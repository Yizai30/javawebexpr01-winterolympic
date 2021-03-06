package winterolympic.dao.impl;

import winterolympic.dao.IUsrDAO;
import winterolympic.vo.Usr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsrDAOImpl implements IUsrDAO {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    public UsrDAOImpl(Connection conn){
        this.conn = conn;
    }

    private boolean checkUid(String str) {
        int len = str.length();
        if (len < 3 || len > 16) {
            return false;
        }
        for (int i = 0; i < len; i++) {
            char ch = str.charAt(i);
            if ((ch < 'a' || ch > 'z') && (ch < 'A' || ch > 'Z') && (ch < '0' || ch > '9') && ch != '_') {
                return false;
            }
        }
        return true;
    }

    private boolean checkAge(int age) {
        if (age < 18 || age > 150) {
            return false;
        }
        return true;
    }

    private boolean checkPasswd(String str) {
        int len = str.length();
        if (len < 3) {
            return false;
        }
        for (int i = 0; i < len; i++) {
            char ch = str.charAt(i);
            if ((ch < 'a' || ch > 'z') && (ch < 'A' || ch > 'Z') && (ch < '0' || ch > '9') && ch != '_') {
                return false;
            }
        }
        return true;
    }

    public boolean doCreate(Usr usr) throws Exception{

        // 如果用户 uid 存在，则注册无效
        if (findByUid(usr.getUid()) != null) {
            System.out.println("该用户已存在，注册无效");
            return false;
        }

        boolean flag = false ;
        String sql = "INSERT INTO user_info(uid,name,gender,age,passwd) VALUES (?,?,?,?,?)";
        this.pstmt = this.conn.prepareStatement(sql);
        System.out.println(usr.getClass());
        System.out.println("task:doCreate(Usr usr).");
        if (!checkUid(usr.getUid()) || !checkAge(usr.getAge()) || !checkPasswd(usr.getPasswd())) {
            System.out.println("注册信息不合法");
            return false;
        }
        this.pstmt.setString(1, usr.getUid());
        this.pstmt.setString(2, usr.getName());
        this.pstmt.setByte(3, usr.getGender());
        this.pstmt.setInt(4, usr.getAge());
        this.pstmt.setString(5, usr.getPasswd());
        if (this.pstmt.executeUpdate() > 0) {
            System.out.println("SQL statement executed successfully.");
            flag = true;
        }
        this.pstmt.close();
        return flag;
    }

    public Usr findByUid(String uid) throws Exception {
        Usr usr=null;
        String sql = "SELECT uid,name,gender,age,passwd FROM user_info WHERE uid=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, uid);
        ResultSet rs = this.pstmt.executeQuery();
        while (rs.next()) {
            usr = new Usr();
            usr.setUid(rs.getString(1));
            usr.setName(rs.getString(2));
            usr.setGender(rs.getByte(3));
            usr.setAge(rs.getInt(4));
            usr.setPasswd(rs.getString(5));
        }
        this.pstmt.close();

        return usr;
    }

    public boolean check(Usr usr) throws Exception {
        boolean flag = false;
        String sql = "SELECT uid FROM user_info WHERE uid=? and passwd=?" ;
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1, usr.getUid());
        this.pstmt.setString(2, usr.getPasswd());
        ResultSet rs = this.pstmt.executeQuery();
        if (rs.next()) {
            flag = true;
        }
        else {
            flag = false;
        }
        this.pstmt.close();
        return flag;
    }
}
