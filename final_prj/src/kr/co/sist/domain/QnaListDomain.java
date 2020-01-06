package kr.co.sist.domain;

public class QnaListDomain {
	private int rnum;
	private String subject,wDate,comFlag, code;
	public QnaListDomain() {
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getComFlag() {
		return comFlag;
	}
	public void setComFlag(String comFlag) {
		this.comFlag = comFlag;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
