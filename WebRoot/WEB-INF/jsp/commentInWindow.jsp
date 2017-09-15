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
        <title>评论</title>
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
        <link rel="stylesheet" type="text/css" href="css/taoxinzan.css"  />
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
        <div class="container" data-role="page">
            <div class="mp-pusher" id="mp-pusher">
                <div class="scroller" style="background:#EEEEEE">
                    <div class="scroller-inner">
                        <div class="codrops-header" style="background:#29C192;" >
                            <div class="back-container">
                                <button class="btn btn-link btn-lg" ><a style="color:#ffffff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a></button>
                            </div>
                            <p style="padding-top:7px;width:100%;height:100%;font-size:22px;color:white">${windowItems.wndName }(${windowItems.campusName }&nbsp${windowItems.cantName })</p> 
                        </div>
                        
                        <div class="row" style="color:white;background:#29C192;padding:16px 0px 16px 0px;font-size: 1.5rem;margin-top:65px">
                            <div class="col-xs-3" style="padding-right:0px;text-align:center;border-right:solid 1px white">
                                <a style="color:white;" data-ajax="false" href="${pageContext.request.contextPath }/userWindowContents.action?wndID=${windowItems.wndID}">菜品</a>
                            </div>
                            <div class="col-xs-5" style="padding-right:0px;text-align:center;border-right:solid 1px white">
                                <a style="color:white;" data-ajax="false" href="${pageContext.request.contextPath }/findAllCommentInWindow.action?wndID=${windowItems.wndID}">评价(<fmt:formatNumber value="${windowItems.wndScore}" pattern="#.00" type="number"/>分)</a>
                            </div>
                            <div class="col-xs-4" style="padding-right:0px;text-align:center">
                                <a style="color:white;" data-ajax="false" href="addCommentInWindow.action?wndID=${windowItems.wndID}">我要评价</a>
                            </div>
                        </div>
                        <br>
                    
                        <div class="container-fluid" style="padding:0 0px;">
                            <div class="item-wrap" >
                                <form role="form" name="commentForm" enctype="multipart/form-data">
                                <input name="wndID" type="hidden" value="${windowItems.wndID }">
                        
                                    <div class="row" style="padding:0 0px;">
                                        <div class="form-group">
                                            <div class="item-wrap">
                                                <c:forEach items="${commentItemsList }" var="item" >
                                                    <div  id="view" class="item clearfix">
                                                        <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px;padding-bottom: 5px;">
                                                            <table width=85%>                                    
                                                                <tr>
                                                                    <td style='vertical-align: middle;text-align: center;' rowspan=3>
                                                                        <c:if test="${item.userPhoto != null }">
                                                                            <img src="/upload/pic/${item.userPhoto }" class="center-block" height="60" width="60" style="border-radius:50%;margin-left:0;margin-right:-20px"/>
                                                                        </c:if>
                                                                    </td>
                                                                    <td style='vertical-align: middle;text-align: left;font-size:1.5em' >${item.userName }</td>
                                                                    <td style='vertical-align: middle;text-align: left;'>${item.cmtScore }分</td>                                                                   
                                                                    <td style='vertical-align: middle;text-align: left;'><fmt:formatDate value="${item.cmtDate}" pattern="yyyy-MM-dd" /></td> 
                                                                </tr>
                                                                <tr>
                                                                    <td class="zan" colspan=3><!-- <a href="updateCmtGoodNum.action?cmtID=${item.cmtID}&cmtGood=${cmtGood} "> -->
                                                                        <span>${item.cmtGoodNum}</span>
                                                                        <input id = "cmtID"  value = "${item.cmtID}"  name = "cmtID"  type = "hidden">
                                                                        <!-- </a> -->
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style='vertical-align: middle;text-align: left;' colspan=3>${item.cmtContent }</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>  
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    
 <script>
    
    $(".zan").click(function () {
        $(this).toggleClass("zan1");
        var classname=$(this).attr("class");
        var zan_num=parseInt($('>span',this).text());
        var cmtID = document.getElementById("cmtID").value;
        if(classname == "zan zan1"){
            zan_num +=1;
            $.get("updateCmtGoodNum.action?cmtID="+cmtID+"&cmtGood="+zan_num,function(data,status){
                      //点赞成功！
    	    });
            $('>span',this).text(zan_num);
            
        }else if(classname== "zan"){
            zan_num -=1;
            $('>span',this).text(zan_num);
        }
    })
    
 </script>
</html>