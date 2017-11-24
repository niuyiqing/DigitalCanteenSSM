package digitalCanteenSSM.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.ClickCountMapper;
import digitalCanteenSSM.service.ClickCountService;

@Service
public class ClickCountServiceImpl implements ClickCountService{
	
	@Autowired ClickCountMapper clickCountMapper;
	
	@Override
	public Integer getClickCount() throws Exception{
		
		return clickCountMapper.getClickCount();
	}
	
	@Override
	public void updateClickCount(Integer clickCount) throws Exception{
		
		clickCountMapper.updateClickCount(clickCount);
	}
	
}
