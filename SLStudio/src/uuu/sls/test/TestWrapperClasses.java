/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

/**
 *
 * @author Admin
 */
public class TestWrapperClasses {
    public static void main(String[] args) {
        int quantity = 10;
        Integer quantityObj = new Integer(quantity);//boxing
        
        double price = 105;
        Double priceObj = new Double(price);//boxing
        
        double amount = quantityObj.intValue() * priceObj.doubleValue();//unboxing
        
        char gender = 'M';
        Character genderObj = new Character(gender);//boxing
        char gender2 = genderObj.charValue();//unboxing
        //以下auto-boxing, auto-unboxing
        Integer quantityObj100 = quantity;//auto-boxing:new Integer(quantity)
        Double priceObj100 = price;//auto-boxing: new Double(price)
        
        int quantity100 = quantityObj100; //auto-unboxing
        double price100 = priceObj100;//auto-unboxing
        
        Double amountObject = quantityObj100 * priceObj100; //auto-unboxing, auto-boxing
        
        //以下測試請關注記憶體中的意義
        Integer i = 1;
        Integer j = i;
        i = i + 1;
        System.out.println("i = " + i);//2
        System.out.println("j = " + j);//1
        
        
        String s = "Hello";
        s = s + " World";
        System.out.println(s);
    }
}
