<%@ page import="java.math.BigDecimal,java.sql.ResultSet,java.sql.SQLException,com.strgen,java.sql.Connection,java.sql.DriverManager,java.sql.Statement" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Blocks</title>
</head>
<body>
	<h1>Blocks</h1>
	<table border="0">
		<tr>
			<th>Height</th>
			<th>Hash</th>
			<th>Time</th>
			<th>Size</th>
			<th>Reward</th>
		</tr>
		<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/blockchain?useUnicode=true&characterEncoding=gbk";
		con=DriverManager.getConnection(url,"root","root");
		stmt=con.createStatement();
		String sql="select height,hash,time,size from block order by height";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+" bytes"+"</td>");
			//BigDecimal reward=new BigDecimal(rs.getString(5));
			//reward=reward.divide(new BigDecimal("100000000"));
			//out.println("<td>"+reward.toPlainString()+" BTC"+"</td>");
			out.println("</tr>");
		}
		rs.close();
		stmt.close();
		con.close();
		%>
		</table>
</body>
</html>
