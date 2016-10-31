package com.project.trabab.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelBodyVO;
import com.project.trabab.vo.TravelTotalVO;

public interface TravelDao {

	
	//쓰기
	public void writeTravelHeaderOk(TravelTotalVO travelTotalVo);
	
	public int writeTravelBodyOk(TravelBodyVO travelBodyVo);
	
	public int writeTravelFooterOk(TravelTotalVO travelTotalVo);

	public int writeTravelFrontImage(HashMap<String, String> map);
	
	//수정
	public int modifyHeaderAndFooterOk(TravelTotalVO travelTotalVo);
	
	public int modifyBodyOk(TravelBodyVO travelBodyVo);
	
	public int deleteBodyOne(TravelBodyVO travelBodyVo);
	
	public int updateBodyStep(TravelBodyVO travelBodyVo);
	
	public int deleteTravelHeaderOk(String travel_no);
	
	public int deleteTraveBodylOk(String travel_no);
	
	
	//리스트, 컨텐츠 가져오기
	public int getTotalRecordNum(SearchVO searchVo);
	
	public ArrayList<TravelTotalVO> getTravelList(SearchVO searchVo);
	
	public TravelTotalVO getTravelHeaderAndFooter(String travel_no);
	
	public ArrayList<TravelBodyVO> getTravelBody(String travel_no);
	
	public TravelBodyVO getTravelBodyOne(TravelBodyVO travelBodyVo);
	
	
	
	public void increaseTravelHit(String travel_no);
	
	
	
	//좋아요
	public int increaseLikeCnt(String travel_no);
	public int insertLikeMember(HashMap<String, String> map);

	public int decreaseLikeCnt(String travel_no);
	public int deleteLikeMember(HashMap<String, String> map);
	
	public String checkTravelLike(HashMap<String, String> map);

	public String getTravelLikeCnt(String travel_no);
	
	
	
}
