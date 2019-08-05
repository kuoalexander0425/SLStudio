package uuu.sls.model;

import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;

//delegate method
public class CustomerService {

    private CustomersDAO dao = new CustomersDAO();

    public Customer login(String id, String pwd) throws SLSException {
        if (id == null || (id = id.trim()).length() == 0 || id.length() == 0
                || pwd == null || pwd.length() == 0) {
            throw new SLSException("登入失敗,必須輸入帳號和密碼!");
        }
        Customer c = dao.getCustomer(id);
        if (c != null) {
            if (pwd.equals(c.getPassword())) {
                return c;
            }
            //throw new SLSException("登入失敗,密碼不正確");
        }
        throw new SLSException("登入失敗,帳號不正確");
    }

    //delegate method
    public void register(Customer c) throws SLSException {
        if (c == null) {
            throw new SLSException("新增客戶時客戶資料不得為null");
        }
        //TODO:完成客戶註冊(insert Object Customer c into customers table)
        dao.insert(c);
    }


    public void update(Customer c) throws SLSException {
        if (c == null) {
            throw new SLSException("修改客戶時客戶資料不得為null");
        }
        dao.update(c);
    }

}
