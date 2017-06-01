<%@ page contentType="text/html; charset=utf-8" %>

<nav class="navbar navbar-default " role="navigation">
    <div class="navbar-all">            
        <ul class="nav navbar-nav">      
    	    <li>
                <a><FONT style="FONT-FAMILY:黑体">校区：${windowItems.campusName }</FONT></a>
            </li>
            <li>
                <a><FONT style="FONT-FAMILY:黑体">食堂：${windowItems.cantName }</FONT></a>
            </li>
            <li>
                <a><FONT style="FONT-FAMILY:黑体">档口：${windowItems.wndName }</FONT></a>
            </li>         
            <li>
                <a><FONT style="FONT-FAMILY:黑体">评分：${windowItems.wndScore }</FONT></a>
            </li>
            <br>
            <li>
                <a href="${pageContext.request.contextPath }/userWindowContents.action?wndID=${windowItems.wndID}"><FONT style="FONT-FAMILY:黑体">菜品</FONT></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/findAllCommentInWindow.action?wndID=${windowItems.wndID}"><FONT style="FONT-FAMILY:黑体">评论</FONT></a>
            </li>
    </div>
    
</nav>
      

