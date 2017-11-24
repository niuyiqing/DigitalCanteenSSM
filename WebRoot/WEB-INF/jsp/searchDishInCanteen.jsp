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
	    
	    <title>搜索已上架菜品</title>
	    
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
    	<%@ include file="publicjsp/canteenMenu.jsp" %>
    	<div class="container-fluid">	
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title">搜索结果</h3>
    			</div>

    			<div class="panel-body">
    				<form class="form-horizontal" role="form" action="searchDishInCanteen.action" method="post">
    					<div class="form-group">
    						<label class="col-sm-2 control-label">菜品名称：</label>
							<div class="col-sm-3">									
								<input type="text" class="form-control" name="dishName"> 
							</div>
							<div>
								<input type="submit" class="btn btn-primary" value="搜索">
							</div>
						</div>							   					

    					<table class="table table-striped table-bordered table-hover table-responsive text-center">
    						<thead>
    							<tr>
    								<th style='text-align: center;'>档口名称</th>
    								<th style='text-align: center;'>菜品类型</th>
    								<th style='text-align: center;'>菜品名称</th>
    								<th style='text-align: center;'>菜品图片</th>
    								<th style='text-align: center;'>菜品价格</th>
    								<th style='text-align: center;'>菜品销售时间</th>
    								<th style='text-align: center;'>菜品销售状态</th>			
    								<th style='text-align: center;'>菜品录入日期</th>				
    								<th style='text-align: center;'>菜品推荐</th>
    								<th style='text-align: center;'>菜品留样</th>
    								<th style='text-align: center;'>编辑</th>
    							</tr>
    						</thead>
    						<tbody>								
								<c:forEach items="${dishItems}" var="item" >
    								<tr>    							 		
    							   		<td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>
    									   	<c:if test="${item.dishPhoto != null }">												   	
    			   								<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="100"/>
    			   							</c:if>
    		   							</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
    							   		<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td> 
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>										   		
    							    	<td style='vertical-align: middle;text-align: center;'>
    							    		<div class="form-group btn-group btn-group-sm">
    									    	<a href="modifyDish.action?dishID=${item.dishID}&dishWndID=${item.wndID}&wndCantID=${item.cantID}" class="btn btn-info">修改</a>
    									    	<a href="deleteDishById.action?dishID=${item.dishID}" class="btn btn-danger">删除</a>
    										</div>
    							    	</td>
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
