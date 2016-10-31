package com.project.trabab.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.TravelTipDao;
import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelTipListVO;
import com.project.trabab.vo.TravelTipVO;

@Service
public class TravelTipServiceImpl implements TravelTipService {

	@Autowired
	private TravelTipDao traveltipDao;
	
	@SuppressWarnings("deprecation")
	@Override
	public TravelTipListVO getTravelTipList(SearchVO searchVo) {

		List<String> skeyList = null;
		String skey = null;
		String cpage_str = searchVo.getCpage();

		if (searchVo.getSkey() != null && searchVo.getStype() != null) {
			skey = searchVo.getSkey();
			skey = URLDecoder.decode(skey);
			skey = skey.trim();

			String[] skeArr = skey.split(" ");
			skeyList = new ArrayList<String>(Arrays.asList(skeArr));

			for (int i = 0; i < skeyList.size(); i++) {
				
				if (skeyList.get(i).equals("")) {
					skeyList.remove(i);
				}
			}
			searchVo.setSkeyList(skeyList);
		}
		
		cpage_str = (cpage_str != null) ? cpage_str : "1";

		if(!Pattern.matches("^[0-9]*$", cpage_str)) {
			cpage_str = "1";
		}
		
		int cpage = Integer.parseInt(cpage_str);
		

		int totalRecordNum = traveltipDao.getTotalRecordNum(searchVo);
		int recordPerPage = 10;

		int totalPage = (int) Math.ceil((double) totalRecordNum / (double) recordPerPage);

		cpage = (cpage > totalPage) ? totalPage : cpage;
		cpage = (cpage < 1) ? 1 : cpage;

		int start = (cpage - 1) * recordPerPage + 1;
		int end = cpage * recordPerPage;
		
		searchVo.setStart(start);
		searchVo.setEnd(end);

		ArrayList<TravelTipVO> traveltipVoList = traveltipDao.getTravelTipList(searchVo);
		
		
		String sUrl = "";
		if (skey != null) {
			String url ="";
			for(String e : skeyList) {
				url += e + " ";
			}
			
			sUrl += "&stype=" + searchVo.getStype() + "&skey=" + url.trim();
		}
		
		String cUrl = "";
		if(searchVo.getTraveltip_category_no() != null) {
			cUrl = "&traveltip_category="+searchVo.getTraveltip_category_no();
		}
		
		int countNum = (totalRecordNum - (cpage-1) * recordPerPage);
		int blockPerPage = 5;
		int startBlock = (cpage - 1) / blockPerPage * blockPerPage + 1;
		int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
		endBlock = (endBlock >= totalPage) ? totalPage : endBlock;
		
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		
		TravelTipListVO travelTipListVo = new TravelTipListVO();
		travelTipListVo.setCountNum(countNum);
		travelTipListVo.setStartBlock(startBlock);
		travelTipListVo.setEndBlock(endBlock);
		travelTipListVo.setBlockPerPage(blockPerPage);
		travelTipListVo.setCpage(cpage);
		travelTipListVo.setTotalPage(totalPage);
		travelTipListVo.setRecordPerPage(recordPerPage);
		travelTipListVo.setTotalRecordNum(totalRecordNum);
		travelTipListVo.setTraveltipVoList(traveltipVoList);
		travelTipListVo.setcUrl(cUrl);
		travelTipListVo.setsUrl(sUrl);
	
		return travelTipListVo;
	}

	@Override
	public TravelTipVO getTravelTipView(TravelTipVO traveltipVo) {
		traveltipDao.upTravelTipHit(traveltipVo);
		return traveltipDao.getTravelView(traveltipVo);
	}

	@Override
	public TravelTipVO modifyTravelTipOk(TravelTipVO traveltipVo) {
		traveltipDao.modifyTravelTipOk(traveltipVo);
		return traveltipVo;
	}

	@Override
	public int deleteTravelTipOk(TravelTipVO traveltipVo) {
		int flag = traveltipDao.deleteTravelTipOk(traveltipVo);
		return flag;
	}

	@Override
	public TravelTipVO writeTravelTipOk(TravelTipVO traveltipVo) {
		traveltipDao.writeTravelTipOk(traveltipVo);
		return traveltipVo;
	}

	@Override
	public ArrayList<TravelTipVO> getTravelTipNoticeList() {
		return traveltipDao.getTravelTipNoticeList();
	}

	@Override
	public List<HashMap<String, String>> searchWifi(String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		
		return traveltipDao.searchWifi(map);
	}

}
