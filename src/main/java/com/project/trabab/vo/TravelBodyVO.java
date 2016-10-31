package com.project.trabab.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TravelBodyVO {
	private String travel_no;
	private String travel_latitude;
	private String travel_longitude;
	private String travel_content;
	private String travel_location_name;
	private String travel_address;
	private String travel_step;
	private List<TravelImageVO> travel_image_list;

	private List<MultipartFile> files;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
	public String getTravel_no() {
		return travel_no;
	}

	public void setTravel_no(String travel_no) {
		this.travel_no = travel_no;
	}

	public String getTravel_latitude() {
		return travel_latitude;
	}

	public void setTravel_latitude(String travel_latitude) {
		this.travel_latitude = travel_latitude;
	}

	public String getTravel_longitude() {
		return travel_longitude;
	}

	public void setTravel_longitude(String travel_longitude) {
		this.travel_longitude = travel_longitude;
	}

	public String getTravel_content() {
		return travel_content;
	}

	public void setTravel_content(String travel_content) {
		this.travel_content = travel_content;
	}

	public String getTravel_location_name() {
		return travel_location_name;
	}

	public void setTravel_location_name(String travel_location_name) {
		this.travel_location_name = travel_location_name;
	}

	public String getTravel_address() {
		return travel_address;
	}

	public void setTravel_address(String travel_address) {
		this.travel_address = travel_address;
	}

	public String getTravel_step() {
		return travel_step;
	}

	public void setTravel_step(String travel_step) {
		this.travel_step = travel_step;
	}

	public List<TravelImageVO> getTravel_image_list() {
		return travel_image_list;
	}

	public void setTravel_image_list(List<TravelImageVO> travel_image_list) {
		this.travel_image_list = travel_image_list;
	}




}