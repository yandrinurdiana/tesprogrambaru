<%-- 
    Document   : data_barang
    Created on : Jun 7, 2018, 3:06:07 AM
    Author     : Bluesky
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Latihan Java Web | TutorialPedia.NET</title>
     </head>
    
    <body>
    <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
   <div id="page-wrapper">
            <div class="row">
 

<h3><span class="glyphicon glyphicon-briefcase"></span>  Data Barang</h3>
    <a href="tambah_data.jsp">Tambah</a>
<br/>
<br/>  

    <%
            try{
                            String url ="jdbc:mysql://localhost/sparepart";

                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, "root", "");
                statement = connection.createStatement();
                String Data = "select * from m_barang";
                rs = statement.executeQuery(Data);
            %>
    
    <table class="table table-hover">
	<tr>
		<th class="col-md-2">Nama Barang</th>
		<th class="col-md-2">Kategori Barang</th>
		<th class="col-md-2">Harga Beli</th>
		<th class="col-md-2">Harga Jual</th>
		<th class="col-md-2">Satuan Barang</th>
		<th class="col-md-2">Stok Barang</th>
		<th class="col-md-2">Opsi</th>
	</tr>

                 <%
                     
                while (rs.next()) {
                %>
        <tr>
            
            <td><%=rs.getString("nama_barang")%></td>
            <td><%=rs.getString("harga_jual")%></td>
            <td><%=rs.getString("harga_beli")%></td>
            <td><%=rs.getString("satuan")%></td>
            <td><%=rs.getString("kategori")%></td>
            <td><%=rs.getString("stok_barang")%></td>
            
            
            
            <td><a href="edit_data.jsp?u=<%=rs.getString("kode_barang")%>" >edit</a> 
                / <a href="hapus.jsp?d=<%=rs.getString("kode_barang")%>" > hapus</a></td>
        </tr>
        <%}%>
    </table>
                <%
                rs.close();
                statement.close();
                connection.close();
            } catch (Exception ex) {
                out.println("Can't connect to database.");
            }
            %>
            <%@include file="footer.jsp" %>