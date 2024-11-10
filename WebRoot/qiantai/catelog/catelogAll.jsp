<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	</head>

	<body>
	  <table width="100%">
	     <s:iterator value="#request.cateLogList" id="catelog">
	          <tr>
	             <td align="left">
	                <img src="<%=path %>/img/head-mark3.gif" align="middle" class="img-vm" border="0"/>
	                <a href="<%=path %>/goodsByCatelog.action?goodsCatelogId=<s:property value="#catelog.catelogId"/>">
	                   <s:property value="#catelog.catelogName"/>
	                </a>
	            </td>
	          </tr>
	     </s:iterator>
	  </table>
	</body>
</html>
