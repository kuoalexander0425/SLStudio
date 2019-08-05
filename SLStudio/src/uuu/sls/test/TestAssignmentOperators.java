package uuu.sls.test;

public class TestAssignmentOperators {
	public static void main(String[] args) {
		
		byte a = 1;
		
		byte b = 1;
		
		b += a;
		
		b = (byte)(b+a);
		
		byte c = 1;
		
		c += a/b + 3.5*6;
		
		c = (byte)(c + (a/b+3.5*6));
		
		int grade = 65;
		String result;
//		if(grade>=90 && grade<=100){
//			result = "A+";
//		}else {
//			result = "B";
//		}
		
		result = (grade>=90 && grade<=100)?"A+":"B";
		
		System.out.println(result);
		
		System.out.println(grade>=90 && grade<=100?"A+":"B");
		
		}
}
