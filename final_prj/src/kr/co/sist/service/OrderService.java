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
	 * �ֹ��� �� ���̴� ���� �޴����� ī�װ��� Ŭ���ϸ� �ط����� ��ǰ��!!
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
			case "Ŀ��" : basicRecipe.get(i).setCategoryName("coffee"); break;
			case "Ƽ" : basicRecipe.get(i).setCategoryName("tea"); break;
			case "����ġ��" : basicRecipe.get(i).setCategoryName("yuliccino"); break;
			default : basicRecipe.get(i).setCategoryName("dessert");
			}//end switch
			
		}//end for
		
		return basicRecipe;
	}//basicRecipe
	
	/**
	 * �ֹ�â���� ��ٱ��� ��ư�� Ŭ������ �� DB�� cart���̺� ���� �����͵�!
	 */
	public CartListVO insertCart(CartVO cVO, List<BasicRecipe> basicRecipe) {
		
		CartListVO clVO=new CartListVO();
		
		clVO.setCup(cVO.getCup());
		clVO.setType(cVO.getBrType());
		
		if(cVO.getMilk()==null || " ".equals(cVO.getMilk())) {
			clVO.setMilk("��������");
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
		
//////////�ֹ�â���� ��ٱ��� ��ư�� Ŭ������ �� DB�� cart���̺� ����^0^
		
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
		case "coffee" : cVO.setCategory("Ŀ��"); clVO.setMenuName("����"); break;
		case "tea" : cVO.setCategory("Ƽ"); clVO.setMenuName("����"); break;
		case "yuliccino" : cVO.setCategory("����ġ��"); clVO.setMenuName("����"); break;
		default : cVO.setCategory("����Ʈ"); clVO.setMenuName("����Ʈ");
		}//end switch
		
		if(cVO.getCup()!=null) {
			switch (cVO.getCup()) {
			case "��ȸ����(����ũ�ƿ���)" : cVO.setCup("O"); break;
			case "�Һ�" : cVO.setCup("T"); break;
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
			case "����" : cVO.setMilk("�Ϲݿ���"); break;
			case "�������� ����" : cVO.setMilk("��������"); break;
			default : cVO.setMilk("����");
			}//end switch
		}//end if
		
		if(cVO.getPack()!=null && !" ".equals(cVO.getPack())) {
			switch (cVO.getPack()) {
			case "����" : cVO.setPack("N"); break;
			default : cVO.setPack("Y");
			}//end switch
		}else {
			cVO.setPack("N");
		}//end if
		
		
///////////��ٱ��� ����Ʈ�� �ط��� ��~~^0^		
		
		/*
		 * if("dessert".equals(cVO.getCategory())) { clVO.setMenuName("����Ʈ"); }else {
		 * clVO.setMenuName("����"); }//end else
		 */		
		clVO.setCategory(cVO.getCategory());
		clVO.setGdName(cVO.getGdName());
		clVO.setSize(cVO.getSize());
		clVO.setId(cVO.getId());
		clVO.setBasicPrice(basicRecipe.get(0).getGdPrice());
		
///////////DAO�ҷ��� �ֹ����� cart���̺� �Է�����!!
		
		OrderDAO oDao=OrderDAO.getInstance();
		oDao.insertCart(cVO);
		backToClVO=clVO;
		
		return clVO;
	}//insertCart
	
	/**
	 * �ֹ��� ������ ��� VO�� ��ȯ
	 * @param cVO
	 * @param basicRecipe
	 * @return
	 */
	public CartListVO orderInfo(CartVO cVO, List<BasicRecipe> basicRecipe) {
		CartListVO clVO=insertCart(cVO, basicRecipe);
		
		OrderDAO oDao=OrderDAO.getInstance();
		clVO.setCartCode(oDao.selectCartCode(clVO.getId()));
		//��ٱ��Ͽ� �ѷ��� �� ������ ���� ���̽��� ����>.<
		if("H".equals(cVO.getBrType())) {
			clVO.setType("HOT");
		}else {
			clVO.setType("ICE");
		}
		
		switch(cVO.getCup()) {
		case "O" : clVO.setCup("��ȸ����(����ũ�ƿ���)"); break;
		case "T" : clVO.setCup("�Һ�"); break;
		default : clVO.setCup("�ӱ���");
		}//end switch
		
		if("��������".equals(cVO.getMilk())) {
			clVO.setMilk("�������� ����");
		}//end if
		
		switch (cVO.getPack()) {
		case "N" : clVO.setPack("����"); break;
		default : clVO.setPack("����");
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
	 * ���� ����� �� - cartCode�� ������ �̰��� DAO�� update�����ش�
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
				cnc.setQuantity(quantity); //����� ���� : �������� - ������ ����ؼ� ������ ����
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
