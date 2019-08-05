/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.text.NumberFormat;

/**
 *
 * @author Admin
 */
public class TestVarType {
    public static void main(String[] args) {
        byte b = 0b010;
short c = 010;
int a = 0xCaFe;
long d = 10000000000000000L;
float e = 1.F;
double f= 1.0 - 0.8; //IEEE 754
System.out.println(f);
        NumberFormat nf = NumberFormat.getInstance(); //需要import
nf.setMaximumFractionDigits(4);
nf.setMinimumFractionDigits(2);
System.out.println(nf.format(f));
char g = 'a';
char g2 = '資';
char g3 = '堃';
System.out.println(g3);
char g4 = '\u03A6';
System.out.println(g4);
boolean h = true;
boolean h1 = false;
int i = 1;//initialize
i = 10; //assign
System.out.println(i);	
    }
}
