<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h3>用户登录</h3>

<div class="box1_list" style="height:180px;border:1px solid rgb(223, 223, 223);margin:10px 0 20px;padding:25px 0 0 10px;">
	<jsp:include flush="true" page="/qiantai/userinfo/userLogin.jsp"></jsp:include>
</div>

<h3>商品类别</h3>
<div class="box1"  style="height:180px;border:1px solid rgb(223, 223, 223);margin:10px 0 20px;padding:20px 0 0 20px;">
	<s:action name="catelogAll" executeResult="true" flush="true"></s:action>
</div>
