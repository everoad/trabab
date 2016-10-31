package com.project.trabab.vo;

import java.util.ArrayList;

public class TravelTotalVO {
	private String travel_no;
	private String travel_subject;
	private String travel_schedule_start;
	private String travel_schedule_end;
	private String travel_wdate;
	private String travel_epilogue;
	private String travel_hashtag;
	private ArrayList<String> travel_hashtag_list;
	private String travel_hit;
	private String travel_comment_cnt;
	private String travel_like_cnt;
	private String travel_image;

	private String member_nickname;
	private String member_email;
	private String member_no;

	private ArrayList<TravelBodyVO> travel_body_list;

	public ArrayList<String> getTravel_hashtag_list() {
		return travel_hashtag_list;
	}

	public void setTravel_hashtag_list(ArrayList<String> travel_hashtag_list) {
		this.travel_hashtag_list = travel_hashtag_list;
	}

	public ArrayList<TravelBodyVO> getTravel_body_list() {
		return travel_body_list;
	}

	public void setTravel_body_list(ArrayList<TravelBodyVO> travel_body_list) {
		this.travel_body_list = travel_body_list;
	}

	public String getTravel_image() {
		return travel_image;
	}

	public void setTravel_image(String travel_image) {
		this.travel_image = travel_image;
	}

	public String getTravel_hit() {
		return travel_hit;
	}

	public void setTravel_hit(String travel_hit) {
		this.travel_hit = travel_hit;
	}

	public String getTravel_comment_cnt() {
		return travel_comment_cnt;
	}

	public void setTravel_comment_cnt(String travel_comment_cnt) {
		this.travel_comment_cnt = travel_comment_cnt;
	}

	public String getTravel_like_cnt() {
		return travel_like_cnt;
	}

	public void setTravel_like_cnt(String travel_like_cnt) {
		this.travel_like_cnt = travel_like_cnt;
	}

	public String getTravel_no() {
		return travel_no;
	}

	public void setTravel_no(String travel_no) {
		this.travel_no = travel_no;
	}

	public String getTravel_subject() {
		return travel_subject;
	}

	public void setTravel_subject(String travel_subject) {
		this.travel_subject = travel_subject;
	}

	public String getTravel_schedule_start() {
		return travel_schedule_start;
	}

	public void setTravel_schedule_start(String travel_schedule_start) {
		this.travel_schedule_start = travel_schedule_start;
	}

	public String getTravel_schedule_end() {
		return travel_schedule_end;
	}

	public void setTravel_schedule_end(String travel_schedule_end) {
		this.travel_schedule_end = travel_schedule_end;
	}

	public String getTravel_wdate() {
		return travel_wdate;
	}

	public void setTravel_wdate(String travel_wdate) {
		this.travel_wdate = travel_wdate;
	}

	public String getTravel_epilogue() {
		return travel_epilogue;
	}

	public void setTravel_epilogue(String travel_epilogue) {
		this.travel_epilogue = travel_epilogue;
	}

	public String getTravel_hashtag() {
		return travel_hashtag;
	}

	public void setTravel_hashtag(String travel_hashtag) {
		this.travel_hashtag = travel_hashtag;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

}
