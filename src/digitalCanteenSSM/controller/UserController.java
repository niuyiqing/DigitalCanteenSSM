package digitalCanteenSSM.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Ad;
import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.Dish;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Role;
import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.po.WindowItems;
import digitalCanteenSSM.service.AdService;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishManagementService;
import digitalCanteenSSM.service.RecordService;
import digitalCanteenSSM.service.RoleService;
import digitalCanteenSSM.service.UploadFileService;
import digitalCanteenSSM.service.UserService;
import digitalCanteenSSM.service.WindowPresetService;
import digitalCanteenSSM.util.CheckMobile;

@Controller
public class UserController {

	private static final  String picturePath = "E:\\webproject\\upload\\picture\\";
	
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private WindowPresetService windowPresetService;
	@Autowired
	private DishManagementService dishManagementService;
	@Autowired
	private UserService userService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private AdService adService;
	@Autowired
	private DetailService detailService;
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("/userRegisterPage")
	public ModelAndView userRegisterPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		//返回当前已有校区和食堂列表,供用户注册时选择
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());				
		
		//师生用户仅在移动端注册，所以仅返回移动端页面，不做客户端类型判断
		modelAndView.setViewName("/WEB-INF/jsp/m_userRegister.jsp");		
		
		return modelAndView;
	}
	
	@RequestMapping(value="/userRegister")
	public String userRegister(User user, MultipartFile userPhotoFile) throws Exception{
		
		if(userService.findUserByName(user.getUserName()) == null){
			String userphoto = uploadFileService.uploadFile(userPhotoFile, DishManagementController.getPicturepath());
			//未输入图片则使用默认的
			if( userphoto == null){			
				user.setUserPhoto(DishManagementController.getUserDefaultpicturepath());
			}
			else{
				user.setUserPhoto(userphoto);
			}
			
			//需要手动设定师生新用户的角色为user
			//首先获取所有的Role,然后从中找出user角色的RoleID并赋给user相应字段
			//如果最终没找到user角色,则提示用户暂时无法注册
			List<Role> roleList = roleService.findAllRole();
			if(!roleList.isEmpty()){
				for(Iterator<Role> it = roleList.iterator(); it.hasNext();){
					Role role = it.next();
					if(role.getRoleName().equals("user")){
						user.setUserRoleID(role.getRoleID());
						userService.insertUser(user);
						
						return "login.jsp";
					}
				}
			}
			// TODO: 提示用户暂时无法注册
		}
		return "login.jsp";
	}
	
	/*
	@RequestMapping(value="/userHomepage")
	public ModelAndView userHomePage(Integer cantCampusID,Integer wndCantID,HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		UserItems userItems = (UserItems)session.getAttribute("userItems");
		
		//第一次进入时读取数据库中校区和食堂ID来读取档口，页面选择其他校区或食堂后将此时的写入userItems，根据选择的来重新读取档口
		if(cantCampusID != null || wndCantID != null){
			userItems.setUserCampusID(cantCampusID);
			userItems.setUserCantID(wndCantID);
		}
		modelAndView.addObject("userItems", userItems);
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList", canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList", windowPresetService.findWindowsInCanteen(userItems.getUserCantID()));
		modelAndView.addObject("canteenItemsInCampus", canteenPresetService.findCanteenByCampus(userItems.getUserCampusID()));
		List<Ad> ad = adService.findAllAd();
		modelAndView.addObject("adList", adService.findAllAd());
		
		modelAndView.setViewName("/WEB-INF/jsp/userHomePage.jsp");
		return modelAndView;
	}
	*/
	@RequestMapping(value="/userHomepage")
	public ModelAndView userHomepage(HttpSession session, Integer campusID, Integer cantID, 
			Integer supplyTime) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Campus> campusList = campusPresetService.findAllCampuses();
		
		modelAndView.addObject("campusList", campusList);
		modelAndView.addObject("adList", adService.findAllAd());
		
		//如果第一次进入这个函数，查询第一个校区的第一个食堂作为默认食堂
		//以后则根据参数返回食堂和档口列表
		if(campusID == null && cantID == null && supplyTime == null){	//第一次进入函数
			
			if(!campusList.isEmpty()){
				
				for(Campus campus : campusList){
					
					List<CanteenItems> canteenItemsList = canteenPresetService.findCanteenByCampus(campus.getCampusID());
					
					if(!canteenItemsList.isEmpty()){
						Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
						CanteenItems canteenItems = iterator_canteenItems.next();
						//将选中的第一个校区的第一个食堂数据传到用户首页
						modelAndView.addObject("canteenItems", canteenItems);
						//将该食堂的档口列表传到用户首页
						modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
						//将该校区下的食堂列表传到用户首页
						modelAndView.addObject("canteenItemsList", canteenItemsList);
						break;
					}
				}
			}
		}else if(campusID != null && cantID == null && supplyTime == null){	//有校区信息，查找该校区下的默认食堂及其档口信息
			
			List<CanteenItems> canteenItemsList = canteenPresetService.findCanteenByCampus(campusID);
			if(!canteenItemsList.isEmpty()){
				Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
				CanteenItems canteenItems = iterator_canteenItems.next();
				//将该校区的第一个食堂数据传到用户首页
				modelAndView.addObject("canteenItems", canteenItems);
				//将该食堂的档口列表传到用户首页
				modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
				//将该校区下的食堂列表传到用户首页
				modelAndView.addObject("canteenItemsList", canteenItemsList);
			}
			
		}else if(campusID == null && cantID != null && supplyTime == null){	//只有食堂信息，反推校区信息
			
			//首先根据cantID在数据库中查找到相应食堂信息
			//然后利用该食堂所属的校区编号查找该校区下所有食堂，传给用户首页
			CanteenItems canteenItems = canteenPresetService.findCanteenById(cantID);
			modelAndView.addObject("canteenItems", canteenItems);
			//将该食堂的档口列表传到用户首页
			modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
			modelAndView.addObject("canteenItemsList", canteenPresetService.findCanteenByCampus(canteenItems.getCampusID()));
		
		}else if(campusID == null && cantID != null && supplyTime != null){	//用户点击时间档
			
			//首先根据cantID在数据库中查找到相应食堂信息
			//然后利用该食堂所属的校区编号查找该校区下所有食堂，传给用户首页
			CanteenItems canteenItems = canteenPresetService.findCanteenById(cantID);
			modelAndView.addObject("canteenItems", canteenItems);
			//将该食堂所属校区的食堂列表传到用户页面
			modelAndView.addObject("canteenItemsList", canteenPresetService.findCanteenByCampus(canteenItems.getCampusID()));
			//将相应时间档的菜品传递到页面
			Detail detail = new Detail();
			detail.setDetailRecordID(recordService.findLatestRecordInCanteen(cantID).getRecordID());
			detail.setDetailDishDateFlag(supplyTime);
			modelAndView.addObject("dishesDetailList", detailService.findDetailByDateAndID(detail));
			modelAndView.addObject("supplyTime", supplyTime);
		}
		
		modelAndView.setViewName("/WEB-INF/jsp/userHomepageNew.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/userWindowContents")
	public ModelAndView userWindowContents(Integer wndID,HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		session.setAttribute("wndID", wndID);
		WindowItems windowItems = windowPresetService.findWindowById(wndID);
		/*List<DishItems> dishItemsList = dishManagementService.findDishesInWindow(wndID);*/
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		modelAndView.addObject("dishItemsList",dishManagementService.findDishesInWindow(wndID));
		modelAndView.setViewName("/WEB-INF/jsp/userWindowContents.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/userInfo")
	public ModelAndView userInfo(HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		UserItems userItems = (UserItems)session.getAttribute("userItems");
		modelAndView.addObject("userItems",userItems);
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("canteenItemsInCampus",canteenPresetService.findCanteenByCampus(userItems.getUserCampusID()));
		modelAndView.setViewName("/WEB-INF/jsp/userInfo.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/userModify",method= RequestMethod.POST)
	public ModelAndView userModifyForm(User user,MultipartFile userPhotoFile,HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		String userPhoto=uploadFileService.uploadFile(userPhotoFile, picturePath);		
		user.setUserPhoto(userPhoto);
		
		userService.updateUser(user);
		UserItems userItems = userService.findUserByName(user.getUserName());
		session.setAttribute("userItems", userItems);
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("canteenItemsInCampus",canteenPresetService.findCanteenByCampus(user.getUserCampusID()));
		modelAndView.setViewName("/WEB-INF/jsp/userInfo.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/userQueryAll")
	public ModelAndView userQueryAll(String queryName,HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		List<DishItems> dishItemsList = new ArrayList<DishItems>();
		List<WindowItems> windowItemsList = new ArrayList<WindowItems>();
		
		if(queryName != null){
			dishItemsList = userService.findDishByFuzzyName(queryName);
			windowItemsList = userService.findWindowByFuzzyName(queryName);			
		}	
		modelAndView.addObject("dishItemsList",dishItemsList);
		modelAndView.addObject("windowItemsList",windowItemsList);
		
		modelAndView.setViewName("/WEB-INF/jsp/userQueryAll.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/userDishInfo")
	public ModelAndView userDishInfo(Integer dishID,HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		DishItems dishItems = dishManagementService.findDishById(dishID);
		modelAndView.addObject("dishItems",dishItems);
		
		modelAndView.setViewName("/WEB-INF/jsp/userDishInfo.jsp");
		
		return modelAndView;
	}
}
