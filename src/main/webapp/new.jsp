<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>通过mysql的JDBC驱动访问数据库</title>
  </head>
  <body>
    <h3 align="center">使用mysql的JDBC驱动访问mysql数据库</h3>
    <hr>
    <table border="1" bgcolor="#ccceee" align="center">
      <tr>
        <th width="87" align="center">学号</th>
        <th width="87" align="center">姓名</th>
        <th width="87" align="center">性别</th>
        <th width="87" align="center">年龄</th>
        <th width="87" align="center">体重</th>
      </tr>
      <%
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        Class.forName("com.mysql.jdbc.Driver");
        
        /*3306为端口号,student为数据库名,url后面添加的
        ?useUnicode=true&characterEncoding=gbk用于
                处理向数据库中添加中文数据时出现乱码的问题*/
        String url="jdbc:mysql://localhost:3306/blockchain?useUnicode=true&characterEncoding=gbk";
        con=DriverManager.getConnection(url,"root","root");
        stmt=con.createStatement();
        String sql="select * from stuinfo";
        rs=stmt.executeQuery(sql);
        while(rs.next()){
      %>
      <tr>
        <td><%=rs.getString("SID") %></td>
        <td><%=rs.getString("SName") %></td>
        <td><%=rs.getString("SSex") %></td>
        <td><%=rs.getString("SAge") %></td>
        <td><%=rs.getString("SWeight") %></td>
      </tr>
      <%
        }
        rs.close();
        stmt.close();
        con.close();
      %>
    </table>
  </body>
</html>