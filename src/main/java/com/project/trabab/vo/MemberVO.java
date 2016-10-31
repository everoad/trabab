package com.project.trabab.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String member_no;
	private String member_nickname;
	private String member_password;
	private String member_email;
	private String member_birthday;
	private String member_gender;
	private String member_profile_image;
	private String member_jdate;
	private String member_following_cnt;
	private String member_follower_cnt;
	private String member_out;
	private String member_power;

	private ArrayList<MemberVO> member_follower;
	private ArrayList<MemberVO> member_following;
	
	private MultipartFile file;

	public String getMember_power() {
		return member_power;
	}

	public void setMember_power(String member_power) {
		this.member_power = member_power;
	}

	public String getMember_out() {
		return member_out;
	}

	public void setMember_out(String member_out) {
		this.member_out = member_out;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getMember_following_cnt() {
		return member_following_cnt;
	}

	public void setMember_following_cnt(String member_following_cnt) {
		this.member_following_cnt = member_following_cnt;
	}

	public String getMember_follower_cnt() {
		return member_follower_cnt;
	}

	public void setMember_follower_cnt(String member_follower_cnt) {
		this.member_follower_cnt = member_follower_cnt;
	}

	public String getMember_jdate() {
		return member_jdate;
	}

	public void setMember_jdate(String member_jdate) {
		this.member_jdate = member_jdate;
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

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_profile_image() {
		return member_profile_image;
	}

	public void setMember_profile_image(String member_profile_image) {
		this.member_profile_image = member_profile_image;
	}

	public ArrayList<MemberVO> getMember_follower() {
		return member_follower;
	}

	public void setMember_follower(ArrayList<MemberVO> member_follower) {
		this.member_follower = member_follower;
	}

	public ArrayList<MemberVO> getMember_following() {
		return member_following;
	}

	public void setMember_following(ArrayList<MemberVO> member_following) {
		this.member_following = member_following;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

}
