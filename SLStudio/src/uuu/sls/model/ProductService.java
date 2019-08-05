package uuu.sls.model;

import java.util.List;
import uuu.sls.entity.Product;
import uuu.sls.entity.SLSException;

public class ProductService {

    public void addPrice(double price) {
        price = price + 100;
    }

    public void addPrice(Product p) {
        p.setUnitPrice(p.getUnitPrice() + 100);
    }
//	public double addPrice(double price) {
//		double result = price + 100;
//		return result;
//	}
//	
//	public double addPrice(Product p) {
//		//p.setUnitPrice(p.getUnitPrice()+100);
//		double result = p.getUnitPrice() + 100;
//		return result;
//	}
    private ProductsDAO dao = new ProductsDAO();

    public List<Product> getAllProducts() throws SLSException {
        return dao.getAllProducts();
    }

    public List<Product> getProductsByName(String name) throws SLSException {
        return dao.getProductsByName(name);
    }

    public Product getProductById(String id) throws SLSException {
        return dao.getProductById(id);    
        
    }
}
