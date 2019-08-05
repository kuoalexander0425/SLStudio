/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.entity;

/**
 *
 * @author Admin
 */
public class VIP extends Customer {

    public VIP() {
    }

    public VIP(String id, String name, String pwd) throws SLSException {
        super(id, name, pwd);
    }

    public VIP(String id, String password, String name, String email, char gender) throws SLSException {
        super(id, password, name, email, gender);
    }

    public VIP(String id, String name, String pwd, int discount) throws SLSException {
        super(id, name, pwd);
        this.discount = discount;
    }
    private int discount = 10;

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDiscountString() {
        int off = 100 - discount;
        if (off % 10 != 0) {
            return off + "折";
        } else {
            return off / 10 + "折";
        }
    }

    @Override
    public String toString() {
        return super.toString() + "\nVIP { " + "享有折扣：" + getDiscountString() + " }";
    }

}
