package com.project.trabab.vo;

public class CommentVO {

	private String comment_no;
	private String comment_theme;
	private String comment_content;
	private String comment_wdate;
	private String board_no;
	private String member_no;

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getComment_no() {
		return comment_no;
	}

	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_theme() {
		return comment_theme;
	}

	public void setComment_theme(String comment_theme) {
		this.comment_theme = comment_theme;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_wdate() {
		return comment_wdate;
	}

	public void setComment_wdate(String comment_wdate) {
		this.comment_wdate = comment_wdate;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

}
