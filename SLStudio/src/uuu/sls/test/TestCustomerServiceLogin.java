package uuu.sls.test;

import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;
import uuu.sls.model.*;

public class TestCustomerServiceLogin {

    public static void main(String[] args) {
        String id = "A213555357";
        String pwd = "123456";
        CustomerService service = new CustomerService();
        try {
            Customer c = service.login(id, pwd);
            System.out.println(c);
        } catch (SLSException e) {
            e.printStackTrace();
        }
    }
}
