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
        <!-- <div class="codrops-header" style="background:rgba(0,0,0,0);" >
            <div class="back-container">
                <button class="btn btn-link btn-lg">
                    <a style="color:black" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a>
                </button>    
            </div>
            <p style="padding-top:7px;width:100%;height:100%;font-size:27px;color:black">特色风味</p>  
        </div> -->                                                                          
        <div >
            <img src="/upload/pic/FancyCanteenpage.png" class="center-block" width="100%">
        </div>
        <div class="newcustom" style="margin-top: 10px;">
            <table width="100%" align="center">
                <tr>
                    <td width="37%" style="margin: 0px;padding: 0px;">
                        <table>
                            <tr>
                                <td style='vertical-align: middle;align: center' >
                                    <img src="/upload/pic/fancypage.png" class="center-block"  width="100%"  style="border-radius:5%;">
                                </td>                                                                                                       
                            </tr>
                            <tr height="30px">
                                <td style='vertical-align: middle;text-align: center;font-size:20px;color:black;'>特色风味</td>
                            </tr>
                        </table>
                    </td>
                    <td width="26%" >
                        <table width="100%">
                            <c:forEach items="${campusList }" var="item" >
                                <tr height="32px">
                                    <c:choose >
                                        <c:when test="${item.campusID eq canteenItems.cantCampusID}">
                                            <td style='vertical-align: middle;text-align: center;font-size:20px;font-weight:500'><a style="color:white;" href="fancyCanteensPage.action?campusID=${item.campusID}"><span style="background-color:#f79076;border-radius:5%">${item.campusName }风味</span></a></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style='vertical-align: middle;text-align: center;font-size:20px;'><a href="fancyCanteensPage.action?campusID=${item.campusID}"><span>${item.campusName }风味</span></a></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td width="37%" style="margin: 0px;padding: 0px;">
                        <table onclick="location.href='starFancyDishesPage.action';">
                            <tr>
                                <td style='vertical-align: middle;align: center' >
                                    <img src="/upload/pic/stardishes.png" class="center-block"  width="100%"  style="border-radius:5%;">
                                </td>                                                                                                       
                            </tr>
                            <tr height="30px">
                                <td style='vertical-align: middle;text-align: center;font-size:20px;color:black;'>人气美食</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>        
        </div>
        <div class="newcustom" style="margin-top: 10px;">
            <!-- <div class="campusnav">
                <ul>
                    <c:forEach items="${canteenItemsList }" var="item" >
                        <c:choose >
                            <c:when test="${item.cantID eq canteenItems.cantID}">
                                <li><a style="color: black;font-weight:500" href="fancyCanteensPage.action?cantID=${item.cantID}"><span>${item.cantName }</span></a><li>
                            </c:when>
                            <c:otherwise>
                                <li><a style="color: white;" href="fancyCanteensPage.action?cantID=${item.cantID}"><span>${item.cantName }</span></a><li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div> -->
            <div style="position:relative;padding-top: 20px;background-color:#f79076">
                <ul class="nav nav-pills">
                    <c:forEach items="${canteenItemsList }" var="item" >
                        <c:choose >
                            <c:when test="${item.cantID eq canteenItems.cantID}">
                                <li style="font-size:18px;"><a style="color:white;font-weight:500" href="fancyCanteensPage.action?cantID=${item.cantID}">${item.cantName }</a><li>
                            </c:when>
                            <c:otherwise>
                                <li style="font-size:18px;"><a href="fancyCanteensPage.action?cantID=${item.cantID}">${item.cantName }</a><li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
            <div class="timenav">
                <ul >
                    <c:choose >
                        <c:when test="${1 eq supplyTime}">
                            <li style="font-size:16px;"><a style="color: #f79076;font-weight:500" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=1"><span>早餐</span></a><li>
                        </c:when>
                        <c:otherwise>
                            <li style="font-size:16px;"><a style="color: black;" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=1"><span>早餐</span></a><li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose >
                        <c:when test="${2 eq supplyTime}">
                            <li style="font-size:16px;"><a style="color: #f79076;font-weight:500" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=2"><span>中餐</span></a><li>
                        </c:when>
                        <c:otherwise>
                            <li style="font-size:16px;"><a style="color: black;" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=2"><span>中餐</span></a><li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose >
                        <c:when test="${3 eq supplyTime}">
                            <li style="font-size:16px;"><a style="color: #f79076;font-weight:500" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=3"><span>晚餐</span></a><li>
                        </c:when>
                        <c:otherwise>
                            <li style="font-size:16px;"><a style="color: black;" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=3"><span>晚餐</span></a><li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose >
                        <c:when test="${4 eq supplyTime}">
                            <li style="font-size:16px;"><a style="color: #f79076;font-weight:500" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=4"><span>全天</span></a><li>
                        </c:when>
                        <c:otherwise>
                            <li style="font-size:16px;"><a style="color: black;" href="fancyCanteensPage.action?cantID=${canteenItems.cantID}&supplyTime=4"><span>全天</span></a><li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="row" style="padding:0 0px;"> 
                <div class="form-group">
                    <c:choose>
                        <c:when test="${supplyTime!=null }">
                            <c:forEach items="${dishesDetailList }" var="item" >
                                <div class="item clearfix">
                                    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
                                        <table  width="100%" style="color:black">                                                        
                                            <tr style="height:30px">
                                                <td style='vertical-align: left;text-align: center;' rowspan=3>
                                                    <c:if test="${item.detailDishPhoto != null }">
                                                        <img src="/upload/pic/${item.detailDishPhoto }" class="center-block" height="80" width="80" style="border-radius:5%;margin-left:20px;margin-right:-50px">
                                                    </c:if>
                                                </td>                                                           
                                                <td style='vertical-align: middle;font-size:18px;font-weight:500;width:120px' >${item.detailDishName}</td>
                                                <td style='vertical-align: middle;'></td>                                             
                                            </tr>
                                            <tr style="height:30px">                                                           
                                                <td style='vertical-align: middle;font-size:16px;'>[${item.detailWndName }]</td>
                                                <td style='vertical-align: middle;font-size:16px;'>${item.detailDishDate } </td> 
                                            </tr>
                                            <tr style="height:30px">                          
                                                <td style='vertical-align: middle;color:#29C192;font-size:20px;'>￥${item.detailDishPrice }</td>
                                                <td style='vertical-align: middle;'><fmt:formatDate value="${item.detailDishInDate}" pattern="yyyy-MM-dd" /></td>
                                            </tr>
                                        </table>
                                        <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>                                                                       
                            <c:forEach items="${windowsList }" var="wnditem">                                                  
                                <table width="100%" onclick="location.href='userWindowContents.action?wndID=${wnditem.wndID}';" style="color:black">
                                    <tr style="height:30px">
                                        <td rowspan=3>
                                            <img src="/upload/pic/${wnditem.wndPhoto }" class="center-block" height="90" width="90"/>
                                        </td>
                                        <td colspan="2" style="width:75%;padding-left:12px;font-size:18px;font-weight:500">
                                            <p class="name">${wnditem.wndName }</p>
                                        </td>
                                    </tr>
                                    <tr style="height:30px">
                                        <td style="padding-left:12px;color:#29C192;font-size:20px;width:30%">
                                            <p class="txt">￥${wnditem.wndPriceRange}</p>
                                        </td>
                                        <td style="font-size:16px;">
                                            <p class="txt"> ${wnditem.wndSaleHours}</p>
                                        </td>
                                    </tr>
                                    <tr style="height:30px">
                                        <td colspan="2" style="padding-left:12px;font-size:16px">
                                            <p class="txt">${wnditem.wndDescription}</p>
                                        </td>
                                    </tr>
                                </table>
                                <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>                                                        
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>                                                                            
                </div>  
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>  
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
