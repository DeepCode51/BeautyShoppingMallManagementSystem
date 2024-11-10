<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>


<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<title>TF美妆产品购物商城</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="<%=path%>/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<script type="text/javascript" src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
var $ = jQuery.noConflict();
	$(function() {
		$('#activator').click(function(){
				$('#box').animate({'left':'0px'},500);
		});
		$('#boxclose').click(function(){
				$('#box').animate({'left':'-2300px'},500);
		});
		$('#box').animate({'left':'0px'},500);
	});
</script>

   
    <script language="JavaScript" type="text/javascript">
    function check2()
    {
        if(document.form1.userName.value=="")
        {
            alert("请输入账号");
            return false;
        }
        if(document.form1.userPw.value=="")
        {
            alert("请输入密码");
            return false;
        }
        document.form1.submit();
    }
    </script>
</head>
<body>
<div class="sales">
   <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
</div>

<div class="about_top">
  <div class="container">
		<div class="col-md-3">
			<%@include file="/qiantai/inc/incLeft.jsp" %>
		</div>
		<div class="col-md-9 content_right">
		   <div class="dreamcrub">
                <ul class="previous">
                	<li><a href="<%=path%>/qiantai/default.jsp">回到首页</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
	
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
					<form action="<%=path %>/userReg.action" name="form1" method="post">
						 <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
							<tr>
								<td width="14%" height="30" align="center" bgcolor="#F9F9F9" style="font-size: 11px;">
									账号：
								</td>
								<td width="86%" bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userName" style="width: 250px;"/>
								</td>
							</tr>
							<tr>
								<td height="30" align="center" bgcolor="#F9F9F9" style="font-size: 11px;">
									密码：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="password" name="userPw" style="width: 250px;" value="000000"/>(默认：000000)
								</td>
							</tr>
							<tr>
								<td height="30" align="center" bgcolor="#F9F9F9" style="font-size: 11px;">
									姓名：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userRealname" style="width: 250px;"/>
								</td>
							</tr>
							<tr>
								<td height="30" align="center" bgcolor="#F9F9F9" style="font-size: 11px;">
									住址：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userAddress" size="50" style="width: 250px;"/>
								</td>
							</tr>
							<tr>
								<td height="30" align="center" bgcolor="#F9F9F9" style="font-size: 11px;">
									电话：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userTel" style="width: 250px;"/>
								</td>
							</tr>
							<tr>
								<td height="30" align="center" bgcolor="#F9F9F9" style="font-size: 11px;">
									邮箱：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userEmail" style="width: 250px;"/>
								</td>
							</tr>
							<tr>
								<td height="30" align="center" bgcolor="#F9F9F9">
									&nbsp;
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="button" value="确定" onclick="check2();"/>
									<input type="reset" value="重置"/>
								</td>
							</tr>
						</table>
					 </form>	
				</div>
				<link href="<%=path%>/css/component.css" rel='stylesheet' type='text/css' />
                <script src="<%=path%>/js/cbpViewModeSwitch.js" type="text/javascript"></script>
                <script src="<%=path%>/js/classie1.js" type="text/javascript"></script>
		</div>
		<div class="clearfix"></div>
	</div>
</div>   	
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> 
</body>
</html>		

