<%@page import="java.util.ArrayList"%>
<%@page import="com.newttl.scnualumni.util.DataBaseUtil"%>
<%@page import="com.newttl.scnualumni.bean.database.Alumnus"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	List<Alumnus> alumnus=new ArrayList<Alumnus>();
	DataBaseUtil baseUtil=new DataBaseUtil();
	alumnus=baseUtil.getAllAlumnus();
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>查找校友</title>

<link rel="stylesheet" href="resources/css/jquery.autocomplete.css">
<link rel="stylesheet" href="resources/css/weui.css">
<link rel="stylesheet" href="resources/css/jquery-weui.css">

<script src="resources/js/jquery-browser.js"></script>
<script src="resources/js/jquery-2.1.4.js"></script>
<script src="resources/js/baiduTemplate.js"></script>
<script src="resources/js/jquery-weui.js"></script>
<script src="resources/js/jquery.autocomplete.js"></script>

<style type="text/css">

.inline{
 	float: left;
 }
 
 </style>



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
		var name=$("#autoComplete").val();
		/* 
		var jsonStr={'userName':name};
		$.ajax({
			type:"POST",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			url:"http://zlgvgnb.hk1.mofasuidao.cn/ScnuAlumni/SignUpServlet",
			data:JSON.stringify(jsonStr),
			dataType:"json",
			success:function(data){  
				var resp=JSON.stringify(data);
				var jsonObj = JSON.parse(resp);
				var rnames=jsonObj.names;
				alert(rnames);
				autocompleteFn(rnames);
			}
		});
		   */
	});
 
 function getEnter(){
	 	var name=$("#autoComplete").val();
		var jsonStr={'userName':name};
		$.ajax({
			type:"POST",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			url:"/ScnuAlumni/SignUpServlet",
			data:JSON.stringify(jsonStr),
			dataType:"json",
			success:function(data){  
				var resp=JSON.stringify(data);
				var jsonObj = JSON.parse(resp);
				alert(jsonObj.names);
				autocompleteFn(jsonObj.names);
			}
		});
}
 
//自动 补全方法  
 function autocompleteFn(names){  
   $("#autocomplete").autocomplete(names,
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
 }  

//搜索数据
function onSearch() {
	var name=$("#autoComplete").val();
	/* alert(name); */
	if (("" != name) && (name.indexOf(" ") < 0)) {
		var jsonStr={'userName':name};
		$.ajax({
			type:"POST",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			url:"/ScnuAlumni/SignUpServlet",
			data:JSON.stringify(jsonStr),
			dataType:"json",
			success:function(data){  
				var resp=JSON.stringify(data);
				var jsonObj = JSON.parse(resp);
				/* alert(jsonObj.length); */
				var jsonLength=jsonObj.users.length;
				if (jsonLength <= 0) {
					/* alert("不存在该校友!"); */
					$.toast("不存在该校友!");
				}
				
				//使用模板 ,使用baidu.template命名空间
				var bt=baidu.template;
				//可以设置分隔符
				bt.LEFT_DELIMITER='<!';
				bt.RIGHT_DELIMITER='!>';

				//可以设置输出变量是否自动HTML转义
				//bt.ESCAPE = false;

				var jsonLength=jsonObj.users.length;
				//最简使用方法
				var html=bt('resultmodel',jsonObj);
				//渲染
				document.getElementById('result').innerHTML=html;
				/* document.body.innerHTML=html; */
			}
		});
	}else {
		alert("请输入正确的名字!");
	}
	
}


function alumniClick(i) {
	var formName="alumniform"+String.valueOf(i);
	document.formName.submit();
}

function alumnus(i) {
	var formName="alumnus"+String.valueOf(i);
	document.formName.submit();
}

</script>

<!-- 结果显示模板 -->
<script id="resultmodel" type="text/html">

<!
	if(users.length > 0){
		for(var i=0;i<users.length;i++){
!>
			<form action="alumniInfo.jsp" method="post" name="alumniform<!=i!>">
			<div class="weui_cells weui_cells_form" style="margin-top: 0px">
			
			<div class="weui_cell">
				<div class="inline">
					<p><!=users[i].userName!></p>
				</div>
    			<div class="inline weui_cell_bd weui_cell_primary">
					<button class="weui_input" onclick="alumniClick(i);" value="<!=users[i].userName!>"></button>
					<input type="hidden" name="alumniName" value="<!=users[i].userName!>">
 					<input type="hidden" name="alumniOpenId" value=<!=users[i].openId!>>
				</div>
        		<div class="inline weui-cell_ft">
         		    <img src="<!=users[i].headImgUrl!>" style="height: 40px;width: 40px">
					<input type="hidden" name="alumniHeadImgUrl" value=<!=users[i].headImgUrl!>>
       			</div>
    		</div>
			</div>
			</form>
<!
		}
!>
<!
	}else{
!>
	<div class="weui_cell">
    	<div class="weui_cell_hd"><p>不存在该校友,请重新输入!</p></div>
    </div>
<!
	}
!>


</script>

</head>
<body>

<div class="weui_cells weui_cells_access"  style="margin-top: 0px">
 	<div class="weui_cell">
 		<div class="weui_cell_bd weui_cell_primary">
	   		<input class="weui_input" type="text" id="autoComplete" placeholder="输入校友名字">
	   	</div>
 		
 		<div class="weui-cell_ft">
 			
 			<input class="weui_btn weui_btn_mini weui_btn_primary" type="button" name="btnSearch" onclick="onSearch();" value="搜索">
 		</div>
 	</div>
</div>

<div id="result">

<%
	if(alumnus.size() > 0){
		for(int i=0;i < alumnus.size();i++){
			
%>
			<form action="alumniInfo.jsp" method="post" name="alumnus<%=i%>">
			<div class="weui_cells weui_cells_form" style="margin-top: 0px">
			
			<div class="weui_cell">
				<div class="inline">
					<p><%=alumnus.get(i).getUserName()%></p>
				</div>
    			<div class="inline weui_cell_bd weui_cell_primary">
					<button class="weui_input" onclick="alumnus(i);" value="<%=alumnus.get(i).getUserName()%>"></button>
					<input type="hidden" name="alumniName" value="<%=alumnus.get(i).getUserName()%>">
 					<input type="hidden" name="alumniOpenId" value="<%=alumnus.get(i).getOpenId()%>">
				</div>
        		<div class="inline weui-cell_ft">
         		    <img src="<%=alumnus.get(i).getHeadImgUrl()%>" style="height: 40px;width: 40px">
					<input type="hidden" name="alumniHeadImgUrl" value="<%=alumnus.get(i).getHeadImgUrl()%>">
       			</div>
    		</div>
			</div>
			</form>
<%		
		}
	}
%>

</div>	


<script src="resources/js/fastclick.js"></script>
 
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>

<!-- 
 <script>
 	 $(document).on("click", "#show-alumni", function() {
 		document.alumniform.submit();
 		alert("你好!");
       });
 	
</script>
 -->
</body>
</html>