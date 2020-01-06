package kr.co.sist.vo;

public class ModifyCartVO {

	private String modifyCartCode;
	private int modifyQuantity;
	
	public String getModifyCartCode() {
		return modifyCartCode;
	}
	public void setModifyCartCode(String modifyCartCode) {
		this.modifyCartCode = modifyCartCode;
	}
	public int getModifyQuantity() {
		return modifyQuantity;
	}
	public void setModifyQuantity(int modifyQuantity) {
		this.modifyQuantity = modifyQuantity;
	}
	@Override
	public String toString() {
		return "ModifyCartVO [modifyCartCode=" + modifyCartCode + ", modifyQuantity=" + modifyQuantity + "]";
	}
	
}
