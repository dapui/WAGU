package com.wagu.dto;

public class HotPlaceDTO {
	private String city;
	private String images;
	private String[] imagesArr;
	
	public HotPlaceDTO(String city, String images) {
		this.city = city;
		this.images = images;
		this.imagesArr = images.split("___");
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
