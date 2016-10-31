package com.project.trabab.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FoodVO {

	private String food_no;
	private String food_subject;
	private String food_content;
	private String food_wdate;
	private String food_hit;
	private String food_like_cnt;
	private String food_comment_cnt;
	private String food_schedule;
	private String food_latitude;
	private String food_longitude;
	private String food_location_name;
	private String food_address;
	private String food_lvtasty;
	private String food_lvtraffic;
	private String food_lvservice;
	private String food_lvprice;
	private String food_lvhonbab;
	private String food_lv_average;
	private String food_image;
	private String food_hashtag;
	private List<FoodImageVO> food_image_list;

	private ArrayList<String> food_hashtag_list;

	private String member_no;
	private String member_nickname;
	private String member_email;

	private List<MultipartFile> files;

	public ArrayList<String> getFood_hashtag_list() {
		return food_hashtag_list;
	}

	public void setFood_hashtag_list(ArrayList<String> food_hashtag_list) {
		this.food_hashtag_list = food_hashtag_list;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getFood_lv_average() {
		return food_lv_average;
	}

	public void setFood_lv_average(String food_lv_average) {
		this.food_lv_average = food_lv_average;
	}

	public List<FoodImageVO> getFood_image_list() {
		return food_image_list;
	}

	public void setFood_image_list(List<FoodImageVO> food_image_list) {
		this.food_image_list = food_image_list;
	}

	public String getFood_hashtag() {
		return food_hashtag;
	}

	public void setFood_hashtag(String food_hashtag) {
		this.food_hashtag = food_hashtag;
	}

	public String getFood_comment_cnt() {
		return food_comment_cnt;
	}

	public void setFood_comment_cnt(String food_comment_cnt) {
		this.food_comment_cnt = food_comment_cnt;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
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

	public String getFood_no() {
		return food_no;
	}

	public void setFood_no(String food_no) {
		this.food_no = food_no;
	}

	public String getFood_subject() {
		return food_subject;
	}

	public void setFood_subject(String food_subject) {
		this.food_subject = food_subject;
	}

	public String getFood_content() {
		return food_content;
	}

	public void setFood_content(String food_content) {
		this.food_content = food_content;
	}

	public String getFood_wdate() {
		return food_wdate;
	}

	public void setFood_wdate(String food_wdate) {
		this.food_wdate = food_wdate;
	}

	public String getFood_hit() {
		return food_hit;
	}

	public void setFood_hit(String food_hit) {
		this.food_hit = food_hit;
	}

	public String getFood_like_cnt() {
		return food_like_cnt;
	}

	public void setFood_like_cnt(String food_like_cnt) {
		this.food_like_cnt = food_like_cnt;
	}

	public String getFood_schedule() {
		return food_schedule;
	}

	public void setFood_schedule(String food_schedule) {
		this.food_schedule = food_schedule;
	}

	public String getFood_latitude() {
		return food_latitude;
	}

	public void setFood_latitude(String food_latitude) {
		this.food_latitude = food_latitude;
	}

	public String getFood_longitude() {
		return food_longitude;
	}

	public void setFood_longitude(String food_longitude) {
		this.food_longitude = food_longitude;
	}

	public String getFood_location_name() {
		return food_location_name;
	}

	public void setFood_location_name(String food_location_name) {
		this.food_location_name = food_location_name;
	}

	public String getFood_address() {
		return food_address;
	}

	public void setFood_address(String food_address) {
		this.food_address = food_address;
	}

	public String getFood_lvtasty() {
		return food_lvtasty;
	}

	public void setFood_lvtasty(String food_lvtasty) {
		this.food_lvtasty = food_lvtasty;
	}

	public String getFood_lvtraffic() {
		return food_lvtraffic;
	}

	public void setFood_lvtraffic(String food_lvtraffic) {
		this.food_lvtraffic = food_lvtraffic;
	}

	public String getFood_lvservice() {
		return food_lvservice;
	}

	public void setFood_lvservice(String food_lvservice) {
		this.food_lvservice = food_lvservice;
	}

	public String getFood_lvprice() {
		return food_lvprice;
	}

	public void setFood_lvprice(String food_lvprice) {
		this.food_lvprice = food_lvprice;
	}

	public String getFood_lvhonbab() {
		return food_lvhonbab;
	}

	public void setFood_lvhonbab(String food_lvhonbab) {
		this.food_lvhonbab = food_lvhonbab;
	}

	public String getFood_image() {
		return food_image;
	}

	public void setFood_image(String food_image) {
		this.food_image = food_image;
	}

}
