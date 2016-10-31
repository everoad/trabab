package com.project.trabab;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trabab.service.PlanService;
import com.project.trabab.vo.PlanBodyVO;
import com.project.trabab.vo.PlanHeaderVO;

@Controller("*.plan")
public class PlanController {

	@Autowired
	private PlanService planService;
	
	@RequestMapping("write_view.plan")
	public String getPlanWriteView() {
		return "plan/plan_write_view";
	}
	
	@RequestMapping("writeOk.plan")
	public String writePlanOk(PlanHeaderVO planHeaderVo, 	PlanBodyVO planBodyVo,	HttpSession session) {
		planHeaderVo.setMember_no((String) session.getAttribute("member_no"));
		planHeaderVo = planService.writePlanHeaderOk(planHeaderVo);
		List<PlanBodyVO> planBodyVoList = planBodyVo.getPlanBodyVoList();
		for(int i = 0; i < planBodyVoList.size(); i++) {
			if(planBodyVoList.get(i).getPlan_price() == null) 
				planBodyVoList.remove(i);
			
			if(planBodyVoList.get(i).getPlan_location_name() == null) {
				String[] addArr = planBodyVoList.get(i).getPlan_address().split(" ");
				planBodyVoList.get(i).setPlan_location_name(addArr[addArr.length -1]);				
			}
			planBodyVoList.get(i).setPlan_no(planHeaderVo.getPlan_no());
		}
		planService.writePlanBodyOk(planBodyVoList);
		return "redirect:content_view.plan?plan_no=" + planHeaderVo.getPlan_no();
	}

	@RequestMapping("content_view.plan")
	public String getPlanContentView(@RequestParam("plan_no") String plan_no, Model model) {
		List<PlanBodyVO> list = planService.getPlanBodyView(plan_no);
		String markers = "";
		String path = "&path=color:0x0000ff|weight:5";
		for(int i = 0; i < list.size(); i++){
			markers+= "&markers=color:blue%7Clabel:" + (i+1) + "%7C" + list.get(i).getPlan_latitude() +","+ list.get(i).getPlan_longitude();
			path += "|"+list.get(i).getPlan_latitude() +","+ list.get(i).getPlan_longitude();
		}
		model.addAttribute("planHeaderVo", planService.getPlanHeaderView(plan_no));
		model.addAttribute("markers", markers);
		model.addAttribute("path", path);
		model.addAttribute("planBodyVoList", list);
		return "plan/plan_content_view";
	}
	
	@RequestMapping("deleteOk.plan")
	public String deletePlanOk(@RequestParam("plan_no") String plan_no) {
		planService.deletePlanOk(plan_no);
		return "redirect:mypage_view.member";
	}
	
	@RequestMapping("modify_view.plan")
	public String modifyPlanView(@RequestParam("plan_no") String plan_no, Model model) {
		model.addAttribute("planHeaderVo", planService.getPlanHeaderView(plan_no));
		model.addAttribute("planBodyVoList", planService.getPlanBodyView(plan_no));
		return "modify_view.plan";
	}
}





