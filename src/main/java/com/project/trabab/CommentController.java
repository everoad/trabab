package com.project.trabab;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trabab.service.CommentService;
import com.project.trabab.vo.CommentVO;

@Controller("*.comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("list_view.comment")
	public @ResponseBody List<HashMap<String, String>> getCommentList(CommentVO commentVo) {
		return commentService.getCommentList(commentVo);
	}

	@RequestMapping("writeOk.comment")
	public @ResponseBody HashMap<String, String> writeCommentOk(CommentVO commentVo,	HttpSession session) {
		commentVo.setMember_no((String) session.getAttribute("member_no"));
		return  commentService.writeCommentOk(commentVo);
	}
	
	@RequestMapping("deleteOk.comment")
	public @ResponseBody HashMap<String, String> deleteCommentOk(CommentVO commentVo) {
		return commentService.deleteCommentOk(commentVo);
	}
	
}
