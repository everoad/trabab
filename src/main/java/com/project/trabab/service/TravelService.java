package com.project.trabab.service;

import java.util.HashMap;

import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelBodyVO;
import com.project.trabab.vo.TravelListVO;
import com.project.trabab.vo.TravelTotalVO;

public interface TravelService {

	public TravelListVO getTravelList(SearchVO searchVo);
	
	public HashMap<String, String> writeTravelHeaderOk(TravelTotalVO travelTotalVo);
	
	public void writeTravelBodyOk(TravelBodyVO travelBodyVo);
	
	public void writeTravelFooterOk(TravelTotalVO travelTotalVo);
	
	public void writeTravelFontImage(HashMap<String, String> map);
	
	public int modifyHeaderAndFooterOk(TravelTotalVO travelTotalVo);
	
	public int modifyBodyOk(TravelBodyVO travelBodyVo);
	
	public int deleteTravelOk(String travel_no);
	

	public TravelTotalVO getTravelConentView(String travel_no);
	
	public TravelBodyVO getTravelBodyContentViewOne(TravelBodyVO travelBodyVo);

	public String increaseLikeCnt(String travel_no, String member_no);
	public String insertLikeMember(String travel_no, String member_no);

	public String decreaseLikeCnt(String travel_no, String member_no);
	public String deleteLikeMember(String travel_no, String member_no);
	
	public int checkTravelLike(String travel_no, String member_no);

	public String getTravelLikeCnt(String travel_no);
	
	public void increaseTravelHit(String travel_no);
	
	
}
