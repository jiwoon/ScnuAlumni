<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.newttl.scnualumni.bean.database.Activity"%>
<%@ page import="com.newttl.scnualumni.util.DataBaseUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校友最新活动</title>
</head>
<body>
	<%
		String aid = request.getParameter("parmer");
		int id = Integer.parseInt(aid);
		DataBaseUtil dataBaseUtil = new DataBaseUtil();
		dataBaseUtil.deleteActivity(id);
	%>
	<jsp:include page="my_activity.jsp" />

</body>
</html>