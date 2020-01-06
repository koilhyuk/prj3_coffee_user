package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.domain.Menu;
import kr.co.sist.domain.MenuInfo;

public class MenuDAO {
	
	private static MenuDAO mDao;
	private static SqlSessionFactory ssf;
	
	/**
	 * singleton���� ����� ���� �����ڸ� private���� ����
	 */
	private MenuDAO() {
		
	}//MenuDAO 
	
	public static MenuDAO getInstance() {
		if(mDao==null) {
			mDao=new MenuDAO();
		}//end if
		
		return mDao;
	}//getInstance
	

	public SqlSessionFactory getSessionFactory() throws IOException{
		if(ssf==null) {
			Reader reader=null;
			
			try {
				//1.������ xml�� ��Ʈ������ ����
				reader=Resources.getResourceAsReader("kr/co/sist/dao/mybatis-config.xml");
				//2.SqlSessionFactoryBuilder����
				SqlSessionFactoryBuilder ssfb= new SqlSessionFactoryBuilder();
				//3.SqlSessionFactory���
				ssf=ssfb.build(reader);
			}finally {
				if(reader!=null) {reader.close();} //end if
			}//end finally
			
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<Menu> selectMenu(String categoryName) throws SQLException{
		
		List<Menu> list=null;
		
		try {
			SqlSession ss= getSessionFactory().openSession();
			list=ss.selectList("selectMenu", categoryName);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectMenu
	
	public List<MenuInfo> selectMenuInfo(String gdName) throws SQLException{
		
		List<MenuInfo> menuInfoList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			menuInfoList=ss.selectList("selectMenuDetail",gdName);
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return menuInfoList;
	}//selectMenuInfo
	
}//class
