package kr.co.sist.domain;

public class OrderListDomain {
	
	private String date, name,payment;
	private int price;
	public OrderListDomain(String date, String name, String payment, int price) {
		this.date = date;
		this.name = name;
		this.payment = payment;
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
