package uuu.sls.model;

import java.sql.*;
import java.util.ResourceBundle;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import uuu.sls.entity.SLSException;

class RDBConnection {

    private static final String driver;// = "com.mysql.jdbc.Driver";
    private static final String url;// = "jdbc:mysql://localhost:3306/sls?zeroDateTimeBehavior=convertToNull";
    private static final String userid;// = "root";
    private static final String pwd;// = "1234";

    static {
        String jdbcDriver, jdbcUrl, jdbcUserid, jdbcPwd; //區域變數

        try {
            ResourceBundle bundle = ResourceBundle.getBundle("uuu.sls.model.jdbc");

            jdbcDriver = bundle.getString("jdbc.driver");
            jdbcUrl = bundle.getString("jdbc.url");
            jdbcUserid = bundle.getString("jdbc.userid");
            jdbcPwd = bundle.getString("jdbc.pwd");

        } catch (Exception ex) {
            ex.printStackTrace(System.out);
            jdbcDriver = "com.mysql.jdbc.Driver";
            jdbcUrl = "jdbc:mysql://localhost:3306/sls?characterEncoding=utf8";
            jdbcUserid = "root";
            jdbcPwd = "1234";
        }
        driver = jdbcDriver;
        url = jdbcUrl;
        userid = jdbcUserid;
        pwd = jdbcPwd;
    }

    public static void main(String[] args) {
        try (Connection conn = RDBConnection.getConnection()) {
            System.out.println(conn.getCatalog());
        } catch (Exception ex) {
            System.out.println(ex);

        }

    }

    public static Connection getConnection() throws SLSException {
        try {
            //從Web Server的Connection Pool取得連線
            Context ctx = new InitialContext();
            if (ctx == null) {
                throw new SLSException("無法取得JNDI Context.");
            }
            //本地端
            DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/sls");
            if (ds == null) {
                throw new RuntimeException("DataSource could not be found.");
            }

            Connection connection = ds.getConnection();
            System.out.println("從Connection Pool取得Connection:" + connection);
            return connection;

        } catch (Exception ex) {
            System.out.println("無法從Connection Pool取得連線" + ex);
            try {
                //1. 載入JDBC Driver
                Class.forName(driver);//checked exception: ClassNotFoundException

                //2. 建立Connection
                try {
                    Connection connection
                            = DriverManager.getConnection(url, userid, pwd); //checked exception: SQLException
                    System.out.println("取得JDBC Driver建立連線" + connection);
                    return connection;
                } catch (SQLException e) {
                    //e.printStackTrace();
                    throw new SLSException("無法建立Connection", e);
                }
            } catch (ClassNotFoundException e) {
                //e.printStackTrace();
                throw new SLSException("無法載入JDBC Driver", e);
            }
        }
    }
}
