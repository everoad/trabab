package com.project.trabab.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelTipListVO;
import com.project.trabab.vo.TravelTipVO;

public interface TravelTipService {
	
	public TravelTipListVO getTravelTipList(SearchVO searchVo);
	
	public ArrayList<TravelTipVO> getTravelTipNoticeList();
	
	public TravelTipVO getTravelTipView(TravelTipVO traveltipVo);
	
	public TravelTipVO modifyTravelTipOk(TravelTipVO traveltipVo);
	
	public int deleteTravelTipOk(TravelTipVO traveltipVo);
	
	public TravelTipVO writeTravelTipOk(TravelTipVO traveltipVo);
	
	public List<HashMap<String, String>> searchWifi(String keyword);
	
}
