package newpackage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class koneksi {
    private Statement st;
    public static Connection con;
    public static Statement stm;
    public static void main(String args[]){
        try {
            String url ="jdbc:mysql://localhost/sparepart";
            String user="root";
            String pass="";
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection(url,user,pass);
            stm = con.createStatement();
            System.out.println("koneksi berhasil;");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("koneksi gagal" +e.getMessage());
        }
    }
    
    public void Koneksi(){
        try {
            String url ="jdbc:mysql://localhost/sparepart";
            String user="root";
            String pass="";
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection(url,user,pass);
            stm = con.createStatement();
            System.out.println("koneksi berhasil;");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("koneksi gagal" +e.getMessage());
        }
    }
    public void diskonek(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            st.close();
            con.close();
        } catch (SQLException x) {
            System.out.println("Terjadi kesalahan diskoneksi : " + x);
        }
    }
    
     public ResultSet ambilData(String sql) {
        ResultSet rs = null;
        try {
            Koneksi();
            rs = st.executeQuery(sql);
        } catch (SQLException x) {
            System.out.println("Terjadi kesalahan ambil data : " + x);
        }
        return rs;
    }
    public void simpanData(String sql) {
        try {
            Koneksi();
            st.executeUpdate(sql);
        } catch (SQLException x) {
            System.out.println("Terjadi kesalahan simpan data : " + x);
        }
    }
}