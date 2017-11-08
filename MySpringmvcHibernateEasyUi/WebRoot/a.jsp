<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="easyui.jsp"></jsp:include>
<!DOCTYPE HTML>
 <html>
 	<head>
		<title></title>
	</head>
	<body>
    <form id="form1">
    <input id="a" class="easyui-combobox"><br/>
    <input id="b" class="easyui-combobox" ><br/>
    <input id="time" name="time">
    </form>
    <script type="text/javascript">
    $(function(){
        var rs = {dname:'RESEARCH',sal:300};
    	$("#a").combobox({
    		url:'dept/queryAllDept.html',    
    	    valueField:'deptno',    
    	    textField:'dname',
    	    panelHeight:'auto',
    	    onLoadSuccess:function(data){
    	    $.each(data,function(i,obj){
				if(obj.dname == rs.dname){
					$("#a").combobox('setValue',obj.deptno);
					}
				});
    	    },
    	    onSelect:function(o){
        	    var url = "emp/queryByDept.html?deptno="+o.deptno;
        	    $("#b").combobox("reload",url);
        	    }
        	});
    	$("#b").combobox({
    	    valueField:'empno',    
    	    textField:'ename',
    	    panelHeight:'auto',
    	    onLoadSuccess:function(data){
    	    $(this).combobox('setValue',data[0].empno);
    	    }
        	});
    	 $("#time").datebox({
    		 formatter: function (date) {  
             var y = date.getFullYear();  
             var m = date.getMonth() + 1;  
             var d = date.getDate();  
             return y + "-" + (m < 10 ? ("0" + m) : m) + "-" + (d < 10 ? ("0" + d) : d);  
         }  
        	 });
    	
        });
    </script>
	</body>
</html>
