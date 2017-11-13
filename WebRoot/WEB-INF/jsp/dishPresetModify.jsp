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
	    
	    <title>修改预置菜品信息</title>
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

        <script>
        	function dishPresetModifySubmit(){
        		jquerySubByFId('updateDishPreset', dishPresetModifySubmit_callback, null, "json");
        	}

        	function dishPresetModifySubmit_callback(data){
        		if(data.resultInfo.type == '1'){	//没有重复

        			alert(data.resultInfo.message);
        			window.location.href = "dishPreset.action";

        		}else if(data.resultInfo.type == '0'){	//有重复

        			alert(data.resultInfo.message);

        		}
        	}
        </script>
	</head>
	  
	<body>
		<%@ include file="publicjsp/backgroundMenu.jsp" %>
		<div class="container-fluid">
    		<div class="container col-sm-6 col-sm-offset-3">
    			<div class="panel panel-default">

    				<div class="panel-heading">
						<h3 class="panel-title">修改预置菜品</h3>
					</div>

					<div class="panel-body">
						<form class="form-horizontal" role="form" id="updateDishPreset" name="updateDishPreset" method="post" action="modifyDishPresetSave.action" enctype="multipart/form-data">
							<div class="form-group">
								<input name="dishPresetID" type="hidden" value="${dishPreset.dishPresetID }">							
								<label class="col-sm-2 control-label">菜品名称：</label>
								<div class="col-sm-9">	
									<input name="dishPresetName" class="form-control" type="text" value="${dishPreset.dishPresetName }">
								</div>								
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">菜品图片：</label>
                                <div class="col-sm-9">
                                    <c:if test="${dishPreset.dishPresetPhoto != null }">
                                        <img src="/upload/pic/${dishPreset.dishPresetPhoto }" height="100" width="120"/>
                                    </c:if>
                                    <br><br>
                                    <input type="file" name="dishPhotoFile"/>
                                </div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<input type="button" class="btn btn-primary" value="保存" onClick=dishPresetModifySubmit()>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</body>
</html>
