package com.project.trabab.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.ImageDao;
import com.project.trabab.vo.FoodImageVO;
import com.project.trabab.vo.TravelImageVO;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDao imageDao;
	
	@Override
	public int writeTravelImageOk(List<TravelImageVO> travelImageList) {
		return imageDao.writeTravelImageOk(travelImageList);
	}

	@Override
	public List<TravelImageVO> getTravelImageList(HashMap<String, String> map) {
		return imageDao.getTravelImageList(map);
	}
	
	@Override
	public void writeFoodImageOk(List<FoodImageVO> foodImageList) {
		imageDao.writeFoodImageOk(foodImageList);
	}

	@Override
	public List<FoodImageVO> getFoodImageList(String food_no) {
		return imageDao.getFoodImageList(food_no);
	}

	@Override
	public int deleteFoodImageListOk(List<FoodImageVO> foodImageList) {
		return imageDao.deleteFoodImageListOk(foodImageList);
	}

	@Override
	public void deleteFoodImageOk(String food_no) {
		imageDao.deleteFoodImageOk(food_no);
		List<FoodImageVO> imageVoList = imageDao.getFoodImageList(food_no);
		if(imageVoList != null) {
			String path = "C:/Users/user/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab2/uploadimg";
			for(FoodImageVO vo : imageVoList) {
				File file = new File(path + "/" + vo.getFood_image_name());
				if(file.exists()) {
					System.out.println("전체삭제 : 파일이 존재합니다.");
					file.delete();
				}
			}
		}
	}

	@Override
	public String getTravelFrontImage(String travel_no) {
		return imageDao.getTravelFrontImage(travel_no);
	}

	@Override
	public void deleteTravelImageListOk(List<TravelImageVO> travelImageList) {
		imageDao.deleteTravelImageListOk(travelImageList);
	}
	
	@Override
	public void deleteTravelImageOk(String travel_no){
		imageDao.deleteTravelImageOk(travel_no);
	};

}
