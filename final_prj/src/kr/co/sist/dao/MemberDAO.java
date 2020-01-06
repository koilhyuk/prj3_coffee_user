package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.domain.IdPassDomain;
import kr.co.sist.vo.CardVO;
import kr.co.sist.vo.FindIdVO;
import kr.co.sist.vo.FindPassVO;
import kr.co.sist.vo.IdPassVO;
import kr.co.sist.vo.IpDateVO;
import kr.co.sist.vo.MemberJoinVO;

public class MemberDAO {
	private static MemberDAO mDao;
	public static SqlSessionFactory ssf;

	public static MemberDAO getInstance() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
		if (mDao == null) {
			mDao = new MemberDAO();
		} // if
		return mDao;
	}// instance

	public SqlSessionFactory getSessionFactory() throws IOException {
		if (ssf == null) {

			Reader reader = null;
			try {
				// 1.설정용 xml을 스트림으로 연결
				reader = Resources.getResourceAsReader("kr/co/sist/dao/mybatis-config.xml");
				// 2. sqlsessionfactorybuilder 생성
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				// 3. sqlsessionfactory 얻ㄱㅣ
				ssf = ssfb.build(reader);

			} finally {
				if (reader != null) {
					reader.close();
				} // if
			} // finally
		}
		return ssf;
	}

	/**
	 * 로그인 조회
	 * 
	 * @param ipVO
	 * @return
	 * @throws SQLException
	 */
	public boolean selectLogin(IdPassVO ipVO) throws SQLException {
		boolean login_flag = false;
		IdPassDomain ipdtemp = null;
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			ipdtemp = ss.selectOne("selectLogin", ipVO);

			if (ipdtemp != null) {
				login_flag = true;
			}
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return login_flag;
	}// selectLogin

	/**
	 * 로그인시 ip와 최종 접속일자 업데이트
	 * 
	 * @param idVO
	 * @return
	 * @throws SQLException
	 */
	public int updateIpDate(IpDateVO idVO) throws SQLException {
		int cnt = 0;
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			cnt = ss.update("updateIpDate", idVO);
			if (cnt == 1) {
				ss.commit();
			}
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	/**
	 * 카드 리스트 조회
	 * 
	 * @return
	 */
	public List<String> selectAllCard() {
		List<String> cardList = null;

		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			cardList = ss.selectList("selectAllCard");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return cardList;
	}// selectAllCard

	/**
	 * 회원가입 아이디 중복확인
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException {
		boolean idChk_flag = false;
		String temp = "";
		try {
			SqlSession ss = getSessionFactory().openSession();
			temp = ss.selectOne("selectId", id);
			if (temp == null) {
				idChk_flag = true;
			}
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return idChk_flag;
	}

	/**
	 * 아이디 찾기
	 * 
	 * @param fVO
	 * @return
	 */
	public String selectLostId(FindIdVO fVO) throws SQLException {
		String id = null;
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			id = ss.selectOne("selectFindId", fVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return id;
	}

	/**
	 * 비밀번호 찾기
	 * 
	 * @param fpVO
	 * @return
	 * @throws SQLException
	 */
	public String selectLostPass(FindPassVO fpVO) throws SQLException {
		String passFindInfo = null;
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			passFindInfo = ss.selectOne("selectFindPass", fpVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return passFindInfo;
	}

	
	 /**
	  * 비밀번호 변경
	 * @param ipVO
	 * @return
	 * @throws SQLException
	 */
	public int updatePass(IdPassVO ipVO)throws SQLException { 
		 int cnt= 0;
		 SqlSession ss; 
		 try {
			 ss=getSessionFactory().openSession();
			 cnt=ss.update("updatePass",ipVO); 
			 if(cnt==1) {
				 ss.commit(); 
			 } 
			 	ss.close(); 
		}catch (IOException e) {
			e.printStackTrace(); 
		} 
		 return cnt; 
	}


	/**
	 * 회원가입 멤버추가
	 * 
	 * @param mjVO
	 * @throws SQLException
	 */
	public boolean insertMember(MemberJoinVO mjVO) throws SQLException {
		boolean insert_MFlag = false;
		int cnt = 0;
		try {
			SqlSession ss = getSessionFactory().openSession();
			cnt = ss.insert("insertMember", mjVO);
			if (cnt == 1) {
				insert_MFlag = true;
			}
			ss.commit();
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return insert_MFlag;

	}

	/**
	 * 회원가입 카드등록
	 * 
	 * @param cVO
	 * @throws SQLException
	 */
	public void insertMemberCard(CardVO cVO) throws SQLException {
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			ss.insert("insertCard", cVO);
			ss.commit();
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
