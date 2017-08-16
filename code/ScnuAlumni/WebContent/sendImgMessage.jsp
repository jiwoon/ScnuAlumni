<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.mysql.jdbc.Connection,java.sql.*,com.mysql.jdbc.PreparedStatement,org.jason.course.dao.*"%>
<%@ page import="org.jason.course.dao.CustomMessage.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String aid = request.getParameter("aid");
		String openid = request.getParameter("openid");

		Connection conn = JDBConnect.connectMySQL();
		String sql = "select * from activity where id =" + aid;
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		String aname = rs.getString("activity_name");
		String start_time = rs.getString("start_time");
		String end_time = rs.getString("end_time");
		String aadress = rs.getString("activity_adress");
		String atip = rs.getString("activity_intro");
		String awho = rs.getString("activity_holder");
		//发送客服消息
		String content = aname + "/" + start_time + " - " + end_time + "/" + aadress + "/" + atip + "/" + awho;
		CustomMessage.sentMessage(openid, content);
	%>
	<script>
		alert("你的活动邀请海报已经生成，请回到公众号查看！")
	</script>
	<jsp:include page="recent_activity.jsp" />
	<%
		rs.close();
		ps.close();
		conn.close();
	%>
</body>
</html>