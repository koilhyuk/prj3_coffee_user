package kr.co.sist.vo;

public class CardVO {
	private String card_code, card_num1, card_num2, card_num3, card_num4, card_year, card_month, card_cvc, m_id, com_code,com_name;

	public String getCard_code() {
		return card_code;
	}

	public void setCard_code(String card_code) {
		this.card_code = card_code;
	}

	public String getCard_num1() {
		return card_num1;
	}

	public void setCard_num1(String card_num1) {
		this.card_num1 = card_num1;
	}

	public String getCard_num2() {
		return card_num2;
	}

	public void setCard_num2(String card_num2) {
		this.card_num2 = card_num2;
	}

	public String getCard_num3() {
		return card_num3;
	}

	public void setCard_num3(String card_num3) {
		this.card_num3 = card_num3;
	}

	public String getCard_num4() {
		return card_num4;
	}

	public void setCard_num4(String card_num4) {
		this.card_num4 = card_num4;
	}

	public String getCard_year() {
		return card_year;
	}

	public void setCard_year(String card_year) {
		this.card_year = card_year;
	}

	public String getCard_month() {
		return card_month;
	}

	public void setCard_month(String card_month) {
		this.card_month = card_month;
	}

	public String getCard_cvc() {
		return card_cvc;
	}

	public void setCard_cvc(String card_cvc) {
		this.card_cvc = card_cvc;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getCom_code() {
		return com_code;
	}

	public void setCom_code(String com_code) {
		this.com_code = com_code;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	@Override
	public String toString() {
		return "CardVO [card_code=" + card_code + ", card_num1=" + card_num1 + ", card_num2=" + card_num2
				+ ", card_num3=" + card_num3 + ", card_num4=" + card_num4 + ", card_year=" + card_year + ", card_month="
				+ card_month + ", card_cvc=" + card_cvc + ", m_id=" + m_id + ", com_code=" + com_code + ", com_name="
				+ com_name + "]";
	}

	
	
	
}
