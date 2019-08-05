package uuu.sls.test;

import java.util.Scanner;



public class TestDoWhile {
	public static void main(String[] args) {
//		int random = 8;
//		
//		Scanner scanner = new Scanner(System.in);
//		int counter = 1;
//		int guess = new Scanner(System.in).nextInt(10);
//
//		do {
//			if(counter>3) {
//				System.out.println("over 3 times");
//				break;
//			}
//			System.out.println("enter a number(0~9): ");
//			guess = scanner.nextInt(10);
//			
//		}while(guess!=random);
//		System.out.println("Ok");
//	}
	
	for(int i = 1; i <= 10; i++) {
		if(i%3!=0)continue;
		System.out.println(i);
	}
	}	

}

