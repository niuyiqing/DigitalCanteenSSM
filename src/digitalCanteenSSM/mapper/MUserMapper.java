package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;

public interface MUserMapper {
	
	public List<MUserItems> findAllMUser() throws Exception;
	
	public MUserItems findMUserInfoById(Integer muserID) throws Exception;
	
	public MUserItems findMUserByName(MUser muser) throws Exception;
	
	public MUserItems findMUserInfoByName(String muserName) throws Exception;

	public void updateMUser(MUser muser) throws Exception;
	
	public void insertMUser(MUser muser) throws Exception;
	
	public void deleteMUserById(Integer muserID) throws Exception;
	
	//查询所有分配了工作人员的食堂
	public List<MUserItems> findMUser() throws Exception;
	//查找花样食堂的工作人员
	public List<MUserItems> findMUserStyle() throws Exception;
}
