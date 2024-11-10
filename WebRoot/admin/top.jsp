<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<style type="text/css">
	        .Header {background: url(<%=path %>/img/4.png) #d10e00 repeat-x left top; height: 97px;
	        	background-repeat: no-repeat;
				background-size: cover;
	        	text-shadow:10px 10px 10 #000;
	        
	        }
	        .HeaderTop {margin: 0px auto;}
	        *{font-family: "微软雅黑";}
        </style>
	</HEAD>

	<BODY text=#000000 bgColor=#ffffff leftMargin=0 rightmargin="0" topMargin=0 marginheight="0" marginwidth="0">
		<div class="Header HeaderTop">
			<font style="font-size: 33px;color:#855b55;font-weight: bolder;display: block;text-align: left;line-height:100px;background:#BE0026; color:#FFF">
			    &nbsp;&nbsp;&nbsp;TF美妆产品购物商城后台管理
			    
            </font>
		</div>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TR>
					<TD>
						<TABLE height=28 cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TR><TD bgColor=#ffffff height=2></TD></TR>
								<TR>
								    <TD align=right bgColor=#d6d6d6 style="font-size: 13px;">
								       <c:if test="${sessionScope.userType==0 }">
								                                       欢迎您：管理员
								       </c:if>
								       <c:if test="${sessionScope.userType==1 }">
								                                       欢迎您：${sessionScope.dianpu.loginname }
								       </c:if>
								       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       <SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;'+''.charAt(new Date().getDay());",1000)</SCRIPT><SPAN id=clock></SPAN>&nbsp;&nbsp;&nbsp;
                                    </TD>
                                </TR>
						</TABLE>
					</TD>
				</TR>
		</TABLE>
</HTML>
