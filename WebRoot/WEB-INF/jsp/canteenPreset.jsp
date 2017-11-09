<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

<html>
    <head>
        <base href="<%=basePath%>">
        
        <title>预置食堂信息</title>
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
         
    </head>
    
    <body>
        <%@ include file="publicjsp/backgroundMenu.jsp" %>
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">预置食堂</h3>
                    </div>

                    <div class="panel-body">
                        <form class="form-horizontal" role="form" action="insertCanteen.action" method="post" enctype="multipart/form-data">
                            <div class="form-group">                                                                
                                <label class="col-sm-2 control-label">所属校区</label>
                                <div class="col-sm-9">    
                                    <!-- 选择食堂所属校区 -->
                                    <select class="form-control" name="cantCampusID">
                                        <option value="">请选择食堂所属校区</option>
                                        <c:forEach items="${campusList }" var="item" >
                                            <option value="${item.campusID }">${item.campusName }</option>
                                        </c:forEach>
                                    </select>
                                </div>                                
                            </div>
                            <div class="form-group">                                
                                <label class="col-sm-2 control-label">食堂类型</label>
                                <div class="col-sm-9">    
                                    <!-- 选择食堂所属类型 -->
                                    <select class="form-control" name="cantTypeID">
                                        <option value="">请选择食堂所属类型</option>
                                        <c:forEach items="${canteenTypeList }" var="item" >
                                            <option value="${item.cantTypeID }">${item.cantTypeName }</option>
                                        </c:forEach>
                                    </select>
                                </div>                                
                            </div>
                            <div class="form-group">                                                                    
                                <label class="col-sm-2 control-label">食堂名称</label>
                                <div class="col-sm-9">    
                                    <!-- 输入食堂名称 -->
                                    <input type="text" class="form-control" placeholder="请在此处输入预置食堂名称" name="cantName"> 
                                </div>                                
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">图片上传</label>
                                <div class="col-sm-9">
                                    <input type="file" name="cantPhotoFile"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 col-sm-offset-5">
                                    <!-- 食堂添加按钮 -->
                                    <input type="submit" class="btn btn-primary" value="添加食堂">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">已有食堂</h3>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover table-responsive text-center">
                            <thead>
                                <tr>
                                    <th style='text-align: center;'>校区名称</th>
                                    <th style='text-align: center;'>食堂类型</th>
                                    <th style='text-align: center;'>食堂名称</th>
                                    <th style='text-align: center;'>食堂图片</th>
                                    <th style='text-align: center;'>编辑</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pagehelper.list }" var="item" >
                                    <tr>
                                        <td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.cantTypeName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>
                                            <c:if test="${item.cantPhoto != null }">
                                                <img src="/upload/pic/${item.cantPhoto }" class="center-block" height="80" width="100"/>
                                            </c:if>
                                        </td>
                                        <td style='vertical-align: middle;text-align: center;'>
                                            <div class="form-group btn-group btn-group-sm">
                                                <a href="modifyCanteen.action?cantID=${item.cantID}" class="btn btn-info">修改</a>
                                                <a href="deleteCanteenById.action?cantID=${item.cantID}" class="btn btn-danger">删除</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div>
                            <div class="message">
                                <p class="text-center">
                                    共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                                </p>
                            </div>
                            <div style="text-align:center;">
                                <ul class="pagination">
                                    <c:if test="${!pagehelper.isFirstPage}">                                        
                                        <li>
                                            <a href="findAllCanteens.action?pageNum=${pagehelper.firstPage}&pageSize=${pagehelper.pageSize}">首页</a>
                                        </li>
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
                                        <li>
                                            <a href="findAllCanteens.action?pageNum=${pagehelper.lastPage}&pageSize=${pagehelper.pageSize}">尾页</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div> 
                    </div>
                </div>  
            </div>
        </div>


    </body>
</html>
