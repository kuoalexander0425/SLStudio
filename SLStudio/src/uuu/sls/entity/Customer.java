/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.entity;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Objects;
//import java.util.Date;

/**
 *
 * @author Admin
 */
public class Customer extends Object {

    public static final char MALE = 'M';
    public static final char FEMALE = 'F';

    private String id;//必要,ROCId,PKey
    private String password;//必要,長度在6~20之間
    private String name = "";//必要
    private String email;//必要 可用regular exp提共格式檢查
    //public Date birthday;//必要.iso-8601 import java.util.Date
    private LocalDate birthday;
    private char gender;//必要,'M'-男, 'F'-女
    private String phone;//非必要
    private String address;//非必要
    private boolean married;//非必要
    private Date oldBirthday;
    // private int bloodType;//非必要,列舉型別

    private BloodType bloodtype;

    public BloodType getBloodType() {
        return bloodtype;
    }

    public void setBloodType(BloodType bloodtype) {
        this.bloodtype = bloodtype;
    }

    public void setId(String idValue) throws SLSException {
        if (this.checkId(idValue)) {
            id = idValue;
        } else {
            System.out.println("客戶身分證號不正確");
            throw new SLSException("客戶身分證號不正確");
        }
    }

    public String getId() {
        return this.id;
    }

    public int getAge() {
        if (this.getBirthday() == null) {
            return 0;
        }
        int thisYear = LocalDate.now().getYear();
        //System.out.println("thisYear= " + thisYear);
        int birthYear = this.getBirthday().getYear();
        //System.out.println("birthYear= " + birthYear);
        int age = thisYear - birthYear;
        return age;
    }
    // int age = Period.between(birthday, LocalDate.now().getYear())
    //         return age;
    private final static String idRegExp = "[A-Z][12][0-9]{8}";

    public static final boolean checkId(String id) {
        if (id == null || !id.matches(idRegExp)) {
            return false;
        }
        //1.將第一個字元轉換成對應的數字
        String firstNumberSerial = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
        char firstChar = id.charAt(0);
        int firstNumber = firstNumberSerial.indexOf(firstChar) +10;
        assert(firstNumber>9 && firstNumber <36);
        //2.依公式計算資料
        int sum = firstNumber / 10 + firstNumber % 10 * 9;
        for (int i = 1; i < 9; i++) {
            sum = sum + (id.charAt(i) - '0') * (9 - i);
        }
        sum = sum + (id.charAt(9) - '0');
        //3.將計算結果%10為0及正確
        return (sum % 10) == 0;

    }

    public Customer() {

    }

    public Customer(String id, String name, String pwd) throws SLSException {
        super();
        this.setId(id);
        this.setName(name);
        this.setPassword(pwd);
    }

    public Customer(String id, String password, String name, String email, char gender) throws SLSException {
        super();
        this.setId(id);
        this.setPassword(password);
        this.setName(name);
        this.setEmail(email);
        this.setGender(gender);
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) throws SLSException {
        if (password != null && password.length() >= 6 && password.length() <= 20) {
            this.password = password;
        } else {
            throw new SLSException("必須輸入6~20長度的密碼");
        }
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     * @throws uuu.sls.entity.SLSException
     */
    public void setName(String name) throws SLSException {
        if (name != null && (name = name.trim()).length() > 0) {
            //小括號一定先運算.
            this.name = name;
        } else {
            System.err.println("必須輸入客戶姓名");
            throw new SLSException("必須輸入客戶姓名");
        }
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) throws SLSException {
        if (email != null && email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            this.email = email;
        } else {
            System.err.println("email格式不正確");
            throw new SLSException("email格式不正確");
        }
    }

    /**
     * @return the birthday
     */
    public LocalDate getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(LocalDate birthday) throws SLSException {
        if (birthday != null && LocalDate.now().isAfter(birthday)) {
            this.birthday = birthday;
        } else {
            System.err.println("必須輸入正確的生日");
            throw new SLSException("必須輸入正確的生日");
        }
    }

    public Date getOldBirthday() {
        return oldBirthday;
    }

    public void setOldBirthday(Date oldBirthday) {
        this.oldBirthday = oldBirthday;
    }

    public void setBirthday(int year, int month, int day) throws SLSException {
        try {
            this.birthday = LocalDate.of(year, month, day);
        } catch (DateTimeException ex) {
            throw new SLSException("客戶生日資料不是正確日期");
        }
    }

    public void setBirthday(String date) throws SLSException {
        try {
            if (date != null) {
                this.birthday = LocalDate.parse(date);
            }
        } catch (DateTimeException ex) {
            throw new SLSException("客戶生日字串不是正確日期");
        }
    }

    public void setOldBirthday(int y, int m, int d) {
        this.oldBirthday = new GregorianCalendar(y, m, d).getTime();
    }

    public void setOldBirthday(String date) throws SLSException {
        if (date == null) {
            throw new SLSException("客戶生日不得為null");
        } else {
            date = date.replace("/", "-");
        }
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date d = dateFormat.parse(date);
            this.setOldBirthday(d);
        } catch (ParseException ex) {
            System.out.println("客戶生日格式不正確");
            throw new SLSException("客戶生日格式不正確");
        }
    }

    /**
     * @return the gender
     */
    public char getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(char gender) throws SLSException {
        if (gender == 'M' || gender == 'F') {
            this.gender = gender;
        } else {
            System.err.println("必須輸入正確的性別資料");
            throw new SLSException("必須輸入正確的性別資料");
        }
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the married
     */
    public boolean isMarried() {
        return married;
    }

    /**
     * @param married the married to set
     */
    public void setMarried(boolean married) {
        this.married = married;
    }

    /**
     * @return the bloodType
     */
//    public int getBloodType() {
//        return bloodType;
//    }
//
//    /**
//     * @param bloodType the bloodType to set
//     */
//    public void setBloodType(int bloodType) {
//        this.bloodType = bloodType;
//    }
    @Override
    public String toString() {
        return this.getClass().getName()
                + "\n  客戶編號: " + id
                + "\n  密碼: " + password
                + "\n  客戶名稱: " + name
                + "\n  Email: " + email
                + "\n  生日: " + birthday
                + "\n  性別: " + gender
                + "\n  電話: " + phone
                + "\n  地址: " + address
                + "\n  未婚/已婚: " + married
                + "\n  血型: " + bloodtype;
                
    }

    @Override
    public int hashCode() {
        int hash = 7;//產生質數
        hash = 37 * hash + Objects.hashCode(this.id);
        return hash;
    }
//    public int hashCode(){
//        int hash = this.id!=null?this.id.hashCode():0;
//        return hash;
//    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof Customer)) {
            return false;
        }
//        final Customer other = (Customer) obj;
//        if (!Objects.equals(this.id, other.id)) {
//            return false;
//        }
        final Customer other = (Customer) obj;
        if (this.id == null || !this.id.equals(other.id)) {
            return false;
        }
        return true;
    }
}
