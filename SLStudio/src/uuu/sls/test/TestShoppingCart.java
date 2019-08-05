/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.CartItem;
import uuu.sls.entity.Customer;
import uuu.sls.entity.Product;
import uuu.sls.entity.ShoppingCart;
import uuu.sls.entity.SLSException;
import uuu.sls.model.CustomerService;
import uuu.sls.model.ProductService;

/**
 *
 * @author Admin
 */
public class TestShoppingCart {

    public static void main(String[] args) {
        try {
            CustomerService cService = new CustomerService();
            Customer c1 = cService.login("A123456789", "123456");
            Customer vip = cService.login("A123123132", "123456");
            //用現有的真實客戶資料測試

            ProductService pService = new ProductService();
            Product p4 = pService.getProductById("4");
            System.out.println("p4 = " + p4);
            Product p52 = pService.getProductById("52");
            System.out.println("p52 = " + p52);

            Product pNull = pService.getProductById("abcd");
            System.out.println("pNull = " + pNull);
            pNull = pService.getProductById("100");
            System.out.println("pNull = " + pNull);

            ShoppingCart cart = new ShoppingCart();
            cart.setUser(c1);
            cart.addCart(p4, 2);
            cart.addCart(p52, 1);
            cart.addCart(p52, 1);

            System.out.println("項:  = " + cart.size());
            System.out.println("件:  = " + cart.getTotalQuantity());
            //System.out.println("總金額:  = " + cart.getTotalAmount());

            cart.addCart(p4, 2);
            System.out.println("項:  = " + cart.size());
            System.out.println("件:  = " + cart.getTotalQuantity());
            //System.out.println("總金額:  = " + cart.getTotalAmount());
            
            
            for(CartItem item:cart.getCartItemSet()){
                   Product p = item.getProduct();
                   Integer size = item.getSize();
                   int quantity = cart.getQuantity(item);
                   
                   System.out.print(p.getId()+",");
                   System.out.print(p.getName()+",");
                   System.out.print(item.getSize()+",");
                   System.out.print(p.getUnitPrice()+",");
                   System.out.print(cart.getTotalQuantity());
            }

        } catch (SLSException ex) {
            Logger.getLogger(TestShoppingCart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
