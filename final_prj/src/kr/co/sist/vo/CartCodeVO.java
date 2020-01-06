package kr.co.sist.vo;

import java.util.List;

public class CartCodeVO {
	
	private String[] cartCode;
	private int checkCnt;

	

	public String[] getCartCode() {
		return cartCode;
	}

	public void setCartCode(String[] cartCode) {
		this.cartCode = cartCode;
	}

	public int getCheckCnt() {
		return checkCnt;
	}

	public void setCheckCnt(int checkCnt) {
		this.checkCnt = checkCnt;
	}

	@Override
	public String toString() {
		return "CartCodeVO [cartCode=" + cartCode + ", checkCnt=" + checkCnt + "]";
	}

	
	

}
