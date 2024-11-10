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
	
    function buy1()
    {
        <s:if test="#session.user==null">
              alert("请先登录");
        </s:if>
        <s:else>
        
        	var quantity=document.buy.quantity.value;
        	if(quantity!=''){
        		quantity=parseInt(quantity);
	        	if(parseInt('<s:property value="#request.goods.goodsNum"/>')<quantity){
	            	alert("库存不足，无法购买");
	        	}else{
	             document.buy.submit();
	        	}
        	}
        </s:else>
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
					<form action="<%=path %>/addToCart.action" method="post" name="buy">
						<table width="100%" border="0">
						    <tr>
						       <td align="center"><img style="border:1px solid #ccc; padding:3px;" src="<%=path %>/<s:property value="#request.goods.goodsPic"/>" width="210" height="230"/><hr/></td>
						    </tr>
						    <tr>
						       <td align="left">商品名称：<s:property value="#request.goods.goodsName"/><hr/></td>
						        <td align="left">购买价格:<s:property value="#request.goods.goodsTejia"/><hr/></td>
						    </tr>
						    
						    <tr>
						      
						           <td align="left">保质期:<s:property value="#request.goods.publisher"/><hr/></td>
						           	           <td align="left">功效:<s:property value="#request.goods.author"/><hr/></td>
						          
						    </tr>
						    	    <tr>
						      
						           <td align="left">货号:<s:property value="#request.goods.isbn"/><hr/></td>
						           	           <td align="left">适用对象:<s:property value="#request.goods.publishtime"/><hr/></td>
						          
						    </tr>
				
						    <tr>
						       <td align="left">商品介绍:<s:property value="#request.goods.goodsMiaoshu" escape="false"/><hr/></td>
						    </tr>
						
						    <tr>
						       <td align="left">预订数量：<input type="text" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/><hr/></td>
						    </tr>
						    <tr>
						       <td align="center"><input type="hidden" name="goodsId" value="<s:property value="#request.goods.goodsId"/>"/><img onclick="buy1()" src="<%=path %>/img/goumai.jpg"/><hr/></td>
						    </tr>
						</table>
						</form>
				</div>
				<s:if test="#session.userType ==2">
				<hr/>
				<h4 style="text-align:center;">评价列表</h4>
				
				<s:iterator value="#request.comments" status="st">
	     <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="99%"  borderColorLight=#e0e0e0 border=1>
	     	
	        <TR bgColor=#f0f0f0 height=30>
		          <TD align="center" width="12%" style="font-size: 11px;">【<s:property value="#st.count"/>】</TD>
		          <TD style="font-size: 11px;" >
		                <span style="float:left">【星级】<s:property value="cstart"/></span>
		              
		          </TD>
		          <TD  style="font-size: 11px;">
		                <span style="float:left">【用户】<s:property value="user.userName"/></span>
		                
		          </TD>
		          <TD style="font-size: 11px;">
		                <span style="float:left">【评价时间】<s:property value="ctime"/></span>
		          </TD>
	        </TR>
	        
	       
	        <TR height=20>
	        	<td align="center">【内容】</td>
		          <TD colspan="3" style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		               	<s:property value="comment"/>
		          </TD>
	        </TR>
	        <s:if test="creply!=null && creply!=''">
	        	<TR height=20>
	        	<td align="center">【回复】</td>
		          <TD colspan="3" style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		               	<s:property value="creply"/>
		          </TD>
	        </TR>
	        </s:if>
	        <s:else>
	        <TR height=20>
	        	<td align="center">【回复】</td>
		          <TD colspan="3" style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		               	暂无回复!
		          </TD>
	        </TR>
	        </s:else>
	    </TABLE>
	    </s:iterator>
	    <s:if test="#request.count>0">
	    <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="99%"  borderColorLight=#e0e0e0 border=1>
	        <TR bgColor=#f0f0f0 height=30>
		          <TD style="TEXT-INDENT: 5px" width="12%" style="font-size: 11px;"></TD>
		          <TD colSpan=2 style="font-size: 11px;">
		                <span style="float:left">对此商品评价 </span>
		          </TD>
	        </TR>
	        <TR bgColor=#f9f9f9>
		          <TD vAlign=top align=middle rowSpan=3>
			          <TABLE style="MARGIN-TOP: 3px" height=110 cellSpacing=0 cellPadding=0 width="95%" border=0>
				              <TR height="35%">
					                <TD align=middle width="30%">
					                </TD>
				              </TR>
			          </TABLE>
		          </TD>
	        </TR>
	        <TR height=20>
		          <TD>
			            <form action="<%=path %>/commentAdd.action" name="form1" method="post">
			            <input type="hidden" name="goodsId" value="<s:property value="#request.goods.goodsId"/>"/>
			            <table border="0">
						     <tr>
						         <td style="font-size: 11px;">内容:</td>
						         <td>
						        	<textarea rows="5" name="comment" cols="50"></textarea>
						         </td>
						     </tr>
						     <tr>
						         <td style="font-size: 11px;">评级:</td>
						         <td>
						             <select name="cstart">
						             	<option value="★★★★★">★★★★★</option>
						             	<option value="★★★★">★★★★</option>
						             	<option value="★★★">★★★</option>
						             	<option value="★★">★★</option>
						             	<option value="★">★</option>
						             <select>
				                 </td>
						     </tr>
						     <tr>
						         <td style="font-size: 11px;">&nbsp;</td>
						         <td>
						             <input type="submit" name="" value="提交">
				                 </td>
						     </tr>
						</table>
						</form>
		          </TD>
	        </TR>
	    </TABLE>
	    </s:if>
	    <s:else>
	    	您尚未购买此商品，无法评价
	    </s:else>
				</s:if>
				
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


