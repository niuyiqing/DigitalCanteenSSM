package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.AdMapper;
import digitalCanteenSSM.mapper.DishManagementMapper;
import digitalCanteenSSM.po.Ad;
import digitalCanteenSSM.service.AdService;

@Service
public class AdServiceImpl implements AdService {

	@Autowired
	private AdMapper adMapper;
	
	@Override
	public List<Ad> findAllAd() throws Exception {
		// TODO Auto-generated method stub
		return adMapper.findAllAd();
	}

	@Override
	public Ad findAdById(Integer adID) throws Exception {
		// TODO Auto-generated method stub
		return adMapper.findAdById(adID);
	}

	@Override
	public Ad findAdByName(String adName) throws Exception {
		// TODO Auto-generated method stub
		return adMapper.findAdByName(adName);
	}

	@Override
	public void updateAdById(Ad ad) throws Exception {
		// TODO Auto-generated method stub
		adMapper.updateAdById(ad);
	}

	@Override
	public void deleteAdById(Integer adID) throws Exception {
		// TODO Auto-generated method stub
		adMapper.deleteAdById(adID);
	}

	@Override
	public void insertAd(Ad ad) throws Exception {
		// TODO Auto-generated method stub
		adMapper.insertAd(ad);
	}

	@Override
	public Ad findAdByPhoto(String adPhoto) throws Exception {
		// TODO Auto-generated method stub
		return adMapper.findAdByPhoto(adPhoto);
	}

}
