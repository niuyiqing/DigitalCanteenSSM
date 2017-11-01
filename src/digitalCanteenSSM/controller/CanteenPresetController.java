package digitalCanteenSSM.controller;


import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.exception.ResultInfo;
import digitalCanteenSSM.exception.SubmitResultInfo;
import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.Canteen;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.CanteenTypePresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishManagementService;
import digitalCanteenSSM.service.RecordService;
import digitalCanteenSSM.service.UploadFileService;
import digitalCanteenSSM.service.WindowPresetService;

@Controller
public class CanteenPresetController {

	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private CanteenTypePresetService canteenTypePresetService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private WindowPresetService windowPresetService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private DetailService detailService;
	
	//食堂预置页面
	//添加食堂按钮与已添加食堂显示
	@RequestMapping ("/canteenPreset")
	public String canteenPreset() throws Exception{
		
		return "forward:findAllCanteens.action";
	}
	
	//查找所有食堂
	//返回食堂预置页面显示
	@RequestMapping("/findAllCanteens")
	public ModelAndView findAllCanteens(HttpServletRequest request, HttpSession session) throws Exception{
		//本段代码运行时优先从request中读取的页码和单页内容数量，
		//如果请求从其它controller发出，并无这两个对象，
		//则使用的是默认的值
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 5;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		
		//配置pagehelper的排序及分页
		String sortString = "id.desc";
		Order.formString(sortString);
		PageHelper.startPage(num, size);
		
		List<CanteenItems> canteenItemsList = canteenPresetService.findAllCanteens();
		PageInfo<CanteenItems> pagehelper = new PageInfo<CanteenItems>(canteenItemsList);

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenTypeList", canteenTypePresetService.findAllCanteenType());
		modelAndView.addObject("pagehelper", pagehelper);	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/canteenPreset.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_canteenPreset.jsp");
		}		
		
		return modelAndView;
	}
	
	//通过食堂ID查找食堂信息
	@RequestMapping ("/findCanteenById")
	public CanteenItems findCanteenById(int cantID) throws Exception{
		
		return canteenPresetService.findCanteenById(cantID);
	}
	
	//通过食堂Name查找食堂信息
	private CanteenItems findCanteenByName(CanteenItems canteenItems) throws Exception {
		
		return canteenPresetService.findCanteenByName(canteenItems);
	}
	
	//修改食堂：跳转到canteenModify.jsp显示具体修改信息
	@RequestMapping ("/modifyCanteen")	
	public ModelAndView modifyCanteen(int cantID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItems",findCanteenById(cantID));	
		modelAndView.addObject("canteenTypeList", canteenTypePresetService.findAllCanteenType());
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/canteenModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_canteenModify.jsp");
		}
		
		
		return modelAndView;
	}
	
	//修改食堂：修改之后保存并跳转到食堂预置页面
	@RequestMapping ("/modifyCanteenSave")	
	public String modifyCanteenSave(CanteenItems canteenItems, MultipartFile cantPhotoFile) throws Exception{
		
		if(findCanteenByName(canteenItems) == null || findCanteenByName(canteenItems).getCantID() == canteenItems.getCantID()){
			
			String cantphoto = uploadFileService.uploadFile(cantPhotoFile, DishManagementController.getPicturepath());
			
			if( cantphoto != null){
				canteenItems.setCantPhoto(cantphoto);
			}else{
				canteenItems.setCantPhoto(canteenPresetService.findCanteenById(canteenItems.getCantID()).getCantPhoto());
			}
			
			canteenPresetService.updateCanteen(canteenItems);
		}	
		
		return "forward:canteenPreset.action";		
	}
		
	//通过食堂ID删除食堂信息
	@RequestMapping ("/deleteCanteenById")
	public String deleteCanteenById(Canteen canteen) throws Exception{
		
		canteenPresetService.deleteCanteenById(canteen);
		
		return "forward:canteenPreset.action";
	}
		
	//插入新食堂信息
	@RequestMapping ("/insertCanteen")
	public String insertCanteen(CanteenItems canteenItems, MultipartFile cantPhotoFile) throws Exception{
		
		if(findCanteenByName(canteenItems) == null){
			
			String cantphoto = uploadFileService.uploadFile(cantPhotoFile, DishManagementController.getPicturepath());
			
			if( cantphoto== null){
				
				canteenItems.setCantPhoto(DishManagementController.getCantDefaultpicturepath());
				
			}else{
				
				canteenItems.setCantPhoto(cantphoto);
			}
			
			canteenPresetService.insertCanteen(canteenItems);
		}
		
		return "forward:canteenPreset.action";	
	}
	
	//设置名星食堂
	@RequestMapping("/selectStarCanteens")
	public ModelAndView selectStarCanteens(HttpSession session) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("canteenItemsList", canteenPresetService.findAllCanteens());
		modelAndView.addObject("starCanteensList", canteenPresetService.findStarCanteens());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/selectStarCanteens.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_selectStarCanteens.jsp");
		}
		
		return modelAndView;
	}

	//保存名星食堂
	@RequestMapping("/saveStarCanteens")
	public @ResponseBody SubmitResultInfo saveStarCanteens(Integer[] cantIDList)throws Exception{
		//传递给页面的参数
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
		
		//清除之前保存的名星食堂标志
		List<CanteenItems> starCanteensList = canteenPresetService.findStarCanteens();
		for(CanteenItems starItem : starCanteensList){
			starItem.setStarCant(0);
			canteenPresetService.updateCanteen(starItem);
		}
		//写入新的名星食堂标志
		CanteenItems starCanteen = new CanteenItems();
		
		if(cantIDList != null){
			for(Integer i: cantIDList){
				starCanteen = canteenPresetService.findCanteenById(i);
				starCanteen.setStarCant(1);
				
				canteenPresetService.updateCanteen(starCanteen);
			}
			resultInfo.setMessage("成功设定【"+cantIDList.length+"】个名星食堂");
		}else{
			resultInfo.setMessage("名星食堂列表已清空");
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}
	
	//用户端名星食堂页面
	@RequestMapping("/starCanteensPage")
	public ModelAndView starCanteensPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("starCanteensList", canteenPresetService.findStarCanteens());
		modelAndView.setViewName("/WEB-INF/jsp/m_starCanteensPage.jsp");
		
		return modelAndView;
	}
	
	//特色风味食堂页面
	@RequestMapping("/fancyCanteensPage")
	public ModelAndView fancyCanteensPage(Integer campusID, Integer cantID, Integer supplyTime) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Campus> campusList = campusPresetService.findAllCampuses();		
		modelAndView.addObject("campusList", campusList);
		
		if (campusID == null && cantID == null && supplyTime == null){			
			if(!campusList.isEmpty()){				
				for (Campus campus : campusList){					
					//读取校区下的风味食堂列表
					List<CanteenItems> canteenItemsList = canteenPresetService.findFancyCanteensByCampus(campus.getCampusID());
					
					if(!canteenItemsList.isEmpty()){
						
						Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
						CanteenItems canteenItems = iterator_canteenItems.next();
						
						//将选中的第一个校区的第一个风味食堂数据传到用户页面
						modelAndView.addObject("canteenItems", canteenItems);
						//将该校区下的风味食堂列表传到用户页面
						modelAndView.addObject("canteenItemsList", canteenItemsList);
						//将该食堂的档口列表传到用户页面
						modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
						
						break;
					}					
				}				
			}
		}else if(campusID != null && cantID == null && supplyTime == null){	//点击校区按钮
			//读取校区下的风味食堂列表
			List<CanteenItems> canteenItemsList = canteenPresetService.findFancyCanteensByCampus(campusID);
			
			if(!canteenItemsList.isEmpty()){
				
				Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
				CanteenItems canteenItems = iterator_canteenItems.next();
				
				//将选中的第一个校区的第一个风味食堂数据传到用户页面
				modelAndView.addObject("canteenItems", canteenItems);
				//将该校区下的风味食堂列表传到用户页面
				modelAndView.addObject("canteenItemsList", canteenItemsList);
				//将该食堂的档口列表传到用户页面
				modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
				
			}
		}else if(campusID == null && cantID != null && supplyTime == null){	//点击食堂按钮
			
			//首先根据cantID在数据库中查找到相应风味食堂信息
			//然后利用该档口所属的校区编号查找该校区下所有档口，传给用户页面
			CanteenItems canteenItems = canteenPresetService.findCanteenById(cantID);
			modelAndView.addObject("canteenItems", canteenItems);			
			//将该食堂的档口列表传到用户页面
			modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
			//将该食堂所属校区的风味食堂列表传到用户页面
			modelAndView.addObject("canteenItemsList", canteenPresetService.findFancyCanteensByCampus(canteenItems.getCampusID()));
		
		}else if(campusID == null && cantID != null && supplyTime != null){	//点击时间档
			//首先根据cantID在数据库中查找到相应风味食堂信息
			//然后利用该档口所属的校区编号查找该校区下所有风味食堂，传给用户页面
			CanteenItems canteenItems = canteenPresetService.findCanteenById(cantID);
			modelAndView.addObject("canteenItems", canteenItems);
			//将该食堂所属校区的风味食堂列表传到用户页面
			modelAndView.addObject("canteenItemsList", canteenPresetService.findFancyCanteensByCampus(canteenItems.getCampusID()));
			//将相应时间档的菜品传递到页面
			Detail detail = new Detail();
			detail.setDetailRecordID(recordService.findLatestRecordInCanteen(cantID).getRecordID());
			detail.setDetailDishDateFlag(supplyTime);
			modelAndView.addObject("dishesDetailList", detailService.findDetailByDateAndID(detail));
			modelAndView.addObject("supplyTime", supplyTime);
		}
		
		modelAndView.setViewName("/WEB-INF/jsp/m_fancyCanteensPage.jsp");
		
		return modelAndView;
	}
	
	//中餐页面
	@RequestMapping("/chineseCanteensPage")
	public ModelAndView chineseCanteensPage(Integer campusID, Integer cantID, Integer supplyTime) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Campus> campusList = campusPresetService.findAllCampuses();		
		modelAndView.addObject("campusList", campusList);
		
		if (campusID == null && cantID == null && supplyTime == null){	//从首页进入本页面
			if(!campusList.isEmpty()){
				for (Campus campus : campusList){
					//读取校区下的中餐食堂列表
					List<CanteenItems> canteenItemsList = canteenPresetService.findChineseCanteensByCampus(campus.getCampusID());
					
					if(!canteenItemsList.isEmpty()){
						
						Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
						CanteenItems canteenItems = iterator_canteenItems.next();
						
						//将选中的第一个校区的第一个中餐食堂数据传到用户页面
						modelAndView.addObject("canteenItems", canteenItems);
						//将该校区下的中餐食堂列表传到用户页面
						modelAndView.addObject("canteenItemsList", canteenItemsList);
						//将该食堂的档口列表传到用户页面
						modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
						
						break;
					}
				}
			}
		}else if (campusID != null && cantID == null && supplyTime == null){	//点击校区按钮
			//读取校区下的中餐食堂列表
			List<CanteenItems> canteenItemsList = canteenPresetService.findChineseCanteensByCampus(campusID);
			
			if(!canteenItemsList.isEmpty()){
				
				Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
				CanteenItems canteenItems = iterator_canteenItems.next();
				
				//将选中的第一个校区的第一个中餐食堂数据传到用户页面
				modelAndView.addObject("canteenItems", canteenItems);
				//将该校区下的中餐食堂列表传到用户页面
				modelAndView.addObject("canteenItemsList", canteenItemsList);
				//将该食堂的档口列表传到用户页面
				modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
			}
		}else if (campusID == null && cantID != null && supplyTime == null){	//点击食堂按钮
			
			//首先根据cantID在数据库中查找到相应中餐食堂信息
			//然后利用该档口所属的校区编号查找该校区下所有食堂，传给用户页面
			CanteenItems canteenItems = canteenPresetService.findCanteenById(cantID);
			modelAndView.addObject("canteenItems", canteenItems);			
			//将该食堂的档口列表传到用户页面
			modelAndView.addObject("windowsList", windowPresetService.findWindowsInCanteen(canteenItems.getCantID()));
			//将该食堂所属校区的中餐食堂列表传到用户页面
			modelAndView.addObject("canteenItemsList", canteenPresetService.findChineseCanteensByCampus(canteenItems.getCampusID()));
		
		}else if (campusID == null && cantID != null && supplyTime != null){	//点击时间档按钮
			//首先根据cantID在数据库中查找到相应中餐食堂信息
			//然后利用该档口所属的校区编号查找该校区下所有食堂，传给用户页面
			CanteenItems canteenItems = canteenPresetService.findCanteenById(cantID);
			modelAndView.addObject("canteenItems", canteenItems);
			//将该食堂所属校区的中餐食堂列表传到用户页面
			modelAndView.addObject("canteenItemsList", canteenPresetService.findChineseCanteensByCampus(canteenItems.getCampusID()));
			//将相应时间档的菜品传递到页面
			Detail detail = new Detail();
			detail.setDetailRecordID(recordService.findLatestRecordInCanteen(cantID).getRecordID());
			detail.setDetailDishDateFlag(supplyTime);
			modelAndView.addObject("dishesDetailList", detailService.findDetailByDateAndID(detail));
			modelAndView.addObject("supplyTime", supplyTime);
		}
		
		modelAndView.setViewName("/WEB-INF/jsp/m_chineseCanteensPage.jsp");
		
		return modelAndView;
	}
}
