/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.model;

import java.util.List;
import uuu.sls.entity.*;


/**
 *
 * @author Admin
 */
public class OrderService {
    private OrdersDAO dao = new OrdersDAO();
    //OCPJP mod10課程範例
    public double order(Customer c, Product p, int quantity){
        double amount = p.getUnitPrice() * quantity;
        if(c instanceof VIP && !(p instanceof Outlet)){
            VIP v = (VIP)c;
            //變數c參考VIP
            amount = amount * (100-v.getDiscount())/100;
            //amount *= (100D - v.getDiscount())/100;
        }
        return amount;
    }
    
    public void insert(Order order) throws SLSException{
        dao.insert(order);
    }
    
    public List<Order> getOrdersHistory(Customer c)throws SLSException{
        return dao.getOrdersByCustomerId(c.getId());
    }
    
      public Order getOrder(Customer user,int id)throws SLSException{
          Order order =  dao.getOrdersById(id);
       if(order!=null && order.getUser().equals(user)){
           return order;
       }else{
           return null;
       }
    }
}
