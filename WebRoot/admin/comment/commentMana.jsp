<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%String path = request.getContextPath();%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript">
    </script>
  </head>
  
  <BODY topmargin="0">
	     <c:forEach items="${requestScope.commentList}" var="c" varStatus="sta">
	     <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="99%"  borderColorLight=#e0e0e0 border=1>
	        <TR bgColor=#f0f0f0 height=30>
		          <TD style="TEXT-INDENT: 5px" width="12%" style="font-size: 11px;">${sta.index+1 }</TD>
		          <TD colSpan=2 style="font-size: 11px;">
		                <span style="float:left">【星级】${c.cstart }</span>
		                <span style="float:right">【评价时间】${c.ctime } &nbsp; &nbsp; &nbsp;【评价人】${c.user.userName }</span>
		                <a href="<%=path %>/admin/comment/commentReply.jsp?id=${c.id}">回复</a>
		                <a href="<%=path %>/commentDel.action?id=${c.id}">删除</a>
		          </TD>
	        </TR>
	        
	        <TR height=20>
		          <TD colspan="2" style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		               	【内容】${c.comment }
		          </TD>
	        </TR>
	        
	    </TABLE>
	    </c:forEach>
  </BODY>
</html>
