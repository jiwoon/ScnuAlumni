<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.mysql.jdbc.Connection,java.sql.*,com.mysql.jdbc.PreparedStatement,org.jason.course.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校友最新活动</title>
</head>
<body>
	<%
		String aid = request.getParameter("parmer");

		Connection conn = JDBConnect.connectMySQL();
		String sql = "delete from activity where id =" + aid;
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
		// 截取二维码参数 选取其中的微信用户openid保存在数据库中
		ps.executeUpdate();
	%>
	<jsp:include page="my_activity.jsp" />
	<%
		ps.close();
		conn.close();
	%>
</body>
</html>