package uuu.sls.test;

import uuu.sls.entity.Product;
import uuu.sls.model.ProductService;

public class TestProductPassByValue {
	public static void main(String[] args) {
		
		Product p = new Product(1,"Java", 699);
		
		System.out.println(p.getId());
		System.out.println(p.getName());
		System.out.println(p.getUnitPrice());
		
		//p.setUnitPrice(p.getUnitPrice() + 100);
		ProductService service = new ProductService();
		service.addPrice(p.getUnitPrice());
		
		System.out.println(p.getUnitPrice());
	}

}
