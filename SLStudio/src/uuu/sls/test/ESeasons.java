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
public enum ESeasons {
    SPRING('春'),SUMMER('夏'),FALL('秋'),WINTER('冬');
    
    private char chName;
    public char getChineseName(){
        return chName;
    }
    private ESeasons(char chName){
        this.chName = chName;
    }
    
    @Override
    public String toString(){
        return chName + "季";
    }
}
