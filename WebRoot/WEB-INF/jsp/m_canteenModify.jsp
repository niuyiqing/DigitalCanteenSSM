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
    <title>修改食堂信息</title>
    <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0">   
 	<meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	
	<script src="js/modernizr.custom.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
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
		</script>	
  </head> 
  <body>
  	<div class="codrops-header" style="background:#29C192;">
  		<div class="back-container">
              <button class="btn btn-link btn-lg">
                  <a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/canteenPreset.action"></a>
              </button>
        </div>    
              <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">修改食堂</p> 
    </div>
  <div class=" newcustom" style="margin-top:77px" >
  <form name="updateCanteen" method="post" action="modifyCanteenSave.action">
  	<br> 	
	<input name="cantID" type="hidden" value="${canteenItems.cantID }">	
	<!-- 选择食堂所属校区 -->
	<div align="center">
 		<select name="cantCampusID" data-toggle="select" class="form-control select select-primary mrs mbm">
			<!-- 显示之前食堂所属校区 -->	
			<option value="${canteenItems.campusID }" selected="selected">${canteenItems.campusName }</option>
			<c:forEach items="${campusList }" var="item" >		
				<!-- 显示所有校区选项 -->					   						  
			<option value="${item.campusID }">${item.campusName }</option>
			</c:forEach>
		</select>
	</div>

	<div align="center">
		<select name="cantTypeID" data-toggle="select" class="form-control select select-primary mrs mbm">
			<c:forEach items="${canteenTypeList }" var="item" >	
				<c:choose>
					<c:when test="${canteenItems.cantTypeID==item.cantTypeID}">
						<option value="${canteenItems.cantTypeID }" selected="selected">${canteenItems.cantTypeName }</option>
					</c:when>
					<c:otherwise>
						<option value="${item.cantTypeID }">${item.cantTypeName }</option>
					</c:otherwise>
				</c:choose>		
			</c:forEach>
		</select>
	</div>

	<div class="form-group" >
		<input name="cantName" type="text" value="${canteenItems.cantName }" class="form-control ">
		<br>
		<div align="center">
            <c:if test="${canteenItems.cantPhoto != null }">
                <img src="/upload/pic/${canteenItems.cantPhoto }" height="80" width="80"/>
            </c:if>
            <br><br>
            <input type="file" name="cantPhotoFile"/>
        </div>
		<div align="center"><input type="submit" value="保存" class="btn btn-primary btn-wide" data-role="none"></div>
	</div>
  </form>
	</div>
  </body>
</html>
