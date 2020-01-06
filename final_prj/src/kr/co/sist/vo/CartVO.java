package kr.co.sist.vo;

public class CartVO {
	
	private String category,gdName,size,cup,brType,milk,syrup,topping,pack,id,cartCode;
	private int quantity,shot,cream,gdPrice;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGdName() {
		return gdName;
	}
	public void setGdName(String gdName) {
		this.gdName = gdName;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCup() {
		return cup;
	}
	public void setCup(String cup) {
		this.cup = cup;
	}
	public String getBrType() {
		return brType;
	}
	public void setBrType(String brType) {
		this.brType = brType;
	}
	public String getMilk() {
		return milk;
	}
	public void setMilk(String milk) {
		this.milk = milk;
	}
	public String getSyrup() {
		return syrup;
	}
	public void setSyrup(String syrup) {
		this.syrup = syrup;
	}
	public String getTopping() {
		return topping;
	}
	public void setTopping(String topping) {
		this.topping = topping;
	}
	public String getPack() {
		return pack;
	}
	public void setPack(String pack) {
		this.pack = pack;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getShot() {
		return shot;
	}
	public void setShot(int shot) {
		this.shot = shot;
	}
	public int getCream() {
		return cream;
	}
	public void setCream(int cream) {
		this.cream = cream;
	}
	public int getGdPrice() {
		return gdPrice;
	}
	public void setGdPrice(int gdPrice) {
		this.gdPrice = gdPrice;
	}
	public String getCartCode() {
		return cartCode;
	}
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}
	@Override
	public String toString() {
		return "CartVO [category=" + category + ", gdName=" + gdName + ", size=" + size + ", cup=" + cup + ", brType="
				+ brType + ", milk=" + milk + ", syrup=" + syrup + ", topping=" + topping + ", pack=" + pack + ", id="
				+ id + ", quantity=" + quantity + ", shot=" + shot + ", cream=" + cream + ", gdPrice=" + gdPrice + "]";
	}
	
	
	
	
	

}
