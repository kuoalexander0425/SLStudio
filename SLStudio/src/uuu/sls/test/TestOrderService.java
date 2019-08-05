/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.Customer;
import uuu.sls.entity.Outlet;
import uuu.sls.entity.Product;
import uuu.sls.entity.SLSException;
import uuu.sls.entity.VIP;
import uuu.sls.model.OrderService;

/**
 *
 * @author Admin
 */
public class TestOrderService {
    public static void main(String[] args) {
        try {
            Customer c = new Customer("A123456789", "羅時豐","123456");
            
            Product p = new Product(1, "朱有LEADER大小通吃", 205);
            
            OrderService service = new OrderService();
            
            System.out.println(service.order(c, p, 2));
            
            VIP vip = new VIP("A223456781","林梅莉","123456", 15);
            
            Outlet outlet = new Outlet(2,"Midori",340, 20);
            
            System.out.println(service.order(vip, p, 2));
            
            System.out.println(service.order(c, outlet, 1));
            
            System.out.println(service.order(vip, outlet, 1));
        } catch (SLSException ex) {
            Logger.getLogger(TestEquals.class.getName()).log(Level.SEVERE, "Customer OrderService比較發生錯誤", ex);
        } catch(Exception ex) {
            Logger.getLogger(TestEquals.class.getName()).log(Level.SEVERE, "Customer OrderService比較發生非預期錯誤", ex);
        }
    }
}
