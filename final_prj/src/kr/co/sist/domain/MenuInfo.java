package kr.co.sist.domain;

import java.sql.Clob;

public class MenuInfo {
	
	private String gdName,gdImg,categoryName;
	private int gdKal,gdCaffein,gdSugar,gdSalt;
	private String gdInfo;
	
	
	public String getGdName() {
		return gdName;
	}
	public void setGdName(String gdName) {
		this.gdName = gdName;
	}
	public String getGdImg() {
		return gdImg;
	}
	public void setGdImg(String gdImg) {
		this.gdImg = gdImg;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getGdKal() {
		return gdKal;
	}
	public void setGdKal(int gdKal) {
		this.gdKal = gdKal;
	}
	public int getGdCaffein() {
		return gdCaffein;
	}
	public void setGdCaffein(int gdCaffein) {
		this.gdCaffein = gdCaffein;
	}
	public int getGdSugar() {
		return gdSugar;
	}
	public void setGdSugar(int gdSugar) {
		this.gdSugar = gdSugar;
	}
	public int getGdSalt() {
		return gdSalt;
	}
	public void setGdSalt(int gdSalt) {
		this.gdSalt = gdSalt;
	}
	public String getGdInfo() {
		return gdInfo;
	}
	public void setGdInfo(String gdInfo) {
		this.gdInfo = gdInfo;
	}
	
	
}
