package kr.co.sist.vo;

public class CodeNCntVO {
	
	private String cartCode;
	private int quantity, checkCnt;
	
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
	public int getCheckCnt() {
		return checkCnt;
	}
	public void setCheckCnt(int checkCnt) {
		this.checkCnt = checkCnt;
	}
	@Override
	public String toString() {
		return "CodeNCntVO [cartCode=" + cartCode + ", quantity=" + quantity + "]";
	}
	

}
