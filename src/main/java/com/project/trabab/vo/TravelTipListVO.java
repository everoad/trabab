package com.project.trabab.vo;

import java.util.ArrayList;

public class TravelTipListVO {

	private int startBlock;
	private int endBlock;
	private int blockPerPage;
	private int cpage;
	private int totalPage;
	private int recordPerPage;
	private int totalRecordNum;
	private String cUrl;
	private String sUrl;
	private ArrayList<TravelTipVO> traveltipVoList;
	private int countNum;


	public int getCountNum() {
		return countNum;
	}

	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getBlockPerPage() {
		return blockPerPage;
	}

	public void setBlockPerPage(int blockPerPage) {
		this.blockPerPage = blockPerPage;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public int getTotalRecordNum() {
		return totalRecordNum;
	}

	public void setTotalRecordNum(int totalRecordNum) {
		this.totalRecordNum = totalRecordNum;
	}

	public String getcUrl() {
		return cUrl;
	}

	public void setcUrl(String cUrl) {
		this.cUrl = cUrl;
	}

	public String getsUrl() {
		return sUrl;
	}

	public void setsUrl(String sUrl) {
		this.sUrl = sUrl;
	}

	public ArrayList<TravelTipVO> getTraveltipVoList() {
		return traveltipVoList;
	}

	public void setTraveltipVoList(ArrayList<TravelTipVO> traveltipVoList) {
		this.traveltipVoList = traveltipVoList;
	}

}
