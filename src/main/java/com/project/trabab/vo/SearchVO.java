package com.project.trabab.vo;

import java.util.List;

public class SearchVO {

	private String stype;
	private String skey;
	private List<String> skeyList;
	private String traveltip_category_no;
	private String order;

	private int start;
	private int end;

	private String cpage;

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getCpage() {
		return cpage;
	}

	public void setCpage(String cpage) {
		this.cpage = cpage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getSkey() {
		return skey;
	}

	public void setSkey(String skey) {
		this.skey = skey;
	}

	public List<String> getSkeyList() {
		return skeyList;
	}

	public void setSkeyList(List<String> skeyList) {
		this.skeyList = skeyList;
	}

	public String getTraveltip_category_no() {
		return traveltip_category_no;
	}

	public void setTraveltip_category_no(String traveltip_category_no) {
		this.traveltip_category_no = traveltip_category_no;
	}

}
