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
        
        <title>搜索预置菜品</title>
        
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
            <p style="width:100%;height:100%;font-size:27px">搜索预置菜品</p>  
        </div>
        <form role="form" method="post" action="saveStarChineseDishes.action">
            <div class=" newcustom" style="padding-top:70px;" >
                <div class="form-group">
                	<div>
    	         		<input type="text" name="dishPresetName" style="width: 70%;height: 32px;color:black">
	             		<input type="submit" class="btn btn-primary" value="搜索">
    	         	</div>
                </div>
                <table  class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr style="background:#29C192;text-align:center;color:white;font-size:18px">
                            <th>菜品名称</th>
                            <th>菜品图片</th>
                            <th>编辑</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${dishPresetItemsList}" var="item">
                            <tr align="center" style="color:black;font-size:15px">
                                <td style='vertical-align: middle;text-align: center;'>${item.dishPresetName }</td>
                                <td style='vertical-align: middle;text-align: center;'>
                                    <c:if test="${item.dishPresetPhoto != null }">
                                        <img src="/upload/pic/${item.dishPresetPhoto }" class="center-block" height="80" width="100"/>
                                    </c:if>
                                </td>
                                <td style='vertical-align: middle;text-align: center;'>                                         
                                    <div class="form-group btn-group btn-group-sm">
                                        <a href="modifyDishPreset.action?dishPresetID=${item.dishPresetID}" class="btn btn-info">修改</a>
                                        <a href="deleteDishPresetById.action?dishPresetID=${item.dishPresetID}" class="btn btn-danger">删除</a>
                                    </div>                                          
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
  	</body>
</html>
