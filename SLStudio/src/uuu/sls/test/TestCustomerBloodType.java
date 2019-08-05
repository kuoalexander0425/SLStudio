package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.BloodType;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;

public class TestCustomerBloodType {
	public static void main(String[] args) {
            try {
                System.out.println(BloodType.O.ordinal());
                System.out.println(BloodType.O.name());
                System.out.println(BloodType.O.getCode());
                
                System.out.println(BloodType.AB.ordinal());
                System.out.println(BloodType.AB.name());
                System.out.println(BloodType.AB.getCode());
                
                
                Customer c = new Customer("A123456789", "羅時豐", "123456");
                c.setBloodType(BloodType.AB);
                System.out.println(c.getBloodType().toString());
            } catch (SLSException ex) {
                Logger.getLogger(TestCustomerBloodType.class.getName()).log(Level.SEVERE, "客戶血型不正確", ex);
            } catch(Exception ex){
                Logger.getLogger(TestCustomerBloodType.class.getName()).log(Level.SEVERE, "客戶血型發生非預期錯誤", ex);
            }
		
	}
}
