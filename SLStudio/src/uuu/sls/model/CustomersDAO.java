package uuu.sls.model;

import uuu.sls.entity.BloodType;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.VIP;

/*這個類別中集中撰寫了對於sls資料庫的CUSTOMERS資料表格之查詢(用帳號查詢)
 新增與修改
 */
class CustomersDAO {

    private static final String SELECT_CUSTOMER_BY_ID_SQL = "select id,name,password, gender"
            + ", email, birthday, phone, address, married, blood_type"
            + ",discount,class_name FROM customers"
            + " WHERE id=? or email=?";

    public Customer getCustomer(String id) throws SLSException {

        try (Connection connection = RDBConnection.getConnection(); // Relational Database
                PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER_BY_ID_SQL);// 3.準備指令
                ) {

            // 3.1傳入?的值
            pstmt.setString(1, id);
            pstmt.setString(2, id);
            // 4.執行指令並取得ResultSet
            try (ResultSet rs = pstmt.executeQuery();) {
                // 5. 處理rs
                Customer c = new Customer();
                int i = 0;
                while (rs.next()) {
                    assert i < 1 : "客戶資料查詢發生主鍵值對應錯誤: " + id;
                    String className = rs.getString("class_name");

                    String classFullName = Customer.class.getName();
                    System.out.println("classFullName = " + classFullName);//uuu.sls.entity.Customer

                    if (className != null) {
                        classFullName
                                = classFullName.replace(Customer.class.getSimpleName(), className);
                        System.out.println("classFullName" + classFullName);
                        try {
                            c = (Customer) Class.forName(classFullName).newInstance();//checked Exception
                            //c = new VIP();
                        } catch (Exception ex) {
                            System.out.println("查詢客戶時建立物件失敗 = " + ex);
                            ex.printStackTrace(System.out);
                            c = new Customer();
                        }
                    }
//                    if(className!=null && className.equals("VIP")){
//                        c= new VIP();
//                    } else {
//                        c = new Customer();
//                    }

                    c.setId(rs.getString("id"));
                    c.setName(rs.getString("name"));
                    c.setPassword(rs.getString("password"));
                    c.setGender(rs.getString("gender").charAt(0));
                    c.setAddress(rs.getString("address"));
                    c.setBirthday(rs.getString("birthday"));
                    c.setPhone(rs.getString("phone"));
                    String bType = rs.getString("blood_type");
                    BloodType type = bType != null ? BloodType.valueOf(bType) : null;
                    c.setBloodType(type);

                    c.setEmail(rs.getString("email"));

                    if (c instanceof VIP) {
                        ((VIP) c).setDiscount(rs.getInt("discount"));
                    }

                    //System.out.println(c);
                    // System.out.println(rs.getBoolean("married"));
                    // System.out.println(rs.getString("id"));
                }
                //System.out.println(c);
                return c;
            }

        } catch (SQLException ex) {
            throw new SLSException("查詢客戶失敗: ", ex);
        }
    }

    private static final String INSERT_SQL = "INSERT INTO customers "
            + "(id,password,name, email, birthday, gender,"
            + " phone, address, married, blood_type, discount, class_name)" 
            + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

    void insert(Customer c) throws SLSException {
        //完成將CUSTOMER物件C修改至資料表格中對應的客戶        
        System.out.println(INSERT_SQL);
        //1,2取得連線
        try (Connection connection = RDBConnection.getConnection();
                //3 準備指令
                PreparedStatement pstmt = connection.prepareStatement(INSERT_SQL)) {
            //3.1 傳入?的值
            pstmt.setString(1, c.getId());
            pstmt.setString(2, c.getPassword());
            pstmt.setString(3, c.getName());
            pstmt.setString(4, c.getEmail());
            pstmt.setString(5, String.valueOf(c.getBirthday()));
            pstmt.setString(6, String.valueOf(c.getGender()));
            pstmt.setString(7, c.getPhone());
            pstmt.setString(8, c.getAddress());
            pstmt.setBoolean(9, c.isMarried());
            pstmt.setString(10,
                    c.getBloodType() != null ? c.getBloodType().name() : null);
            if (c instanceof VIP) {
                pstmt.setInt(11, ((VIP) c).getDiscount());

            } else {
                pstmt.setInt(11, 0);
            }

            pstmt.setString(12, c.getClass().getSimpleName());
            //4.執行指令
            int row = pstmt.executeUpdate();
            //可寫可不寫
            System.out.println("新增客戶成功 = " + row);

        } catch (SQLException ex) {
            if (ex.getErrorCode() == 1062) {
                if (ex.getMessage().lastIndexOf("email_UNIQUE") > 0) {
                    throw new SLSException("新增客戶失敗, Email已重複註冊", ex);
                } else {
                    throw new SLSException("新增客戶失敗, 帳號已重複註冊", ex);
                }
            }
            throw new SLSException("新增客戶失敗", ex);
        }
    }

    private static final String UPDATE_SQL = "UPDATE customers"
            + " SET password=?, name=?, email=?, birthday=?, gender=?,"
            + " phone=?, address=?,married=?, blood_type=?, discount=?, class_name=?" //
            + " WHERE id = ?";

    void update(Customer c) throws SLSException {
        //TODO:完成將CUSTOMER物件C修改至資料表格中對應的客戶資料
        System.out.println(UPDATE_SQL);
        //1,2取得連線
        try (Connection connection = RDBConnection.getConnection();
                //3 準備指令
                PreparedStatement pstmt = connection.prepareStatement(UPDATE_SQL)) {
            //3.1 傳入?的值
            pstmt.setString(12, c.getId());
            pstmt.setString(1, c.getPassword());
            pstmt.setString(2, c.getName());
            pstmt.setString(3, c.getEmail());
            pstmt.setString(4, String.valueOf(c.getBirthday()));
            pstmt.setString(5, String.valueOf(c.getGender()));
            pstmt.setString(6, c.getPhone());
            pstmt.setString(7, c.getAddress());
            pstmt.setBoolean(8, c.isMarried());
            pstmt.setString(9,
                    c.getBloodType() != null ? c.getBloodType().name() : null);
            if (c instanceof VIP) {
                pstmt.setInt(10, ((VIP) c).getDiscount());

            } else {
                pstmt.setInt(10, 0);
            }
            pstmt.setString(11, c.getClass().getSimpleName());

            //4.執行指令
            int row = pstmt.executeUpdate();
            //可寫可不寫
            System.out.println("修改客戶成功 = " + row);
        
        } catch (SQLException ex) {
            throw new SLSException("修改客戶失敗", ex);
        }
    }
}
