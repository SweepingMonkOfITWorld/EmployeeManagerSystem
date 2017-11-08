<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<jsp:include page="easyui.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'suc.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<body class="easyui-layout">
	<%
	  if(session.getAttribute("user")!=null){
	%>

			<div data-options="region:'north',title:'松和教育信息科技有限公司',split:true,collapsible:true" id="north" style="height: 15%;line_height:35px;background: #eee;">
			<div>后台管理</div>
			<br/><br/>
			<div>你好！Mr&nbsp${user.username}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a id="exit">退出</a></div>
			</div>
			<div data-options="region:'west',title:'导航',split:true,iconCls:'icon-reload'" style="width: 10%;background: #eee;" >
			<br/>
			信息管理系统
			<div>
			<ul id="nav"></ul>
			</div>
			
			</div>
			<div data-options="region:'center',title:'显示内容',iconCls:'icon-world'" style="padding: 5px; background: #eee;">
			<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,narrow:true" >
			<div title="首页" data-options="iconCls:'icon-house',closable: true">
			<jsp:include page="demo.jsp"></jsp:include>
			</div>
			</div>
			</div>
			
			
<script type="text/javascript">
$(function() {
	setTimeout(function(){
		$("body").layout("collapse","north");
		},10000);
	$("#nav").tree( {
		url : "navigation/loadNav.html",
		animate : true,
		//checkbox: true,
		onlyLeafCheck : true,
		lines : true,
		dnd : true,
		onClick:function(node){
		if(node.url){
			if($("#tabs").tabs("exists",node.text)){
				$("#tabs").tabs("select",node.text);
				}else{
					$('#tabs').tabs('add', {
						title: node.text,
						closable: true,
						content: '<iframe src="'+node.url+'" frameBorder="0" border="0"  style="width: 100%; height: 100%;"/>',  
						iconCls : 'icon-user',
						//href : node.url,
						});
					}
		}
		
		}
	});

});
</script>
<script type="text/javascript">
$(function(){
	//退出按钮
	$("#exit").linkbutton({
		text:'退出',
		iconCls:'icon-back',
		onClick:function(){
		$.messager.confirm('确认对话框','退出系统吗',function(r){
			if(r){
				$.ajax({
					type:'POST',
					url:'user/exit.html',
					success:function(data){
					location.replace(data.msg);
					}
					});
				}
			});
		}
		});
	//结束
});

</script>
<% }else{
	out.print("请登录后操作！");
} %>
	</body>
</html>
