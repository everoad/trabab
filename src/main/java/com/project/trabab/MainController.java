package com.project.trabab;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.trabab.service.FoodService;
import com.project.trabab.service.MemberService;
import com.project.trabab.service.TravelService;
import com.project.trabab.vo.SearchVO;

@Controller("*.main")
public class MainController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TravelService travelService;

	@Autowired
	private FoodService foodService;

	@RequestMapping("index.main")
	public String indexView(SearchVO searchVo, Model model) {
		searchVo.setOrder("like");
		model.addAttribute("boardCount", memberService.getBoardCount());
		model.addAttribute("travelListVo", travelService.getTravelList(searchVo));
		model.addAttribute("foodListVo", foodService.getFoodList(searchVo));
		return "index";
	}

	@RequestMapping("search.main")
	public String searchResultView(SearchVO searchVo, Model model) {
		searchVo.setOrder("hit");
		model.addAttribute("travelListVo", travelService.getTravelList(searchVo));
		model.addAttribute("foodListVo", foodService.getFoodList(searchVo));
		return "search_list_view";
	}

	@RequestMapping("error404.main")
	public String error404(HttpServletResponse response, Model model) {
		response.setStatus(HttpServletResponse.SC_OK);
		return "error/page_404_error";
	}

	@RequestMapping("error500.main")
	public String error500(HttpServletResponse response, Model model) {
		response.setStatus(HttpServletResponse.SC_OK);
		return "error/page_500_error";
	}

}
