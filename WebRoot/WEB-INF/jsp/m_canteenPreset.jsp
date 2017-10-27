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
    <title>预置食堂信息</title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0">   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="format-detection" content="telephone=no">
  	
    <script src="js/modernizr.custom.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <!--分页控件--> 
    <link rel="stylesheet" href="css/qunit-1.11.0.css">
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

      <div class="container">
        <div class="mp-pusher" id="mp-pusher">
          <%@ include file="publicjsp/index.jsp" %>               
          <div class="scroller" style="background:#EEEEEE">
            <div class="scroller-inner">
              <div class="codrops-header" style="background:#29C192">
                  <div id="trigger" class="burger-container">
                  <span class="burger-bun-top"></span>
                  <span class="burger-filling"></span>
                  <span class="burger-bun-bot"></span>
                  </div>         
                  <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">预置食堂</p> 
              </div>
      
          <div class="content clearfix">
          <form action="insertCanteen.action" method="post">
            <div class=" newcustom" style="margin-top:77px" >
          	<!-- 选择食堂所属校区 -->
            <div align="center" >
         		  <select name="cantCampusID" data-toggle="select" class="form-control select select-primary mrs mbm" >
         		  	<option value="">请选择食堂所属校区</option>
         		  	<c:forEach items="${campusList }" var="item" >
         		  		<option value="${item.campusID }">${item.campusName }</option>
      			    </c:forEach>
         		  </select>
      	      <br>
         		  <select name="cantTypeID" data-toggle="select" class="form-control select select-primary mrs mbm" >
         		  	<option value="">请选择食堂所属类型</option>
         		  	<c:forEach items="${canteenTypeList }" var="item" >
         		  		<option value="${item.cantTypeID }">${item.cantTypeName }</option>
      			    </c:forEach>
         		  </select>
            </div>
            <br>
         		<!-- 输入食堂名称 -->
            <div class="form-group" >
          	  <div ><input type="text" placeholder="请输入预置食堂名称" name="cantName" class="form-control "> </div>
              <br>
              <div>
                <input type="file" name="cantPhotoFile"/>
              </div>
          	  <div align="center"><input type="submit" value="添加食堂" class="btn btn-primary btn-wide" data-role="none"></div>
            </div>
          </div>
          <!-- 列举已录入的食堂 -->
          <div class="newcustom" style="padding: 1em 0.6em">
      	    <table  class="table table-striped table-bordered table-condensed">
      		    <thead>
              <tr style="background:#29C192;text-align:center;color:white;font-size:15px">
      		   	 	<td>校区名称</td>
      		   	 	<td>食堂类型</td>
      	        <td>食堂名称</td>
                <td>食堂图片</td>
      		      <td colspan="2">编辑</td>
      		    </tr>
              </thead>
      			  <c:forEach items="${pagehelper.list }" var="item" >
      			  	<tr align="center" style="color:black;font-size:15px">
      			  	 	<td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
      			  	 	<td style='vertical-align: middle;text-align: center;'>${item.cantTypeName }</td>
      			  	  <td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
                  <td>
                    <c:if test="${item.cantPhoto != null }">
                      <img src="/upload/pic/${item.cantPhoto }" class="center-block" height="80" width="80"/>
                    </c:if>
                  </td>
      			  	  <td style='vertical-align: middle;text-align: center;'><a href="modifyCanteen.action?cantID=${item.cantID}" style="color:#66AFE9">修改</a></td>
      			  	  <td style='vertical-align: middle;text-align: center;'><a href="deleteCanteenById.action?cantID=${item.cantID}" style="color:#66AFE9">删除</a></td>
      			  	</tr>
      			  </c:forEach>
      		  </table>
      
                  <div>
                    <div class="message">
                      <p class="text-center" style="color:black">
                        共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                      </p>
                    </div>
                    <div style="text-align:center;">
                      <ul class="pagination">
                        <c:if test="${!pagehelper.isFirstPage}">                    
                          <li>
                            <a href="findAllCanteens.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                          </li>
                        </c:if>
      
                        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">  
      
                          <c:if test="${navigatepageNum==pagehelper.pageNum}">
                            <li class="active">
                              <a href="findAllCanteens.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                            </li>
                          </c:if>
      
                          <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                            <li>
                              <a href="findAllCanteens.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                            </li>
                          </c:if>
      
                        </c:forEach>
      
                        <c:if test="${!pagehelper.isLastPage}">
                          <li>
                            <a href="findAllCanteens.action?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                          </li>
                        </c:if>
                      </ul>
                    </div>
                  </div>
                </div>
      	  </form>
      	  </div>
            </div>
          </div>
        </div>
      </div>
<script src="js/classie.js"></script>
<script src="js/mlpushmenu.js"></script>
<script>
   new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
</script>
<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
</body>
</html>
