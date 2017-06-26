package digitalCanteenSSM.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.exception.ResultInfo;
import digitalCanteenSSM.exception.SubmitResultInfo;
import digitalCanteenSSM.po.Ad;
import digitalCanteenSSM.service.AdService;
import digitalCanteenSSM.service.UploadFileService;

@Controller
public class AdController {
	@Autowired
	private AdService adService;
	@Autowired
	private UploadFileService uploadFileService;
	
	@RequestMapping("/adManagement")
	public ModelAndView adManagement() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Ad> adList = adService.findAllAd();
		modelAndView.addObject("adList", adList);
		
		modelAndView.setViewName("/WEB-INF/jsp/adManagement.jsp");		
		
		return modelAndView;
	}
	
	@RequestMapping ("/deleteAdById")
	public String deleteAdById(int adID) throws Exception{
		
		adService.deleteAdById(adID);
		
		return "forward:adManagement.action";
	}
		
	@RequestMapping(value="/insertAdWithValidation", method={ RequestMethod.POST,RequestMethod.GET })
	public @ResponseBody SubmitResultInfo insertAd(Ad ad, MultipartFile adPhotoFile) throws Exception{
		ResultInfo resultInfo = new ResultInfo();
		String adPhoto = uploadFileService.uploadFile(adPhotoFile, DishManagementController.getPicturepath());
				
		ad.setAdPhoto(adPhoto);
		adService.insertAd(ad);	
		
		resultInfo.setMessage("添加成功");
		resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
			
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);
		return submitResultInfo;
	}
}
