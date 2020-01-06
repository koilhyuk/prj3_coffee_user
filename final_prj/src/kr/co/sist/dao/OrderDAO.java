package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.domain.BasicRecipe;
import kr.co.sist.domain.Card;
import kr.co.sist.domain.GoodsList;
import kr.co.sist.domain.LemonCnt;
import kr.co.sist.domain.MenuBar;
import kr.co.sist.domain.OrderCartCode;
import kr.co.sist.domain.PayList;
import kr.co.sist.domain.backToCart;
import kr.co.sist.vo.CartVO;
import kr.co.sist.vo.CodeNCntVO;
import kr.co.sist.vo.ModifyCartVO;
import kr.co.sist.vo.ModifyPayVO;

public class OrderDAO {

	private static OrderDAO oDao;
	private static SqlSessionFactory ssf;
	
	/**
	 * singleton으로 만들기 위해 생성자를 private으로 설정
	 */
	private OrderDAO() {
		
	}//MenuDAO 
	
	public static OrderDAO getInstance() {
		if(oDao==null) {
			oDao=new OrderDAO();
		}//end if
		
		return oDao;
	}//getInstance
	

	public SqlSessionFactory getSessionFactory() throws IOException{
		if(ssf==null) {
			Reader reader=null;
			
			try {
				//1.설정용 xml을 스트림으로 연결
				reader=Resources.getResourceAsReader("kr/co/sist/dao/mybatis-config.xml");
				//2.SqlSessionFactoryBuilder생성
				SqlSessionFactoryBuilder ssfb= new SqlSessionFactoryBuilder();
				//3.SqlSessionFactory얻기
				ssf=ssfb.build(reader);
			}finally {
				if(reader!=null) {reader.close();} //end if
			}//end finally
			
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<GoodsList> goodsList(String categoryName){
		
		List<GoodsList> goodsList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			goodsList=ss.selectList("selectGoodsList", categoryName);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return goodsList;
	}//goodsList
	
	public List<BasicRecipe> basicRecipe(String gdName){
		
		List<BasicRecipe> basicRecipe=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			basicRecipe=ss.selectList("selectBasicRecipe", gdName);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return basicRecipe;
	}//basicRecipe
	
	public void insertCart(CartVO cVO) {
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			ss.insert("cartInsert", cVO);
			ss.commit();
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
	}//inertCart
	
	public String selectCartCode(String id) {
		
		String cartCode=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			cartCode=ss.selectOne("selectCartCode", id);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return cartCode;
	}//selectCartCode
	
	public List<MenuBar> selectMenuBar(){
		
		List<MenuBar> menuBar=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			menuBar=ss.selectList("selectMenuBar");
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return menuBar;
	}//selectMenuBar
	
	public void updateCart(ModifyCartVO mcVO) {
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			ss.update("updateCart", mcVO);
			ss.commit();
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//updateCart
	
	public void deleteCart(List<String> deleteCodeList) {
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			ss.delete("deleteCart", deleteCodeList);
			ss.commit();
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
	}//deleteCart 
	
	public List<PayList> payList(){
		
		List<PayList> payList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			payList=ss.selectList("selectPay");
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return payList;
	}//payList
	
	public void updateCoupon(List<CodeNCntVO> codeNCnt, String id) {
		
		try {
			SqlSession ss=getSessionFactory().openSession();
	
			for(int i=0; i<codeNCnt.size(); i++) {
				ss.update("updateCoupon",codeNCnt.get(i));
				ss.commit();
			}//end for
			for(int i=0; i<codeNCnt.get(0).getCheckCnt(); i++) {
				ss.update("useLemon",id);
				ss.commit();
			}//end for
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
	}//updateCoupon
	
	public List<LemonCnt> lemonCnt(String id){
		
		
		List<LemonCnt> lemonCnt=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			lemonCnt=ss.selectList("curLemon", id);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return lemonCnt;
	}//lemonCnt
	
	public List<Card> selectCard(String id){
		
		List<Card> cardInfo=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			cardInfo=ss.selectList("selectCard", id);
			
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return cardInfo;
	}//selectCard
	
	public void pay(List<ModifyPayVO> payInfo, String[] cartCode, String id) {
		
		List<OrderCartCode> orderCartCode=new ArrayList<OrderCartCode>(); 
		
		int nLemonCnt=0;
		int cntGroupBy10=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			
			if(payInfo!=null) {
				for(int i=0;i< payInfo.size() ; i++) {
				ss.update("updatePayInfo", payInfo.get(i));
				ss.commit();
				}
			}//end if
			for(int i=0;i< cartCode.length ; i++) {
				ss.update("payCompleteCart", cartCode[i]);
				ss.commit();
				ss.insert("payComplete", cartCode[i]);
				ss.commit();
			}//end for
			
			nLemonCnt=ss.selectOne("countNLemon");
			if(10<nLemonCnt) {
				cntGroupBy10=nLemonCnt/10;
			}//end if
			
			int oStatusFlag=0;
			for(int i=0; i<cntGroupBy10; i++) {
				orderCartCode=ss.selectList("orderingCCode",id); 
				for(int j= 0 ; j < orderCartCode.size(); j++) {
					oStatusFlag	=ss.update("lemonMoreThan10",orderCartCode.get(j));
					ss.commit(); //commit을 해줍니다.
				}
				if(oStatusFlag>0) {
					ss.insert("insertLemon",id);
					ss.commit();
				}
			}//end for
			
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//pay
	
	public List<backToCart> backToCart(String id){
		
		List<backToCart> backToCart=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			backToCart=ss.selectList("backToCart", id);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return backToCart;
	}//backToCart
	
	public void canclePay() {
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			ss.update("canclePay");
			ss.commit();
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
	}//canclePay
	
}//class

