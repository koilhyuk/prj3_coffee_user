package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.domain.MainComGoodsDomain;
import kr.co.sist.domain.MainNoticeListDomain;
import kr.co.sist.domain.NoticeBoardDomain;
import kr.co.sist.domain.NoticeDetailDomain;
import kr.co.sist.vo.SearchVO;

public class NoticeDAO {
	private static NoticeDAO qDAO;
	private static SqlSessionFactory ssf;
	
	private NoticeDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static NoticeDAO getInstance() {
		if(qDAO==null) {
			qDAO=new NoticeDAO();
		}//end if
		return qDAO;
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
	
	public int selectTotalCount(SearchVO sVO)throws SQLException{
		int cnt=0;
		try {
		//MyBatis Handler얻기
			SqlSession ss=getSessionFactory().openSession();
		//쿼리수행후 결과 얻기
			cnt=ss.selectOne("selectTotalCount", sVO);
		//Handler끊기
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public List<NoticeBoardDomain> selectBoardList(SearchVO sVO)throws SQLException{
		List<NoticeBoardDomain> list=null;
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			list=ss.selectList("selectBoardList", sVO);
			
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<MainNoticeListDomain> selectMNoticeList()throws SQLException{
		List<MainNoticeListDomain> list=null;
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			list=ss.selectList("selectMNoticeList");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public NoticeDetailDomain selectNoticeDetail(String code) {
		NoticeDetailDomain ndd=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			ndd=ss.selectOne("selectNoticeDetail",code);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ndd;
	}//selectNoticeDetail
	
	public List<MainComGoodsDomain> mainComGoodsSelect() throws SQLException{
		List<MainComGoodsDomain> comGoods = null;

		try {
			SqlSession ss=getSessionFactory().openSession();
			comGoods = ss.selectList("kr.co.sist.dao.mapper.MenuMapper.selectMainComGoods");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return comGoods;
	}//mainComGoodsSelect
	
	
}// class
