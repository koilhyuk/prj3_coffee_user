package kr.co.sist.vo;

public class MemberUpdateVO {
	private String m_id,m_pass, m_name, m_birth, m_phone, m_email, m_nick, m_date, m_gender,  m_recent_ip, m_recent_date;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pass() {
		return m_pass;
	}

	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_recent_ip() {
		return m_recent_ip;
	}

	public void setM_recent_ip(String m_recent_ip) {
		this.m_recent_ip = m_recent_ip;
	}

	public String getM_recent_date() {
		return m_recent_date;
	}

	public void setM_recent_date(String m_recent_date) {
		this.m_recent_date = m_recent_date;
	}

	@Override
	public String toString() {
		return "MemberUpdateVO [m_id=" + m_id + ", m_pass=" + m_pass + ", m_name=" + m_name + ", m_birth=" + m_birth
				+ ", m_phone=" + m_phone + ", m_email=" + m_email + ", m_nick=" + m_nick + ", m_date=" + m_date
				+ ", m_gender=" + m_gender + ", m_recent_ip=" + m_recent_ip + ", m_recent_date=" + m_recent_date + "]";
	}

	
	
	
	
		
}
