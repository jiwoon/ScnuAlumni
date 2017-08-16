<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
	import="com.mysql.jdbc.Connection,java.sql.*,com.mysql.jdbc.PreparedStatement,org.jason.course.dao.*"%>
<%@ page import="org.jason.course.dao.CustomMessage.*"%>
<%@ page
	import="java.text.DateFormat,java.text.SimpleDateFormat,java.util.Date "%>
<%@ page import="org.jason.course.pojo.SNSUserInfo"%>
<html>
<head>
<link rel="stylesheet" href="css/weui.min.css">
<link rel="stylesheet" href="css/jquery-weui.css">
<link rel="stylesheet" href="css/demos.css">
<script src="js/jquery-2.1.4.js"></script>
<script src="js/fastclick.js"></script>
<script src="js/jquery-weui.js"></script>
<title>校友近期活动</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
</head>
<body>
	<%!public static final int PAGESIZE = 3;
	int pageCount = 0;%>

	<div class="weui-btn-area">
		<a href="recent_activity.jsp"
			class="weui-btn weui-btn_mini weui-btn_primary"><h3>近期活动</h3></a> <a
			href="add_activity.jsp"
			class="weui-btn_mini weui-btn weui-btn_plain-primary">发起活动</a> <a
			href="my_activity.jsp"
			class="weui-btn_mini weui-btn weui-btn_plain-primary">我的活动</a>
	</div>
	<hr />
	<div class="weui-form-preview__item">
		<br />
		<h2>&nbsp;近期活动</h2>
	</div>

	<%
		String openid = (String) session.getAttribute("openid");
		String nickname = (String) session.getAttribute("nickname");
		Connection conn = JDBConnect.connectMySQL();

		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = format.format(date);
		String sql = "select * from activity where end_time > '" + time + "' order by start_time";
		//String sql = "select * from activity";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		//将游标移到最后一行
		rs.last();
		//获取最后一行的行号
		int size = rs.getRow();
		pageCount = (size % PAGESIZE == 0) ? (size / PAGESIZE) : (size / PAGESIZE + 1);
		//当前显示的页数
		int curPage = 1;
		String tmp = request.getParameter("curPage");
		if (tmp == null) {
			tmp = "1";
		}
		curPage = Integer.parseInt(tmp);
		if (curPage >= pageCount)
			curPage = pageCount;
		if (curPage <= 1)
			curPage = 1;
		//游标移动到对应的位置
		rs.absolute((curPage - 1) * PAGESIZE + 1);
		int count = 1;
		do {
			if (count > PAGESIZE)
				break;
			count++;
			if (size > 0) {
	%>

	<div class="weui-form-preview">
		<!-- head 部分 -->
		<div class="weui-form-preview__hd">
			<div class="weui-form-preview__item">
				<label class="weui-form-preview__label">活动名称</label> <span
					class="weui-form-preview__value"><%=rs.getString("activity_name")%></span>
			</div>
		</div>
		<!-- body 部分 -->
		<div class="weui-form-preview__bd">
			<div class="weui-form-preview__item">
				<label class="weui-form-preview__label">活动开始时间</label> <span
					class="weui-form-preview__value"><%=rs.getString("start_time")%></span>
			</div>
			<div class="weui-form-preview__item">
				<label class="weui-form-preview__label">活动结束时间</label> <span
					class="weui-form-preview__value"><%=rs.getString("end_time")%></span>
			</div>
			<div class="weui-form-preview__item">
				<label class="weui-form-preview__label">活动地点</label> <span
					class="weui-form-preview__value"><%=rs.getString("activity_adress")%></span>
			</div>
			<div class="weui-form-preview__item">
				<label class="weui-form-preview__label">活动介绍</label> <span
					class="weui-form-preview__value"><%=rs.getString("activity_intro")%></span>
			</div>
			<div class="weui-form-preview__item">
				<label class="weui-form-preview__label">发起人</label> <span
					class="weui-form-preview__value"><%=rs.getString("activity_holder")%></span>
			</div>
		</div>
	</div>
	<hr />

	<%
		}
		} while (rs.next());

		rs.close();
		ps.close();
		conn.close();
	%>
	<br />
	<div style="text-align: center">
		<a href="recent_activity.jsp?curPage=1" class="weui-footer__link">首页</a>
		<a href="recent_activity.jsp?curPage=<%=curPage - 1%>"
			class="weui-footer__link">上一页</a> <a
			href="recent_activity.jsp?curPage=<%=curPage + 1%>"
			class="weui-footer__link">下一页</a> <a
			href="recent_activity.jsp?curPage=<%=pageCount%>"
			class="weui-footer__link">尾页</a> <br />
		<div class="weui-footer">
			<p class="weui-footer__text">
				第<%=curPage%>页/共<%=pageCount%>页
			</p>
		</div>
		<br /> <br />
	</div>
	<br />
	<br />

</body>
</html>