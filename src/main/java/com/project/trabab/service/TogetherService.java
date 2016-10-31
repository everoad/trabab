package com.project.trabab.service;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.TogetherVO;

public interface TogetherService {

	public List<HashMap<String, String>> getTohetherList();
	
	public int writeTogetherOk(TogetherVO togetherVo);
	
}
