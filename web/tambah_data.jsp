<%-- 
    Document   : tambah_data
    Created on : Jun 7, 2018, 2:40:41 AM
    Author     : Bluesky
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah Data</title>
        <style type="text/css">
            *{margin:auto;padding:0;}
            #con2{width:500px;padding:30px;}
            p{margin-bottom:10px;}
            label{display:inline-block;width:150px;}
        </style>
    </head>
    <body>
          <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
  
        <div id="page-wrapper">
            <div class="row"></div>
            <h3 align="center">Tambah Data</h3><p></p>
            <form action="" method="post">
              <div>
                    
                    <label>Nama Barang</label>
                    <input type="text" name="nama_barang" class="form-control"  />
             </div>
                
                <div >
                    <label>Harga Jual</label><input type="text" name="harga_jual" class="form-control"/>
                </div>
                <div>
                    <label>Harga_beli</label><input type="text" name="harga_beli" class="form-control"/>
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
                    <label>Stok Barang</label><input type="text" name="stok_barang" class="form-control"/>
                </div>
                  
                <div>
                    <label></label><input type="submit" class="btn btn-default" name="submit" value="Simpan"/>
                    <a href="data_barang.jsp">Kembali</a>
              </div>
            </form>
        </div>
 
<%
String a=request.getParameter("nama_barang");
String b=request.getParameter("harga_jual");
String c=request.getParameter("harga_beli");
String d=request.getParameter("satuan");
String e=request.getParameter("kategori");
String f=request.getParameter("stok_barang");
//membuat variabel untuk nampung alamat untuk akses database nantinya.
String url ="jdbc:mysql://localhost/sparepart";
//membuat koneksi ke database dengan jdbc
Connection conn=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
int updateQuery=0;
//untuk mengecek textbox name, city, dan phone tidak kosong
if(a!=null && b!=null && c!=null && d!=null && e!=null){
    if(a!="" && b!="" && c!="" && d!="" && e!=""){
         try{
        conn=DriverManager.getConnection(url,"root","");
        String query="Insert into m_barang(nama_barang,harga_jual,harga_beli,satuan,kategori,stok_barang) values(?,?,?,?,?,?)";
        ps=conn.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,b);
        ps.setString(3,c);
        ps.setString(4,d);
        ps.setString(5,e);
        ps.setString(6,f);
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            JOptionPane.showMessageDialog(null, "Berhasil Tambah Data");
            response.sendRedirect("data_barang.jsp");
        }
    }catch(Exception ex){
        out.println("Koneksi bermasalah");
        response.sendRedirect("data_barang.jsp");
 
    }finally{
        ps.close();
        conn.close();
    }
    }
}
%>

<%@include file="footer.jsp" %>