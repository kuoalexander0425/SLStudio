package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;

public class TestCustomerConstructor {

	public static void main(String[] args) {
            try {
                Customer c = new Customer();
                c.setId("A123456789");
                c.setPassword("123456");
                c.setName("張三豐");
                
                System.out.println(c.getId());
                System.out.println(c.getPassword());
                System.out.println(c.getName());
                
                Customer c1 = new Customer(
                        "A223456781", "林梅莉", "123456"	);
                System.out.println(c1.getId());
                System.out.println(c1.getPassword());
                System.out.println(c1.getName());
                
                Customer c2 = new Customer(
                        "A123123123", "李五端", "123456",
                        "test03@gmail.com", 'M');
                System.out.println(c2.getId());
                System.out.println(c2.getPassword());
                System.out.println(c2.getName());
                System.out.println(c2.getEmail());
                System.out.println(c2.getGender());
            } catch (SLSException ex) {
                Logger.getLogger(TestCustomerConstructor.class.getName()).log(Level.SEVERE, null, ex);
            }
	}

}
