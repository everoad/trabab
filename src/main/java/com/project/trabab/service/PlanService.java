package com.project.trabab.service;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.PlanBodyVO;
import com.project.trabab.vo.PlanHeaderVO;

public interface PlanService {
	
	public PlanHeaderVO writePlanHeaderOk(PlanHeaderVO planHeaderVo);

	public int writePlanBodyOk(List<PlanBodyVO> planBodyVo);

	public PlanHeaderVO getPlanHeaderView(String plan_no);

	public List<PlanBodyVO> getPlanBodyView(String plan_no);
	
	public List<HashMap<String, String>> getPlanMyPageList(HashMap<String, Integer> map);
	
	public int deletePlanOk(String plan_no);
	
}
