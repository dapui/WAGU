package com.wagu.dto;

public class BestSellerDTO {
	private int itemID;
	private String images; 
	private String[] imagesArr;
	private String videoUrl;
	private String available;
	private String goodsName;
	private float score;
	private int reviewCnt;
	private int price;
	private float discount;
	private int discountRate;
	private String stringDiscountedPrice;
	
	public BestSellerDTO(int itemID, String images, String videoUrl, String available, String goodsName, float score, int reviewCnt, int price, float discount, String stringDiscountedPrice) {
		this.itemID = itemID;
		this.images = images;
		this.imagesArr = images.split("___");	
		this.videoUrl = videoUrl;
		this.available = available;
		this.goodsName = goodsName;
		this.score = score;
		this.reviewCnt = reviewCnt;
		this.price = price;
		this.discount = discount;
		this.discountRate = (int)(discount*100);
		this.stringDiscountedPrice = stringDiscountedPrice;
		
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
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public String getStringDiscountedPrice() {
		return stringDiscountedPrice;
	}
	public void setStringDiscountedPrice(String stringDiscountedPrice) {
		this.stringDiscountedPrice = stringDiscountedPrice;
	}
}
