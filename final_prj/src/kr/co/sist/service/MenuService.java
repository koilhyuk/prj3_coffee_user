package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.dao.MenuDAO;
import kr.co.sist.domain.Menu;
import kr.co.sist.domain.MenuInfo;

public class MenuService {
	
	/**
	 * ī�װ��� ���� ��ǰ�� ���̺� �ѷ��ֱ�>3<
	 * @param categoryName ī�װ��� ���� �������� ��ǰ���� �޶�����~��.��
	 * @return
	 */
	public List<Menu> searchMenu(String categoryName) {
		
		List<Menu> list=null;
		
		MenuDAO mDAO=MenuDAO.getInstance();
		
		try {
			list=mDAO.selectMenu(categoryName);
			
			for(int i=0; i<list.size(); i++) {
				
				switch (list.get(i).getCategoryName()) {
				case "Ŀ��" : list.get(i).setCategoryName("coffee"); break;
				case "Ƽ" : list.get(i).setCategoryName("tea"); break;
				case "����ġ��" : list.get(i).setCategoryName("yuliccino"); break;
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
				case "Ŀ��" : list.get(i).setCategoryName("coffee"); break;
				case "Ƽ" : list.get(i).setCategoryName("tea"); break;
				case "����ġ��" : list.get(i).setCategoryName("yuliccino"); break;
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
	 * DB�� ��ǰ ���� �� ���������� CLOB�� gd_Info�� ���� ����� �� �ְ� 
	 * ��Ʈ���� �̿��Ͽ� String���� �ٲ��ִ� �޼ҵ�(>.<)/
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
