<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		
		<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
        <script language="javascript">
           function showpic()
           {
               var type=$("#type").val();
               
               if(type!=-1){
            	   var txtTitle=(type==1?"每日销售总量":"日订单总量");
            	   var txtTitle2=(type==1?"销售总量":"订单总量");
            	   // 基于准备好的dom，初始化echarts实例
                   var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                   var option = {
                       title: {
                           text: txtTitle
                       },
                       tooltip: {},
                       legend: {
                           data:[txtTitle2]
                       },
                       xAxis: {
                           data: []
                       },
                       yAxis: {},
                       series: [{
                           name: txtTitle2,
                           type: 'bar',
                           data: []
                       }]
                   };
					
                   // 使用刚指定的配置项和数据显示图表。
                   myChart.setOption(option);
                       
                   $.get("<%=path %>/orderdata.action",{"type":type},function(data) {
                	    // 填入数据
                	    myChart.setOption({
                	        xAxis: {
                	            data: data.categories
                	        },
                	        series: [{
                	            // 根据名字对应到相应的系列
                	            data: data.data
                	        }]
                	    });
                	});
               }
           }
          
          
           
       </script>
   </body>
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td>请选择图表类型:
				    <select id="type" onchange="showpic()">
				    	<option value="-1">请选择</option>
				    	<option value="1">每日销售总量</option>
				    	<option value="2">日订单总量</option>
				    </select>
				    </td>
					
		        </tr>	
				
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<div id="main" style="width: 600px;height:400px;"></div>
					</td>
				</tr>
				
			</table>
	</body>
</html>
