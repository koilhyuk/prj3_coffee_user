package kr.co.sist.domain;

public class PayList {
	
	private String menu,gdName,cartCode;
	private int quantity,totalPrice;
	
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getGdName() {
		return gdName;
	}
	public void setGdName(String gdName) {
		this.gdName = gdName;
	}
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
		return "PayList [menu=" + menu + ", gdName=" + gdName + ", cartCode=" + cartCode + ", quantity=" + quantity
				+ ", totalPrice=" + totalPrice + "]";
	}
	
}
