package com.project.trabab.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.CommentDao;
import com.project.trabab.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;

	@Override
	public List<HashMap<String, String>> getCommentList(CommentVO commentVo) {
		System.out.println("COMMENT_LIST");
		return commentDao.getCommentList(commentVo);
	}

	@Override
	public HashMap<String, String> writeCommentOk(CommentVO commentVo) {
		commentDao.writeCommentOk(commentVo);
		commentDao.increaseCommentCnt(commentVo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put(commentVo.getComment_theme() + "_comment_cnt", commentDao.getCommentCnt(commentVo) + "");
		return map;
	}

	@Override
	public HashMap<String, String> deleteCommentOk(CommentVO commentVo) {
		int flag = commentDao.deleteCommentOk(commentVo);
		commentDao.decreaseCommentCnt(commentVo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", flag + "");
		return map;
	}

}
