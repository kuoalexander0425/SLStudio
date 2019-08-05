package uuu.sls.test;

import java.util.List;

import uuu.sls.entity.Product;
import uuu.sls.entity.SLSException;
import uuu.sls.model.ProductService;

public class TestProductService {
	public static void main(String[] args) {
		ProductService service = new ProductService();
		try {
			List<Product> list = service.getAllProducts();
			//System.out.println(list);
			for(Product p:list) {
				System.out.println(p);
			}
		} catch (SLSException e) {
		
			e.printStackTrace();
		}
	}
}