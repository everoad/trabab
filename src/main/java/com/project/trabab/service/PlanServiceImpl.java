package com.project.trabab.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.PlanDao;
import com.project.trabab.vo.PlanBodyVO;
import com.project.trabab.vo.PlanHeaderVO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	private PlanDao planDao;
	
	@Override
	public PlanHeaderVO writePlanHeaderOk(PlanHeaderVO planHeaderVo) {
		planDao.writePlanHeaderOk(planHeaderVo);
		return planHeaderVo;
	}

	@Override
	public int writePlanBodyOk(List<PlanBodyVO> planBodyVoList) {
		return planDao.writePlanBodyOk(planBodyVoList);
	}

	@Override
	public PlanHeaderVO getPlanHeaderView(String plan_no) {
		return planDao.getPlanHeaderView(plan_no);
	}

	@Override
	public List<PlanBodyVO> getPlanBodyView(String plan_no) {
		return planDao.getPlanBodyView(plan_no);
	}

	@Override
	public int deletePlanOk(String plan_no) {
		return planDao.deletePlanOk(plan_no);
	}

	@Override
	public List<HashMap<String, String>> getPlanMyPageList(HashMap<String, Integer> map) {
		ArrayList<String> temp = planDao.getPlanNo(map);
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		
		for(String plan_no : temp){
			System.out.println("plan_no가 나와야함: "+plan_no);
			HashMap<String, String> pageOne = planDao.getPlanMyPageList(plan_no);
			list.add(pageOne);
		}

		for(HashMap<String, String> e : list) {
			e.put("board_theme", "plan");
		}

		return list;
	}

}
