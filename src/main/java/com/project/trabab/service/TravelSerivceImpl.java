package com.project.trabab.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.ImageDao;
import com.project.trabab.dao.TravelDao;
import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelBodyVO;
import com.project.trabab.vo.TravelImageVO;
import com.project.trabab.vo.TravelListVO;
import com.project.trabab.vo.TravelTotalVO;

@Service
public class TravelSerivceImpl implements TravelService {

	@Autowired
	private TravelDao travelDao;

	@Autowired
	private ImageDao imageDao;

	@SuppressWarnings("deprecation")
	@Override
	public TravelListVO getTravelList(SearchVO searchVo) {

		List<String> skeyList = null;
		List<String> skeyList2 = null;
		
		String skey = null;
		String cpage_str = searchVo.getCpage();

		if (searchVo.getSkey() != null && searchVo.getStype() != null) {
			skey = searchVo.getSkey();
			skey = URLDecoder.decode(skey);
			skey = skey.trim();

			String[] skeArr = skey.split(" ");
			skeyList = new ArrayList<String>(Arrays.asList(skeArr));
			skeyList2 = new ArrayList<String>(Arrays.asList(skeArr));
			
			for (int i = 0; i < skeyList.size(); i++) {

				if (skeyList.get(i).equals("")) {
					skeyList.remove(i);
				}

				if (skeyList.get(i).substring(skeyList.get(i).length() - 1, skeyList.get(i).length()).equals("도")) {
					skeyList.add(skeyList.get(i).substring(0, skeyList.get(i).length() - 1));
				}

			}

			searchVo.setSkeyList(skeyList);
		}

		cpage_str = (cpage_str != null) ? cpage_str : "1";

		if (!Pattern.matches("^[0-9]*$", cpage_str)) {
			cpage_str = "1";
		}

		int cpage = Integer.parseInt(cpage_str);

		int totalRecordNum = travelDao.getTotalRecordNum(searchVo);
		int recordPerPage = 16;
		System.out.println("totalRecordNum : " + totalRecordNum);
		int totalPage = (int) Math.ceil((double) totalRecordNum / (double) recordPerPage);

		cpage = (cpage > totalPage) ? totalPage : cpage;
		cpage = (cpage < 1) ? 1 : cpage;
		int start;
		int end;
		System.out.println(searchVo.getOrder());
		if (searchVo.getOrder().equals("hit") || searchVo.getOrder().equals("like")) {
			start = 1;
			end = 4;

		} else {
			start = (cpage - 1) * recordPerPage + 1;
			end = cpage * recordPerPage;
		}

		searchVo.setStart(start);
		searchVo.setEnd(end);

		ArrayList<TravelTotalVO> travelTotalVoList = travelDao.getTravelList(searchVo);

		String sUrl = "";
		if (skey != null) {
			String url = "";
			for (String e : skeyList2) {
				url += e + " ";
			}

			sUrl += "&stype=" + searchVo.getStype() + "&skey=" + url.trim();
		}

		int blockPerPage = 5;
		int startBlock = (cpage - 1) / blockPerPage * blockPerPage + 1;
		int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
		endBlock = (endBlock >= totalPage) ? totalPage : endBlock;
		System.out.println("토탈페이지: "+totalPage);
		TravelListVO travelListVo = new TravelListVO();
		travelListVo.setStartBlock(startBlock);
		travelListVo.setEndBlock(endBlock);
		travelListVo.setBlockPerPage(blockPerPage);
		travelListVo.setCpage(cpage);
		travelListVo.setTotalPage(totalPage);
		travelListVo.setRecordPerPage(recordPerPage);
		travelListVo.setTotalRecordNum(totalRecordNum);
		travelListVo.setTravelTotalVoList(travelTotalVoList);
		travelListVo.setsUrl(sUrl);
		return travelListVo;
	}

	@Override
	public TravelTotalVO getTravelConentView(String travel_no) {
		travelDao.increaseTravelHit(travel_no);
		TravelTotalVO travelTotalVo = travelDao.getTravelHeaderAndFooter(travel_no);
		
		String hashtag = travelTotalVo.getTravel_hashtag();
		
		hashtag = hashtag.replaceAll("#", "");
		hashtag = hashtag.replaceAll(" ", "");
		String[] tagArr = hashtag.split(",");
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(tagArr));
		travelTotalVo.setTravel_hashtag_list(list);
		travelTotalVo.setTravel_body_list(travelDao.getTravelBody(travel_no));
		return travelTotalVo;
	}

	@Override
	public HashMap<String, String> writeTravelHeaderOk(TravelTotalVO travelTotalVo) {
		travelDao.writeTravelHeaderOk(travelTotalVo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("travel_no", travelTotalVo.getTravel_no());
		map.put("travel_step", "0");
		return map;
	}

	@Override
	public void writeTravelBodyOk(TravelBodyVO travelBodyVo) {
		if(travelBodyVo.getTravel_location_name() == null) {
			String[] addressArr = travelBodyVo.getTravel_address().split(" ");
			travelBodyVo.setTravel_location_name(addressArr[addressArr.length -1]);
		}
		travelDao.writeTravelBodyOk(travelBodyVo);
	}

	@Override
	public void writeTravelFooterOk(TravelTotalVO travelTotalVo) {
		TravelImageVO vo = imageDao.getTravelImageOne(travelTotalVo.getTravel_no());
		if(vo != null) {
			travelTotalVo.setTravel_image(vo.getTravel_image_name());
		} else {
			travelTotalVo.setTravel_image("no_image.jpg");
		}
		travelDao.writeTravelFooterOk(travelTotalVo);
	}

	@Override
	public String increaseLikeCnt(String travel_no, String member_no) {
		int flag = travelDao.increaseLikeCnt(travel_no);
		String like_cnt = null;
		if (flag == 1) {
			like_cnt = insertLikeMember(travel_no, member_no);
		}
		return like_cnt;
	}

	@Override
	public String insertLikeMember(String travel_no, String member_no) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("travel_no", travel_no);
		map.put("member_no", member_no);
		int flag = travelDao.insertLikeMember(map);
		String like_cnt = null;
		if (flag == 1) {
			like_cnt = getTravelLikeCnt(travel_no);
		}
		return like_cnt;
	}

	@Override
	public String decreaseLikeCnt(String travel_no, String member_no) {
		int flag = travelDao.decreaseLikeCnt(travel_no);
		String like_cnt = null;
		if (flag == 1) {
			like_cnt = deleteLikeMember(travel_no, member_no);
		}
		return like_cnt;
	}

	@Override
	public String deleteLikeMember(String travel_no, String member_no) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("travel_no", travel_no);
		map.put("member_no", member_no);

		int flag = travelDao.deleteLikeMember(map);
		String like_cnt = null;

		if (flag == 1) {
			like_cnt = getTravelLikeCnt(travel_no);
		}

		return like_cnt;
	}

	@Override
	public int checkTravelLike(String travel_no, String member_no) {
		HashMap<String, String> map = new HashMap<String, String>();
		int flag = 1;
		map.put("travel_no", travel_no);
		map.put("member_no", member_no);

		if (travelDao.checkTravelLike(map) == null) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public String getTravelLikeCnt(String travel_no) {
		String like_cnt = travelDao.getTravelLikeCnt(travel_no);
		return like_cnt;
	}

	@Override
	public void increaseTravelHit(String travel_no) {
		travelDao.increaseTravelHit(travel_no);
	}

	@Override
	public void writeTravelFontImage(HashMap<String, String> map) {
		travelDao.writeTravelFrontImage(map);
	}

	@Override
	public int modifyHeaderAndFooterOk(TravelTotalVO travelTotalVo) {
		int flag =travelDao.modifyHeaderAndFooterOk(travelTotalVo);
		return flag;
	}

	@Override
	public int modifyBodyOk(TravelBodyVO travelBodyVo) {
		if(travelBodyVo.getTravel_location_name() == null) {
			String[] addressArr = travelBodyVo.getTravel_address().split(" ");
			travelBodyVo.setTravel_location_name(addressArr[addressArr.length -1]);
		}
		int flag = travelDao.modifyBodyOk(travelBodyVo);
		return flag;
	}

	@Override
	public TravelBodyVO getTravelBodyContentViewOne(TravelBodyVO travelBodyVo) {
		
		return travelDao.getTravelBodyOne(travelBodyVo);
	}

	@Override
	public int deleteTravelOk(String travel_no){
		int flag1 = travelDao.deleteTravelHeaderOk(travel_no);
		int flag2 = 0;
		
		if(flag1==1){
			flag2 = travelDao.deleteTraveBodylOk(travel_no);
		}
		
		return flag2;
	};

	
}
