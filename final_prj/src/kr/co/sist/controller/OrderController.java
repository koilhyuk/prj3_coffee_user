package kr.co.sist.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sist.domain.BasicRecipe;
import kr.co.sist.domain.Card;
import kr.co.sist.domain.GoodsList;
import kr.co.sist.domain.LemonCnt;
import kr.co.sist.domain.MenuBar;
import kr.co.sist.service.OrderService;
import kr.co.sist.vo.CartCodeVO;
import kr.co.sist.vo.CartFrmVO;
import kr.co.sist.vo.CartListVO;
import kr.co.sist.vo.CartVO;
import kr.co.sist.vo.CodeNCntLemonVO;
import kr.co.sist.vo.CodeNCntVO;
import kr.co.sist.vo.ModifyCartVO;
import kr.co.sist.vo.ModifyPayVO;
import kr.co.sist.vo.PayPriceVO;

@SessionAttributes({"cardInfo","cartListFromPay","backToCart","CartCodeVO"})
@Controller
public class OrderController {
	
	private List<CartListVO> cartListInstance=new ArrayList<CartListVO>(); //장바구니창에 뿌려질 리스트!! 삭제되면 삭제해주고 추가되면 추가해줘야 하는 넌 야속한 존재
	private List<LemonCnt> lemonCnt=new ArrayList<LemonCnt>();
	private List<PayPriceVO> payPrice=new ArrayList<PayPriceVO>(); //레몬을 사용한 전후 전체가격 
	
	
	
	@RequestMapping(value="order/goods_list.do", method=GET)
	public String goodsList(String categoryName, Model model) {
		
		OrderService os=new OrderService();
		List<GoodsList> goodsList=os.goodsList(categoryName);
		model.addAttribute("goodsList",goodsList);
		
		return "order/order_menu";
	}//searchGoods
	
	@RequestMapping(value="order/order_menu.do", method=GET)
	public String searchGoods(HttpServletRequest request, String gdName, Model model) {
		String url="";
		HttpSession session=request.getSession();
		String temps=(String)session.getAttribute("id");
		OrderService os=new OrderService();
		List<BasicRecipe> basicRecipe=os.basicRecipe(gdName);
		List<MenuBar> menuBar=os.selectMenuBar();
		model.addAttribute("basicRecipe", basicRecipe);
		model.addAttribute("menuBar", menuBar);
		if(temps==null) {
		model.addAttribute("msg", "주문은 로그인 후 이용하실 수 있습니다.");
		model.addAttribute("url", "/final_prj/member/login.do"); 
		url="order/order_n";
		}else {
		url="order/order_menu";
		}
		return url;
	}//searchGoods
	
	@RequestMapping(value="order/temp.do", method= GET)
	public String temp(Model model) {
	
		model.addAttribute("cartList", cartListInstance);
		
		return "order/cart";
	}
	
	/**
	 * 장바구니에 주문정보 담기
	 * @param cfVO
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="order/cart.do", method= POST)
	public String goodsInCart(CartFrmVO cfVO, HttpServletRequest request, Model model) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		OrderService os=new OrderService();
		
		CartVO cVO=new CartVO(); 
		//VO로 들어온 문자열 값들 숫자로 바꿔주면서 CartVo에 담기
		
		
		cVO.setId(id);
		
		
		cVO.setCategory(cfVO.getCategory());
		cVO.setGdName(cfVO.getGdName());
		cVO.setSize(cfVO.getSize());
		cVO.setCup(cfVO.getCup());
		cVO.setBrType(cfVO.getBrType());
		cVO.setMilk(cfVO.getMilk());
		cVO.setSyrup(cfVO.getSyrup());
		cVO.setTopping(cfVO.getTopping());
		cVO.setPack(cfVO.getPack());
		
		if(cfVO.getQuantity()!=null) {
			cVO.setQuantity(Integer.parseInt(cfVO.getQuantity()));
		}else {
			cVO.setQuantity(0);
		}
		if(cfVO.getShot()!=null && !"undefined".equals(cfVO.getShot())) {
			cVO.setShot(Integer.parseInt(cfVO.getShot()));
		}else {
			cVO.setShot(0);
		}
		if(cfVO.getCream()!=null && !"undefined".equals(cfVO.getCream()) ) {
			cVO.setCream(Integer.parseInt(cfVO.getCream()));
		}else {
			cVO.setCream(0);
		}
		if(cfVO.getGdPrice()!=null) {
			cVO.setGdPrice(Integer.parseInt(cfVO.getGdPrice()));
		}else {
			cVO.setGdPrice(0);
		}
		
		//기본 레시피와 주문되어진 요구사항을 비교해 값을 계산해 주어야 한다.
		List<BasicRecipe> basicRecipe=os.basicRecipe(cfVO.getGdName());
		CartListVO clVO=os.orderInfo(cVO, basicRecipe);
		cartListInstance.add(clVO); //주문창에서 장바구니 버튼을 클릭하면 DB의 cart테이블에 데이터가 들어가진다.
		
		
		model.addAttribute("cartList", cartListInstance);
		
		
		return "order/cart";
	}//goodsInCart
	
	@RequestMapping(value="order/modify_cart.do", method=GET)
	@ResponseBody
	public String modifyCart(ModifyCartVO mcVO) {
		
		OrderService os=new OrderService();
		os.modifyCart(mcVO);
		
		int totalprice=0;
		for(int i=0; i<cartListInstance.size(); i++) {
			if(cartListInstance.get(i).getCartCode().contains(mcVO.getModifyCartCode())) {
				totalprice=cartListInstance.get(i).getTotalPrice()/cartListInstance.get(i).getQuantity(); 
				cartListInstance.get(i).setQuantity(mcVO.getModifyQuantity());
				totalprice=totalprice*(cartListInstance.get(i).getQuantity());
				cartListInstance.get(i).setTotalPrice(totalprice);
			}//end if
		}//end for
		
		JSONArray jsonArr=os.jsonCartList(cartListInstance);
		
		return jsonArr.toJSONString();
	}//modifyCart
	
	@RequestMapping(value="order/delete_cart.do", method=GET)
	@ResponseBody
	public String deleteCode(@RequestParam(value="deleteCode[]")List<String> deleteCodeList, Model model) {
		
		OrderService os=new OrderService();
		os.deleteCart(deleteCodeList);
		for(int i=0; i<cartListInstance.size(); i++) {
			for(int j=0; j<deleteCodeList.size(); j++) {
				if(cartListInstance.get(i).getCartCode().contains(deleteCodeList.get(j))) {
					cartListInstance.remove(i);
				}//end if
			}//end for
		}//end foN
		
		JSONArray jsonArr=os.jsonCartList(cartListInstance);
		
		
		return jsonArr.toJSONString();
	}//deleteCode
	
	public String showCart() {
		
		return "order/cart";
	}
	
	
	@RequestMapping(value="order/pay.do", method=GET)
	public String payGoods(HttpServletRequest request, Model model) {
		
		//private List<CartListVO> backToCart=new ArrayList<CartListVO>();
		//model.addAttribute("backToCart", backToCart);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		OrderService os=new OrderService();
		List<Card> cardInfo=new ArrayList<Card>();
		
		
		cardInfo=os.selectCard(id);
		lemonCnt=os.lemonCnt(id);
		
		
		lemonCnt.get(0).setUseLemon(0);
		
		int superPrice=0;
		for(int i=0; i<cartListInstance.size(); i++) {
			superPrice+=cartListInstance.get(i).getTotalPrice();
		}//end if
		PayPriceVO pp=new PayPriceVO();
		pp.setBeforeUseLemon(superPrice);
		pp.setAfterUseLemon(superPrice);
		payPrice.add(pp);
		payPrice.get(0).setAfterUseLemon(superPrice);
		payPrice.get(0).setBeforeUseLemon(superPrice);
		
		model.addAttribute("payList", cartListInstance);
		model.addAttribute("cardInfo", cardInfo);
		model.addAttribute("payPrice", payPrice);
		model.addAttribute("lemonCnt", lemonCnt);
		
		return "order/pay";
	}//payGoods
	
	
	@RequestMapping(value="order/coupon.do", method=GET)
	public String coupon( CodeNCntLemonVO cclVO, HttpServletRequest request, Model model) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		OrderService os=new OrderService();
		
		lemonCnt=os.lemonCnt(id);
		
		
		
		model.addAttribute("couponList",cartListInstance);
		model.addAttribute("lemonCnt",lemonCnt);
		model.addAttribute("cartListFromPay",cclVO);
		
		return "order/coupon";
	}//payGoods
	
	/**
	 * 쿠폰창에서 쿠폰을 쓸 메뉴를 선택하였을 때 넘어오는 cartCode들
	 * @param cartCode
	 * @return
	 */
	@RequestMapping(value="order/useLemon.do", method=GET)
	public String useLemon(CartCodeVO cartCodeVO, Model model, HttpServletRequest request ) {
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		lemonCnt.get(0).setUseLemon(cartCodeVO.getCheckCnt());
		
		
		OrderService os=new OrderService();
		//모든 카트코드와 변경된 수량이 입력되어있다.
		List<CodeNCntVO> codeNCnt=os.useLemon(cartCodeVO, cartListInstance, id);
		
		int totalPrice=0;
		int cnt=0;
		int updateCnt=0;
		for(int i=0; i<cartListInstance.size(); i++) {
			for(int j=0; j<codeNCnt.size(); j++) {
				if(cartListInstance.get(i).getCartCode().contains(codeNCnt.get(j).getCartCode())) {
					if(codeNCnt.get(j).getQuantity()==0) {
						cartListInstance.get(i).setCreamAddedPrice(0);
						cartListInstance.get(i).setMilkAddedPrice(0);
						cartListInstance.get(i).setShotAddedPrice(0);
						cartListInstance.get(i).setSizeAddedPrice(0);
						cartListInstance.get(i).setSyrupAddedPrice(0);
						cartListInstance.get(i).setToppingAddedPrice(0);
						cartListInstance.get(i).setTotalPrice(0);
						cartListInstance.get(i).setQuantity(0);
			
					}else {
							cnt=cartListInstance.get(i).getQuantity();
							updateCnt=codeNCnt.get(j).getQuantity();
							if(cnt==0) {
								cnt=1;
							}//end if
							totalPrice=(cartListInstance.get(i).getTotalPrice()/cnt)*updateCnt;
						cartListInstance.get(i).setTotalPrice(totalPrice);
						cartListInstance.get(i).setQuantity(codeNCnt.get(j).getQuantity());
						
					}//end else
				}//end if
			}//end for
		}//end for
		
		int superPrice=0;
		for(int i=0; i<cartListInstance.size(); i++) {
			superPrice+=cartListInstance.get(i).getTotalPrice();
		}//end for
		
		payPrice.get(0).setAfterUseLemon(superPrice);
		
		model.addAttribute("payList", cartListInstance);
		model.addAttribute("lemonCnt",lemonCnt);
		model.addAttribute("payPrice", payPrice);
		//model.addAttribute("codeNCnt", codeNCnt);
	
		
		return "order/pay";
	}//useLemon
	
	public void useLemonPushPayBtn(HttpServletRequest request, Model model) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
	}//useLemonPushPayBtn
	
	@RequestMapping(value="order/cancle.do", method=GET)
	public String cancleCoupon(Model model) {
		
		lemonCnt.get(0).setUseLemon(0);
		model.addAttribute("payList", cartListInstance);
		model.addAttribute("lemonCnt",lemonCnt);
		
		return "order/pay";
	}//cancleCoupon
	
	@RequestMapping(value="order/payBtn.do", method=POST)
	public String pay(String[] cartCode, int[] quantity, int[] totalPrice, HttpServletRequest request, Model model ) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		List<CodeNCntVO> codeNCnt=(List) session.getAttribute("codeNCnt");
		
		List<ModifyPayVO> payInfo=new ArrayList<ModifyPayVO>();
		ModifyPayVO mfpVO=new ModifyPayVO();
		
		for(int i=0; i<cartCode.length; i++) {
				mfpVO.setCartCode(cartCode[i]);
				mfpVO.setQuantity(quantity[i]);
				mfpVO.setTotalPrice(totalPrice[i]);
				payInfo.add(mfpVO);
		}//end for
		
		OrderService os=new OrderService();
		os.pay(payInfo, cartCode, id);
		cartListInstance.clear();
		
		
		return "redirect:../menu/menu.do";
	}//pay
	
	@RequestMapping(value="order/payCancle.do", method=GET)
	public String canclePay(Model model, HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		OrderService os=new OrderService();
		os.canclePay();
		cartListInstance.clear();
		
		return "mainpage/main_page";
	}//cancleCoupon
	
}//class
