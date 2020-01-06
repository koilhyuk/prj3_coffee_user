package kr.co.sist.domain;

public class backToCart {
	
	private String cartCode;
	private int quantity, totalPrice;
	public String getCartCode() {
		return cartCode;
	}
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "backToCart [cartCode=" + cartCode + ", quantity=" + quantity + ", totalPrice=" + totalPrice + "]";
	}
	
	

}
