package digitalCanteenSSM.service;

public interface ClickCountService {
	
	public Integer getClickCount() throws Exception;
	
	public void updateClickCount(Integer clickCount) throws Exception;

}
