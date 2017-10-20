<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  	<head>
	    <base href="<%=basePath%>">
	    
	    <title>人气风味菜品管理</title>
	    
		<meta name="viewport" content="width=device-width, 
		                                initial-scale=0.3, 
		                                maximum-scale=1.0, 
		                                user-scalable=true">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
    
        <!--bootstrap-->    
        <script src="js/jquery-1.10.1.min.js"></script>       
    
        <!--bootstrap-->    
        <script src="js/bootstrap.min.js"></script>

        <!-- jQuery支撑 -->
        <script src="js/jquery.form.js"></script>
	    <script src="js/custom.jquery.form.js"></script>
	    <script src="js/jquery.validate.js"></script>

  	</head>
  
  	<body>
    	<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	<div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                </div>
            </div>
        </div>
  	</body>
</html>
