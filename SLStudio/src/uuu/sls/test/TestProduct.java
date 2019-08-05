package uuu.sls.test;

import uuu.sls.entity.Product;

public class TestProduct {
	public static void main(String[] args) {
		Product p = new Product();
		
		System.out.println(p.getId());
		System.out.println(p.getName());
		System.out.println(p.getUnitPrice());
		System.out.println(p.getStock());
		System.out.println(p.getPhotoURL());
		System.out.println(p.getDescription());
		
		p.setId(1);
		p.setName("Java");
		p.setUnitPrice(699);
		
		//Product p2 = p;
		Product p2 = new Product(p);
		System.out.println(p==p2);
		p2.setUnitPrice(850);
		System.out.println(p.getUnitPrice());
		System.out.println(p2.getUnitPrice());
                
                System.out.println("產品:" + p.toString());
	}
}
