<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 

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
	</head>

	<body>
		<font class="red" style="font-size: 18px;">上传完毕</font><br/>
        <s:property value="#request.newFujianName"/><br/>
        <s:property value="#request.oldFujianName"/><br/>
        <s:property value='#request.fujianPath'/>
		
		<script language="javascript">
		     window.parent.document.getElementById("fujian").value="<s:property value='#request.fujianPath'/>";
		     window.parent.document.getElementById("fujianYuanshiming").value="<s:property value='#request.oldFujianName'/>";
		</script>
   </body>
</html>
