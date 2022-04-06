package winterolympic.dbc;

import java.sql.* ;
public class DatabaseConnection {
    private static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DBURL = "jdbc:mysql://localhost:3306/winterolympic" +
            "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DBUSER = "root";
    private static final String DBPASS = "Menamovic020122";
    private Connection conn;
    public DatabaseConnection() throws Exception {
        Class.forName(DBDRIVER);
        this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
    }
    public Connection getConn() {
        return conn;
    }
    public void setConn(Connection conn) {
        this.conn = conn;
    }
    public void close() throws Exception {
        if (this.conn != null) {
            try {
                this.conn.close();
            } catch(Exception e) {
                throw e;
            }
        }
    }
}
