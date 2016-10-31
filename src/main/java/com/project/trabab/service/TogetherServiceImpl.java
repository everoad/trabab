package com.project.trabab.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.TogetherDao;
import com.project.trabab.vo.TogetherVO;

@Service
public class TogetherServiceImpl implements TogetherService {

	@Autowired
	private TogetherDao togetherDao;
	
	@Override
	public List<HashMap<String, String>> getTohetherList() {
		return  togetherDao.getTohetherList();
	}
	

	@Override
	public int writeTogetherOk(TogetherVO togetherVo) {
		int flag = togetherDao.writeTogetherOk(togetherVo);
		return flag;
	}

}
