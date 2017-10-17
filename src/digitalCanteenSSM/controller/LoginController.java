package digitalCanteenSSM.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;  

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.UserService;
import digitalCanteenSSM.util.CheckMobile;


@Controller
public class LoginController {
	@Autowired
	private MUserService mUserService;
	@Autowired
	private UserService userService;
	
	@SuppressWarnings("unused")//测试cookie时用的
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String userName, String password,String isLogin, HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception{

		Cookie[] cook = request.getCookies();//测试cookie时用的
		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
		Subject currentUser = SecurityUtils.getSubject();
		try{
			currentUser.login(token);
		}catch(UnknownAccountException uae){
			request.setAttribute("message_login", "未知账户");
		}catch(IncorrectCredentialsException ice){
			request.setAttribute("message_login", "密码不正确");
		}catch(LockedAccountException lae){
			request.setAttribute("message_login", "账户已锁定");
		}catch(ExcessiveAttemptsException eae){
			request.setAttribute("message_login", "用户名或密码错误次数过多");
		}catch(AuthenticationException ae){
			request.setAttribute("message_login", "用户名或密码不正确");
		}
		
		
		//判断用户访问的设备类型并写入到session			
		try{
			String userAgent = request.getHeader("USER-AGENT").toLowerCase();
			if(null == userAgent){
				userAgent = "";
			}
			if(CheckMobile.check(userAgent)){
				session.setAttribute("ua", "mobile");
			}else{
				session.setAttribute("ua", "pc");
			}
		}catch(Exception e){
			e.printStackTrace();
		}	
				
		//判断登录用户的类型，跳转到不同的页面
		if(currentUser.isAuthenticated()){

			String name = userName;
			String pwd = password;
		    String flag = request.getParameter("isLogin");
			if ("y".equals(flag)) {
	             //创建两个Cookie对象
	             Cookie nameCookie = new Cookie("userName", name);
	             nameCookie.setPath("/");
	             //设置Cookie的有效期为3天
	             nameCookie.setMaxAge(60 * 60 * 24 * 3);
	             Cookie pwdCookie = new Cookie("password", pwd);
	             pwdCookie.setPath("/");
	             pwdCookie.setMaxAge(60 * 60 * 24 * 3);
	             response.addCookie(nameCookie);
	             response.addCookie(pwdCookie);
	         }

			cook = request.getCookies();//测试cookie时用的 
			MUserItems	mUserItems = mUserService.findMUserInfoByName(userName);
			UserItems userItems = userService.findUserByName(userName);						
			if(mUserItems == null && "user".equals(userItems.getRoleName())){
				
				session.setAttribute("userItems", userItems);
				//TODO: 用户页面跳转
				return "forward:userHomepage.action";					
			}else if("canteen".equals(mUserItems.getRoleName())){

				/*
				*MUserService的mapper中findMUserByName查询限定了
				*用户所属校区和食堂的ID，用于查询食堂和饮食公司
				*这一级别的用户
				*findMUserInfoByName查询没有限定校区和食堂的ID，
				*用于查询后台管理员用户
				*所以这里对于食堂管理员额外使用了一次findMUserByName
				*查询，不然获取不到校区和食堂信息
				*/
				MUser mUser = new MUser();
				mUser.setMuserName(mUserItems.getMuserName());
				mUserItems = mUserService.findMUserByName(mUser);
				session.setAttribute("muserItems", mUserItems);
				return "forward:muserCanteenHostPage.action";
				
			}else if("super".equals(mUserItems.getRoleName())){	
				
				session.setAttribute("muserItems", mUserItems);				
				return "forward:backgroundHomepage.action";
				
			}else if("company".equals(mUserItems.getRoleName())){
				session.setAttribute("muserItems", mUserItems);
				return "forward:companyHomepage.action";
				
			}else{
				//TODO: 用户页面跳转
				return "forward:guestHomePage.action";
			}
		
		}else{
			token.clear();
			return "login.jsp";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response){

		Cookie[] cookies = request.getCookies();  
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userName")) {  
                cookie.setValue("");
                cookie.setPath("/");
                cookie.setMaxAge(0);// 立即销毁cookie  
                response.addCookie(cookie);  
            }else if (cookie.getName().equals("password")){
            	cookie.setValue("");
            	cookie.setPath("/");
                cookie.setMaxAge(0);// 立即销毁cookie   
                response.addCookie(cookie);  
            }
        }
        cookies = request.getCookies();//测试cookie时用的  
		SecurityUtils.getSubject().logout();
		return "login.jsp";
	}
}
