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
        <title>菜品</title>
        <meta http-equiv="pragma" content="no-cache" >
        <meta http-equiv="cache-control" content="no-cache" >
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" >
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <script src="js/modernizr.custom.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
        <link rel="stylesheet" type="text/css" href="css/footnav.css" />
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
        <div class="codrops-header" style="background:rgba(41, 193, 146,0.8);" >
            
            <div class="back-container">
                <button class="btn btn-link btn-lg" ><a style="color:white" class="icon icon-fanhui" data-ajax="false" onclick="javascript:history.back(-1)"></a></button>
            </div>
            <p style="padding-top:8px;width:100%;height:100%;font-size:22px;">${windowItems.wndName }(${windowItems.campusName }&nbsp${windowItems.cantName })</p> 
        </div>
        <div style="padding-top:63px">
    	<div >
            <img src="/upload/pic/${windowItems.wndPhoto }" class="center-block" width="100%">
        </div>
        <div class="item-wrap" style="margin-top: 10px;">
    	    <form role="form" name="dishForm" enctype="multipart/form-data">
			    <input name="dishID" type="hidden" value="${dishItems.dishID }">								
			   	    <c:forEach items="${dishItemsList }" var="item" >
                    <div id="view" class="item clearfix">
                        <div class="txt-item" style="padding-top:0px;margin-left:0px">
                            <table width="70%">
    	                        <tr>    							 		
    	            	           	<td style='vertical-align: middle;text-align: center;' rowspan="3" width="30%">
    	                             	<c:if test="${item.dishPhoto != null }">												   	
    			           	           		<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="80" style="border-radius:5%"/>
    			           	           	</c:if>
    		      	      	        </td>
                                    <td style='vertical-align: middle;text-align: left;font-size:1.5em;padding-left:12px;padding-top:3px' colspan=2>${item.dishName }</td>
    	                        </tr>
                                <tr>
                                    <td style='vertical-align: middle;text-align: left;padding-left:12px' width="30%">${item.dishSale }</td>
                                    <td style='vertical-align: middle;text-align: center;' width="30%">${item.dishDate }</td>
                                </tr>
                                <tr>
                                    <td style='vertical-align: middle;text-align: left;color:#29C192;font-size:1.5em;padding-left:12px'>￥${item.dishPrice }</td>
                                    <td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
                                </tr>
                            </table>
                        </div>
                    </div>
			   	    </c:forEach>		
    	    </form>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> 
        </div>
        </div>
        <div class="footnav">
            <ul>
                <li>
                    <a href="userHomepage.action"><span>首页</span></a>
                </li>
                <li style="position:relative;">
                    <span>附近</span>
                </li>
                <li>
                    <span>订单</span>
                </li>
                <li>
                    <span>我的</span>
                </li>
            </ul>
        </div>
    </body>
</html>