package com.project.trabab.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.PlanBodyVO;
import com.project.trabab.vo.PlanHeaderVO;

public interface PlanDao {
	
	public void writePlanHeaderOk(PlanHeaderVO planHeaderVo);
	
	public int writePlanBodyOk(List<PlanBodyVO> planBodyVo);
	
	public PlanHeaderVO getPlanHeaderView(String plan_no);
	
	public List<PlanBodyVO> getPlanBodyView(String plan_no);
	
	public HashMap<String, String> getPlanMyPageList(String plan_no);
	
	public int deletePlanOk(String plan_no);
	
	public ArrayList<String> getPlanNo(HashMap<String, Integer> map);
	
}
