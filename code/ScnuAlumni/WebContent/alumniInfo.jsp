<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.newttl.scnualumni.util.DataBaseUtil" %>
<%@page import="com.newttl.scnualumni.bean.database.SignedUser" %>
<%
	request.setCharacterEncoding("UTF-8");
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

<link rel="stylesheet" href="resources/css/weui.css">
<link rel="stylesheet" href="resources/css/weui.min.css">
<link rel="stylesheet" href="resources/css/jquery-weui.css">
<!-- <link rel="stylesheet" href="resources/css/demos.css"> -->

<style type="text/css">
 .p{
 	line-height:48px;
 	color: black;
 	font-size: large;
 }
 .inline{
 	float: left;
 }
.my-label{
	color: gray;
 }
 </style>

<!-- <title>校友个人信息</title> -->

</head>

<body>

<%
	String alumniName=request.getParameter("alumniName");
	String alumniOpenId=request.getParameter("alumniOpenId");
	String alumniHeadImgUrl=request.getParameter("alumniHeadImgUrl");
	DataBaseUtil baseUtil=new DataBaseUtil();
	SignedUser signedUser=baseUtil.getSigned(alumniOpenId);
	//校友已经注册了，显示校友的信息 
	/* if(null != signedUser){ */
%>

<script type="text/javascript">
	document.title="<%=alumniName%>个人信息";
</script>

<form name="formInfo">
<div class="page__bd">
 <div class="weui_cells weui_cells_access"  style="margin-top: 0px">
 	<div class="weui_cell">
 		<div class="weui_cell_bd weui_cell_primary" style="height: 48px">
 			<p class="p"><%=alumniName%></p>
 		</div>
 		<div class="weui-cell_ft" style="height: 48px">
 			<img src="<%=signedUser.getHeadImgUrl() %>" style="height: 45px;width: 45px">
 		</div>
 	</div>
 </div>	
			    
<div class="weui_cells weui_cells_form" style="margin-top: 0px">

	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">性别</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getSex() %></p>
        </div>
    </div>
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">学院</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getCollege()%></p>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">班级</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getUserClass() %></p>
        </div>
    </div>

	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">手机号</label></div>
        <div class="weui_cell_bd weui_cell_primary"">
            <p ><%=signedUser.getPhone() %></p>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">QQ</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getQQ() %></p>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">邮箱</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.geteMail() %></p>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">城市</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getCity()%></p>
        </div>
    </div>

</div>

<div class="weui_cells weui_cells_form" style="margin-top: 0px">

	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">行业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p ><%=signedUser.getIndustry() %></p>
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">爱好</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p ><%=signedUser.getHobby() %></p>
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">职业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p ><%=signedUser.getProfession() %></p>
	    </div>
	</div>
	
</div>

</div>

</form>


</body>
</html>