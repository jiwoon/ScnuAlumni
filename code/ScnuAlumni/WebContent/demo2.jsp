<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
	import="com.mysql.jdbc.Connection,java.sql.*,com.mysql.jdbc.PreparedStatement,org.jason.course.dao.*"%>
<%@ page import="org.jason.course.dao.CustomMessage.*"%>
<%@ page
	import="java.text.DateFormat,java.text.SimpleDateFormat,java.util.Date "%>
<%@ page import="org.jason.course.pojo.SNSUserInfo"%>
<!DOCTYPE html>
<html>
<head>
<title>校友最新活动</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<link rel="stylesheet" href="css/weui.min.css">
<link rel="stylesheet" href="css/jquery-weui.css">
<link rel="stylesheet" href="css/demos.css">

</head>
<body ontouchstart>
	<%
		// 获取由OAuthServlet中传入的参数
		SNSUserInfo user = (SNSUserInfo) request.getAttribute("snsUserInfo");
		if (null != user) {
			session.setAttribute("openid", user.getOpenId());
			session.setAttribute("nickname", user.getNickname());
		}
	%>
	<jsp:include page="recent_activity.jsp" flush="true" />
</body>
</html>
