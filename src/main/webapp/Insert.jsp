<%@ page language="java" import="mySQL.*,infoGet.*,java.text.DecimalFormat,java.math.BigDecimal,java.sql.ResultSet,java.sql.SQLException,com.strgen,java.sql.Connection,java.sql.DriverManager,java.sql.Statement" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
String start = request.getParameter("start");
String end = request.getParameter("end");
int s=Integer.valueOf(start);
int e=Integer.valueOf(end);
DataInsert inserter=new DataInsert();
inserter.BlockInfoImport(s,e);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>title</title>
</head>
<body>

</body>
</html>