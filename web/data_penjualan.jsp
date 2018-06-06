<%-- 
    Document   : data_penjualan
    Created on : Jun 7, 2018, 5:09:55 AM
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
 

<h3><span class="glyphicon glyphicon-briefcase"></span>  Data Penjualan</h3>
   
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
                String Data = "select * from m_penjualan";
                rs = statement.executeQuery(Data);
            %>
    
    <table class="table table-hover">
	<tr>
		<th class="col-md-2">Nama Pembeli</th>
		<th class="col-md-2">Kode Barang</th>
		<th class="col-md-2">No faktur</th>
		<th class="col-md-2">Tanggal Faktur</th>
		<th class="col-md-2">Jumlah Barang</th>
		<th class="col-md-2">Harga Satuan</th>
                <th class="col-md-2">Total harga</th>
	
	</tr>

                 <%
                     
                while (rs.next()) {
                %>
        <tr>
            
            <td><%=rs.getString("nama_pembeli")%></td>
            <td><%=rs.getString("kode_barang")%></td>
            <td><%=rs.getString("no_faktur")%></td>
            <td><%=rs.getString("tgl_faktur")%></td>
            <td><%=rs.getString("jumlah_barang")%></td>
            <td><%=rs.getString("harga_satuan")%></td>
            <td><%=rs.getString("total_harga")%></td>
            
            
            
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
