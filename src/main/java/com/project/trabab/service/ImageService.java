package com.project.trabab.service;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.FoodImageVO;
import com.project.trabab.vo.TravelImageVO;

public interface ImageService {
	
	public int writeTravelImageOk(List<TravelImageVO> travelImageList);

	public List<TravelImageVO> getTravelImageList(HashMap<String, String> map);
	
	public void deleteTravelImageListOk(List<TravelImageVO> travelImageList);

	public String getTravelFrontImage(String travel_no);
	
	public void writeFoodImageOk(List<FoodImageVO> foodImageList);
	
	public List<FoodImageVO> getFoodImageList(String food_no);
	
	public int deleteFoodImageListOk(List<FoodImageVO> foodImageList);

	public void deleteFoodImageOk(String food_no);
	
	public void deleteTravelImageOk(String travel_no);
	
}
