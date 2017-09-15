<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav id="mp-menu" class="mp-menu">
		<div class="mp-level">
			<h2  style="color:white;font-size:20px; background:#29C192">用户系统</h2>
			<ul>
			    <li >
					<a class="icon icon-shouyeshouye" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action" style="font-size:17px">首页</a>
				</li>
				<!-- <li >
					<a class="icon icon-shezhi" data-ajax="false" href="#" style="font-size:17px">设置</a>
				</li> -->
				<!-- <li >
					<a class="icon icon-fankui" data-ajax="false" href="#" style="font-size:17px">反馈</a>
				</li> -->
				<!-- <li >
					<a class="icon icon-guanyu" data-ajax="false" href="#" style="font-size:17px">关于</a>
				</li> -->
				<li >
					<a class="icon icon-wode" data-ajax="false" href="${pageContext.request.contextPath }/userInfo.action?userID=${userItems.userID}" style="font-size:17px">我的</a>
				</li>
			</ul>
		</div>
		<button style="position:absolute;left:20px;top:90%;border:none"><a class="icon icon-zhuxiao" data-ajax="false" href="${pageContext.request.contextPath }/logout.action"><span style="font-size:15px;color:#000000;">注销</span></a></button>
	</nav>


    



