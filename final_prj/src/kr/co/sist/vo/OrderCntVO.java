package kr.co.sist.vo;

public class OrderCntVO {
	private int totalOrder, monthlyOrder;

	public OrderCntVO(int totalOrder, int monthlyOrder) {
		super();
		this.totalOrder = totalOrder;
		this.monthlyOrder = monthlyOrder;
	}

	public int getTotalOrder() {
		return totalOrder;
	}

	public void setTotalOrder(int totalOrder) {
		this.totalOrder = totalOrder;
	}

	public int getMonthlyOrder() {
		return monthlyOrder;
	}

	public void setMonthlyOrder(int monthlyOrder) {
		this.monthlyOrder = monthlyOrder;
	}

	


	
}
