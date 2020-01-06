package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.domain.CardDomain;
import kr.co.sist.domain.LemonDomain;
import kr.co.sist.domain.LemonHistDomain;
import kr.co.sist.domain.MemberUpdateDomain;
import kr.co.sist.domain.OrderHistoryDomain;
import kr.co.sist.domain.QnaDetailDomain;
import kr.co.sist.domain.QnaListDomain;
import kr.co.sist.vo.MemberUpdateVO;
import kr.co.sist.vo.MyCardVO;
import kr.co.sist.vo.OrderCntVO;
import kr.co.sist.vo.QnaListVO;
import kr.co.sist.vo.QnaUpdateVO;

public class MypageDAO {
	private static MypageDAO mDAO;
	private static SqlSessionFactory ssf;
	
	private MypageDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static MypageDAO getInstance() {
		if(mDAO==null) {
			mDAO=new MypageDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	public SqlSessionFactory getSessionFactory()throws IOException {
		if(ssf==null) {
			Reader reader=null;
			try {
			//1.설정용 xml을 스트림으로 연결 
			reader=Resources.getResourceAsReader("kr/co/sist/dao/mybatis-config.xml");
			//2.SqlSessionFactoryBuilder 생성
			SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
			//3.SqlSessionFactory얻기
			ssf=ssfb.build(reader);
			}finally {
				if(reader!=null) {reader.close();}//end if
			}//finally
		}//end if
		return ssf;
	}//getSessionFactory
	
	public OrderCntVO orderCnt(String id)throws SQLException {
		OrderCntVO ocVO=null;
		int totalCount=0;
		int monthlyCnt=0;
		
			SqlSession ss;
			try {
				ss = getSessionFactory().openSession();
			totalCount=ss.selectOne("selectTotalCnt",id);
			monthlyCnt=ss.selectOne("selectMonthlyCnt",id);
			ocVO=new OrderCntVO(totalCount,monthlyCnt);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return ocVO;
	}
	
	public List<OrderHistoryDomain> orderHistList(String id){
		List<OrderHistoryDomain> list=null;
		SqlSession ss;
		
		try {
			ss=getSessionFactory().openSession();
			list=ss.selectList("selectOrderhist", id);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public LemonDomain countLemon(String id) {
		LemonDomain ld=new LemonDomain();
		int totalLemon=0;
		int monthlyLemon=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			totalLemon=ss.selectOne("countLemon",id);
			monthlyLemon=ss.selectOne("countMonthlyLemon",id);
			ld.setTotalLemon(totalLemon);
			ld.setMonthlyLemon(monthlyLemon);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ld;
	}
	
	public List<LemonHistDomain> lemonList(String id) {
		List<LemonHistDomain> list=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			list=ss.selectList("lemonHistory", id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int qnaCnt(String id) {
		int cnt=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			cnt=ss.selectOne("selectQnaCount",id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public List<QnaListDomain> selectQnaList(QnaListVO qlVO){
		List<QnaListDomain> list=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			list=ss.selectList("selectQnaList",qlVO);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public QnaDetailDomain selectQnaDetail(String code) {
		QnaDetailDomain qdd=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			qdd=ss.selectOne("selectQnaDetail",code);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qdd;
	}
	
	public String updateQna(QnaUpdateVO quVO) {
		String status="문의가 수정되지 않았습니다.";
		int result=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			result = ss.update("updateQna",quVO);
			ss.commit();
			
			if(result!=0) {
				status="문의사항이 정상적으로 수정되었습니다.";
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public MemberUpdateDomain selectMember(String id) {
		MemberUpdateDomain mud=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			mud=ss.selectOne("selectMember",id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mud;
	}
	
	public int updateMember(MemberUpdateVO muVO) {
		int flag=0;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			flag=ss.update("updateMember",muVO);
			ss.commit();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public List<CardDomain> selectCard(String id) {
		List<CardDomain> list=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			list=ss.selectList("selectCardList", id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int deleteCard(String code) {
		int flag=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			flag=ss.delete("deleteCard",code);
			if(flag==1) {
				ss.commit();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public void insertCard(MyCardVO mcVO) {
		int temp=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			temp=ss.insert("insertMyCard",mcVO);
			
			if(temp==1) {
				ss.commit();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//insertCard
	
}
