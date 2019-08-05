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
public class Outlet extends Product{
    private int discount = 5;

    public Outlet(){
        
    }

    public Outlet(int id, String name, double unitPrice) {
        super(id, name, unitPrice);
        //this.setId(id);
        //this.setName(name);
        //this.setUnitPrice(unitPrice);
    }
    
     public Outlet(int id, String name, double unitPrice, int discount) {
        super(id, name, unitPrice);
        this.discount = discount;
        //this.setId(id);
        //this.setName(name);
        //this.setUnitPrice(unitPrice);
    }
    
    
    
    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
    @Override
    public double getUnitPrice() {//查詢售價
        return super.getUnitPrice() * (100 - discount)/100;
    }
    
    public double getListPrice(){//查詢定價
        return super.getUnitPrice();
    }
    public String getDiscountString(){
        int discount = 100 - this.discount;
        if(discount%10 == 0){
            discount = discount/10;
        }
        return discount + "折";
    }

    @Override
    public String toString() {
        return super.toString() 
                + "\n售價: "+ getUnitPrice() + " 元"
                + "\n折扣: " + discount + "% off";
    }
    
    
}
