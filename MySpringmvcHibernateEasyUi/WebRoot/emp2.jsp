<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<jsp:include page="easyui.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'emp.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/extenddatebox.js"></script>
		<style type="text/css">
lable {
	font-size: 12px;
}

td {
	text-align: 'center';
}
</style>
	</head>

	<body>
		<table id="tb" style="margin: auto"></table>
		<div id="tl" style="padding: 5px; height: auto">
			<a id="add" style="" data-options="iconCls:'icon-add',text:'添加',plain:true" onclick="obj.add();" class="easyui-linkbutton"></a>
			<a id="edit" style="" data-options="iconCls:'icon-edit',text:'修改',plain:true" onclick="obj.edit();" class="easyui-linkbutton"></a>
			<a id="delete" style="" data-options="iconCls:'icon-delete-new',text:'删除',plain:true" onclick="obj.remove();" class="easyui-linkbutton"></a>
			<a id="save" style="" data-options="iconCls:'icon-save',text:'保存',plain:true"  onclick="obj.save();" class="easyui-linkbutton"></a>
			<a id="redo" style="" data-options="iconCls:'icon-redo',text:'取消操作',plain:true"  onclick="obj.redo();" class="easyui-linkbutton"></a>
		<div style="padding: 0 0 0 5px; padding: 5px">
							按部门搜索：
							<input id="ss"></input>
							<div id="mm" style="width: 120px">
							</div>

		</div>
		</div>
		<form id="form_add">
			<table style="width: 300px">
				<caption style="font-size:12px">
					添加员工
				</caption>
				<tr>
					<td>
						<lable>
						员工编号:
						</lable>
					</td>
					<td>
						<input name="empno" id="empno" class="easyui-numberbox" data-options="readonly:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						员工姓名:
						</lable>
					</td>
					<td>
						<input name="ename" id="ename" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						所在部门:
						</lable>
					</td>
					<td>
						<input id="deptno" name="deptno" class="easyui-combobox">
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						所属上级:
						</lable>
					</td>
					<td>
						<input id="mgr" name="mgr" class="easyui-combobox">
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						工种:
						</lable>
					</td>
					<td>
						<input name="job" id="job" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						薪酬:
						</lable>
					</td>
					<td>
						<input name="sal" id="sal" class="easyui-numberbox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						佣金:
						</lable>
					</td>
					<td>
						<input name="comm" id="comm" class="easyui-numberbox" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						雇佣时间:
						</lable>
					</td>
					<td>
						<input name="hiredate" id="hiredate" class="easyui-datebox" />
					</td>
				</tr>
			</table>
		</form>
		<form id="form_edit">
			<table style="width: 300px">
				<caption style="font-size:12px">
					修改员工
				</caption>
				<tr>
					<td>
						<lable>
						员工编号:
						</lable>
					</td>
					<td>
						<input name="empno" id="empno_edit" class="easyui-numberbox" data-options="readonly:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						员工姓名:
						</lable>
					</td>
					<td>
						<input name="ename" id="ename_edit" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						所在部门:
						</lable>
					</td>
					<td>
						<input id="deptno_edit" name="deptno" class="easyui-combobox">
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						所属上级:
						</lable>
					</td>
					<td>
						<input id="mgr_edit" name="mgr" class="easyui-combobox">
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						工种:
						</lable>
					</td>
					<td>
						<input name="job" id="job_edit" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						薪酬:
						</lable>
					</td>
					<td>
						<input name="sal" id="sal_edit" class="easyui-numberbox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						佣金:
						</lable>
					</td>
					<td>
						<input name="comm" id="comm_edit" class="easyui-numberbox" />
					</td>
				</tr>
				<tr>
					<td>
						<lable>
						雇佣时间:
						</lable>
					</td>
					<td>
						<input name="hiredate" id="hiredate_edit" class="easyui-datebox" data-optios="formatter:formatDatebox"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="content" class="easyui-accordion" style="width:1025px;">
		<div title="Title1" data-options="" style="overflow:auto;padding:10px;">   
        <h3 style="color:#0099FF;">Accordion for jQuery</h3>   
        <p>Accordion is a part of easyui framework for jQuery.     
        It lets you define your accordion component on web page more easily.</p>   
    </div>   
    <div title="Title2" data-options="selected:false" style="padding:10px;">   
        content2    
    </div>   
    <div title="Title3">   
        content3    
    </div>   
		
		</div>
		<script type="text/javascript">
		//扩展 dateBox,使datagrid行编辑时，日期控件内的时间格式正确显示
		$.extend(
    $.fn.datagrid.defaults.editors, {
        datebox: {
                init: function (container, options) {
                    var input = $('<input type="text">').appendTo(container);
                    input.datebox(options);
                    return input;
                },
                destroy: function (target) {
                    $(target).datebox('destroy');
                },
                getValue: function (target) {
                    return $(target).datebox('getValue');
                },
                setValue: function (target, value) {
                    $(target).datebox('setValue', formatDatebox(value));
                },
                resize: function (target, width) {
                    $(target).datebox('resize', width);
                }
        }
    });
    $(function(){
        
        $("#tb").datagrid({
            width:1025,
            title:'员工列表',
            url:'emp/list.html',
            striped:true,
            fitColumn:true,
            toolbar:'#tl',
            rownumbers:true,
            resizeHandle: "both",
            iconCls: "icon-search",
            pagination: true,
		    pageNumber: 1,
		    pageSize: 10,
		    pageList: [10, 20, 30, 40],
		    remoteSort: false,
		    onDblClickRow: function (index, row) {
	            if (obj.editRow != undefined) {
	                $("#tb").datagrid("endEdit", obj.editRow);
	                $("#redo,#save").hide();
	            }
	            if (obj.editRow == undefined) {
	                $("#redo,#save").show();
	                $("#tb").datagrid("beginEdit", index);
	                obj.editRow = index;
	                $("#tb").datagrid("getEditor", {
	                    index: obj.editRow,
	                    field: "empno"
	                }).target.prop("readonly", true);
	            }


	        },
	        onAfterEdit: function (rowIndex, rowData, changes) {
	            $("#save,#redo").hide();
	            var updated = $("#tb").datagrid("getChanges", "updated");
	            var url = "";
	            var info = "";
	            if (updated.length > 0) {
	                url = "emp/update.html";
	                info = "修改";

	            }
	            $.ajax({
	                type: "post",
	                url: url,
	                contentType: "application/json",
	                data: JSON.stringify(rowData),
	                dataType: "json",
	                beforeSend: function () {
	                        $('#tb').datagrid('loading');
	                    },
	                    success: function (data) {
	                        if (data) {
	                            $('#tb').datagrid('loaded');
	                            $('#tb').datagrid('load');
	                            $('#tb').datagrid('unselectAll');
		                        $.messager.show({
			                                title: '提示',
			                                msg: data.effectRow + '个用户被' + info + '成功！',
			                            });
			                            
	                            
	                            obj.editRow = undefined;
	                        }
	                    }
	            });
	        },
		    columns: [
			            [{
			                    field: "ck",
			                    width:20,
			                    checkbox: true,
			                }, {
			                    field: "empno",
			                    title: "员工编号",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: true,
			                            validType: "number",
			                        },
			                    },
			                    // checkbox:true,
			                }, {
			                    field: "ename",
			                    title: "员工姓名",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: true,
			                        },
			                    },
			                }, {
			                    field: "job",
			                    title: "工种",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: true,
			                            //validType:"email",
			                        },
			                    },
			                }, {
			                    field: "mname",
			                    title: "所属上级",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: true,
			                        },
			                    },
			                },

			                {
			                    field: "sal",
			                    title: "薪酬",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: true,
			                            validType: "number",
			                        },
			                    },
			                }, {
			                    field: "comm",
			                    title: "佣金",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: false,
			                            validType: "number",
			                        },
			                    },
			                }, {
			                    field: "dname",
			                    title: "所在部门",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    editor: {
			                        type: "validatebox",
			                        options: {
			                            required: true,
			                        },
			                    },
			                }, {
			                    field: "hiredate",
			                    title: "雇佣时间",
			                    align: "center",
			                    sortable: true,
			                    width: 120,
			                    formatter: formatDatebox,
			                    editor: {
		                        type: "datebox",
		                        options: {
		                            required: true,
		                        },
		                    },
			                    
			                },
			            ]
			        ]
        });
        });
    
    </script>
		<script type="text/javascript">
		
   window.onload = function(){
        obj = {
        		editRow: undefined,
                add:function(){
        	$("#form_add").dialog('open');
            },
            edit:function(){
            	var rows = $("#tb").datagrid("getSelections");
	            if (rows.length == 1) {
		            $("#save,#redo").show();
		            $("#form_edit").dialog('open');
		            var rs = $("#deptno_edit").combobox('getData');
		            $.each(rs,function(i,obj){
					    if(obj.dname == rows[0].dname){
						$("#deptno_edit").combobox('setValue',obj.deptno);
						}
	                    });
                    setTimeout(function(){
                    	var rs2 = $("#mgr_edit").combobox('getData');
    		            $.each(rs2,function(i,o){
    					    if(o.ename == rows[0].mname){
    						$("#mgr_edit").combobox('setValue',o.empno);
    						}
    	                    });
                        },3000);
                    $("#hiredate_edit").datebox("setValue",formatDatebox(new Date(rows[0].hiredate)));
                   
		            $("#form_edit").form('load',{
			            empno:rows[0].empno,
			            ename:rows[0].ename,
			            job:rows[0].job,
			            sal:rows[0].sal,
			            comm:rows[0].comm,
			            //hiredate:rows[0].hiredate
			            });
                    
	            } else {
	                $.messager.alert("警告", "必须选一行修改", "warning");
	            }
            },
            save: function () {
	            $("#tb").datagrid("endEdit", this.editRow);
	        },
            redo: function () {
	            $("#tb").datagrid('rejectChanges');
	            $("#redo,#save").hide();
	            obj.editRow = undefined;
	        },
	        remove: function () {
	            var rows = $("#tb").datagrid("getSelections");
	            if (rows.length > 0) {
	                $.messager.confirm("确认信息", "你确定删除这些数据", function (flag) {

	                    if (flag) {
	                        var ids = [];
	                        for (var i = 0; i < rows.length; i++) {
	                            ids.push(rows[i].empno);
	                        }
	                        $.ajax({
	                            type: "post",
	                            url: "emp/delete.html",
	                            data: "empnos=" + ids.join(","),
	                            dataType: "json",
	                            beforeSend: function () {
	                                    $("#box").datagrid("loading");
	                                },
	                                success: function (data) {
	                                    if (data) {
	                                        $("#tb").datagrid("load");
	                                        $("#tb").datagrid("loaded");
	                                        $("#tb").datagrid("unselectAll");
	                                        $.messager.show({
	                                            title: "提示",
	                                            msg: data.effectRow + "条数据被删除成功",
	                                        });
	                                    }

	                                }
	                        });
	                    }
	                });
	            } else {
	                $.messager.alert("提示", "请选择要删除的记录", "info");
	            }
	        },
                };
    	$("#redo,#save").hide();
    	$("#deptno").combobox({
    		url:'dept/queryAllDept.html',    
    	    valueField:'deptno',    
    	    textField:'dname',
    	    panelHeight:'auto',
    	    onLoadSuccess:function(data){
    	    $(this).combobox('setValue',data[0].deptno);
    	    },
    	    onSelect:function(o){
        	    var url = "emp/queryByDept.html?deptno="+o.deptno;
        	    $("#mgr").combobox("reload",url);
        	    }
        	});
    	$("#mgr").combobox({
    		//url:'emp/queryByDept.html',    
    	    valueField:'empno',    
    	    textField:'ename',
    	    panelHeight:'auto',
    	    onLoadSuccess:function(data){
    	    $(this).combobox('setValue',data[0].empno);
    	    }
        	});
    	$("#form_add").dialog({
        	title:'添加员工',
        	collapsible:true,
        	maximizable:true,
        	width:350,
        	height:330,
        	cache:false,
        	top:100,
        	modal:true,
        	resizable:true,
        	onOpen:function(){
    		$.ajax({
            	type:'POST',
            	url:'emp/getMax.html',
            	success:function(empno){
        		$("#empno").numberbox('setValue',empno);
            	}
            	});
        	},
        	
        	buttons:[{
                 text:'添加',
                 iconCls:'icon-add',
                 handler:function(){
                 if($("#form_add").form("validate")){
                     $.ajax({
                         type:'GET',
                         url:'emp/addEmp.html',
                         data:$("#form_add").serialize() ,
                         dataType:'JSON',
                         cache:false,
                         success:function(data){
                         if(data){
                             $.messager.show({
                            	 title:'提示消息',
                            		msg:'有'+data+"条数据被保存",
                            		timeout:5000
                                 });
                             $("#form_add").dialog('close');
                             $("#tb").datagrid('load');
                             $("#form_add").form('reset');
                         }
                     }
                         });
                     }
                }
            	},
        	        {
        	        text:'重置',
        	        iconCls:'icon-undo',
        	        handler:function(){$("#form_add").form("reset")}
        	        }]
            }).dialog('close');
        };
  
    </script>
		<script type="text/javascript">
		$(function(){
			$("#deptno_edit").combobox({
			    		url:'dept/queryAllDept.html',    
			    	    valueField:'deptno',    
			    	    textField:'dname',
			    	    panelHeight:'auto',
			    	    cache:false,
			    	    onLoadSuccess:function(data){
			    	    },
			    	    onSelect:function(o){
			        	    var url = "emp/queryByDept.html?deptno="+o.deptno;
			        	    $("#mgr_edit").combobox("reload",url);
			        	    }
			        	});
			    	$("#mgr_edit").combobox({
			    		//url:'emp/queryByDept.html',    
			    	    valueField:'empno',    
			    	    textField:'ename',
			    	    panelHeight:'auto',
			    	    onLoadSuccess:function(data){
			    	    //$(this).combobox('setValue',data[0].empno);
			    	    }
			        	});
			    	$("#form_edit").dialog({
			        	title:'修改员工',
			        	collapsible:true,
			        	maximizable:true,
			        	width:350,
			        	height:330,
			        	cache:false,
			        	top:100,
			        	modal:true,
			        	resizable:true,
			        	onOpen:function(){
			        	},
			        	
			        	buttons:[{
			                 text:'修改',
			                 iconCls:'icon-edit',
			                 handler:function(){
			                 var a = {
					 	                empno:$('#empno_edit').val(),
					 	                ename:$('#ename_edit').val(),
					 	                deptno:$('#deptno_edit').combobox('getValue'),
					 	                mgr:$('#mgr_edit').combobox('getValue'),
					 	                job:$('#job_edit').val(),
					 	                sal:$('#sal_edit').val(),
					 	                comm:$('#comm_edit').val(),
					 	                hiredate:$('#hiredate_edit').datebox('getValue')
					 	                };
			                 $.ajax({
			 	                type: "post",
			 	                url: 'emp/update2.html',
			 	                contentType: "application/json",
			 	                data:JSON.stringify(a),
			 	                dataType: "json",
			 	                beforeSend: function () {
			 	                        $('#tb').datagrid('loading');
			 	                    },
			 	                    success: function (data) {
			 	                        if (data) {
			 	                            $('#tb').datagrid('loaded');
			 	                            $('#tb').datagrid('load');
			 	                            $('#tb').datagrid('unselectAll');
			 		                        $.messager.show({
			 			                                title: '提示',
			 			                                msg: data.effectRow + '个用户被修改成功！',
			 			                            });
			 	                            $('#form_edit').dialog('close');
			 	                            $("#save,#redo").hide();
			 	                        }
			 	                    }
			 	            });
			                     
			                }
			            	},
			        	        {
			        	        text:'重置',
			        	        iconCls:'icon-undo',
			        	        handler:function(){$("#form_edit").form("reset")}
			        	        }]
			            }).dialog('close');
			});
    </script>
    <script type="text/javascript">
		$(function() {
			$.ajax({
				type:"post",
				url:"dept/queryAllDept.html",
				dataType: "json",
				success:function(data){
					if(data){
						$.each(data,function(index,dept){
							$("<div>"+dept.dname+"</div>").appendTo($("#mm")).attr("data-options","name:"+"\'"+dept.dname+"\'");
						});
						//easyui在异步请求后不再加载渲染页面  所以要手动解析异步数据所在元素的父节点 否则不显示
						$.parser.parse($('#mm').parent());
						$('#ss').searchbox({ 
							searcher:searchByDept, 
							menu:'#mm', 
							width:250,
							prompt:'请输入关键字' 
						}); 


					}


				}
			});	
			//异步提交后台
			function searchByDept(value,name){
				var opts = $("#tb").datagrid("options");
				opts.url = "emp/searchByDept.html";
				var params = {
		                page: opts.pageNumber,
		                rows: opts.pageSize,
		                ename: value,
		                dname: ""+name,
		            };
				opts.queryParams = params;
				$("#tb").datagrid("load");
	            $("#tb").datagrid("getPage").pagination({
	                onSelectPage: function (page, rows) {
	                    $("#tb").datagrid("load",params);
	                },
	            });
				
				}
		});	
</script>
	</body>
</html>
