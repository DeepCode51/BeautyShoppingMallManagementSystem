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
   <script type="text/javascript" src="<%=path %>/ckeditor/ckeditor.js"></script> 
  </head>
  
  <BODY topmargin="0">
	     <c:forEach items="${requestScope.liuyanList}" var="liuyan" varStatus="sta">
	     <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="99%"  borderColorLight=#e0e0e0 border=1>
	        <TR bgColor=#f0f0f0 height=30>
		          <TD style="TEXT-INDENT: 5px" width="12%" style="font-size: 11px;">${sta.index+1 }楼</TD>
		          <TD colSpan=2 style="font-size: 11px;">
		                <span style="float:left">【标题】${liuyan.liuyanTitle } </span>
		                <span style="float:right">${liuyan.liuyanDate }&nbsp;&nbsp;&nbsp;&nbsp;</span>
		          </TD>
	        </TR>
	        <TR bgColor=#f9f9f9>
		          <TD vAlign=top align=middle rowSpan=3>
			            <TABLE style="MARGIN-TOP: 3px" cellSpacing=0 cellPadding=0  border=0>
				              <TR height="35%">
					                <TD align=middle width="30%">
					                   <IMG src="<%=path %>/img/user2.gif" style="border:1px solid #ccc; padding:3px;;width: 70px;height: 90px;">
					                   
					                </TD>
				              </TR>
		                </TABLE>
		          </TD>
	        </TR>
	        <TR height=20>
		          <TD style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		               ${liuyan.liuyanContent }
		          </TD>
	        </TR>
	    </TABLE>
	    </c:forEach>
	    <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="99%"  borderColorLight=#e0e0e0 border=1>
	        <TR bgColor=#f0f0f0 height=30>
		          <TD style="TEXT-INDENT: 5px" width="12%" style="font-size: 11px;"></TD>
		          <TD colSpan=2 style="font-size: 11px;">
		                <span style="float:left">我也说两句 </span>
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
			            <form action="<%=path %>/liuyanAdd.action" name="form1" method="post">
			            <table border="0">
						     <tr>
						         <td style="font-size: 11px;">标题:</td>
						         <td><input type="text" name="liuyanTitle" size="50"/></td>
						     </tr>
						     <tr>
						         <td style="font-size: 11px;">内容:</td>
						         <td>
				                      <TEXTAREA id="liuyanContent" NAME="liuyanContent" ROWS="20" COLS="70"></TEXTAREA>	
										<script>
											CKEDITOR.replace('liuyanContent');
										</script>
				                      
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
  </BODY>
</html>
