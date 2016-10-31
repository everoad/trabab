package com.project.trabab.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.FoodDao;
import com.project.trabab.vo.FoodListVO;
import com.project.trabab.vo.FoodVO;
import com.project.trabab.vo.SearchVO;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodDao foodDao;
	
	@SuppressWarnings("deprecation")
	@Override
	public FoodListVO getFoodList(SearchVO searchVo) {
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
				
				if(skeyList.get(i).substring(skeyList.get(i).length() - 1, skeyList.get(i).length()).equals("도")){
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

		int totalRecordNum = foodDao.getTotalRecordNum(searchVo);
		int recordPerPage = 16;

		int totalPage = (int) Math.ceil((double) totalRecordNum / (double) recordPerPage);

		cpage = (cpage > totalPage) ? totalPage : cpage;
		cpage = (cpage < 1) ? 1 : cpage;
		int start;
		int end;

		if (searchVo.getOrder().equals("hit") || searchVo.getOrder().equals("like")) {
			start = 1;
			end = 4;

		} else {
			searchVo.setOrder("wdate");
			start = (cpage - 1) * recordPerPage + 1;
			end = cpage * recordPerPage;
		}

		searchVo.setStart(start);
		searchVo.setEnd(end);

		ArrayList<FoodVO> foodVoList = foodDao.getFoodList(searchVo);

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

		FoodListVO foodListVo = new FoodListVO();
		
		foodListVo.setStartBlock(startBlock);
		foodListVo.setEndBlock(endBlock);
		foodListVo.setBlockPerPage(blockPerPage);
		foodListVo.setCpage(cpage);
		foodListVo.setTotalPage(totalPage);
		foodListVo.setRecordPerPage(recordPerPage);
		foodListVo.setTotalRecordNum(totalRecordNum);
		foodListVo.setFoodVoList(foodVoList);
		foodListVo.setsUrl(sUrl);

		return foodListVo;
		
		
	}

	@Override
	public FoodVO writeFoodOk(FoodVO foodVo) {
		
		if(foodVo.getFood_location_name() == null) {
			String[] addressArr = foodVo.getFood_address().split(" ");
			foodVo.setFood_location_name(addressArr[addressArr.length -1]);
		}
		
		foodDao.writeFoodOk(foodVo);

		return foodVo;
	}

	@Override
	public int modifyFoodOk(FoodVO foodVo) {
		return foodDao.modifyFoodOk(foodVo);
	}

	@Override
	public FoodVO getFoodContentView(String food_no) {
		foodDao.increaseFoodHit(food_no);
		return foodDao.getFoodContentView(food_no);
	}

	@Override
	public int deleteFoodOk(String food_no) {
		return foodDao.deleteFoodOk(food_no);
	}

	@Override
	public String increaseLikeCnt(String food_no, String member_no) {
		int flag = foodDao.increaseLikeCnt(food_no);
		String like_cnt = null;
		if (flag == 1) {
			like_cnt = insertLikeMember(food_no, member_no);
		}
		return like_cnt;
	}

	@Override
	public String insertLikeMember(String food_no, String member_no) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("food_no", food_no);
		map.put("member_no", member_no);

		int flag = foodDao.insertLikeMember(map);
		String like_cnt = null;

		if (flag == 1) {
			like_cnt = getFoodLikeCnt(food_no);
		}

		return like_cnt;
	}

	@Override
	public String decreaseLikeCnt(String food_no, String member_no) {
		int flag = foodDao.decreaseLikeCnt(food_no);
		String like_cnt = null;
		if (flag == 1) {
			like_cnt = deleteLikeMember(food_no, member_no);
		}
		return like_cnt;
	}

	@Override
	public String deleteLikeMember(String food_no, String member_no) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("food_no", food_no);
		map.put("member_no", member_no);

		int flag = foodDao.deleteLikeMember(map);
		String like_cnt = null;

		if (flag == 1) {
			like_cnt = getFoodLikeCnt(food_no);
		}

		return like_cnt;
	}

	@Override
	public int checkFoodLike(String food_no, String member_no) {
		HashMap<String, String> map = new HashMap<String, String>();
		int flag = 1;
		map.put("food_no", food_no);
		map.put("member_no", member_no);

		if (foodDao.checkFoodLike(map) == null) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public String getFoodLikeCnt(String food_no) {
		String like_cnt = foodDao.getFoodLikeCnt(food_no);
		return like_cnt;
	}




}
