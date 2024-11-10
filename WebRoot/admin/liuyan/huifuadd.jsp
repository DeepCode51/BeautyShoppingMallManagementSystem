<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />

	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/liuyanAddReply.action" name="formAdd" method="post">
					<input type="hidden" id="liuyanId" name="liuyanId" value=""/>
				    <table border="0">
		     
		     <tr>
		         <td style="font-size: 11px;">回复内容</td>
		         <td>
                      <TEXTAREA id="liuyan_huifu" NAME="liuyan_huifu" ROWS="6" COLS="55"></TEXTAREA>	
					<script>
						CKEDITOR.replace('liuyan_huifu');
					</script>
                 </td>
		     </tr>
		     <tr>
		         <td style="font-size: 11px;">&nbsp;</td>
		         <td>
		             <input type="submit" name="" value="提交回复">
                 </td>
		     </tr>
		</table>
			</form>
   </body>
</html>

<script>
var lyid=window.opener.window.document.getElementById("lyid").value;
document.getElementById("liuyanId").value=lyid;
</script>
