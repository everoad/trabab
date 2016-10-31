package com.project.trabab.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelTipVO;

public interface TravelTipDao {

	public ArrayList<TravelTipVO> getTravelTipList(SearchVO searchVo);
	
	public ArrayList<TravelTipVO> getTravelTipNoticeList();

	public int getTotalRecordNum(SearchVO searchVo);

	public TravelTipVO getTravelView(TravelTipVO traveltipVo);
	
	public void writeTravelTipOk(TravelTipVO traveltipVo);
	
	public int deleteTravelTipOk(TravelTipVO traveltipVo);
	
	public int modifyTravelTipOk(TravelTipVO traveltipVo);

	public void upTravelTipHit(TravelTipVO traveltipVo);
	
	public List<HashMap<String, String>> searchWifi(HashMap<String, String> map);
}
