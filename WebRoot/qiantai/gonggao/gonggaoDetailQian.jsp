<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title></title>
		<meta name="author" content="">
    	
    	<style>
    	*{font-family: "微软雅黑";}
    	p{
    		line-height:30px;
    		border-bottom:1px dashed #EEE;
    	}
    	</style>
	</head>

	<body>

            
          <div>
              	<h2 style="line-height:40px;text-align:center;background-color:#EEE;">公告详情</h2>
              	<p>标题：<s:property value="#request.gonggao.gonggaoTitle"/></p>
              	<p>内容：<s:property value="#request.gonggao.gonggaoContent" escape="false"/></p>
              	<p class="pull-right">发布时间： <s:property value="#request.gonggao.gonggaoData"/></p>
          </div>
     
	</body>

</html>