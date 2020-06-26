<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% Context initCtx = new InitialContext();
	
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource) envCtx.lookup("jdbc/miran");
	
	Connection con = ds.getConnection();
	
	String sql = "SELECT * FROM MEMBERSHIP";
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>멤버쉽</title>
</head>
<body>
<div class="container">
<h1 class="text-center font-weight-bold">멤버쉽</h1>
<br><br>
<table class="table table-hover">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>휴대전화</th>
	</tr>
<% 
	while(rs.next()){
		String name=rs.getString("NAME");
		String id=rs.getString("ID");
		String password=rs.getString("PASSWORD");
		String email=rs.getString("EMAIL");
		String phonenumber=rs.getString("PHONENUMBER");
%>
<tr>
		<td><%=name %></td>
		<td><%=id %></td>
		<td><%=password %></td>
		<td><%=email %></td>
		<td><%=phonenumber %></td>
	</tr>
<% } 
	rs.close();
	st.close();
	con.close();
%>
</table>
</div>
</body>
</html>