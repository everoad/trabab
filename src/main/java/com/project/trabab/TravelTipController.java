package com.project.trabab;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trabab.service.TravelTipService;
import com.project.trabab.vo.PhotoVO;
import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelTipVO;

@Controller("*.traveltip")
public class TravelTipController {

	@Autowired
	private TravelTipService traveltipService;
	
	@RequestMapping("list_view.traveltip")
	public String getTravelTipList(SearchVO searchVo, Model model) {
		model.addAttribute("travelTipListVo", traveltipService.getTravelTipList(searchVo));
		model.addAttribute("travelTipNoticeListVo", traveltipService.getTravelTipNoticeList());
		return "traveltip/traveltip_list_view";
	}
	
	@RequestMapping("content_view.traveltip")
	public String travelTipView(TravelTipVO traveltipVo, SearchVO searchVo, Model model) {
		
		traveltipVo = traveltipService.getTravelTipView(traveltipVo);
		String sUrl = "?cpage=" + ((searchVo.getCpage() == null) ? "1" : searchVo.getCpage());
		sUrl += (searchVo.getSkey() != null) ? "&stype=" + searchVo.getStype() + "&skey=" + searchVo.getSkey() : "";
		String cUrl = (searchVo.getTraveltip_category_no() != null) ? "&traveltip_category_no=" + searchVo.getTraveltip_category_no() : "";
		model.addAttribute("sUrl",sUrl);
		model.addAttribute("cUrl",cUrl);
		model.addAttribute("traveltipVo", traveltipVo);
		return "traveltip/traveltip_content_view";
	}

	
	@RequestMapping("write_view.traveltip")
	public String writeTravelTipView() {
		return "traveltip/traveltip_write_view";
	}
	
	
	@RequestMapping("writeOk.traveltip")
	public String writeTravelTipOk(TravelTipVO traveltipVo, HttpSession session, Model model) {
		traveltipVo.setMember_no((String)session.getAttribute("member_no"));
		traveltipVo = traveltipService.writeTravelTipOk(traveltipVo);
		return "redirect:content_view.traveltip?traveltip_no=" + traveltipVo.getTraveltip_no();
	}
	
	
	@RequestMapping("modify_view.traveltip")
	public String modifyTravelTipView(TravelTipVO traveltipVo, HttpSession session, SearchVO searchVo, Model model) {
		traveltipVo.setMember_no((String)session.getAttribute("member_no"));
		traveltipVo = traveltipService.getTravelTipView(traveltipVo);
		String sUrl = "?cpage=" + ((searchVo.getCpage() == null) ? "1" : searchVo.getCpage());
		sUrl += (searchVo.getSkey() != null) ? "&stype=" + searchVo.getStype() + "&skey=" + searchVo.getSkey() : "";
		
		String cUrl = (searchVo.getTraveltip_category_no() != null) ? "&traveltip_category_no=" + searchVo.getTraveltip_category_no() : "";
			
		model.addAttribute("sUrl",sUrl);
		model.addAttribute("cUrl",cUrl);
		model.addAttribute("traveltipVo", traveltipVo);
		return "traveltip/traveltip_modify_view";
	}
	
	
	@RequestMapping("modifyOk.traveltip")
	public String modifyTravelTipOk(TravelTipVO traveltipVo, Model model) {
		traveltipVo = traveltipService.modifyTravelTipOk(traveltipVo);
		return "redirect:content_view.traveltip?traveltip_no="+ traveltipVo.getTraveltip_no();
	}
	
	
	@RequestMapping("deleteOk.traveltip")
	public String deleteTravelTipOk(TravelTipVO traveltipVo, Model model) {
		traveltipService.deleteTravelTipOk(traveltipVo);
		return "redirect:list_view.traveltip";
	}
	
	@RequestMapping("convenient_view.traveltip")
	public String getConvenientView() {
		return "traveltip/traveltip_convenient_view";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("file_upload.traveltip")
	public String fileUpload(PhotoVO photoVo) {
		
		String file_result = "";
		if(photoVo.getFiledata() != null) {
			String originalFileName = URLDecoder.decode(photoVo.getFiledata().getOriginalFilename());
			originalFileName = originalFileName.replaceAll(" ", "_");
			
			String path = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab/resources/uploadimg/";
			System.out.println(photoVo.getFiledata().getOriginalFilename());
			String newName = System.currentTimeMillis() + "_" + originalFileName;
			System.out.println("new: " + newName);
			File f = new File(path + newName);
			try {
				photoVo.getFiledata().transferTo(f);
				file_result += "&bNewLine=true&sFileName="+URLEncoder.encode(originalFileName) +"&sFileURL=/trabab/resources/uploadimg/"+URLEncoder.encode(newName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			file_result += "&errstr=error";
		}
		return "redirect:" + photoVo.getCallback() + "?callback_func=" + photoVo.getCallback_func() + file_result;
	}
	
	@RequestMapping("/searchWifi.traveltip")
	public @ResponseBody List<HashMap<String,String>> searchWifiConvenient(
																					@RequestParam("keyword") String keyword) {
		return traveltipService.searchWifi(keyword);
	}
	
	
}
