package kr.co.sist.domain;

public class LemonCnt {
	
	private int curLemon,useLemon;

	public int getCurLemon() {
		return curLemon;
	}

	public void setCurLemon(int curLemon) {
		this.curLemon = curLemon;
	}

	public int getUseLemon() {
		return useLemon;
	}

	public void setUseLemon(int useLemon) {
		this.useLemon = useLemon;
	}

	@Override
	public String toString() {
		return "LemonCnt [curLemon=" + curLemon + ", useLemon=" + useLemon + "]";
	}
	
	

}
