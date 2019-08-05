package uuu.sls.entity;

public enum BloodType {
	O(10), A(20), B(30), AB(40);//屬性方法建構式override

	private final int code;
	
	private BloodType(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}


	@Override
	public String toString() {
		
		return this.name()+'型';
	}
	
	
}
