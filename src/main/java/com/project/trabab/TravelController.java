package com.project.trabab;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trabab.service.ImageService;
import com.project.trabab.service.TravelService;
import com.project.trabab.vo.SearchVO;
import com.project.trabab.vo.TravelBodyVO;
import com.project.trabab.vo.TravelImageVO;
import com.project.trabab.vo.TravelTotalVO;

@Controller("*.travel")
public class TravelController {

	@Autowired
	private TravelService travelService;
	
	@Autowired
	private ImageService imageService;

	@RequestMapping("list_view.travel")
	public String getTravelList(SearchVO searchVo, Model model) {
		searchVo.setOrder("wdate");
		model.addAttribute("travelListVo", travelService.getTravelList(searchVo));
		return "travel/travel_list_view";
	}

	@RequestMapping("write_header_view.travel")
	public String getTravelHeaderWriteView() {
		return "travel/travel_write_header_view";
	}

	@RequestMapping("write_body_view.travel")
	public String getTravelBodyWriteView() {
		return "travel/travel_write_body_view";
	}

	@RequestMapping("write_footer_view.travel")
	public String getTravelFooterWriteView() {
		return "travel/travel_write_footer_view";
	}

	@RequestMapping("writeHeaderOk.travel")
	public @ResponseBody HashMap<String, String> writeTravelHeaderOk(TravelTotalVO travelTotalVo, HttpSession session) {
		travelTotalVo.setMember_no((String)session.getAttribute("member_no"));
		HashMap<String, String> map = travelService.writeTravelHeaderOk(travelTotalVo);
		return map;
	}


	@RequestMapping(value="writeBodyOk.travel", method=RequestMethod.POST)
	public @ResponseBody TravelBodyVO writeTravelBodyOk(TravelBodyVO travelBodyVo) {
	
		if(travelBodyVo.getFiles() != null) {
			String path = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab/resources/uploadimg/";
			List<TravelImageVO> travelImageList = new ArrayList<TravelImageVO>();
			
			for (int i = 0; i < travelBodyVo.getFiles().size(); i++) {
				if (travelBodyVo.getFiles().get(i) == null)
					travelBodyVo.getFiles().remove(i);
			}
			
			for(int i = 0; i < travelBodyVo.getFiles().size(); i++) {
				if(travelBodyVo.getFiles().get(i) == null)
					travelBodyVo.getFiles().remove(i);
				
				String originalName = travelBodyVo.getFiles().get(i).getOriginalFilename();
				originalName = originalName.replaceAll(" ", "_");
				
				TravelImageVO vo = new TravelImageVO();
				String newName = System.currentTimeMillis() + "_" + originalName;
				vo.setTravel_image_name(newName);
				vo.setTravel_step(travelBodyVo.getTravel_step());
				vo.setTravel_no(travelBodyVo.getTravel_no());
				travelImageList.add(vo);

				File f = new File(path + newName);
				
				try {
		            f.createNewFile();
		           travelBodyVo.getFiles().get(i).transferTo(f);
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
			}
			imageService.writeTravelImageOk(travelImageList);
		} 
		travelService.writeTravelBodyOk(travelBodyVo);
		travelBodyVo.setFiles(null);

		return travelBodyVo;
	}

	@RequestMapping("writeFooterOk.travel")
	public @ResponseBody TravelTotalVO writeTravelFooterOk(TravelTotalVO travelTotalVo) {
		travelService.writeTravelFooterOk(travelTotalVo);
		return travelTotalVo;
	}
	
	@RequestMapping("modify_header_footer_view.travel")
	public String getTravelModifyHeaderAndFooterView(@RequestParam("travel_no") String travel_no, Model model) {
		model.addAttribute("travelTotalVo", travelService.getTravelConentView(travel_no));
		return "travel/travel_modify_header_footer_view";
	}
	
	@RequestMapping("modifyHeaderAndFooterOk.travel")
	public @ResponseBody HashMap<String, String> modifyTravelHeaderAndFooterOk(TravelTotalVO travelTotalVo) {
		int flag = travelService.modifyHeaderAndFooterOk(travelTotalVo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", flag + "");
		return map;
	}
	
	@RequestMapping("modify_body_view.travel")
	public String getTravelModifyBodyView(TravelBodyVO travelBodyVo, Model model) {
		
		travelBodyVo =travelService.getTravelBodyContentViewOne(travelBodyVo);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("travel_no", travelBodyVo.getTravel_no());
		map.put("travel_step", travelBodyVo.getTravel_step());
		travelBodyVo.setTravel_image_list(imageService.getTravelImageList(map));
		model.addAttribute("travelBodyVo", travelBodyVo);
		model.addAttribute("travelTotalVo", travelService.getTravelConentView(travelBodyVo.getTravel_no()));
		return "travel/travel_modify_body_view";
	}
	
	@RequestMapping("modifyBodyOk.travel")
	public @ResponseBody HashMap<String, String>
									modifyTravelBodyOk(TravelBodyVO travelBodyVo,
																	@RequestParam(value="delete_imgs", required=false) List<String> delete_imgs) {
		
		List<TravelImageVO> travelImageList = new ArrayList<TravelImageVO>();
		String path = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab/resources/uploadimg/";
		
		
		if(travelBodyVo.getFiles() != null) {for (int i = 0; i < travelBodyVo.getFiles().size(); i++) {
			if (travelBodyVo.getFiles().get(i) == null)
				travelBodyVo.getFiles().remove(i);
		}
			
			
			for(int i = 0; i < travelBodyVo.getFiles().size(); i++) {
				
				
				String originalName = travelBodyVo.getFiles().get(i).getOriginalFilename();
				originalName = originalName.replaceAll(" ", "_");
				
				TravelImageVO vo = new TravelImageVO();
				String newName = System.currentTimeMillis() + "_" + originalName;
				vo.setTravel_image_name(newName);
				vo.setTravel_step(travelBodyVo.getTravel_step());
				vo.setTravel_no(travelBodyVo.getTravel_no());
				travelImageList.add(vo);

				File f = new File(path + newName);
				try {
					f.createNewFile();
		            travelBodyVo.getFiles().get(i).transferTo(f);
		        } catch (IOException e) {
		            e.printStackTrace();
		        } 
				imageService.writeTravelImageOk(travelImageList);
			}
			
		}

		if (delete_imgs != null) {
			travelImageList.clear();
			
			for (String delete_image : delete_imgs) {
				System.out.println("삭제되는 이미지 : " + delete_image);
				
				File file = new File(path + delete_image);
				
				if (file.exists()) {
					System.out.println("존재합니다.");
					TravelImageVO vo = new TravelImageVO();
					vo.setTravel_image_name(delete_image);
					travelImageList.add(vo);
					// 파일 삭제
					file.delete();
					// 대표 이미지 삭제시 새 대표 이미지 입력.
					String a = imageService.getTravelFrontImage(travelBodyVo.getTravel_no());
					System.out.println(a);
					if (a.equals(delete_image)) {
						System.out.println("뭐지...");
						HashMap<String, String> map = new HashMap<String, String>();
						map.put("travel_no", travelBodyVo.getTravel_no());
						map.put("travel_step", travelBodyVo.getTravel_step());
						List<TravelImageVO> list1 = imageService.getTravelImageList(map);
						map.put("travel_image", list1.get(0).getTravel_image_name());
						travelService.writeTravelFontImage(map);
					}
				}
			}
			// 데이터베이스 삭제
			imageService.deleteTravelImageListOk(travelImageList);
		}
		
		int flag = travelService.modifyBodyOk(travelBodyVo);
		System.out.println("modifybody : " + flag);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", flag + "");
		return map;
	}
	
	@RequestMapping("deleteOk.travel")
	public String deleteTravelOk(@RequestParam("travel_no") String travel_no) {
		travelService.deleteTravelOk(travel_no);
		imageService.deleteTravelImageOk(travel_no);
		return "redirect:list_view.travel";
	}

	@RequestMapping("content_view.travel")
	public String getTravelContentView(@RequestParam("travel_no") String travel_no, Model model) {
		TravelTotalVO travelTotalVo = travelService.getTravelConentView(travel_no);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("travel_no", travel_no);
		for (int i = 0; i < travelTotalVo.getTravel_body_list().size(); i++) {
			map.put("travel_step", (i + 1) + "");
			travelTotalVo.getTravel_body_list().get(i).setTravel_image_list(imageService.getTravelImageList(map));
		}
		String markers = "";
		String path = "&path=color:0x0000ff|weight:5";
		for(int i = 0; i < travelTotalVo.getTravel_body_list().size(); i++){
			markers+= "&markers=color:blue%7Clabel:" + (i+1) + "%7C" + travelTotalVo.getTravel_body_list().get(i).getTravel_latitude() +","+ travelTotalVo.getTravel_body_list().get(i).getTravel_longitude();
			path += "|"+travelTotalVo.getTravel_body_list().get(i).getTravel_latitude() +","+ travelTotalVo.getTravel_body_list().get(i).getTravel_longitude();
		}
		
		model.addAttribute("markers", markers);
		model.addAttribute("path", path);
		model.addAttribute("travelTotalVo", travelTotalVo);
		return "travel/travel_content_view";
	}

	
	
	
	@RequestMapping("travel_like_increase.travel")
	public @ResponseBody HashMap<String, String> increaseLikeCnt(@RequestParam("travel_no") String travel_no, HttpSession session) {
		String like_cnt = travelService.increaseLikeCnt(travel_no, (String) session.getAttribute("member_no"));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("travel_like_cnt", like_cnt);
		return map;
	}

	@RequestMapping("travel_like_decrease.travel")
	public @ResponseBody HashMap<String, String> decreaseLikeCnt(@RequestParam("travel_no") String travel_no, HttpSession session) {
		String like_cnt = travelService.decreaseLikeCnt(travel_no, (String) session.getAttribute("member_no"));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("travel_like_cnt", like_cnt);
		return map;
	}

	@RequestMapping("travel_like_check.travel")
	public @ResponseBody HashMap<String, String> checkTravelLike(@RequestParam("travel_no") String travel_no, HttpSession session) {
		int flag = 0;
		String member_no = (String) session.getAttribute("member_no");
		if(member_no != null) 
			flag = travelService.checkTravelLike(travel_no, member_no);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", flag + "");
		return map;
	}

}
