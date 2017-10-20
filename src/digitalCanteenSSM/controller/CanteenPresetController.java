package digitalCanteenSSM.controller;


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
import digitalCanteenSSM.po.Canteen;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.CanteenTypePresetService;

@Controller
public class CanteenPresetController {

	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private CanteenTypePresetService canteenTypePresetService;
	
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
	public String modifyCanteenSave(CanteenItems canteenItems) throws Exception{
		
		if(findCanteenByName(canteenItems) == null || findCanteenByName(canteenItems).getCantID() == canteenItems.getCantID()){
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
	public String insertCanteen(CanteenItems canteenItems) throws Exception{
		
		if(findCanteenByName(canteenItems) == null){
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
}
