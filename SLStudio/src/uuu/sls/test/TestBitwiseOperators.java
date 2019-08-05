package uuu.sls.test;

public class TestBitwiseOperators {
		public static void main(String[] args) {
			//byte, short, char, int, long
			byte a = 6, b = 5;
			int c1 = a & b;
			System.out.println(c1);
			
			int c2 = a | b;
			System.out.println(c2);
			
			int c3 = 6 ^ 5;
			System.out.println(c3);
			
			long c4 = ~6L;
			System.out.println(c4);
			
			a = 32;
			b = 2;
			int c5 =( a << b );
			System.out.println(c5);
			
			int c6 = (a >> b);
			System.out.println(c6);
			
			a = -32;
			byte c7 =(byte)( a << b );
			System.out.println(c7);
			
			int c8 = (a >> b);
			System.out.println(c8);
			
			int c9 = (a >>> b);
			System.out.println(c9);
		}

}
