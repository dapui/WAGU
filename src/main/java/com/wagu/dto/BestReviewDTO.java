package com.wagu.dto;

public class BestReviewDTO {
	private int itemID;
	private String images; 
	private String[] imagesArr;
	private String goodsName;
	private String memberName;
	private String writeDate;
	private int score;
	
	public BestReviewDTO(int itemID, String images, String goodsName, String memberName, String writeDate, int score) {
		this.itemID = itemID;
		this.images = images;
		this.imagesArr = images.split("___");
		this.goodsName = goodsName;
		this.memberName = memberName;
		this.writeDate = writeDate;
		this.score = score;
	}
	
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String[] getImagesArr() {
		return imagesArr;
	}
	public void setImagesArr(String[] imagesArr) {
		this.imagesArr = imagesArr;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
