/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

/**
 *
 * @author alexanderkuo
 */
public class MyClass {
    static String finStr = "";
    public String starOut(String str) {
 
 for(int i =0;i<str.length();i++){
   if(i==0&&str.charAt(i)!='*'){
     finStr += str.charAt(i);
   }
   if(i>0&&str.charAt(i)!='*'&&str.charAt(i-1)!='*'){
     finStr += str.charAt(i);
   }
   if(i>0&&str.charAt(i)=='*'&&str.charAt(i-1)!='*'){
      finStr = finStr.substring(0,finStr.length()-1);
   }
 }
 return finStr;
}
    

    public static void main(String[] args) {
      
        MyClass my = new MyClass();
        my.starOut("qwe*qweq");
        System.out.println(finStr);
    }
    
    
    
}
