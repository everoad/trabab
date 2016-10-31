package com.project.trabab.dao;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.TogetherVO;

public interface TogetherDao {
	
	public List<HashMap<String, String>> getTohetherList();
	
	public int writeTogetherOk(TogetherVO togetherVo);
}
