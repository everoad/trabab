package com.project.trabab.vo;

import java.util.List;

public class PlanBodyVO {
	private String plan_schedule;
	private String plan_price;
	private String plan_traffic;
	private String plan_lodge_meal;
	private String plan_memo;
	private String plan_no;

	private String plan_latitude;
	private String plan_longitude;
	private String plan_address;
	private String plan_location_name;

	private List<PlanBodyVO> planBodyVoList;

	public List<PlanBodyVO> getPlanBodyVoList() {
		return planBodyVoList;
	}

	public void setPlanBodyVoList(List<PlanBodyVO> planBodyVoList) {
		this.planBodyVoList = planBodyVoList;
	}

	public String getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(String plan_no) {
		this.plan_no = plan_no;
	}

	public String getPlan_location_name() {
		return plan_location_name;
	}

	public void setPlan_location_name(String plan_location_name) {
		this.plan_location_name = plan_location_name;
	}

	public String getPlan_schedule() {
		return plan_schedule;
	}

	public void setPlan_schedule(String plan_schedule) {
		this.plan_schedule = plan_schedule;
	}

	public String getPlan_price() {
		return plan_price;
	}

	public void setPlan_price(String plan_price) {
		this.plan_price = plan_price;
	}

	public String getPlan_traffic() {
		return plan_traffic;
	}

	public void setPlan_traffic(String plan_traffic) {
		this.plan_traffic = plan_traffic;
	}

	public String getPlan_lodge_meal() {
		return plan_lodge_meal;
	}

	public void setPlan_lodge_meal(String plan_lodge_meal) {
		this.plan_lodge_meal = plan_lodge_meal;
	}

	public String getPlan_memo() {
		return plan_memo;
	}

	public void setPlan_memo(String plan_memo) {
		this.plan_memo = plan_memo;
	}

	public String getPlan_latitude() {
		return plan_latitude;
	}

	public void setPlan_latitude(String plan_latitude) {
		this.plan_latitude = plan_latitude;
	}

	public String getPlan_longitude() {
		return plan_longitude;
	}

	public void setPlan_longitude(String plan_longitude) {
		this.plan_longitude = plan_longitude;
	}

	public String getPlan_address() {
		return plan_address;
	}

	public void setPlan_address(String plan_address) {
		this.plan_address = plan_address;
	}

}
