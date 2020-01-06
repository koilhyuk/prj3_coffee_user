package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.dao.MenuDAO;
import kr.co.sist.domain.Menu;
import kr.co.sist.domain.MenuInfo;

public class MenuService {
	
	/**
	 * 카테고리에 따른 상품을 테이블에 뿌려주기>3<
	 * @param categoryName 카테고리명에 따라 보여지는 상품들이 달라진당~ㅎ.ㅎ
	 * @return
	 */
	public List<Menu> searchMenu(String categoryName) {
		
		List<Menu> list=null;
		
		MenuDAO mDAO=MenuDAO.getInstance();
		
		try {
			list=mDAO.selectMenu(categoryName);
			
			for(int i=0; i<list.size(); i++) {
				
				switch (list.get(i).getCategoryName()) {
				case "커피" : list.get(i).setCategoryName("coffee"); break;
				case "티" : list.get(i).setCategoryName("tea"); break;
				case "율리치노" : list.get(i).setCategoryName("yuliccino"); break;
				default : list.get(i).setCategoryName("dessert");
				}//end switch
				
			}//end for
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchMenu
	
	public List<MenuInfo> showMenuDetail(String gdName) {
		
		List<MenuInfo> list=null;
		
		MenuDAO mDAO=MenuDAO.getInstance();
		
		try {
			list=mDAO.selectMenuInfo(gdName);
			
			for(int i=0; i<list.size(); i++) {
				
				switch (list.get(i).getCategoryName()) {
				case "커피" : list.get(i).setCategoryName("coffee"); break;
				case "티" : list.get(i).setCategoryName("tea"); break;
				case "율리치노" : list.get(i).setCategoryName("yuliccino"); break;
				default : list.get(i).setCategoryName("dessert");
				}//end switch
				
			}//end for
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return list;
	}//showMenuDetail
	
	/**
	 * DB의 상품 정보 중 데이터형이 CLOB인 gd_Info의 값을 사용할 수 있게 
	 * 스트림을 이용하여 String으로 바꿔주는 메소드(>.<)/
	 * @return
	 */
	/*
	 * public List<String> gdInfo(List<MenuInfo> list) {
	 * 
	 * List<String> gdInfoList=null; StringBuilder sb=new StringBuilder(); Reader
	 * reader=null; BufferedReader br=null; try { for(int i=0; i<list.size(); i++) {
	 * reader=(list.get(i).getGdInfo()).getCharacterStream(); br=new
	 * BufferedReader(reader);
	 * 
	 * String line; while(null!=(line=br.readLine())) { sb.append(line); }//end
	 * while gdInfoList.add(sb.toString()); }//end for br.close(); } catch
	 * (SQLException e) { // TODO Auto-generated catch block e.printStackTrace(); }
	 * catch (IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }//end catch
	 * 
	 * return gdInfoList; }//gdInfo
	 */
	
}//class
