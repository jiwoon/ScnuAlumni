<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.mysql.jdbc.Connection,java.sql.*,com.mysql.jdbc.PreparedStatement,org.jason.course.dao.*"%>
<%@ page import="org.jason.course.dao.CustomMessage.*"%>
<%@ page
	import="java.text.DateFormat,java.text.SimpleDateFormat,java.util.Date "%>
<%@ page import="org.jason.course.pojo.SNSUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String openid = (String) session.getAttribute("openid");
		String awho = (String) session.getAttribute("nickname");
		String aid = (String) session.getAttribute("aid");

		String aname = new String((request.getParameter("aname")).getBytes("ISO-8859-1"), "UTF-8");
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String aadress = new String((request.getParameter("aadress")).getBytes("ISO-8859-1"), "UTF-8");
		String atip = new String((request.getParameter("atip")).getBytes("ISO-8859-1"), "UTF-8");

		Connection conn = JDBConnect.connectMySQL();

		//tip：如果是字符串，记得添加单引号！！！
		String sql = "update activity set activity_name='" + aname + "',activity_adress='" + aadress
				+ "',start_time='" + start_time + "',end_time='" + end_time + "',activity_intro='" + atip
				+ "' where id =" + aid;
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
		// 截取二维码参数 选取其中的微信用户openid保存在数据库中
		ps.executeUpdate();
	%>
	<jsp:include page="my_activity.jsp" />
	<%
		ps.close();
		conn.close();
	%>

</html>