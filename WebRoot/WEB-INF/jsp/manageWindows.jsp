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
	    
	    <title>预置档口管理</title>
	    
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
	    		var objForm = document.forms["windowManageForm"];
	    	
        		if(objValue == ""){
        			objForm.wndCantID.disabled = true;
        		}else{  
        			objForm.wndCantID.disabled = false; 
        			objForm.wndCantID.options.length = 0;
        			
        			<c:forEach items="${canteenItemsList }" var="item" >  	
        	 			var cantCampusID = ${item.cantCampusID };
 	     				var optionObj = document.createElement("option");
        	 			if( cantCampusID == Number(objValue)){
	                        optionObj.text = "${item.cantName }";
	                        optionObj.value = "${item.cantID }";
	                        objForm.wndCantID.add(optionObj);
        	 			}  
	    			</c:forEach>
        		}
	    	}

	    	function check(form){
            	if(form.cantCampusID.value == ""){
            		alert("请先选择档口所在校区！");
            		return false;
            	}
            	if(form.wndCantID.value == ""){
            		alert("请先选择档口所在食堂！");
            		return false;
            	}
            }
        </script> 

  	</head>
  
  	<body>
    	<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	<div class="container-fluid">
            <div class="container col-sm-8 col-sm-offset-2">

                <div class="panel panel-default">

                	<div class="panel-heading">
                        <h3 class="panel-title">食堂选择</h3>
                    </div>

                    <div class="panel-body">
                    	<form class="form-horizontal" role="form" name = "windowManageForm" action="manageWindows.action" method="post">
                    		<div class="form-group">
                    			<!-- 选择食堂所属校区 -->
                                <label class="col-sm-2 control-label">所属校区</label>
                                <div class="col-sm-9"> 
   	                    	        <!-- 选择食堂所属校区 -->
   	                        	    <select name="cantCampusID" class="form-control" onchange="getCanteen(this.value)">
   	                        	    	<option value="">请选择食堂所属校区</option>
   	                        	    	<c:forEach items="${campusList }" var="item" >
   	                        	    		<option value="${item.campusID }">${item.campusName }</option>
	                        	    	</c:forEach>
   	                        	    </select>
                                </div>
                    		</div>
                    		<div class="form-group">
                    			<!-- 选择档口所属食堂 -->
                                <label class="col-sm-2 control-label">所属食堂</label>
                                <div class="col-sm-9">    
   	                        	    <!-- 选择档口所属食堂 -->
   	                        		<select name="wndCantID" class="form-control" disabled="disabled">
   	                        		    <option value="">请选择档口所属食堂</option>
   	                        	    </select>
                                </div>
                    		</div>
                    		<div class="form-group">    
                                <div class="col-sm-2 col-sm-offset-5">                                
                                    <input type="submit" class="btn btn-primary" value="查找档口" onClick="return check(windowManageForm)">
                                </div>
                            </div>
                    	</form>
                    </div>
                </div>

                <div class="panel panel-default">

                	<div class="panel-heading">
                        <h3 class="panel-title">${canteenItems.cantName}档口</h3>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover table-responsive text-center">
                            <thead>
                                <tr>
                                    <th style='text-align: center;'>校区名称</th>
                                    <th style='text-align: center;'>食堂名称</th>
                                    <th style='text-align: center;'>档口名称</th>
                                    <th style='text-align: center;'>档口图片</th>
                                    <th style='text-align: center;'>档口位置</th>
                                    <th style='text-align: center;'>价格范围</th>
                                    <th style='text-align: center;'>营业时间段</th>
                                    <th style='text-align: center;'>支付方式</th>
                                    <th style='text-align: center;'>档口描述</th>
                                    <th style='text-align: center;'>备注</th>
                                    <th style='text-align: center;'>操作</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${windowsList}" var="item" >
                                    <tr>
                                        <td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>
                                            <c:if test="${item.wndPhoto != null }">
                                                <img src="/upload/pic/${item.wndPhoto }" class="center-block" height="80" width="100"/>
                                            </c:if>
                                        </td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndAddr}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndPriceRange}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndSaleHours}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndPayment}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndDescription}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndNote}</td>
                                        <!-- wndID=${item.wndID}& -->
                                        <td style='vertical-align: middle;text-align: center;'>
                                            <div class="form-group btn-group btn-group-sm">
                                                <a href="modifyWindow.action?wndID=${item.wndID}&cantCampusID=${item.cantCampusID}" class="btn btn-info">修改</a>
                                                <a href="deleteWindowById.action?wndID=${item.wndID}" class="btn btn-danger">删除</a>
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
