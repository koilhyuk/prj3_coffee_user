package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.vo.QnaVO;

public class QnaDAO {
	private  static QnaDAO qDAO;

	public static SqlSessionFactory ssf;

	public static QnaDAO getInstance() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
		if (qDAO == null) {
			qDAO = new QnaDAO();
		} // if
		return qDAO;
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
	}//getsession
	public int insertQna(QnaVO qVO)throws SQLException {
		SqlSession ss;
		int cnt=0;
		try {
			ss=getSessionFactory().openSession();
			cnt= ss.insert("insertQnA",qVO);
			if(cnt==1) {
			ss.commit();
			ss.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
}//class
