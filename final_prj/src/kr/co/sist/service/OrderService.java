package kr.co.sist.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.sist.dao.OrderDAO;
import kr.co.sist.domain.BasicRecipe;
import kr.co.sist.domain.Card;
import kr.co.sist.domain.GoodsList;
import kr.co.sist.domain.LemonCnt;
import kr.co.sist.domain.MenuBar;
import kr.co.sist.domain.PayList;
import kr.co.sist.domain.backToCart;
import kr.co.sist.vo.CartCodeVO;
import kr.co.sist.vo.CartListVO;
import kr.co.sist.vo.CartVO;
import kr.co.sist.vo.CodeNCntVO;
import kr.co.sist.vo.ModifyCartVO;
import kr.co.sist.vo.ModifyPayVO;

public class OrderService {
	private CartListVO backToClVO=new CartListVO();
	
	/**
	 * 주문할 때 보이는 왼쪽 메뉴바의 카테고리를 클릭하면 쀼려지는 상품들!!
	 * @return
	 */
	public List<GoodsList> goodsList(String categoryName){
		
		List<GoodsList> goodsList=null;
		
		OrderDAO oDao=OrderDAO.getInstance();
		goodsList=oDao.goodsList(categoryName);
		
		return goodsList;
	}//goodsList
	
	public List<BasicRecipe> basicRecipe(String gdName){
		
		List<BasicRecipe> basicRecipe=null;
		
		OrderDAO oDao=OrderDAO.getInstance();
		basicRecipe=oDao.basicRecipe(gdName);
		
		for(int i=0; i<basicRecipe.size(); i++) {
			
			switch (basicRecipe.get(i).getCategoryName()) {
			case "커피" : basicRecipe.get(i).setCategoryName("coffee"); break;
			case "티" : basicRecipe.get(i).setCategoryName("tea"); break;
			case "율리치노" : basicRecipe.get(i).setCategoryName("yuliccino"); break;
			default : basicRecipe.get(i).setCategoryName("dessert");
			}//end switch
			
		}//end for
		
		return basicRecipe;
	}//basicRecipe
	
	/**
	 * 주문창에서 장바구니 버튼을 클릭했을 때 DB의 cart테이블에 들어가는 데이터들!
	 */
	public CartListVO insertCart(CartVO cVO, List<BasicRecipe> basicRecipe) {
		
		CartListVO clVO=new CartListVO();
		
		clVO.setCup(cVO.getCup());
		clVO.setType(cVO.getBrType());
		
		if(cVO.getMilk()==null || " ".equals(cVO.getMilk())) {
			clVO.setMilk("우유없음");
		}else {
			clVO.setMilk(cVO.getMilk());
		}//end else
		
		if(cVO.getSyrup()==null || " ".equals(cVO.getSyrup())) {
			clVO.setSyrup(" ");
		}else {
			clVO.setSyrup(cVO.getSyrup());
		}//end else
		
		if(cVO.getTopping()==null || " ".equals(cVO.getTopping())) {
			clVO.setTopping(" ");
		}else {
			clVO.setTopping(cVO.getTopping());
		}//end else
		
		clVO.setPack(cVO.getPack());
		clVO.setQuantity(cVO.getQuantity());
		
//////////주문창에서 장바구니 버튼을 클릭했을 때 DB의 cart테이블에 들어가기^0^
		
		int price=cVO.getGdPrice();
		
		if("M".equals(cVO.getSize())) {
			price+=500;
			clVO.setSizeAddedPrice(basicRecipe.get(0).getGdPrice()+500);
		}else if("L".equals(cVO.getSize())) {
			price+=1000;
			clVO.setSizeAddedPrice(basicRecipe.get(0).getGdPrice()+1000);
		}//end if
		
			if(basicRecipe.get(0).getMilk()==null && cVO.getMilk()!=null && !" ".equals(cVO.getMilk())) {
				price+=500;
				clVO.setMilkAddedPrice(500);
			}//end if
			
			if(basicRecipe.get(0).getSyrup()==null && cVO.getSyrup()!=null && !" ".equals(cVO.getSyrup())) {
				price+=500;
				clVO.setSyrupAddedPrice(500);
			}//end if
			
			
			
			int shotPlus;
			if(basicRecipe.get(0).getShot()<cVO.getShot()) {
				shotPlus=cVO.getShot()-basicRecipe.get(0).getShot();
				price+=shotPlus*500;
				clVO.setShotPlus(shotPlus);
				clVO.setShotAddedPrice(shotPlus*500);
			}//end if
			
			int creamPlus;
			if(basicRecipe.get(0).getCream()<cVO.getCream()) {
				creamPlus=cVO.getCream()-basicRecipe.get(0).getCream();
				price+=creamPlus*500;
				clVO.setCreamPlus(creamPlus);
				clVO.setCreamAddedPrice(creamPlus*500);
			}//end if
		
		
		if(cVO.getTopping()!=null && !" ".equals(cVO.getTopping())) {
			price+=500;
			clVO.setToppingAddedPrice(500);
		}//end if
		
		
		if(cVO.getQuantity()!=1) {
			price=price*cVO.getQuantity();
		}//end if
		
		cVO.setGdPrice(price);
		clVO.setTotalPrice(price);
		
		switch (cVO.getCategory()) {
		case "coffee" : cVO.setCategory("커피"); clVO.setMenuName("음료"); break;
		case "tea" : cVO.setCategory("티"); clVO.setMenuName("음료"); break;
		case "yuliccino" : cVO.setCategory("율리치노"); clVO.setMenuName("음료"); break;
		default : cVO.setCategory("디저트"); clVO.setMenuName("디저트");
		}//end switch
		
		if(cVO.getCup()!=null) {
			switch (cVO.getCup()) {
			case "일회용컵(테이크아웃용)" : cVO.setCup("O"); break;
			case "텀블러" : cVO.setCup("T"); break;
			default : cVO.setCup("M");
			}//end switch
		}//end if
		
		if(cVO.getBrType()!=null) {
			switch (cVO.getBrType()) {
			case "ICE" : cVO.setBrType("I"); break;
			default : cVO.setBrType("H");
			}//end switch
		}//end if
		
		if(cVO.getMilk()!=null) {
			switch (cVO.getMilk()) {
			case "우유" : cVO.setMilk("일반우유"); break;
			case "락토프리 우유" : cVO.setMilk("락토프리"); break;
			default : cVO.setMilk("두유");
			}//end switch
		}//end if
		
		if(cVO.getPack()!=null && !" ".equals(cVO.getPack())) {
			switch (cVO.getPack()) {
			case "매장" : cVO.setPack("N"); break;
			default : cVO.setPack("Y");
			}//end switch
		}else {
			cVO.setPack("N");
		}//end if
		
		
///////////장바구니 리스트에 쀼려줄 때~~^0^		
		
		/*
		 * if("dessert".equals(cVO.getCategory())) { clVO.setMenuName("디저트"); }else {
		 * clVO.setMenuName("음료"); }//end else
		 */		
		clVO.setCategory(cVO.getCategory());
		clVO.setGdName(cVO.getGdName());
		clVO.setSize(cVO.getSize());
		clVO.setId(cVO.getId());
		clVO.setBasicPrice(basicRecipe.get(0).getGdPrice());
		
///////////DAO불러서 주문정보 cart테이블에 입력하자!!
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.insertCart(cVO);
		backToClVO=clVO;
		
		return clVO;
	}//insertCart
	
	/**
	 * 주문한 정보를 담는 VO를 반환
	 * @param cVO
	 * @param basicRecipe
	 * @return
	 */
	public CartListVO orderInfo(CartVO cVO, List<BasicRecipe> basicRecipe) {
		CartListVO clVO=insertCart(cVO, basicRecipe);
		
		OrderDAO oDao=OrderDAO.getInstance();
		clVO.setCartCode(oDao.selectCartCode(clVO.getId()));
		//장바구니에 뿌려줄 때 보여줄 정보 아이스와 핫핫>.<
		if("H".equals(cVO.getBrType())) {
			clVO.setType("HOT");
		}else {
			clVO.setType("ICE");
		}
		
		switch(cVO.getCup()) {
		case "O" : clVO.setCup("일회용컵(테이크아웃용)"); break;
		case "T" : clVO.setCup("텀블러"); break;
		default : clVO.setCup("머그컵");
		}//end switch
		
		if("락토프리".equals(cVO.getMilk())) {
			clVO.setMilk("락토프리 우유");
		}//end if
		
		switch (cVO.getPack()) {
		case "N" : clVO.setPack("포장"); break;
		default : clVO.setPack("매장");
		}//end switch
		
		return clVO;
	}//showCartList
	

	

	public List<MenuBar> selectMenuBar(){
		
		List<MenuBar> menuBar=null;
		
		OrderDAO oDao=OrderDAO.getInstance();
		menuBar=oDao.selectMenuBar();
		
		return menuBar;
	}//selectMenuBar
	
	public void modifyCart(ModifyCartVO mcVO) {
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.updateCart(mcVO);
		
	}//modifyCart
	
	public void deleteCart(List<String> deleteCodeList) {
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.deleteCart(deleteCodeList);
		
	}//deleteCart
	
	public List<PayList> payList(){
		
		List<PayList> payList=null;
		
		OrderDAO oDao=OrderDAO.getInstance();
		payList=oDao.payList();
		
		return payList;
	}//payList
	
	public JSONArray jsonCartList(List<CartListVO> cartList) {
		
		
		JSONArray jsonArr=new JSONArray();
		   
		for (int i = 0; i < cartList.size(); i++) {
			
			JSONObject obj=new JSONObject();
			obj.put("cartCode", cartList.get(i).getCartCode());
			obj.put("quantity", cartList.get(i).getQuantity());
			obj.put("totalPrice", cartList.get(i).getTotalPrice());

			jsonArr.add(obj);
		 }//end for
		
		return jsonArr;
	}//jsonCartList
	
	
	/**
	 * 레몬 사용할 때 - cartCode가 들어오고 이것을 DAO에 update시켜준다
	 */
	public List<CodeNCntVO> useLemon(CartCodeVO ccVO, List<CartListVO> cartList, String id) {
		
		String[] cartCode=ccVO.getCartCode();
		Map<String, Integer> map=new HashMap<String, Integer>();
		List<CodeNCntVO> codeNCnt=new ArrayList<CodeNCntVO>();
		CodeNCntVO cnc=null;
		
		
		for(int i=0; i<cartCode.length; i++) {
			
			int cnt=1;
			if(map.get(cartCode[i])!=null) {
				cnt=map.get(cartCode[i])+1;
			}//end if
			map.put(cartCode[i], cnt);
			
		
		}//end for
		
		int quantity=0;
		
		for(int j=0; j<cartList.size(); j++) {
			if(map.get(cartList.get(j).getCartCode())!=null){
//				map.put(cartList.get(j).getCartCode(),0);
				quantity=cartList.get(j).getQuantity()-map.get(cartList.get(j).getCartCode());
				cnc=new CodeNCntVO();
				cnc.setCartCode(cartList.get(j).getCartCode());
				cnc.setQuantity(quantity); //변경된 수량 : 원래수량 - 쿠폰을 사용해서 차감된 수량
				cnc.setCheckCnt(ccVO.getCheckCnt());
				codeNCnt.add(cnc);
				
			}//end if
			
		
		}//end for
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.updateCoupon(codeNCnt,id);
		
		return codeNCnt;
	}//useLemon
	
	public List<LemonCnt> lemonCnt(String id){
		
		List<LemonCnt> lemonCnt=null; 
		OrderDAO oDao=OrderDAO.getInstance();
		lemonCnt=oDao.lemonCnt(id);
		
		return lemonCnt;
	}//lemonCnt
	
	public List<Card> selectCard(String id){
		
		List<Card> cardInfo=null;
		
		OrderDAO oDao=OrderDAO.getInstance();
		cardInfo=oDao.selectCard(id);
		
		return cardInfo;
	}//cardInfo
	
	public void pay(List<ModifyPayVO> payInfo, String[] cartCode, String id) {
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.pay(payInfo, cartCode, id);
		
	}//pay
	
	public List<backToCart> backToCart(String id){
		
		List<backToCart> backToCart=null;
		
		OrderDAO oDao=OrderDAO.getInstance();
		backToCart=oDao.backToCart(id);
		
		return backToCart;
	}//backToCart
	
	public void canclePay() {
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.canclePay();
		
	}//canclePay
	

	public CartListVO getBackToClVO() {
		return backToClVO;
	}

	public void setBackToClVO(CartListVO backToClVO) {
		this.backToClVO = backToClVO;
	}
	
	
	
}//class
