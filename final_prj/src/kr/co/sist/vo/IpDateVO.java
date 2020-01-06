package kr.co.sist.vo;

public class IpDateVO {
	private String m_id,m_recent_ip;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_recent_ip() {
		return m_recent_ip;
	}

	public void setM_recent_ip(String m_recent_ip) {
		this.m_recent_ip = m_recent_ip;
	}

	@Override
	public String toString() {
		return "IpDateVO [m_id=" + m_id + ", m_recent_ip=" + m_recent_ip + "]";
	}
	
	
	
}
