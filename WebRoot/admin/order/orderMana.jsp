<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
        <script language="javascript">
           function orderDel(orderId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/orderDelByAd.action?orderId="+orderId;
               }
           }
           
           function orderShouli(orderId)
           {
               if(confirm('您确定发货吗？'))
               {
                   window.location.href="<%=path %>/orderShouli.action?orderId="+orderId;
               }
           }
           
           
           function orderDetail(orderId)
           {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 var n="";
                 var w="700px";
                 var h="700px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
			     openWin(url,n,w,h,s);
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="8" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
					<td width="8%">用户信息</td>
					<td width="10%">订单编号</td>
					<td width="10%">金额</td>
					
					<td width="16%">下单日期</td>
					<td width="18%">送货地址</td>
					<td width="16%">付款方式</td>
					<td width="22%">操作</td>
		        </tr>	
				<s:iterator value="#request.orderList" id="order" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="userXinxi(<s:property value="#order.orderUserId"/>)" style="color: red">用户信息</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#order.orderBianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ￥<s:property value="#order.orderJine"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.orderDate"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.odderSonghuodizhi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#orderItem.order.fkstatus"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					        <a href="#" onclick="orderDetail(<s:property value="#order.orderId"/>)" class="pn-loperator">订单明细</a>
						    <s:if test="#order.orderZhuangtai=='no'">
							    <a href="#" onclick="orderShouli(<s:property value="#order.orderId"/>)" class="pn-loperator">发货</a>
						    </s:if>
						    <s:if test="#order.orderZhuangtai=='yes'">
						         已发货
						    </s:if>
							<a href="#" onclick="orderDel(<s:property value="#order.orderId"/>)" class="pn-loperator">删除订单</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
