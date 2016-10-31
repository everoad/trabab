package com.project.trabab.dao;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.FoodImageVO;
import com.project.trabab.vo.TravelImageVO;

public interface ImageDao {
	
	public int writeTravelImageOk(List<TravelImageVO> travelImageList);

	public List<TravelImageVO> getTravelImageList(HashMap<String, String> map);
	
	public TravelImageVO getTravelImageOne(String travel_no);
	
	public String getTravelFrontImage(String travel_no);

	public int deleteTravelImage(String travel_no, String travel_step, String delete_image);
	
	public void deleteTravelImageListOk(List<TravelImageVO> travelImageList);
	
	
	public int writeFoodImageOk(List<FoodImageVO> foodImageList);
	
	public List<FoodImageVO> getFoodImageList(String food_no);
	
	public int deleteFoodImageListOk(List<FoodImageVO> foodImageList);
	
	public void deleteFoodImageOk(String food_no);
	
	public void deleteTravelImageOk(String travel_no);

}
