<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Context initCtx = new InitialContext();
	
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource) envCtx.lookup("jdbc/miran");
	
	Connection conn = ds.getConnection();
	
	String str = "연결 성공";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP 연결</title>
</head>
<body>
	<%=str %>
</body>
</html>