package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.Dish;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.po.WindowItems;

public interface UserMapper {
	
	public UserItems findUserByName(String userName) throws Exception;
	
	public UserItems findUserByID(Integer userID) throws Exception;
	
	public List<UserItems> findAllUser() throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUserByID(Integer userID) throws Exception;
	
	public List<DishItems> findDishByFuzzyName(String dishName) throws Exception;
	
	public List<WindowItems> findWindowByFuzzyName(String wndName) throws Exception;
}
