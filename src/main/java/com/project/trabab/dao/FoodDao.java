package com.project.trabab.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.trabab.vo.FoodVO;
import com.project.trabab.vo.SearchVO;

public interface FoodDao {

	//쓰기
	public void writeFoodOk(FoodVO foodVo);
	
	public int modifyFoodOk(FoodVO foodVo);
	
	public int deleteFoodOk(String food_no);

	//리스트, 컨텐츠 가져오기
	public int getTotalRecordNum(SearchVO searchVo);
	
	public ArrayList<FoodVO> getFoodList(SearchVO searchVo);
	
	public FoodVO getFoodContentView(String food_no);
	
	public void increaseFoodHit(String food_no);
	
	//좋아요
	public int increaseLikeCnt(String food_no);
	public int insertLikeMember(HashMap<String, String> map);

	public int decreaseLikeCnt(String Food_no);
	public int deleteLikeMember(HashMap<String, String> map);
	
	public String checkFoodLike(HashMap<String, String> map);

	public String getFoodLikeCnt(String food_no);
	
}
