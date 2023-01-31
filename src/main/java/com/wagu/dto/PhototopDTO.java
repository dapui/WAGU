package com.wagu.dto;

public class PhototopDTO {
	private int itemID;
	private int reviewID;
	private String image;
	
	public PhototopDTO(int itemID, int reviewID, String image) {
		this.itemID = itemID;
		this.reviewID = reviewID;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	

}
