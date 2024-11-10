<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link href="<%=path %>/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
   
    
  </head>
  
<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
	
	
	
	
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
     <div id="navigation" class="naivgation">
			<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
	 </div>
	 <div id="content" class="Sub">
			<div class="NewContainer770">
				<div class="BoxHeader">
					<div class="BoxHeader-center MarginTop10">&nbsp;</div>
				</div>
				<div class="Slot" style="height: 400px;">
					 <div style="color: red;font-size: 20px;font-weight: 700">${requestScope.msg1}</div>
                </div>
			</div>
	 </div>
</div>
</div>
	
	
	
<div align="center" class="Wrapper">
	<div id="footer" align="center" class="Footer">
		 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</div>
</div>
</body>
</html>
