<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<html lang="zh-cn">
<head>
<title>TF美妆产品购物商城</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="<%=path%>/css/style.css" rel='stylesheet' type='text/css' />
<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
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
                	<li><a href="qiantai/default.jsp">回到首页</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
	<s:iterator value="#request.orderList" id="order">
		    </s:iterator>		
	<form action="<%=path %>/orderFk.action" name="f1" method="post">
 <input type="hidden" name="orderId" value="<s:property value="#order.orderId"/>"/>


         
                  <table width="100%">
                  	<tr>
                  		<td>付款金额</td>
                  		 <td>￥<s:property value="#order.orderJine"/></td>
                  	</tr>
                  	<tr>
                  		<td><input type="radio" id="b" name="b"><img src="/cosmetic/img/bank1.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/cosmetic/img/bank2.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/cosmetic/img/bank3.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/cosmetic/img/bank4.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/cosmetic/img/bank5.jpg" width="100" height="60"> </td>
                  	</tr>
            	
                  	<tr>
                  		<td colspan="2">
                  			<input type="submit" value="提交"  >
                  			<input type="reset" value="重置">
                  		</td>
                  	</tr>
                  </table>
                  </form>
				<link href="<%=path%>/css/component.css" rel='stylesheet' type='text/css' />
                <script src="<%=path%>/js/cbpViewModeSwitch.js" type="text/javascript"></script>
                <script src="<%=path%>/js/classie1.js" type="text/javascript"></script>
		</div>
		<div class="clearfix"></div>
	</div>
</div>   	
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> 
 <script type="text/javascript">

    	
    	<%
		String suc = (String)request.getAttribute("suc");
    	String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("用户名或密码错误");
		 location.replace("/b2csys/login.jsp");
		 <%}
		if(suc!=null){%>
		 alert("支付成功");
		 location.replace("/b2csys/orders.jsp");
		 <%}%>
    </script>
</body>
</html>		
