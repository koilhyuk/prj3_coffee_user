package kr.co.sist.vo;

public class PayPriceVO {
	
	private int beforeUseLemon, afterUseLemon;

	public int getBeforeUseLemon() {
		return beforeUseLemon;
	}

	public void setBeforeUseLemon(int beforeUseLemon) {
		this.beforeUseLemon = beforeUseLemon;
	}

	public int getAfterUseLemon() {
		return afterUseLemon;
	}

	public void setAfterUseLemon(int afterUseLemon) {
		this.afterUseLemon = afterUseLemon;
	}

	@Override
	public String toString() {
		return "PayPriceVO [beforeUseLemon=" + beforeUseLemon + ", afterUseLemon=" + afterUseLemon + "]";
	}
	
	

}
