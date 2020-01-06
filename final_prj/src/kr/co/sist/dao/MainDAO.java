package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MainDAO {
	
	private static MainDAO mDAO;
	private static SqlSessionFactory ssf;
	
	private MainDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static MainDAO getInstance() {
		if(mDAO==null) {
			mDAO=new MainDAO();
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
	
	
	
}//class
