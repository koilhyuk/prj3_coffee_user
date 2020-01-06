package kr.co.sist.domain;

public class OrderHistoryDomain {
	private String orderDate, gdName, payment;
	private int price;
	public OrderHistoryDomain() {
		super();
	}
	public OrderHistoryDomain(String orderDate, String gdName, String payment, int price) {
		super();
		this.orderDate = orderDate;
		this.gdName = gdName;
		this.payment = payment;
		this.price = price;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getGdName() {
		return gdName;
	}
	public void setGdName(String gdName) {
		this.gdName = gdName;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}