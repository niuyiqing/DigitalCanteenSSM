package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Dish;
import digitalCanteenSSM.po.DishItems;

public interface DishManagementService {

	public List<DishItems> findAllDishes() throws Exception;
	
	public List<DishItems> findDishInCanteen(Integer cantID) throws Exception;
	
	public List<DishItems> findDishInCampus(Integer campusID) throws Exception;
	
	public List<DishItems> findDishesInFancyCanteens() throws Exception;
	
	public List<DishItems> findStarFancyDishes() throws Exception;
	
	public List<DishItems> findDishesInChineseCanteens() throws Exception;
	
	public List<DishItems> findStarChineseDishes() throws Exception;
	
	public List<DishItems> findApplyDish(String dishInState) throws Exception;
	
	public DishItems findDishById(Integer dishID) throws Exception;
	
	public DishItems findDishByName(DishItems dishItems) throws Exception;
	
	public List<DishItems> findDishByFuzzyName(String dishPresetName) throws Exception;
	
	public List<DishItems> findDishesInWindow(Integer wndID) throws Exception;
	
	public void updateDish(DishItems dishItems) throws Exception;
	
	public void insertDish(Dish dish) throws Exception;
	
	public void deleteDishById(Dish dish) throws Exception;
	
	public List<DishItems> findDishInCanteenAndDate(DishItems dishItems) throws Exception;
	
	public List<DishItems> findAllDishesInShenziyuan() throws Exception;
	
	public List<DishItems> findStarDishesInShenziyuan() throws Exception;
	
	public List<DishItems> findNonStarDishesInShenziyuan() throws Exception;
	
	public void changeDishPhotoByName(String dishPhoto, String dishName) throws Exception;
	
}
