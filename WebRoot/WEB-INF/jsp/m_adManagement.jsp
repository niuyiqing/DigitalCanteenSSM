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
    	<title>推送消息</title>
    	<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0">   
 		<meta charset="utf-8">
 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
	
		<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" />	
         
        <script src="js/jquery-1.10.1.min.js"></script>       
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
        <!-- iOS Web APP中点击链接跳转到Safari 浏览器新标签页的问题 -->
        <script>  
		if(('standalone' in window.navigator)&&window.navigator.standalone){  
		        var noddy,remotes=false;  
		        document.addEventListener('click',function(event){  
		                noddy=event.target;  
		                while(noddy.nodeName!=='A'&&noddy.nodeName!=='HTML') noddy=noddy.parentNode;  
		                if('href' in noddy&&noddy.href.indexOf('http')!==-1&&(noddy.href.indexOf(document.location.host)!==-1||remotes)){  
		                        event.preventDefault();  
		                        document.location.href=noddy.href;  
		                }  
		        },false);  
		}  
		</script>
	</head>
	  
	<body>
		<div class="container">
		<div class="codrops-header" style="background:#29C192;">
  			<div class="back-container">
                <button class="btn btn-link btn-lg">
                    <a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/backgroundHomepage.action"></a>
                </button>
        	</div>    
            <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">信息推送</p> 
    	</div>		
		<div class="container-fluid" style="margin-top:77px">
				<div class="panel panel-default">
					<div class="panel panel-heading">
						<h4 class="panel-title">添加推送</h4>
					</div>

					<div class="panel-body">						
						<form id="adManagementForm" name="adManagementForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">								
							<div class="form-group">
                                <div align="center">
                                	<label class="control-label" style="color:black">推送图片上传</label>
                                    <input type="file" name="adPhotoFile"/>
                                </div>
							</div>
							<div class="form-group" align="center">					
									<!-- 此处按钮类型是button 提交动作放入了js函数中-->
									<input type="button" class="btn btn-primary btn-wide" value="添加推送" onclick="insertAd()">								
							</div>
						</form>							
					</div>																		
				</div>

				<div class="panel panel-default">
					<div class="panel panel-heading">
						<h4 class="panel-title">已有推送</h4>
					</div>

					<div class="panel-body">
						<table class="table table-striped table-bordered table-condensed table-hover table-responsive text-center">
							<thead>
								<tr style="background:#29C192;text-align:center;color:white;font-size:15px">
									<th>推送图片</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adList }" var="item" >
									<tr>
									    <td style='vertical-align: middle;text-align: center;'>
						    		    	<c:if test="${item.adPhoto != null }">
	                		    				<img src="/upload/pic/${item.adPhoto }" class="center-block" height="100" width="100"/>
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
