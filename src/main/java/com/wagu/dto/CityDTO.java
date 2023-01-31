package com.wagu.dto;

public class CityDTO {
	private String city;
	private String images;
	private String[] imagesArr;
	private String keyword;
	private String title;
	private String content;
	
	public CityDTO() { }
	public CityDTO(String city, String images, String keyword, String title, String content) {
		this.city = city;
		this.images = images;
		this.imagesArr = images.split("___");	// images 문자열을 '___' 기준으로 배열에 담기.
		this.keyword = keyword;
		this.title = title;
		this.content = content;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getImage() {
		return images;
	}
	public void setImage(String image) {
		this.images = image;
	}
	public String[] getImagesArr() {
		return imagesArr;
	}
	public void setImagesArr(String[] imagesArr) {
		this.imagesArr = imagesArr;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
