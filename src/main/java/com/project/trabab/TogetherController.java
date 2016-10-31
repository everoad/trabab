package com.project.trabab;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trabab.service.TogetherService;
import com.project.trabab.vo.TogetherVO;

@Controller("*.together")
public class TogetherController {

	@Autowired
	private TogetherService togetherService;
	
	@RequestMapping("together_view.together")
	public String getTogetherView() {
		return "together/together_list_view";
	}
	
	@RequestMapping("list_view.together")
	public @ResponseBody List<HashMap<String, String>> getTohetherList() {
		return togetherService.getTohetherList();
	}
	
	@RequestMapping("writeOk.together")
	public String writeTogetherOk(TogetherVO togetherVo, HttpSession session) {
		togetherVo.setMember_no((String) session.getAttribute("member_no"));
		togetherService.writeTogetherOk(togetherVo);
		return "redirect:list_view.together";
	}
}
