/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.BloodType;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;
import uuu.sls.entity.VIP;
import uuu.sls.model.CustomerService;

/**
 *
 * @author Admin
 */
public class TestCustomerServiceRegister {
    public static void main(String[] args) {
        try {
            VIP c = new VIP();
            c.setId("A213555357");
            c.setName("李四娘");
            c.setPassword("123456");
            c.setGender(Customer.FEMALE);
            c.setEmail("FourLeeWoman@gmail.com");
            c.setBirthday("1994-03-19");
            c.setPhone("0992546879");
            c.setAddress("高雄市中央路13號");
            c.setMarried(false);
            c.setBloodType(BloodType.A);
            c.setDiscount(15);
                        
            CustomerService service = new CustomerService();
            service.register(c);
        } catch (SLSException ex) {
            Logger.getLogger(TestCustomerServiceRegister.class.getName()).log(Level.SEVERE, "測試會員註冊失敗", ex);
        }
    }
}
