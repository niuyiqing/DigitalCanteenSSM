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
        
        <title>人气风味菜品管理</title>
        
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
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
    
        <script src="js/modernizr.custom.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
        <div class="codrops-header" style="background:#29C192;">
            <div class="back-container">
                <button class="btn btn-link btn-lg" style="padding-top:4px">
                    <a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/backgroundHomepage.action"></a>
                </button>    
            </div>
            <p style="width:100%;height:100%;font-size:27px">人气风味菜品管理</p>  
        </div>
        <form role="form" name="starFancyDishesForm" id="starFancyDishesForm" method="post" action="saveStarFancyDishes.action">
            <div class=" newcustom" style="padding-top:63px;" >
                <table  class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr style="background:#29C192;text-align:center;color:white;font-size:18px">
                            <th>选择</th>
                            <th>风味菜品</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${fancyDishesList }" var="item">
                            <tr align="center" style="color:black;font-size:15px">
                                <td>
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
                                <td >${item.dishName }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="form-group" align="center">
                    <input type="button" style="width:80%" class="btn btn-primary btn-wide" value="保存" onClick="starFancyDishesSubmit()">
                </div>
            </div>
        </form>
    </body>
</html>
