package com.wagu.dto;

public class ReviewMainDTO {
	private int reviewID;
	private int itemID;
	private int memberID;
	private String writeDate;
	private String bestreview;
	private int score;
	private String content;
	private String images;
	private String[] imagesArr;
	private int likes;
	private String comments;
	private String commentDate;
	
	public ReviewMainDTO(int reviewID, int itemID, int memberID, String writeDate, String bestreview, int score, String content) {
		this.reviewID = reviewID;
		this.itemID = itemID;
		this.memberID = memberID;
		this.writeDate = writeDate;
		this.bestreview = bestreview;
		this.score = score;
		this.content = content;
//		this.imagesArr=images.split("___");
	}
	
	public int getReviewID() {
		return reviewID;
	}

	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	
	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getBestreview() {
		return bestreview;
	}

	public void setBestreview(String bestreview) {
		this.bestreview = bestreview;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	
	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}
	
	public String[] getImageArr() {
		return imagesArr;
	}

	public void setImagesArr(String[] imagesArr) {
		this.imagesArr = imagesArr;
	}
	
	
}
