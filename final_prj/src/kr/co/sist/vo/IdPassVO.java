package kr.co.sist.vo;

public class IdPassVO {
	private String m_id,m_pass;

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

	@Override
	public String toString() {
		return "IdPassVO [m_id=" + m_id + ", m_pass=" + m_pass + "]";
	}
	
	
}
