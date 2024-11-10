<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>
<script type="text/javascript">
function myCart()
{
    <c:if test="${sessionScope.userType !=2 }">
          alert("请先登录");
    </c:if>
    
    <c:if test="${sessionScope.userType ==2 }">
         var s="<%=path %>/myCart.action";
         window.location.href=s;
    </c:if>
}

function myOrder()
{
    <c:if test="${sessionScope.userType !=2 }">
          alert("请先登录");
    </c:if>
    
    <c:if test="${sessionScope.userType ==2 }">
         var s="<%=path %>/myOrder.action";
         window.location.href=s;
    </c:if>
}
function liuyanAll()
{
	<c:if test="${sessionScope.userType !=2 }">
          alert("请先登录");
    </c:if>
    
    <c:if test="${sessionScope.userType ==2 }">
		 var url = "<%=path %>/liuyanAll.action";
		 window.location.href=url;
	</c:if>
}

function myXinxi()
{
        var url="<%=path %>/qiantai/userinfo/userxinxi.jsp";
        var n="";
        var w="480px";
        var h="500px";
        var s="resizable:no;help:no;status:no;scroll:yes";
	    openWin(url,n,w,h,s);
}

function myTuijian()
{
	<c:if test="${sessionScope.userType !=2 }">
          alert("请先登录");
    </c:if>
    
    <c:if test="${sessionScope.userType ==2 }">
		 var url = "<%=path %>/tuijianList.action";
		 window.location.href=url;
	</c:if>
}

function userReg()
{
    var url="<%=path %>/qiantai/userinfo/userReg.jsp";
    window.location.href=url;
}
</script>

  <div class="container">
 <div class="header_top">
<div class="menu">																
	<a href="#" class="right_bt" id="activator">
	
	</a>
		<div class="box" id="box">
		   <div class="box_content_center">
			   <div class="menu_box_list">
				   <ul>
					   <li class="active"><a href="<%=path %>/qiantai/default.jsp">系统首页</a></li>
				   <li><A href="#" onClick="myCart()">我的购物车</A></li> 
				   <li><A href="#" onClick="myOrder()">我的订单</A></li> 
				   <li><A href="#" onClick="liuyanAll()">留言板</A></li> 
				   <li><a href="#" onClick="userReg()">用户注册</a></li>
				   </ul>
				</div>
				<a class="boxclose" id="boxclose"><img src="<%=path%>/images/close.png" alt=""/></a>
			  </div>                
			</div>
	                 
	         </div> 	
	         <div class="clearfix"></div>		
      </div>
</div>	


