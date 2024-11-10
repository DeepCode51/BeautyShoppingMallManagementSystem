<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

  	function orderShouli(id){
  	  	location.href="<%=path %>/orderShouli.action?orderId="+id;
  	}
	function pingjia(id){
  	  	location.href="<%=path %>/goodsDetailQian.action?goodsId="+id;
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
                	<li><a href="qiantai/default.jsp">回到首页</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
	
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
					<table cellspacing="1" cellpadding="0" width="100%" border="0" bgcolor="#F7F3F7">
          <tr height="26">
              <td class="blackTitle" align="center">商品名称</td>
              <td class="blackTitle" align="center">购买数量</td>
              <td class="blackTitle" align="center">购买价格</td>
              <td class="blackTitle" align="center">状态</td>
          </tr>
		  <s:iterator value="#request.orderItemList" id="orderItem">
		  <tr class="text" align="center" bgcolor="#FFFFFF">
			  <td>
				<s:property value="#orderItem.goods.goodsName"/>
			  </td>
			  <td><s:property value="#orderItem.goodsQuantity"/></td>
			  <td><s:property value="#orderItem.goods.goodsTejia"/></td>
			  <td>
			  <s:property value="#orderItem.zt"/>
			  <s:if test="#orderItem.zt=='已发货'">
			  	<button onclick="orderShouli(<s:property value="#orderItem.orderItemId"/>)">收货</button>
			  </s:if>
			    <s:if test="#orderItem.zt=='已收货'">
			  	<button onclick="pingjia(<s:property value="#orderItem.goods.goodsId"/>)">评价</button>
			  </s:if>
			  </td>
		  </tr>
		  </s:iterator>
		  <tr align="center" bgcolor="#FAFAF1" height="22">
							  	<td colspan="4">
							  		<button type="button" onclick="history.go(-1)">返回</button>
							  	</td>
							  </tr>
  	</table>
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



