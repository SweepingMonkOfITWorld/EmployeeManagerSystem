<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<jsp:include page="easyui.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
	lable{
	font-size:12px;
	}
	</style>
	</head>

	<body style="width:100%;height:100%">
		<div id="div1">
			<table align="center">
				<form id="form1">
					<tr>
						<td>
							<lable>
							账户:
							</lable>
						</td>
						<td>
							<input class="easyui-validatebox" name="username" required="required" id="username" />
						</td>
					</tr>
					<tr>
						<td>
						<lable>
							密码：
							</lable>
						</td>
						<td>
							<input class="easyui-passwordbox"  name="password" id="password" data-options="
							prompt:'输入密码',
							checkInterval:200
							"/>
						</td>
					</tr>
				</form>
			</table>
		</div>
		<script type="text/javascript">
	$(function(){
		
        $("#div1").dialog({
        	title:'登录',
        	collapsible:true,
        	maximizable:true,
        	width:400,
        	height:150,
        	top:250,
        	resizable:true,
        	buttons:[{
                 text:'登录',
                 iconCls:'icon-login',
                 handler:function(){
                 if($("#form1").form("validate")){
                     $.ajax({
                         type:'GET',
                         url:'user/login.html',
                         data:"username="+$("#username").val()+"&password="+$("#password").val(),
                         dataType:'JSON',
                         cache:false,
                         beforeSend:function(){
                         },
                         success:function(data){
                         if(data.success){
                             location.replace("main.jsp");
                             }else{
                                 $.messager.alert('错误',data.msg,'error');
                                 }
                         }
                         });
                     }
                }
            	},
        	        {
        	        text:'重置',
        	        iconCls:'icon-undo',
        	        handler:function(){$("#form1").form("reset")}
        	        }]
            });
        $("#username").focus();
		});
	
	</script>
	</body>
</html>
