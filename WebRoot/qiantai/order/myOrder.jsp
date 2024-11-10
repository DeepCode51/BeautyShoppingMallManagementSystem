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
	function orderDel(orderId)
    {
	    if(confirm("是否删除?")){
        var url="<%=path %>/orderDel.action?orderId="+orderId;
        window.location.href=url;
	    }
    }
    
    
    	function hdfk(orderId)
    {
        var url="<%=path %>/orderHdFk.action?orderId="+orderId;
        window.location.href=url;
    }
        	function wyfk(orderId)
    {
        var url="<%=path %>/bank.action?orderId="+orderId;
        window.location.href=url;
    }
    function orderDetail(orderId)
    {
    	location.href="<%=path %>/orderDetail.action?orderId="+orderId;   
    }
    <s:if test="message!=null">
	alert('${message}');
</s:if>
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
					<table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
				              <tr align="center" bgcolor="#FAFAF1" height="22">
				                  <td>订单编号</td>
				                  <td>金额</td>
				                  <td>下单日期</td>
				                  <td>付款状态</td>
				                  <td>编辑</td>
				              </tr>
							  <s:iterator value="#request.orderList" id="order">
							  <tr align='center' bgcolor="#FFFFFF" height="22">
								  <td>
									<s:property value="#order.orderBianhao"/>
								  </td>
								  <td>￥<s:property value="#order.orderJine"/><br/></td>
							
								  <td><s:property value="#order.orderDate"/></td>
								  	   <td><s:property value="#order.fkstatus"/><br/></td>
								  <td>
								  
								   <s:if test="#order.fkstatus=='未付款'"><!--
						
								     <a href="#" onclick="hdfk(<s:property value="#order.orderId"/>)">货到付款</a>  
								     &nbsp;&nbsp;
								  --><a href="#" onclick="wyfk(<s:property value="#order.orderId"/>)">网银付款</a>  
								  </s:if>
								      &nbsp;&nbsp;
								      <a href="#" onclick="orderDetail(<s:property value="#order.orderId"/>)">订单明细</a>
								      &nbsp;&nbsp;
								      <a href="#" onclick="orderDel(<s:property value="#order.orderId"/>)">删除</a>
								  </td>
							  </tr>
							  </s:iterator>
							  
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



