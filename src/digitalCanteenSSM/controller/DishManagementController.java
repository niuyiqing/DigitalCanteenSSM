package digitalCanteenSSM.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.exception.ResultInfo;
import digitalCanteenSSM.exception.SubmitResultInfo;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.Dish;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.Log;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
//import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishManagementService;
import digitalCanteenSSM.service.DishPresetService;
import digitalCanteenSSM.service.DishTypePresetService;
import digitalCanteenSSM.service.LogService;
import digitalCanteenSSM.service.RecordService;
//import digitalCanteenSSM.service.UploadFileService;
import digitalCanteenSSM.service.WindowPresetService;

@Controller
public class DishManagementController {

	//图片实际存放路径，Tomcat虚拟路径定为/upload/pic，在页面dishManagement.jsp中使用到虚拟路径
	private static final  String picturePath = "D:\\webproject\\upload\\picture\\";
	
	//默认图片设置
	private static final  String defaultPicturePath     = "default.jpg";
	private static final  String defaultUserPicturePath = "user-default.jpg";
	private static final  String defaultWndPicturePath  = "wnd-default.jpg";
	private static final  String defaultCantPicturePath = "cant-default.jpg";
	@Autowired
	private WindowPresetService windowPresetService;
	@Autowired
	private DishTypePresetService dishTypePresetService;
	@Autowired
	private DishPresetService dishPresetService;
	@Autowired
	private DishManagementService dishManagementService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private DetailService detailService;
	@Autowired
	private LogService logService;
	//@Autowired
	//private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	
	
	public static String getPicturepath() {
		return picturePath;
	}

	public static String getDefaultpicturepath() {
		return defaultPicturePath;
	}
	
	public static String getUserDefaultpicturepath() {
		return defaultUserPicturePath;
	}
	
	public static String getWndDefaultpicturepath(){
		return defaultWndPicturePath;
	}
	
	public static String getCantDefaultpicturepath(){
		return defaultCantPicturePath;
	}

	//菜品管理页面
	@RequestMapping ("/dishManagement")
	public ModelAndView dishManagement(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("dishItemsList",dishManagementService.findDishInCanteen(muserItems.getCantID()));
		modelAndView.addObject("muserItems",muserItems);	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishManagement.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishManagement.jsp");
		}
		
		
		return modelAndView;
	}
	
	//查找该管理员所属食堂下所有菜品
	@RequestMapping ("/findDishInCanteen")
	public ModelAndView findDishInCanteen(HttpSession session, HttpServletRequest request) throws Exception{
		//本段代码运行时优先从request中读取的页码和单页内容数量，
		//如果请求从其它controller发出，并无这两个对象，
		//则使用的是默认的值
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 10;
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
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		
		List<DishItems> dishItemsList = dishManagementService.findDishInCanteen(muserItems.getCantID());
		PageInfo<DishItems> pagehelper = new PageInfo<DishItems>(dishItemsList);
		
		modelAndView.addObject("pagehelper", pagehelper);
		modelAndView.addObject("muserItems",muserItems);	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishInCanteen.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishInCanteen.jsp");
		}
		
		return modelAndView;
	}
	
	//搜索食堂已上架菜品
	@RequestMapping("/searchDishInCanteen")
	public ModelAndView searchDishInCanteen(String dishName, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		
		if(dishName != null){
			modelAndView.addObject("dishItems", dishManagementService.findDishInCanteenByFuzzyName(dishName, muserItems.getCantID()));
		}
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/searchDishInCanteen.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_searchDishInCanteen.jsp");
		}
		
		return modelAndView;
	}
		
	//查找该管理员所属校区下所有菜品
	@RequestMapping ("/findDishInCampus")
	public ModelAndView findDishInCampus(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("dishItemsList",dishManagementService.findDishInCampus(muserItems.getCampusID()));
		modelAndView.addObject("muserItems",muserItems);
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishInCampus.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishInCampus.jsp");
		}		
		
		return modelAndView;
	}

	//新申请的菜品审核页面
	@RequestMapping("/checkDish")
	public ModelAndView checkDish(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("dishItemsList",dishManagementService.findApplyDish("待审核"));
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishCheck.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishCheck.jsp");
		}
		
		return modelAndView;
	}
	
	
	//后台录入审核(工作人员发出录入菜品请求时需要后台审核通过)
	@RequestMapping ("/dishImportCheck")
	public ModelAndView dishImportCheck(HttpSession session, HttpServletRequest request) throws Exception{
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 8;
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
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		List<Record> recordList = recordService.findRecordCheck();
		PageInfo<Record> pagehelper = new PageInfo<Record>(recordList);
		
		modelAndView.addObject("pagehelper", pagehelper);
		modelAndView.addObject("muserItems",muserItems);	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishImportCheck.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishImportCheck.jsp");
		}	
		return modelAndView;
	}
    //后台审核是否通过
	@RequestMapping("/checkif")
	public String checkif(HttpSession session, int recordCheck,int recordID, HttpServletRequest request) throws Exception{
				
		Record record = new Record();
		record.setRecordID(recordID);
		
		if(recordCheck == 0){	//同意
			record.setRecordCheck(recordCheck);
			recordService.updateRecordCheck(record);
		}else{
			recordService.deleteRecord(record);
		}
		
		return "forward:dishImportCheck.action";
	}
	
	//录入菜品的重复检测  ——录入请求（工作人员要录入菜品时向后台发送请求）
	@RequestMapping("/importRepeatCheck")
	public @ResponseBody SubmitResultInfo importRepeatCheck(HttpSession session) throws Exception{
		
		ResultInfo resultInfo = new ResultInfo();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		//首先判断是花样食堂还是自营食堂
		CanteenItems canteenItems = canteenPresetService.findCanteenById(muserItems.getCantID());
		
		//取得当前时间并格式化,用来记入记录表中
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");  
		String dateString=simpleDateFormat.format(new Date());
		Date date=simpleDateFormat.parse(dateString);
		
		//新建一个record，填入操作人相关的字段信息以及时间，由于是当日录入，补录标志设置为0
		Record record = new Record(); 
		record.setRecordCampusID(muserItems.getCampusID());
		record.setRecordCantID(muserItems.getCantID());
		record.setRecordMUserID(muserItems.getMuserID());
		record.setRecordCampusName(muserItems.getCampusName());
		record.setRecordCantName(muserItems.getCantName());
		record.setRecordMUserName(muserItems.getMuserName());
		record.setRecordDate(date);
		record.setRecordSubmitState("已提交");
		record.setReplenishFlag(0);

		if(canteenItems.getCantTypeName().equals("花样食堂")){
			record.setRecordCheck(1); //表明 向后台申请录入菜品				
			resultInfo.setMessage("申请成功！请等待后台审核");
			resultInfo.setMessageCode(22);
		}else if(canteenItems.getCantTypeName().equals("自营食堂")){				
			record.setRecordCheck(0);
			resultInfo.setMessage("今日记录表创建成功！请开始录入");
			resultInfo.setMessageCode(11);
		}
		
		//到数据库中用食堂和日期信息查询今日是否已经生成过记录表，
		//如果没有生成，则生成一个新表；否则跳转到修改页面
		Record rec = recordService.findRecordInCanteenAndDate(record);
		if(rec == null){
			//将数据表存入数据库并获取表的id
			recordService.insertRecord(record);
			int recordid= recordService.findRecordID(record);
			
			resultInfo.setRecordID(recordid);
			
			resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
			
			//记录添加记录表的log
			Log log = new Log();
			log.setMuser(muserItems);			
			log.setLogOperation("添加记录表");
			log.setLogContent(simpleDateFormat.format(record.getRecordDate())+"的记录表");
			logService.insertLog(log);
		}else{
			//读取record的id
			int recordid= recordService.findRecordID(record);
			
			//将此消息的类型设定为info类型，方便前台页面判断要跳转的目标
			resultInfo.setRecordID(recordid);			
			resultInfo.setMessage("今日已生成过记录表");
			resultInfo.setType(ResultInfo.TYPE_RESULT_INFO);			
		}
		//请等待后台审核
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}
		
	//录入菜品页面显示
	@RequestMapping ("/importDish")
	public ModelAndView importDish(HttpSession session, HttpServletRequest request, Integer recordID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");		
		Date recordDate = (Date) request.getAttribute("recordDate");
		
		//进入importDish.jsp页面默认显示早餐时间档，
		//在后台需要将早餐的菜品列表传到页面
		DishItems dishItems = new DishItems();		
		dishItems.setDishDate("早餐");
		dishItems.setCantID(muserItems.getCantID());
		List<DishItems> dishItemsList = dishManagementService.findDishInCanteenAndDate(dishItems);
		
		//新建detail对象，填入recordID和时间档标志位1（早餐）
		Detail detail = new Detail();
		detail.setDetailRecordID(recordID);
		detail.setDetailDishDateFlag(1);	//1代表早餐，默认进入录入界面先显示早餐的菜品
		
		modelAndView.addObject("recordID",recordID);			//传递记录表编号, 后面用于和detail表关联
		modelAndView.addObject("recordDate",recordDate);
		modelAndView.addObject("dishDate", "早餐");				//将默认时间档传递到页面
		modelAndView.addObject("dishItemsList", dishItemsList);	//早餐时间档的菜品列表
		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("dishDetailInDateList", detailService.findDetailByDateAndID(detail));	//已录入的早餐菜品
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishImport.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishImport.jsp");
		}
		
		return modelAndView;
	}

	//补充录入以前日期的菜品
	@RequestMapping("/importReplenishDish")
	public ModelAndView importReplenishDish(HttpSession session,HttpServletRequest request) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		Date recordDate = (Date) request.getAttribute("recordDateReplenish");
		modelAndView.addObject("recordDate",recordDate);
		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("dishItemsList",dishManagementService.findDishInCanteen(muserItems.getCantID()));
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishImportReplenish.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishImportReplenish.jsp");
		}		
		
		return modelAndView;
	}
	
	//食堂管理员菜品录入处理
	@RequestMapping("/importHandle")
	public @ResponseBody SubmitResultInfo importHandle(Integer[] dishIDList, HttpSession session, String replenishDate,
			Integer replenishFlag, Integer recordID, String dishDate)throws Exception{
		
		//传递给页面的参数
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
		resultInfo.setRecordID(recordID);
		
		
		if(replenishFlag==1){
			// TODO: 补录功能还没写
			resultInfo.setReplenishFlag(replenishFlag);
			resultInfo.setReplenishDate(replenishDate);
		}
		
		//将Date转换成yyyy-MM-dd格式
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String dateString=simpleDateFormat.format(new Date());
		Date date=simpleDateFormat.parse(dateString);
		
		//首先读取本次录入的时间档，然后在数据库中查询是否已经录入过本时间档的菜品
		//如果没有录入过，依次将菜品detail和record关联起来
		//如果已经录入过，则先清除已经录入过的detail，这相当于录入修改功能
		int dishdateflag = 0;
		if(dishDate.equals("早餐")){
			dishdateflag = 1;
		}else if(dishDate.equals("中餐")){
			dishdateflag = 2;
		}else if(dishDate.equals("晚餐")){
			dishdateflag = 3;
		}else if(dishDate.equals("全天供应")){
			dishdateflag = 4;
		}
		
		//查询当日记录当某个时间档已录入的菜品d，
		//如果d不为空，把它清理掉，然后录入这个时间档新录入的菜品，
		//下面有代码处理d中和新录入的菜品中重复的元素
		Detail detail = new Detail();
		detail.setDetailDishDateFlag(dishdateflag);
		detail.setDetailRecordID(recordID);
	    List<Detail> d = detailService.findDetailByDateAndID(detail);
	    
	    DishItems dishItems = new DishItems();	    
	    MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
	    Log log = new Log();
	    
	    //初始化log的用户信息部分
	    log.setMuser(muserItems);
	    
	    if(dishIDList != null){
		    for(Integer i: dishIDList){
				dishItems = dishManagementService.findDishById(i);
				
				//检查d中和新传来的dishItems中有没有重合的元素，
				//如果有重合，把它们从各自的集合中去掉，
				//这样删除d中元素和添加dishItems中元素时的log就不会对某个菜品重复记录了
				//（比如一个菜品先在d中被删了，又在dishItems中被添加，如果这样不处理会多出两条log）
				if(d.contains(dishItems)){
					d.remove(dishItems);
					continue;
				}
				
				//录入记录
				dishItems.setDishRecordID(recordID);
				dishItems.setDishDateFlag(dishdateflag);
				dishItems.setDishDate(dishDate);
				detailService.insertDetailDish(dishItems);
				
				//添加Log
				log.setLogOperation("添加记录");
				log.setLogContent("【"+dishItems.getDishDate()+"】"+dishItems.getDishName());
				logService.insertLog(log);
			}
	    }
	    
	    //删除d中和dishIDList中不重合的部分，并且添加log
	    if(!d.isEmpty()){
	    	for(Detail oldDetail:d){
	    		detailService.deleteDetailDish(oldDetail.getDetailID());
	    		
	    		//添加Log
				log.setLogOperation("删除记录");
				log.setLogContent("【"+oldDetail.getDetailDishDate()+"】"+oldDetail.getDetailDishName());
				logService.insertLog(log);
	    	}	    	
	    }
	    
	    //生成提示语，提示用户已经录入了哪些时间档：
	    //首先读取当日所有已录入的detail，
	    //然后将它们的detailDishDate字段不重复地保存到messageList中，
	    //最后拼接成提示信息
	    List<Detail> detailRecorded = detailService.findDetailDish(recordID);
	    List<String> messageList = new ArrayList<String>();
	    for(Detail detailTmp:detailRecorded){
	    	if(!messageList.contains(detailTmp.getDetailDishDate())){
	    		messageList.add(detailTmp.getDetailDishDate());
	    	}
	    }
	    if(!messageList.isEmpty()){
	    	String inputMessage = "已录入";
	    	Iterator<String> string_itr = messageList.iterator();
	    	while(string_itr.hasNext()){
	    		inputMessage += " 【";
	    		inputMessage += string_itr.next();
	    		inputMessage += "】 ";
	    	}
	    	inputMessage += "时间档的菜品";
	    	resultInfo.setMessage(inputMessage);
	    }else{
	    	resultInfo.setMessage("未录入任何菜品");
	    }
	    
	    SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}
	
	@RequestMapping("/getDishInImportDate")
	public @ResponseBody SubmitResultInfo getDishInImportDate(HttpSession session, HttpServletRequest request, Record record)throws Exception{
		
		ResultInfo resultInfo = new ResultInfo();
		
		//页面回传的record类只带有recordDate和recordID信息,
		//需要注意：其中recordDate是要导入的记录的日期，recordID是当日生成的record的ID。
		//
		//查询记录是否存在要设定record的recordCantName值，利用食堂和日期来查
		//调用findRecordInCanteenAndDate查找食堂该日是否进行了录入，
		//如果没有录入，返回警告信息
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		record.setRecordCantName(muserItems.getCantName());
		
		Record recordImport = recordService.findRecordInCanteenAndDate(record);
		if(recordImport != null){
			resultInfo.setMessage("查询到记录");
			resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
			resultInfo.setRecordID(record.getRecordID());
			
			//导入时需要把detail设定为今日时间
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateString=simpleDateFormat.format(new Date());
			Date date=simpleDateFormat.parse(dateString);
			
			//用户从之前的记录导入时，在后台就将记录保存好。步骤如下：
			//1.读取要导入日期的所有detail
			//2.(如果存在)清除录入当日已录入的所有detail
			//3.将读取的detail中的recordID改成当日的recordID，并添加到数据库中
			List<Detail> detailList = detailService.findDetailDish(recordImport.getRecordID());
			detailService.deleteDetailDishByRecordId(record.getRecordID());
			for(Detail detail:detailList){
				detail.setDetailRecordID(record.getRecordID());
				detail.setDetailDishInDate(date);
				detailService.insertDetail(detail);
			}
		}else{
			resultInfo.setMessage("该日期没有记录，请重新选择导入日期！");
			resultInfo.setType(ResultInfo.TYPE_RESULT_FAIL);
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}

	//补录
	@RequestMapping("/getDishInImportReplenishDate")
	public ModelAndView getDishInImportReplenishDate(HttpSession session,HttpServletRequest request,Record record,Date muserSubmitDate)throws Exception{
		
		ModelAndView modelAndView =new ModelAndView();
		
		//TODO: 这里要换一种查询方式
		if(!(recordService.findRecordByDate(record).isEmpty())){
			MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
			muserItems.setMuserSubmitDate(muserSubmitDate);
			record.setRecordCantID(muserItems.getCantID());
			int recordid= recordService.findRecordID(record);
			request.setAttribute("recordDateReplenish",record.getRecordDate());
			List<Detail> dishDetailInDateList = detailService.findDetailDish(recordid);
			modelAndView.addObject("dishDetailInDateList",dishDetailInDateList);
			modelAndView.addObject("muserItems",muserItems);
			modelAndView.addObject("dishItemsList",dishManagementService.findDishInCanteen(muserItems.getCantID()));
		}
		modelAndView.setViewName("importReplenishDish.action");
		return modelAndView;
	}
	
	/**
	 * 根据时间档查询菜品列表
	 * 用于响应切换菜品时间档下拉框的操作
	 * */
	@RequestMapping ("/chooseDishInDate")
	public ModelAndView chooseDishInDate(HttpSession session, String dishDate, Integer recordID,
			Integer replenishFlag, String replenishDate) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		
		int canteenID = muserItems.getCantID();
		DishItems dishItems = new DishItems();
		List<DishItems> dishItemsList = new ArrayList<DishItems>();
		
		//中餐和晚餐合并为正餐查询，
		//早餐和全天供应各自查询
		if(dishDate.equals("中餐")||dishDate.equals("晚餐")){			
			dishItems.setDishDate("正餐");			
		}else{			
			dishItems.setDishDate(dishDate);			
		}
		dishItems.setCantID(canteenID);
		
		//构建并初始化一个detail用于查询相应时间档已经录入的记录，
		//用于页面切换时间档之后显示出已录入的记录
		int dishdateflag = 0;
		if(dishDate.equals("早餐")){
			dishdateflag = 1;
		}else if(dishDate.equals("中餐")){
			dishdateflag = 2;
		}else if(dishDate.equals("晚餐")){
			dishdateflag = 3;
		}else if(dishDate.equals("全天供应")){
			dishdateflag = 4;
		}
		Detail detail = new Detail();
		detail.setDetailDishDateFlag(dishdateflag);
		detail.setDetailRecordID(recordID);
		
		dishItemsList = dishManagementService.findDishInCanteenAndDate(dishItems);
		
		//菜品查询时间档和记录表ID需要重新传回页面，页面加载时会根据这些信息来确定各下拉框的显示值
		//
		//录入页面切换时间档时需要显示已经录入过的菜品，要将录入过的detail传回页面
		//回传的detail列表包含所有时间档下的已录入菜品，所以数量可能比所选时间档下的菜品数量多
		modelAndView.addObject("dishDate", dishDate);	//时间档
		modelAndView.addObject("recordID", recordID);	//记录表编号
		modelAndView.addObject("muserItems", muserItems);
		modelAndView.addObject("dishDetailInDateList", detailService.findDetailByDateAndID(detail));
		modelAndView.addObject("dishItemsList", dishItemsList);		
		
		//replenishFlag此处用于标记发出查询请求的页面是属于录入、补录还是修改页面
		if(replenishFlag == 0){
			if(session.getAttribute("ua").equals("pc")){
				modelAndView.setViewName("/WEB-INF/jsp/dishImport.jsp");
			}else{
				modelAndView.setViewName("/WEB-INF/jsp/m_dishImport.jsp");
			}
		}
		
		return modelAndView;
	}
	
	//添加已预置的菜品(菜品上架)
	@RequestMapping ("/addDish")
	public ModelAndView addDish(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("windowItemsList",windowPresetService.findWindowsInCanteen(muserItems.getCantID()));
		modelAndView.addObject("dishTypeList", dishTypePresetService.findAllDishType());
		modelAndView.addObject("dishPresetList",dishPresetService.findAllDishPreset());
		modelAndView.addObject("dishItemsList",dishManagementService.findAllDishes());
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishAdd.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishAdd.jsp");
		}
		
		return modelAndView;
	}
	
	//申请菜品页面显示
	@RequestMapping ("/applyDish")
	public ModelAndView applyDish(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("windowItemsList",windowPresetService.findWindowsInCanteen(muserItems.getCantID()));
		modelAndView.addObject("dishTypeList", dishTypePresetService.findAllDishType());
		modelAndView.addObject("dishPresetList",dishPresetService.findAllDishPreset());
		modelAndView.addObject("dishItemsList",dishManagementService.findDishInCanteen(muserItems.getCantID()));
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishApply.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishApply.jsp");
		}
		
		return modelAndView;
	}
	
	//通过菜品ID查找菜品信息
	@RequestMapping ("/findDishById")
	public DishItems findDishById(Integer dishID) throws Exception{
		
		return dishManagementService.findDishById(dishID);
	}
		
	//修改菜品：跳转到dishModify.jsp显示具体修改信息
	@RequestMapping ("/modifyDish")	
	public ModelAndView modifyDish(DishItems dishItems, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
			
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("windowItemsList",windowPresetService.findWindowsInCanteen(dishItems.getWndCantID()));
		modelAndView.addObject("dishTypeList", dishTypePresetService.findAllDishType());
		modelAndView.addObject("dishPresetList",dishPresetService.findAllDishPreset());
		modelAndView.addObject("dishItems",findDishById(dishItems.getDishID()));	
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishModify.jsp");
		}
		
		return modelAndView;
	}
	
	//修改菜品：修改之后保存并跳转到菜品录入页面
	@RequestMapping ("/modifyDishSave")
	public String modifyDishSave(DishItems dishItems, HttpSession session) throws Exception{
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		//从数据库中查找页面传来的dishItems对应的记录，暂存在dishItemsTmp中，
		//用来在log中记录修改操作改掉了哪个菜品
		DishItems dishItemsTmp = dishManagementService.findDishById(dishItems.getDishID());
		
		if(dishItems != null){
			if(findDishByName(dishItems) == null || 
					findDishByName(dishItems).getDishID() == dishItems.getDishID()){
				dishManagementService.updateDish(dishItems);
			}
			
			//判断要记录的log类型
			if(findDishByName(dishItemsTmp) == null){
				//出现新菜名，记录为下架了旧的，上架了新的
				Log log = new Log();				
				log.setMuser(muserItems);
				
				log.setLogOperation("下架");
				log.setLogContent("【"+dishItemsTmp.getDishDate()+"】"+dishItemsTmp.getDishName());
				logService.insertLog(log);
				
				log.setLogOperation("上架");
				log.setLogContent("【"+dishItems.getDishDate()+"】"+dishItems.getDishName());
				logService.insertLog(log);
			}else if(findDishByName(dishItems).getDishID() == dishItems.getDishID()){
				//检查确实做出了改动才记录log
				if(!(dishItemsTmp.getDishWndID() == dishItems.getDishWndID() &&
						dishItemsTmp.getDishTypeID() == dishItems.getDishTypeID() &&
						dishItemsTmp.getDishName().equals(dishItems.getDishName()) &&
						dishItemsTmp.getDishPrice().equals(dishItems.getDishPrice()) &&
						dishItemsTmp.getDishRecmd().equals(dishItems.getDishRecmd()) &&
						dishItemsTmp.getDishKeep().equals(dishItems.getDishKeep()) &&
						dishItemsTmp.getDishDate().equals(dishItems.getDishDate()))){
					Log log = new Log();				
					log.setMuser(muserItems);
					
					log.setLogOperation("修改");
					log.setLogContent("【"+dishItems.getDishDate()+"】"+dishItems.getDishName());
					logService.insertLog(log);
				}
			}
		}
		
		return "forward:findDishInCanteen.action";
	}
	
	//通过菜品Name查找菜品信息供插入菜品信息时检查
	private DishItems findDishByName(DishItems dishItems) throws Exception {
		//实际上是用Name和WndID结合查询的
		return dishManagementService.findDishByName(dishItems);
	}
	
	//插入新菜品信息
	@RequestMapping ("/insertDish")
	public ModelAndView insertDish(DishItems dishItems, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		//确认dishItems不为空，
		//然后查询同一窗口下是否已经有同名菜品了，
		//如果没有菜名冲突，则关联图片并保存到数据库
		if(dishItems != null){
			if(findDishByName(dishItems) == null){
				
				//在后台设定菜品上架的时间，不让用户自己选
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String dateString=simpleDateFormat.format(new Date());
				Date date=simpleDateFormat.parse(dateString);
				
				dishItems.setDishPhoto(dishPresetService.findDishPresetByName(dishItems.getDishName()).getDishPresetPhoto());
				dishItems.setDishInDate(date);
				dishItems.setStarDish(0);
				
				dishManagementService.insertDish(dishItems);
				
				MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
				Log log = new Log();
				
				log.setMuser(muserItems);
				log.setLogOperation("上架");
				log.setLogContent("【"+dishItems.getDishDate()+"】"+dishItems.getDishName());
				logService.insertLog(log);
			}
		}
				
		modelAndView.setViewName("findDishInCanteen.action");
		
		return modelAndView;
	}
	
	//通过菜品ID删除菜品信息
	@RequestMapping ("/deleteDishById")
	public ModelAndView deleteDishById(Dish dish,HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		DishItems dishItems = dishManagementService.findDishById(dish.getDishID());
		
		if(dishItems != null){
			dishManagementService.deleteDishById(dish);
			
			Log log = new Log();
			log.setMuser(muserItems);
			log.setLogOperation("下架");
			log.setLogContent("【"+dishItems.getDishDate()+"】"+dishItems.getDishName());
			logService.insertLog(log);
		}		
		
		modelAndView.addObject("muserItems",muserItems);
		
		modelAndView.setViewName("findDishInCanteen.action");
		
		return modelAndView;
	}
	
	//后台设置人气风味美食
	@RequestMapping("/selectStarFancyDishes")
	public ModelAndView selectStarFancyDishes(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("fancyDishesList", dishManagementService.findDishesInFancyCanteens());
		modelAndView.addObject("starFancyDishesList", dishManagementService.findStarFancyDishes());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/selectStarFancyDishes.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_selectStarFancyDishes.jsp");
		}
		
		return modelAndView;
	}
	
	//后台保存人气风味美食
	@RequestMapping("/saveStarFancyDishes")
	public @ResponseBody SubmitResultInfo saveStarFancyDishes(Integer[] dishIDList) throws Exception{
		//传递给页面的参数
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
		
		//清除之前保存的名星风味美食标志
		List<DishItems> starFancyDishesList = dishManagementService.findStarFancyDishes();
		for(DishItems starItem : starFancyDishesList){
			starItem.setStarDish(0);
			dishManagementService.updateDish(starItem);
		}
		
		//写入新的名星风味美食
		if(dishIDList != null){
			DishItems starDish = new DishItems();
			
			for(Integer i : dishIDList){
				starDish = dishManagementService.findDishById(i);
				starDish.setStarDish(1);
				
				dishManagementService.updateDish(starDish);
			}
			resultInfo.setMessage("成功设定【" + dishIDList.length + "】个人气风味美食");
		}else{
			resultInfo.setMessage("人气风味美食列表已清空");
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}
	
	//后台设置人气中餐美食
	@RequestMapping("/selectStarChineseDishes")
	public ModelAndView selectStarChineseDishes(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("chineseDishesList", dishManagementService.findDishesInChineseCanteens());
		modelAndView.addObject("starChineseDishesList", dishManagementService.findStarChineseDishes());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/selectStarChineseDishes.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_selectStarChineseDishes.jsp");
		}
		
		return modelAndView;
	}
	
	//后台保存人气中餐美食
	@RequestMapping("/saveStarChineseDishes")
	public @ResponseBody SubmitResultInfo saveStarChineseDishes(Integer[] dishIDList) throws Exception{
		//传递给页面的参数
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
		
		//清除之前保存的人气中餐美食标志
		List<DishItems> starChineseDishesList = dishManagementService.findStarChineseDishes();
		for(DishItems starItem : starChineseDishesList){
			starItem.setStarDish(0);
			dishManagementService.updateDish(starItem);
		}
		
		//写入新的人气中餐美食
		if(dishIDList != null){
			DishItems starDish = new DishItems();
			
			for(Integer i : dishIDList){
				starDish = dishManagementService.findDishById(i);
				starDish.setStarDish(1);
				
				dishManagementService.updateDish(starDish);
			}
			resultInfo.setMessage("成功设定【" + dishIDList.length + "】个人气中餐美食");
		}else{
			resultInfo.setMessage("人气中餐美食列表已清空");
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}
	
	//人气风味美食页面
	@RequestMapping("/starFancyDishesPage")
	public ModelAndView starFancyDishesPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("fancyDishesList", dishManagementService.findStarFancyDishes());
		modelAndView.setViewName("/WEB-INF/jsp/m_starFancyDishesPage.jsp");
		
		return modelAndView;
	}
	
	//人气中餐美食页面
	@RequestMapping("/starChineseDishesPage")
	public ModelAndView starChineseDishesPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("chineseDishesList", dishManagementService.findStarChineseDishes());
		modelAndView.setViewName("/WEB-INF/jsp/m_starChineseDishesPage.jsp");
		
		return modelAndView;
	}
	
	//后台设置莘子苑酒店推荐菜
	@RequestMapping("/selectStarShenziyuanDishes")
	public ModelAndView selectStarShenziyuanDishes(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("shenziyuanDishesList", dishManagementService.findAllDishesInShenziyuan());
		modelAndView.addObject("starShenziyuanDishesList", dishManagementService.findStarDishesInShenziyuan());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/selectStarShenziyuanDishes.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_selectStarShenziyuanDishes.jsp");
		}
		
		return modelAndView;
	}
	
	//后台保存莘子苑推荐菜
	@RequestMapping("/saveStarShenziyuanDishes")
	public @ResponseBody SubmitResultInfo saveStarShenziyuanDishes(Integer[] dishIDList) throws Exception{
		
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
		
		//清除之前保存的莘子苑酒店推荐菜标志
		List<DishItems> starShenziyuanDishesList = dishManagementService.findStarDishesInShenziyuan();
		for(DishItems starItem : starShenziyuanDishesList){
			starItem.setStarDish(0);
			dishManagementService.updateDish(starItem);
		}
		
		//写入新的莘子苑酒店推荐菜
		if(dishIDList != null){
			DishItems starDish = new DishItems();
			
			for(Integer i : dishIDList){
				starDish = dishManagementService.findDishById(i);
				starDish.setStarDish(1);
				
				dishManagementService.updateDish(starDish);
			}
			resultInfo.setMessage("成功设定【" + dishIDList.length + "】个莘子苑酒店推荐菜");
		}else{
			resultInfo.setMessage("莘子苑酒店推荐菜列表已清空");
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);		
		return submitResultInfo;
	}
	
	//莘子苑页面
	@RequestMapping("/shenziyuanPage")
	public ModelAndView shenziyuanPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("starShenziyuanDishesList", dishManagementService.findStarDishesInShenziyuan());
		modelAndView.addObject("nonStarShenziyuanDishesList", dishManagementService.findNonStarDishesInShenziyuan());
		
		modelAndView.setViewName("/WEB-INF/jsp/m_shenziyuanPage.jsp");
		
		return modelAndView;
	}
}
