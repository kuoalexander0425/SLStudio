/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.Customer;
import uuu.sls.entity.Order;
import uuu.sls.entity.SLSException;
import uuu.sls.model.CustomerService;
import uuu.sls.model.OrderService;

/**
 *
 * @author Admin
 */
public class TestOrderServiceGetOrders {
    public static void main(String[] args) {
        try {
            CustomerService cService = new CustomerService();
            Customer c = cService.login("A123456789","123456");
            
            OrderService service= new OrderService();
            List<Order> list = service.getOrdersHistory(c);
            
            System.out.println("list = " + list);
            for(Order order:list){
                System.out.println("id: " + order.getId());
                System.out.println("orderDate: " + order.getOrderDate());
                System.out.println("totalAmount: " + order.getTotalAmount());
            }
            
            
        } catch (SLSException ex) {
            Logger.getLogger(TestOrderServiceGetOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
}
