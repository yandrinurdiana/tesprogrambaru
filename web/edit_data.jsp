<%-- 
    Document   : edit_data
    Created on : Jun 7, 2018, 3:55:49 AM
    Author     : Bluesky
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
  <div id="page-wrapper">
            <div class="row"></div>  
        <div id="con2">
            <h3 align="center">Update Data</h3><p></p>
            <form action="" method="post">
                 <%
                try {
                    
                    String url ="jdbc:mysql://localhost/sparepart";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, "root", "");
                    statement = connection.createStatement();
                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "select * from m_barang where kode_barang='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                %>   
                <p>
                    <label></label><input type="hidden" name="kode_barang" value='<%=rs.getString("kode_barang")%>'/>
                </p>
                <div>
                   <label>Harga Jual</label><input type="text" name="nama_barang" class="form-control" value='<%=rs.getString("nama_barang")%>'/> 
                    <div >
                    <label>Harga Jual</label><input type="text" name="harga_jual" class="form-control" value='<%=rs.getString("harga_jual")%>'/>
                </div>
                <div>
                    <label>Harga_beli</label><input type="text" name="harga_beli" class="form-control" value='<%=rs.getString("harga_beli")%>'/>
                </div>
                <div>
                    <label>Satuan</label>
                    <select class="form-control" name="satuan">
                    <option>pcs</option>
                    <option>box</option>
    
                </select>
                </div>
                <div>
                <label>Kategori Barang</label>
            <select class="form-control" name="kategori">
            <option>sparepart motor</option>
            <option>sparepart mobil</option>
    
                </select>
		</div>
                  
                <div>
                    <label>Stok Barang</label><input type="text" name="stok_barang" class="form-control" value='<%=rs.getString("stok_barang")%>'/>
                </div>
                <div>
                    <label></label><input type="submit" class="btn btn-default" name="submit" value="Update"/>
                    <a href="data_barang.jsp">Kembali</a>
                </div>
                <%   }
                    rs.close();
                    statement.close();
                    connection.close();
                } catch (Exception ed) {
                    out.println("Can't connect to database.");
                }
                %>
            </form>
        </div>
        
  
<%
String a=request.getParameter("kode_barang");
String b=request.getParameter("nama_barang");
String c=request.getParameter("harga_jual");
String d=request.getParameter("harga_beli");
String e=request.getParameter("satuan");
String f=request.getParameter("kategori");
String g=request.getParameter("stok_barang");

//membuat variabel untuk nampung alamat untuk akses database nantinya.
String url ="jdbc:mysql://localhost/sparepart";
//membuat koneksi ke database dengan jdbc
Connection conn=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
int  updateQuery=0;
//untuk mengecek textbox name, city, dan phone tidak kosong
         try{
        conn=DriverManager.getConnection(url,"root","");
        String query="update m_barang set nama_barang=?,harga_jual=?,harga_beli=?,satuan=?,kategori=?,stok_barang=? where kode_barang='"+a+"'";
        ps=conn.prepareStatement(query);
        ps.setString(1,b);
        ps.setString(2,c);
        ps.setString(3,d);
        ps.setString(4,e);
        ps.setString(5,f);
        ps.setString(6,g);
        updateQuery=ps.executeUpdate();
        if(updateQuery>0){
            JOptionPane.showMessageDialog(null, "Berhasil Update Data");
            response.sendRedirect("data_barang.jsp");
        }
        }catch(Exception ex){
           
        out.println("Koneksi bermasalah");
        
 response.sendRedirect("data_barang.jsp");
    }finally{
        ps.close();
        conn.close();
   
}
       
%>

<%@include file="footer.jsp" %>