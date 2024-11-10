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
<script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script language="javascript">
            function modiNum(goodsId,quantity)
	        {
	            var r1= /^[0-9]*[1-9][0-9]*$/　　//正整数 
	            var val=r1.test(quantity); //str为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else
	            {
	                document.getElementById("indicator1").style.display="block";
	                cartService.modiNum(goodsId,quantity,callback);
	            }
	        }
	        
	        function callback(data)
	        {
	            document.getElementById("indicator1").style.display="none";
	            document.location.reload(true);
	        }
	        
	        
	        function delGoodsFromCart(goodsId)
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.delGoodsFromCart(goodsId,callback);
	        }
	        
	        function clearCart()
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.clearCart(callback);
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
					
					<s:set name="items" value="#session.cart.items"/>
	                        <table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr align="center" bgcolor="#FAFAF1" height="22">
					                  <td>商品名称</td>
					                  <td>价格</td>
					                  <td>数量</td>
					                  <td>金额</td>
					                  <td>删除</td>
				                  </tr>
								  <s:iterator value="#items">
								  <tr align='center' bgcolor="#FFFFFF" height="22">
									  <td><s:property value="value.goods.goodsName"/></td>
									  <td>￥<s:property value="value.goods.goodsTejia"/><br/></td>
									  <td><input type="text" class="textBox" onChange="modiNum(<s:property value="value.goods.goodsId"/>,this.value)" value="<s:property value="value.goodsQuantity"/>" size="4"/></td>
									  <td>￥<s:property value="value.goodsQuantity * value.goods.goodsTejia"/></td>
									  <td><input onClick="delGoodsFromCart(<s:property value="value.goods.goodsId"/>)" type="image" src="<%=path %>/img/delete_01.gif" border="0"/></td>
								  </tr>
								  </s:iterator>
					              <tr>
					                 <td colspan="6" class="Order_Total">
					                   <img hspace="5" src="<%=path %>/img/me03.gif"/> 
									    总金额：￥<span id="totalMoney"><s:property value="#session.cart.totalPrice"/></span>
									    &nbsp;&nbsp;&nbsp;&nbsp;
									    <img id="indicator1" src="<%=path %>/img/loading.gif" style="display:none"/>
									 </td>
					              </tr>				
	        				</table>
	        				<table>
	        				   <tr height="7"><td></td></tr>
			                   <tr>
			                       <td width="120"></td>
			                       <td><a href="#" onclick="clearCart()"><img border="0" src="<%=path %>/img/qingkong.jpg"/></a></td>
			                       <td><a href="<%=path %>/qiantai/default.jsp"><img border="0" src="<%=path %>/img/jixu.jpg"/></a></td>
			                  <td><a href="javascript:void(0)" onclick="queren()"><img border="0" src="<%=path %>/img/next.jpg"/></a></td>
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
<script>
function queren(){	
	if('<s:property value="#session.cart.items.size()"/>'==0){
		alert("购物车为空");
	}else{
		location.href="<%=path %>/orderQueren.action";
	}
}
<s:if test="message!=null">
	alert('${message}');
</s:if>
</script>   	
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> 
</body>
</html>		


	
