package com.wagu.dto;

public class WishDTO {
	private int memberID;
	private int goodsID;
	private String status;
	
	public WishDTO(int memberID, int goodsID, String status) {
		this.memberID = memberID;
		this.goodsID = goodsID;
		this.status = status;
	}
	
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public int getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(int goodsID) {
		this.goodsID = goodsID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
