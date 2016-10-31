package com.project.trabab;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trabab.service.FoodService;
import com.project.trabab.service.ImageService;
import com.project.trabab.vo.FoodImageVO;
import com.project.trabab.vo.FoodVO;
import com.project.trabab.vo.SearchVO;

@Controller("*.food")
public class FoodController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private ImageService imageService;

	@RequestMapping("list_view.food")
	public String getFoodList(SearchVO searchVo, Model model) {
		searchVo.setOrder("wdate");
		model.addAttribute("foodListVo", foodService.getFoodList(searchVo));
		return "food/food_list_view";
	}

	@RequestMapping("write_view.food")
	public String getFoodWriteView() {
		return "food/food_write_view";
	}

	@RequestMapping("writeOk.food")
	public @ResponseBody FoodVO writeFoodOk(FoodVO foodVo, HttpSession session) {
		foodVo.setMember_no((String) session.getAttribute("member_no"));

		if (foodVo.getFiles() != null) {
			String path = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab/resources/uploadimg/";
			List<FoodImageVO> foodImageList = new ArrayList<FoodImageVO>();
			for (int i = 0; i < foodVo.getFiles().size(); i++) {
				if (foodVo.getFiles().get(i) == null)
					foodVo.getFiles().remove(i);
			}
			
			for (int i = 0; i < foodVo.getFiles().size(); i++) {

				
				String originalName = foodVo.getFiles().get(i).getOriginalFilename();
				originalName = originalName.replaceAll(" ", "_");

				FoodImageVO vo = new FoodImageVO();
				String newName = System.currentTimeMillis() + "_" + originalName;
				vo.setFood_image_name(newName);
				foodImageList.add(vo);

				File f = new File(path + newName);
				try {
					foodVo.getFiles().get(i).transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				if (foodVo.getFood_image() == null) {
					foodVo.setFood_image(foodImageList.get(0).getFood_image_name());
					foodVo = foodService.writeFoodOk(foodVo);
				}
				vo.setFood_no(foodVo.getFood_no());
			}
			imageService.writeFoodImageOk(foodImageList);
		} else {
			foodVo.setFood_image("no_image.jpg");
			foodVo = foodService.writeFoodOk(foodVo);
		}
		foodVo.setFiles(null);

		return foodVo;
	}

	@RequestMapping("content_view.food")
	public String getFoodContentView(@RequestParam("food_no") String food_no, Model model) {
		FoodVO foodVo = foodService.getFoodContentView(food_no);
		
		String hashtag = foodVo.getFood_hashtag();
		
		hashtag = hashtag.replaceAll("#", "");
		hashtag = hashtag.replaceAll(" ", "");
		String[] tagArr = hashtag.split(",");
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(tagArr));
		foodVo.setFood_hashtag_list(list);
		for(String e : foodVo.getFood_hashtag_list()) {
			System.out.println(e);
		}
		
		foodVo.setFood_image_list(imageService.getFoodImageList(food_no));
		model.addAttribute("foodVo", foodVo);
		return "food/food_content_view";
	}

	@RequestMapping("modify_view.food")
	public String getFoodModifyView(@RequestParam("food_no") String food_no, Model model) {
		FoodVO foodVo = foodService.getFoodContentView(food_no);
		foodVo.setFood_image_list(imageService.getFoodImageList(food_no));
		model.addAttribute("foodVo", foodVo);
		return "food/food_modify_view";
	}

	@RequestMapping("modifyOk.food")
	public @ResponseBody FoodVO modfiyFoodOk(FoodVO foodVo, @RequestParam(value="delete_imgs", required=false) List<String> delete_imgs) {

		String path = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab/resources/uploadimg/";
		List<FoodImageVO> foodImageList = new ArrayList<FoodImageVO>();

		if (foodVo.getFiles() != null) {
			for (int i = 0; i < foodVo.getFiles().size(); i++) {
				if (foodVo.getFiles().get(i) == null)
					foodVo.getFiles().remove(i);
			}
			
			for (int i = 0; i < foodVo.getFiles().size(); i++) {
				
				String originalName = foodVo.getFiles().get(i).getOriginalFilename();
				originalName = originalName.replaceAll(" ", "_");

				FoodImageVO vo = new FoodImageVO();
				String newName = System.currentTimeMillis() + "_" + originalName;
				vo.setFood_image_name(newName);
				vo.setFood_no(foodVo.getFood_no());
				foodImageList.add(vo);

				File f = new File(path + newName);
				try {
					foodVo.getFiles().get(i).transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			imageService.writeFoodImageOk(foodImageList);
		}

		if (delete_imgs != null) {
			foodImageList.clear();
			for (String delete_image : delete_imgs) {
				System.out.println("삭제되는 이미지 : " + delete_image);

				File file = new File(path + delete_image);

				if (file.exists()) {
					System.out.println("존재합니다.");
					FoodImageVO vo = new FoodImageVO();
					vo.setFood_image_name(delete_image);
					foodImageList.add(vo);
					// 파일 삭제
					file.delete();
					// 대표 이미지 삭제시 새 대표 이미지 입력.
					if (foodVo.getFood_image().equals(delete_image)) {
						List<FoodImageVO> list1 = imageService.getFoodImageList(foodVo.getFood_no());
						foodVo.setFood_image(list1.get(0).getFood_image_name());
					}
				}
			}
			// 데이터베이스 삭제
			imageService.deleteFoodImageListOk(foodImageList);
		}
		foodVo.setFiles(null);
		foodService.modifyFoodOk(foodVo);
		return foodVo;
	}

	@RequestMapping("deleteOk.food")
	public String deleteFoodOk(@RequestParam("food_no") String food_no) {
		foodService.deleteFoodOk(food_no);
		imageService.deleteFoodImageOk(food_no);
		return "redirect:list_view.food";
	}

	@RequestMapping("food_like_increase.food")
	public @ResponseBody HashMap<String, String> increaseLikeCnt(@RequestParam("food_no") String food_no,
			HttpSession session) {
		String like_cnt = foodService.increaseLikeCnt(food_no, (String) session.getAttribute("member_no"));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("food_like_cnt", like_cnt);
		return map;
	}

	@RequestMapping("food_like_decrease.food")
	public @ResponseBody HashMap<String, String> decreaseLikeCnt(@RequestParam("food_no") String food_no,
			HttpSession session) {
		String like_cnt = foodService.decreaseLikeCnt(food_no, (String) session.getAttribute("member_no"));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("food_like_cnt", like_cnt);
		return map;
	}

	@RequestMapping("food_like_check.food")
	public @ResponseBody HashMap<String, String> checkFoodLike(@RequestParam("food_no") String food_no,
			HttpSession session) {
		int flag = 0;
		String member_no = (String) session.getAttribute("member_no");
		if (member_no != null)
			flag = foodService.checkFoodLike(food_no, member_no);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", flag + "");
		return map;
	}
}
