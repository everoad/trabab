package com.project.trabab.service;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.CommentVO;

public interface CommentService {

	
	public List<HashMap<String, String>> getCommentList(CommentVO commentVo);
	
	public HashMap<String, String> writeCommentOk(CommentVO commentVo);
	
	public HashMap<String, String> deleteCommentOk(CommentVO commentVo);
}
																																																																			