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
        <title>特色风味</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />        
        <meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
		<meta name="format-detection" content="telephone=no">
		
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
    	<script src="js/bootstrap.min.js"></script>
    	<script src="http://cdn.bootcss.com/jquery.touchswipe/1.6.18/jquery.touchSwipe.min.js"></script>
    	<script src="js/bootstrap-touch-slider.js"></script>

    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/footnav.css" />
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" /> 
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

        function userQueryAll(){
                document.userQueryForm.action="userQueryAll.action";
                document.userQueryForm.submit();
            }  
        </script> 
    </head>
  
    <body>
        <div class="codrops-header" style="background:rgba(0,0,0,0);" >
            <div class="back-container">
                <button class="btn btn-link btn-lg">
                    <a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a>
                </button>    
            </div>
            <p style="padding-top:7px;width:100%;height:100%;font-size:27px">特色风味</p>  
        </div>                                                                          
        <div >
            <img src="/upload/pic/FancyCanteens.png" class="center-block" width="100%">
        </div>
        <div class="newcustom" style="margin-top: 10px;">
            <table width="100%" align="center">
                <tr>
                    <td width="35%" style="margin: 0px;padding: 0px;">
                        <table>
                            <tr>
                                <td style='vertical-align: middle' >
                                    <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block"  width="100%" style="border-radius:50%;">
                                </td>                                                                                                       
                            </tr>
                            <tr height="30px">
                                <td style='vertical-align: middle;text-align: center;font-size:1.5em;color:black;'>特色风味</td>
                            </tr>
                        </table>
                    </td>
                    <td width="30%" >
                        <table width="100%">
                            <c:forEach items="${campusList }" var="item" >
                                <tr height="32px">
                                    <c:choose >
                                        <c:when test="${item.campusID eq canteenItems.cantCampusID}">
                                            <td style='vertical-align: middle;text-align: center;font-size:1.5em;'><a style="color:white;" href="fancyCanteensPage.action?campusID=${item.campusID}"><span style="background-color:#f79076">${item.campusName }风味</span></a></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style='vertical-align: middle;text-align: center;font-size:1.5em;'><a href="fancyCanteensPage.action?campusID=${item.campusID}"><span>${item.campusName }风味</span></a></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td width="35%" style="margin: 0px;padding: 0px;">
                        <table>
                            <tr>
                                <td style='vertical-align: middle' >
                                    <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block"  width="100%" style="border-radius:50%;">
                                </td>                                                                                                       
                            </tr>
                            <tr height="30px">
                                <td style='vertical-align: middle;text-align: center;font-size:1.5em;color:black;'>人气美食排行</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>        
        </div>
        <div class="newcustom" style="margin-top: 10px;">
            <div class="campusnav">
                <ul>
                    <c:forEach items="${canteenItemsList }" var="item" >
                        <c:choose >
                            <c:when test="${item.cantID eq canteenItems.cantID}">
                                <li><a style="color: black;" href="fancyCanteensPage.action?cantID=${item.cantID}"><span>${item.cantName }</span></a><li>
                            </c:when>
                            <c:otherwise>
                                <li><a style="color: white;" href="fancyCanteensPage.action?cantID=${item.cantID}"><span>${item.cantName }</span></a><li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
            <div class="row" style="padding:0 0px;"> 
                <div class="form-group">                                                                       
                    <c:forEach items="${windowsList }" var="wnditem">                                                  
                        <table width="100%" onclick="location.href='userWindowContents.action?wndID=${wnditem.wndID}';" style="color:black">
                            <tr style="height:30px">
                                <td rowspan=3>
                                    <img src="/upload/pic/${wnditem.wndPhoto }" class="center-block" height="90" width="90"/>
                                </td>
                                <td style="width:75%;padding-left:12px;font-size:1.5em;font-weight:500">
                                    <p class="name">${wnditem.wndName }</p>
                                </td>
                                <td style="width:25%">
                                   <p class="name">${wnditem.wndAddr}</p>
                                </td>
                            </tr>
                            <tr style="height:30px">
                                <td style="padding-left:12px">
                                    <p class="txt">￥${wnditem.wndPriceRange}&nbsp &nbsp支持${wnditem.wndPayment}</p>
                                </td>
                                <td>
                                    <p class="txt"> ${wnditem.wndSaleHours}营业</p>
                                </td>
                            </tr>
                            <tr style="height:30px">
                                <td style="padding-left:12px">
                                    <p class="txt">${wnditem.wndDescription}</p>
                                </td>
                            </tr>
                        </table>
                        <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>                                                        
                    </c:forEach>                                                                            
                </div>  
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
        <script src="js/classie.js"></script>
        <script src="js/mlpushmenu.js"></script>
        <script>new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );</script>
        <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    </body>
</html>
