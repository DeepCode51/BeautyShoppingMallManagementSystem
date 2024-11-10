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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function shouli(orderItemId)
           {
               if(confirm('您确定发货吗？'))
               {
                   window.location.href="<%=path %>/shouli.action?orderItemId="+orderItemId;
               }
           }
                      function orderDel(orderId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/orderDelByAd.action?orderId="+orderId;
               }
           }
           
           
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="5%">序号</td>
					<td width="10%">商品名称</td>
					<td width="10%">销售数量</td>
					<td width="10%">下单时间</td>
					
					<td width="10%">送货地址</td>
					<td width="10%">付款方式</td>
					<td width="10%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.orderItemList" id="orderItem" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#orderItem.goods.goodsName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#orderItem.goodsQuantity"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#orderItem.order.orderDate"/>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#orderItem.order.odderSonghuodizhi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#orderItem.order.fkstatus"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#orderItem.zt"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test="#orderItem.zt=='待发货'">
						<input type="button" value="发货" onclick="shouli(<s:property value="#orderItem.orderItemId"/>)"/>
					</s:if>
						<a href="#" onclick="orderDel(<s:property value="#orderItem.order.orderId"/>)" class="pn-loperator">删除订单</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
