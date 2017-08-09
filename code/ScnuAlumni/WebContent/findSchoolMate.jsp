<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>查找校友</title>
<script src="resources/js/jquery-2.1.4.js"></script>
<script src="resources/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" href="resources/css/jquery.autocomplete.css">
<link rel="stylesheet" href="resources/css/weui.css">

<script type="text/javascript">
//本地数组
var data=["java","javaee","jquery","c++","css","html","htm5","bb","ejb","c#"];
//开始
/* 
$().ready(function() {
	$("#autoComplete").autocomplete(data,  
	        {  
	            minChars: 0,  
	            max: 5,  
	            autoFill: true,  
	            mustMatch: true,  
	            matchContains: true,
	            formatItem: function (data, i, total) {  
	              return "<I>" + data[0] + "</I>";  
	            }, formatMatch: function (data, i, total) {  
	              return data[0];  
	            }, formatResult: function (data) {  
	              return data[0];  
	            }     
	              
	        });  
});
 */
 
 $(document).ready(function() {
		$.ajax({
			type:"POST",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			url:"/SignUpServlet",
			data:{userName:"guochang"},
			dataType:"json",
			success:function(data){
				alert(data);
				autocompleteFn(data);
			}
		});
	});
 
//自动 补全方法  
 function autocompleteFn(names){  
   $("#autocomplete").autocomplete(names,{  
     minChars:1,  
     max: 10,  
     dataType:"json",  
     autoFill: true,  
     mustMatch: true,  
     matchContains: true,  
     scrollHeight: 220,  
     formatItem: function(data, i, total) {  
       return "<I>"+data[0]+"</I>";  
     },  
     formatMatch: function(data, i, total) {  
       return data[0];  
     },  
     formatResult: function(data) {  
       return data[0];  
     }  
   });  
 }  

//搜索数据
function onSearch() {
	/* var userName=$("#autoComplete").val();
	alert(userName); */
	$.ajax({
		type:"POST",
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		url:"http://zlgvgnb.hk1.mofasuidao.cn/WeChat/SignUpServlet",
		data:{userName:"guochang"},
		dataType:"json",
		success:function(data){
			alert(data);
			autocompleteFn(data);
		}
	});
}

</script>


</head>
<body>

<div class="weui_cells weui_cells_form">
<div class="weui_cell">
	   	<div class="weui_cell_hd">
	   		<input class="weui_input" type="text" id="autoComplete" placeholder="输入校友名字">
	   	</div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <input class="weui_btn weui_btn_primary" type="button" name="btnSearch" onclick="onSearch();" value="搜索">
	    </div>
	</div>
</div>

</body>
</html>