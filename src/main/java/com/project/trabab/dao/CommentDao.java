package com.project.trabab.dao;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.CommentVO;

public interface CommentDao {
	
	public  List<HashMap<String, String>> getCommentList(CommentVO commentVo);

	public int writeCommentOk(CommentVO commentVo);
	
	public int deleteCommentOk(CommentVO commentVo);
	
	public int increaseCommentCnt(CommentVO commentVo);

	public int decreaseCommentCnt(CommentVO commentVo);
	
	public int getCommentCnt(CommentVO commentVo);
	
}