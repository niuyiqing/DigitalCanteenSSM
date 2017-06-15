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
        
        <title>账户信息</title>
    
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

        <script>
        
        function getCanteen(objValue)
		{	
			var objForm = document.forms["userModifyForm"];
		
    		if(objValue == ""){
    			objForm.wndCantID.disabled = true;
    		}else{   			 	
    			objForm.wndCantID.disabled = false; 
    			objForm.wndCantID.options.length = 0; 
    			<c:forEach items="${canteenItemsList }" var="item" >  	
    	 			 var cantCampusID = ${item.cantCampusID };   	 			 
    	 			if( cantCampusID == Number(objValue)){	
    	 				/* 把var optionObj = document.createElement("option")放在循环外，则只出现一次值 */
    	 				var optionObj = document.createElement("option"); 				
	                    optionObj.text = "${item.cantName }";
	                    optionObj.value = "${item.cantID }";
	                    objForm.wndCantID.add(optionObj);
    	 			}  
				</c:forEach>
    		}
		}
		
        	function checkForm(form){	    		
	    		if(form.userName.value == "" ){
	    			alert("用户名不能为空!");
	    			return false;
	    		}else if(form.userPwd.value == ""){
	    			alert("密码不能为空！");
	    			return false;
	    		}else if(form.userCampusID.value == ""){
	    			alert("请选择你所在的校区！");
	    			return false;
	    		}else if(form.userCantID.value == ""){
	    			alert("请设定首选食堂！");
	    			return false;
	    		}
	    	}
        </script>

    </head>
  
    <body>
    
    
    <div class="content clearfix" style="margin-top:10%">
    	<form name="userModifyForm" method="post" enctype="multipart/form-data" action="userModify.action" role="form">
    	<input name="userID" type="hidden" value="${userItems.userID }">
    	<input name="userRoleID" type="hidden" value="${userItems.userRoleID }">
            <div class="form-group row">
                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">用户名：</label>
                <div class="col-xs-6">
    		      <input type="text" class="form-control" name="userName" placeholder="请输入用户名" value="${userItems.userName }">
                </div>
            </div> 
            <br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">用户密码：</label>
                <div class="col-xs-6">
    		      <input type="text" class="form-control" name="userPwd" placeholder="请输入密码" value="${userItems.userPwd }">
                </div>
            </div>                         		
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">头像：</label>
                <div class="col-xs-6">
                  <a href="javascript:;" class="file" style="font-size:15px;">选择头像
    		          <input type="file" name="userPhotoFile">
                  </a>
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">校区：</label>
                <div class="col-xs-6">
    		      <div align="center">
			 		<select name="userCampusID" onchange="getCanteen(this.value)" data-toggle="select" class="form-control select select-primary mrs mbm">	
			   			<c:forEach items="${campusList }" var="item" >
			   			<c:choose>
						    <c:when test="${userItems.userCampusID == item.campusID }">
						       <option value="${item.campusID }" selected="selected">${item.campusName }</option>
						    </c:when>
						    <c:otherwise>
						        <option value="${item.campusID }">${item.campusName }</option>
						    </c:otherwise>
						 </c:choose>
						 </c:forEach>
			   		</select>
				</div>
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">食堂：</label>
                <div class="col-xs-6">
    		      <select name="userCantID" data-toggle="select" class="form-control select select-primary mrs mbm">
	   			<c:forEach items="${canteenItemsInCampus }" var="item" >
	   			<c:choose>
				    <c:when test="${userItems.userCantID == item.cantID }">
				       <option value="${item.cantID }" selected="selected">${item.cantName }</option>
				    </c:when>
				    <c:otherwise>
				        <option value="${item.cantID }">${item.cantName }</option>
				    </c:otherwise>
				  </c:choose>
				</c:forEach>
   		</select>
                </div>
            </div>
    		<br>                                
            <br>
            <div align="center">
    		  <input type="submit" value="保存" onclick="return checkForm(userModifyForm)" class="btn btn-block" style="width:80%;background:#72dbc8;color:#fff;font-size:18px">
            </div>
    	</form>
    </div>    

    </body>
</html>
