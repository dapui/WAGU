package com.wagu.dto;

public class PhotoReviewDTO {
	private int itemID;
	private int reviewID;
	private String images;
	private String[] imagesArr;
	
	public PhotoReviewDTO(int itemID, int reviewID, String images) {
		this.itemID = itemID;
		this.reviewID = reviewID;
		this.imagesArr = images.split("___");
	}
	
	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	
	public int getReviewID() {
		return reviewID;
	}

	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
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
	


}
