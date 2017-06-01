<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
    	<base href="<%=basePath%>">
    	
    	<title>菜品</title>
    	
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
    </head>
  
    <body>
    	<%@ include file="publicjsp/userWindowInfo.jsp" %>
    	<div class="container-fluid">	
    		<div class="panel panel-default">

    			<div class="panel-body">
    				<!-- 显示在一个食堂中的所有菜品 -->
    				<form role="form" name="dishForm" enctype="multipart/form-data">
						<input name="dishID" type="hidden" value="${dishItems.dishID }">

    					<table class="table table-striped table-bordered table-hover table-responsive text-center">
    						<thead>
    							<tr>
    								<th style='text-align: center;'>菜品类型</th>
    								<th style='text-align: center;'>菜品名称</th>
    								<th style='text-align: center;'>菜品图片</th>
    								<th style='text-align: center;'>菜品价格</th>
    								<th style='text-align: center;'>菜品销售时间</th>
    								<th style='text-align: center;'>菜品销售状态</th>			
    								<th style='text-align: center;'>菜品录入日期</th>				
    								<th style='text-align: center;'>菜品推荐</th>
    								<th style='text-align: center;'>菜品留样</th>
    							</tr>
    						</thead>
    						
    						<tbody>								
								<c:forEach items="${dishItemsList }" var="item" >
    								<tr>    							 		
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>
    									   	<c:if test="${item.dishPhoto != null }">												   	
    			   								<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="120"/>
    			   							</c:if>
    		   							</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
    							   		<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td> 
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>										   		    							    
    								</tr>
								</c:forEach>
							</tbody>
    					</table>
    				</form>
    			</div>
    		</div>
    	</div>
    </body>
</html>