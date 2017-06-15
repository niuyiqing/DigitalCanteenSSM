package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Ad;

public interface AdService {
	
	public List<Ad> findAllAd() throws Exception;
	
	public Ad findAdById(Integer adID) throws Exception;
	
	public Ad findAdByName(String adName) throws Exception;
	
	public Ad findAdByPhoto(String adPhoto) throws Exception;
	
	public void updateAdById(Ad ad) throws Exception;
	
	public void deleteAdById(Integer adID) throws Exception;
	
	public void insertAd(Ad ad) throws Exception;
	
}
