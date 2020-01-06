package kr.co.sist.vo;

public class CartListVO {
	
	private String menuName,category,gdName,size,cup,type,milk,syrup,topping,pack,cartCode,id;
	private int quantity,shotPlus,creamPlus,totalPrice, milkAddedPrice,syrupAddedPrice,toppingAddedPrice,shotAddedPrice,creamAddedPrice,
				basicPrice,sizeAddedPrice;
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getShotPlus() {
		return shotPlus;
	}
	public void setShotPlus(int shotPlus) {
		this.shotPlus = shotPlus;
	}
	public int getCreamPlus() {
		return creamPlus;
	}
	public void setCreamPlus(int creamPlus) {
		this.creamPlus = creamPlus;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getMilkAddedPrice() {
		return milkAddedPrice;
	}
	public void setMilkAddedPrice(int milkAddedPrice) {
		this.milkAddedPrice = milkAddedPrice;
	}
	public int getSyrupAddedPrice() {
		return syrupAddedPrice;
	}
	public void setSyrupAddedPrice(int syrupAddedPrice) {
		this.syrupAddedPrice = syrupAddedPrice;
	}
	public int getToppingAddedPrice() {
		return toppingAddedPrice;
	}
	public void setToppingAddedPrice(int toppingAddedPrice) {
		this.toppingAddedPrice = toppingAddedPrice;
	}
	public int getShotAddedPrice() {
		return shotAddedPrice;
	}
	public void setShotAddedPrice(int shotAddedPrice) {
		this.shotAddedPrice = shotAddedPrice;
	}
	public int getCreamAddedPrice() {
		return creamAddedPrice;
	}
	public void setCreamAddedPrice(int creamAddedPrice) {
		this.creamAddedPrice = creamAddedPrice;
	}
	public String getCartCode() {
		return cartCode;
	}
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBasicPrice() {
		return basicPrice;
	}
	public void setBasicPrice(int basicPrice) {
		this.basicPrice = basicPrice;
	}
	public int getSizeAddedPrice() {
		return sizeAddedPrice;
	}
	public void setSizeAddedPrice(int sizeAddedPrice) {
		this.sizeAddedPrice = sizeAddedPrice;
	}
	@Override
	public String toString() {
		return "CartListVO [menuName=" + menuName + ", category=" + category + ", gdName=" + gdName + ", size=" + size
				+ ", cup=" + cup + ", type=" + type + ", milk=" + milk + ", syrup=" + syrup + ", topping=" + topping
				+ ", pack=" + pack + ", cartCode=" + cartCode + ", id=" + id + ", quantity=" + quantity + ", shotPlus="
				+ shotPlus + ", creamPlus=" + creamPlus + ", totalPrice=" + totalPrice + ", milkAddedPrice="
				+ milkAddedPrice + ", syrupAddedPrice=" + syrupAddedPrice + ", toppingAddedPrice=" + toppingAddedPrice
				+ ", shotAddedPrice=" + shotAddedPrice + ", creamAddedPrice=" + creamAddedPrice + ", basicPrice="
				+ basicPrice + ", sizeAddedPrice=" + sizeAddedPrice + "]";
	}
	
	

}
