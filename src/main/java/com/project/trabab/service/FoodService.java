package com.project.trabab.service;

import com.project.trabab.vo.FoodListVO;
import com.project.trabab.vo.FoodVO;
import com.project.trabab.vo.SearchVO;

public interface FoodService {

	public FoodListVO getFoodList(SearchVO searchVo);
	
	public FoodVO writeFoodOk(FoodVO foodVo);
	
	public int modifyFoodOk(FoodVO foodVo);
	
	public FoodVO getFoodContentView(String food_no);
	
	public int deleteFoodOk(String food_no);
	
	public String increaseLikeCnt(String food_no, String member_no);
	public String insertLikeMember(String food_no, String member_no);

	public String decreaseLikeCnt(String food_no, String member_no);
	public String deleteLikeMember(String food_no, String member_no);
	
	public int checkFoodLike(String food_no, String member_no);

	public String getFoodLikeCnt(String food_no);
}
