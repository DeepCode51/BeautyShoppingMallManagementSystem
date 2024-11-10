<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>TF美妆产品购物商城后台登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type='text/javascript' src='<%=path%>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
		<style type="text/css">
body {
	background: rgba(205,163,152);
	background-repeat: no-repeat;
	background-size: cover;
}

* {
	font-family: "微软雅黑";
}

#Layer1 {
	border:1px solid #CCC;
	border-radius:5px;
	background-color:rgba(220,220,220,0.5);

	width:350px;
	height:240px;
	margin:100px auto;
	z-index: 1
}
h2{
padding-bottom:15px;
border-bottom:1px dashed #EEE;
text-align:center;
color:#333;
}
p{
line-height:30px;
padding:0px 30px;
}
p span{
padding:0px 10px;
}
p input{
border:1px solid #EEE;
border-radius:2px;
width:200px;
}
.btn{
line-height:30px;
text-align:center;
}
button{
display:inline-bolck;
background-color:#E40139;
font-size:18px;
font-weight:600;
width:240px;
color:#FFF;
border:0px;
border-radius:2px;
}
</style>

		<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }

			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
		}
		
		function callback(data)
		{
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path%>/loginSuccess.jsp";
		    }
		}
	    </script>

	</head>

	<body>
		<div id="Layer1">
			<form action="" name="ThisForm" method="post">
				<h2>TF美妆产品购物商城后台登录</h2>
				<p><span>账号:</span><input name="userName" type="text"/></p>
				<p><span>密码:</span><input name="userPw" type="password"/></p>
				<div class="btn"><button type="button" onClick="check1()">登录</button></div>	
			</form>
		</div>
	</body>
</html>
