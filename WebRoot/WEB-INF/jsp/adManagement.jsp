<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	    <base href="<%=basePath%>">
	    <title>推送信息</title>
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

        <script src="js/jquery.form.js"></script>
	    <script src="js/custom.jquery.form.js"></script>
	    <script src="js/jquery.validate.js"></script>

        <script>
        	//添加校区的重复检验
        	function insertAd(){
        		if(document.adManagementForm.adPhotoFile.value == ""){
        			alert("请输入推送图片");
        			return;
        		}
				
        		document.adManagementForm.action="insertAdWithValidation.action";
        		jquerySubByFId('adManagementForm', insertAd_callback, null, "json");
        	}
        	function insertAd_callback(data){
        		//成功
        		if(data.resultInfo.type == '1'){
        			window.location.href="adManagement.action";
        		}
        		//失败
        		else if(data.resultInfo.type == '0'){
        			alert(data.resultInfo.message);
        			window.location.href="adManagement.action";
        		}
        	}
        	
        </script>
	</head>
	  
	<body>
		<%@ include file="publicjsp/backgroundMenu.jsp" %>
		<div class="container-fluid">
			<div class="container col-sm-6 col-sm-offset-3">
				<div class="panel panel-default">

					<div class="panel panel-heading">
						<h3 class="panel-title">添加推送</h3>
					</div>

					<div class="panel-body">						
						<form id="adManagementForm" name="adManagementForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">								
							<div class="form-group">
								<label class="col-sm-3 control-label">推送图片上传</label>
                                <div class="col-sm-9">
                                    <input type="file" name="adPhotoFile"/>
                                </div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<!-- 此处按钮类型是button 提交动作放入了js函数中-->
									<input type="button" class="btn btn-primary" value="添加推送" onclick="insertAd()">
								</div>
							</div>
						</form>							
					</div>													
					
				</div>

				<div class="panel panel-default">

					<div class="panel panel-heading">
						<h3 class="panel-title">已有推送</h3>
					</div>

					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover table-responsive text-center">
							<thead>
								<tr>
									<th style='text-align: center;'>推送图片</th>
									<th style='text-align: center;'>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adList }" var="item" >
									<tr>
									    <td style='vertical-align: middle;text-align: center;'>
						    		    	<c:if test="${item.adPhoto != null }">
	                		    				<img src="/upload/pic/${item.adPhoto }" class="center-block" height="100" width="120"/>
	                		    			</c:if>
						    		    </td>					    		    
									    <td style='vertical-align: middle;text-align: center;'>
									    	<div class="form-group btn-group btn-group-sm">
									    		<a href="deleteAdById.action?adID=${item.adID}" class="btn btn-danger">删除</a>
									    	</div>
									    </td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>				
			</div>
		</div>
	</body>
</html>
