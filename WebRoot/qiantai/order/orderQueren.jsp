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
	 function back1()
     {
        window.history.go(-1);
     }
     
     function dd()
     {
         var odderFukuangfangshi=document.f.odderFukuangfangshi.value;
         //alert(odderFukuangfangshi);
         if(odderFukuangfangshi=="银行付款")
         {
              document.getElementById("qufukuan").style.display="block";
         }
         if(odderFukuangfangshi=="网银付款")
         {
              document.getElementById("qufukuan").style.display="none";
         }
     }
     
     function kahao()
     {
         var strUrl = "<%=path %>/qiantai/order/kahao.jsp";
			var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
     }
     function checkALL(){
         var odderSonghuodizhi=$("#odderSonghuodizhi").val();
         if(odderSonghuodizhi==""){
             alert("请输入送货地址");
             return false;
         }
        var odderFukuangfangshi=$("#odderFukuangfangshi").val();
        if(odderFukuangfangshi=="-1"){
            alert("请选择付款方式");
             return false;
        }
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
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">订单确认</div>
					</div>
					<div class="Slot">
						<form action="<%=path %>/orderSubmit.action" name="f" method="post" onsubmit="return checkALL()">
		                        <table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人帐号：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userName"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人姓名：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userRealname"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人联系电话：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userTel"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人地址：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userAddress"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">送货地址：</td>
					                  <td width="80%" align="left"><input type="text" id="odderSonghuodizhi" name="odderSonghuodizhi"/></td>
					              </tr>
					            
		        				
		        				</table>
		        				<table>
		        				   <tr height="7"><td></td></tr>
				                   <tr>
				                       <td><a href="#" onclick="back1()"><img border="0" src="<%=path %>/img/back.jpg"/></a></td>
				                       <td>
				                       	<input type="image" src="<%=path %>/img/orderSub.jpg"/>
				                       
				                       </td>
				                   </tr>
				               </table>
				        </form>
				        </div>
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




	