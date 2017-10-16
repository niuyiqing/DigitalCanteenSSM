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
	    
	    <title>名星食堂管理</title>
	    
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
            function getAllCanteensSelect(name){
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

            function checkBoxSelect(cantID){
                var checkbox = document.getElementById(cantID); 
                checkbox.checked=true;
            }

            function starCanteensSubmit(){
                document.starCanteensForm.action = "saveStarCanteens.action";
                jquerySubByFId('starCanteensForm', starCanteensSubmit_callback, null, "json");
            }
            function starCanteensSubmit_callback(data){
                alert(data.resultInfo.message);
            }
        </script>
  	</head>
  
  	<body>
        <%@ include file="publicjsp/backgroundMenu.jsp" %>

        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">名星食堂管理</h3>
                    </div>
    
                    <div class="panel-body">
                        <form role="form" name="starCanteensForm" id="starCanteensForm" method="post" action="saveStarCanteens.action">
                            <table  class="table table-striped table-bordered table-hover table-responsive text-center">
                                <thead>
                                    <tr>
                                        <th style='text-align: center;'>
                                            <input type="checkbox" id="selectAll" name="selectAll" onclick="getAllCanteensSelect('cantIDList')">
                                        </th>
                                        <th style='text-align: center;'>校区名称</th>
                                        <th style='text-align: center;'>食堂名称</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${canteenItemsList }" var="item">
                                        <tr>
                                            <td style='vertical-align: middle;text-align: center;'>
                                                <input type="checkbox" name="cantIDList" id="${item.cantID }" value="${item.cantID }" />
                                            </td>

                                            <!-- 自动勾选已选为名星食堂的食堂 -->
                                            <c:choose >
                                                <c:when test="${starCanteensList == null }">
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${starCanteensList }" var="itemstar">
                                                        <c:choose>
                                                            <c:when test="${itemstar.cantID == item.cantID }">
                                                                <script> checkBoxSelect("${item.cantID}");</script>     
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>

                                            <td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
                                            <td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="form-group">
                                <input type="button" class="btn btn-primary" value="保存" onClick=starCanteensSubmit()>
                                <a href="${pageContext.request.contextPath }/backgroundHomepage.action" class="btn btn-primary">返回首页</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
  	</body>
</html>
