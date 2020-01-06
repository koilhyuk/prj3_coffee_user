package kr.co.sist.domain;

import java.sql.Clob;

public class NoticeDetailDomain {
	private String subject, wDate, Content;

	public NoticeDetailDomain(String subject, String wDate, String content) {
		super();
		this.subject = subject;
		this.wDate = wDate;
		Content = content;
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

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	@Override
	public String toString() {
		return "NoticeDetailDomain [subject=" + subject + ", wDate=" + wDate + ", Content=" + Content + "]";
	}

	
	
}
