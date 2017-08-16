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

		String aname = new String((request.getParameter("aname")).getBytes("ISO-8859-1"), "UTF-8");
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String aadress = new String((request.getParameter("aadress")).getBytes("ISO-8859-1"), "UTF-8");
		String atip = new String((request.getParameter("atip")).getBytes("ISO-8859-1"), "UTF-8");

		//发送客服消息
		String content = "活动通知\n" + aname + "将在 " + start_time + "举行，" + "地点为" + aadress + "\n活动简介:" + atip
				+ "\n发起人:jason";
		//CustomMessage.sentMessage(request.getParameter("openid"),content);

		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = format.format(date);

		Connection conn = JDBConnect.connectMySQL();
		String sql = "insert into activity (openid,activity_name,"
				+ "activity_adress,start_time,end_time,activity_intro,activity_holder) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
		// 截取二维码参数 选取其中的微信用户openid保存在数据库中
		ps.setString(1, openid);
		ps.setString(2, aname);
		ps.setString(3, aadress);
		ps.setString(4, start_time);
		ps.setString(5, end_time);
		ps.setString(6, atip);
		ps.setString(7, awho);
		ps.executeUpdate();
	%>
	<jsp:include page="recent_activity.jsp" />
	<%
		ps.close();
		conn.close();
	%>

</html>