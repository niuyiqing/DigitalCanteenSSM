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

        <script>
            var checkflag=false;
            function getAllDishesSelect(name){
                var allvalue = document.getElementsByName(name);
                
                if(checkflag==false){
                    for (var i = 0; i < allvalue.length; i++) {        
                        if ((allvalue[i].type == "checkbox"))             
                        allvalue[i].checked = true;                            
                    }  
                    checkflag=true;
                }else{
                    for (var i = 0; i < allvalue.length; i++) {        
                        if ((allvalue[i].type == "checkbox"))             
                        allvalue[i].checked = false;                           
                    }  
                    checkflag=false;
                }
            }

            function checkBoxSelect(dishID){
                var checkbox = document.getElementById(dishID); 
                checkbox.checked=true;
            }

            function starFancyDishesSubmit(){
                document.starFancyDishesForm.action = "saveStarFancyDishes.action";
                jquerySubByFId('starFancyDishesForm', starFancyDishesSubmit_callback, null, "json");
            }
            function starFancyDishesSubmit_callback(data){
                alert(data.resultInfo.message);
            }

            //搜索
            $(document).ready(function(){        
            	$("#searchin").click(function(){
            		var txt=$("#search").val();

            		if($.trim(txt)!=""){	
				        $("table tr:not('#theader')").hide().filter(":contains('"+txt+"')").show();
				    }else{
				        $("table tr:not('#theader')").css("background","#fff").show();
				    }
            	});
            });
        </script>
  	</head>
  
  	<body>
    	<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	<div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">人气风味菜品管理</h3>
                    </div>

                    <div class="panel-body">
                        <form role="form" name="starFancyDishesForm" id="starFancyDishesForm" method="post" action="saveStarFancyDishes.action">
                            <div class="form-group">
                            	<div>
    	                			<input type="text" name="search" id="search">
	                				<input type="button" class="btn btn-primary" value="搜索" name="searchin" id="searchin">
    	                		</div>
                            </div>

                            <table  class="table table-striped table-bordered table-hover table-responsive text-center">
                                <thead>
                                    <tr>
                                        <th style='text-align: center;' width="10%">勾选</th>
                                        <th style='text-align: center;'>风味菜品</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${fancyDishesList }" var="item">
                                        <tr>
                                            <td style='vertical-align: middle;text-align: center;'>
                                                <input type="checkbox" name="dishIDList" id="${item.dishID }" value="${item.dishID }" />
                                            </td>

                                            <!-- 自动勾选已选为名星食堂的食堂 -->
                                            <c:choose >
                                                <c:when test="${starFancyDishesList == null }">
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${starFancyDishesList }" var="itemstar">
                                                        <c:choose>
                                                            <c:when test="${itemstar.dishID == item.dishID }">
                                                                <script> checkBoxSelect("${item.dishID}");</script>     
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>

                                            <td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="form-group">
                                <input type="button" class="btn btn-primary" value="保存" onClick="starFancyDishesSubmit()">
                                <a href="${pageContext.request.contextPath }/backgroundHomepage.action" class="btn btn-primary">返回首页</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
  	</body>
</html>
