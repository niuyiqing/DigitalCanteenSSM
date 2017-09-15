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
        <title>用户信息</title>
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
        <script>
        
        function getCanteen(objValue)
        {   
            var objForm = document.forms["userModifyForm"];
        
            if(objValue == ""){
                objForm.wndCantID.disabled = true;
            }else{                  
                objForm.wndCantID.disabled = false; 
                objForm.wndCantID.options.length = 0; 
                <c:forEach items="${canteenItemsList }" var="item" >    
                     var cantCampusID = ${item.cantCampusID };                   
                    if( cantCampusID == Number(objValue)){  
                        /* 把var optionObj = document.createElement("option")放在循环外，则只出现一次值 */
                        var optionObj = document.createElement("option");               
                        optionObj.text = "${item.cantName }";
                        optionObj.value = "${item.cantID }";
                        objForm.wndCantID.add(optionObj);
                    }  
                </c:forEach>
            }
        }
        
            function checkForm(form){               
                if(form.userName.value == "" ){
                    alert("用户名不能为空!");
                    return false;
                }else if(form.userPwd.value == ""){
                    alert("密码不能为空！");
                    return false;
                }else if(form.userCampusID.value == ""){
                    alert("请选择你所在的校区！");
                    return false;
                }else if(form.userCantID.value == ""){
                    alert("请设定首选食堂！");
                    return false;
                }
            }
        </script>
    
    <div class="codrops-header" style="background:rgba(0,0,0,0);">
            <div class="back-container">
              <button class="btn btn-link btn-lg" ><a style="color:#29C192" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a></button>
            </div>  
            <p style="padding-top:7px;width:100%;height:100%;font-size:22px;color:black">我的信息</p>
    </div>  
    <div class="content clearfix" style="margin-top:20%">s
        <form name="userModifyForm" method="post" enctype="multipart/form-data" action="userModify.action" role="form">
            <input name="userID" type="hidden" value="${userItems.userID }">
            <input name="userRoleID" type="hidden" value="${userItems.userRoleID }">
            <div class="form-group row">
                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">用户名：</label>
                <div class="col-xs-6">
                  <input type="text" class="form-control" name="userName" placeholder="请输入用户名" value="${userItems.userName }">
                </div>
            </div>
            <br>
            <div class="form-group row">
              <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">用户密码：</label>
                <div class="col-xs-6">
                  <input type="text" class="form-control" name="userPwd" placeholder="请输入密码" value="${userItems.userPwd }">
                </div>
            </div>
            <br>
            <div class="form-group row">
              <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">头像：</label>
                <div class="col-xs-6">
                  <a href="javascript:;" class="file" style="font-size:15px;">选择头像
                      <input type="file" name="userPhotoFile">
                  </a>
                </div>
            </div>
            <br>
            <div class="form-group row">
              <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">校区：</label>
                <div class="col-xs-6">
                    <select name="userCampusID" onchange="getCanteen(this.value)" data-toggle="select" class="form-control select select-primary mrs mbm">  
                        <c:forEach items="${campusList }" var="item" >
                        <c:choose>
                            <c:when test="${userItems.userCampusID == item.campusID }">
                               <option value="${item.campusID }" selected="selected">${item.campusName }</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${item.campusID }">${item.campusName }</option>
                            </c:otherwise>
                         </c:choose>
                         </c:forEach>
                    </select>
                </div>
            </div>
            <br>
            <div class="form-group row">
              <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px;text-align:left;margin-left:12%;margin-right:-10%;line-height:34px;">食堂：</label>
                <div class="col-xs-6">
                    <select name="userCantID" data-toggle="select" class="form-control select select-primary mrs mbm">
                        <c:forEach items="${canteenItemsInCampus }" var="item" >
                        <c:choose>
                            <c:when test="${userItems.userCantID == item.cantID }">
                               <option value="${item.cantID }" selected="selected">${item.cantName }</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${item.cantID }">${item.cantName }</option>
                            </c:otherwise>
                          </c:choose>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <br>                                
            <br>
            <div align="center">
              <input type="submit" value="保存" onclick="return checkForm(userModifyForm)" class="btn btn-block" style="width:80%;background:#61c6b4;color:#fff;font-size:18px">
            </div>
        </form>
    </div>
        
    </body>
</html>
