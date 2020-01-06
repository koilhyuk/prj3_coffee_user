package kr.co.sist.domain;

public class NoticeBoardDomain {
	private int num;
	private String category, subject, date, code;
	public NoticeBoardDomain(int num, String category, String subject, String date, String code) {
		super();
		this.num = num;
		this.category = category;
		this.subject = subject;
		this.date = date;
		this.code = code;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
		
	


	
	
}
