package kr.co.sist.vo;

import java.util.Arrays;

import org.springframework.context.annotation.Scope;

@Scope("prototype")
public class CodeNCntLemonVO {
	
	private String[] cartCodeLemon;
	private int quantityLemon;
	public String[] getCartCodeLemon() {
		return cartCodeLemon;
	}
	public void setCartCodeLemon(String[] cartCodeLemon) {
		this.cartCodeLemon = cartCodeLemon;
	}
	public int getQuantityLemon() {
		return quantityLemon;
	}
	public void setQuantityLemon(int quantityLemon) {
		this.quantityLemon = quantityLemon;
	}
	@Override
	public String toString() {
		return "CodeNCntLemonVO [cartCodeLemon=" + Arrays.toString(cartCodeLemon) + ", quantityLemon=" + quantityLemon
				+ "]";
	}
	
	
	
	

}
