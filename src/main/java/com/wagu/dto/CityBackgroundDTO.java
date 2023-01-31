package com.wagu.dto;

public class CityBackgroundDTO {
	private String images;
	private String[] imagesArr;
	

	public CityBackgroundDTO() { }
	public CityBackgroundDTO(String images) {
		this.images = images;
		this.imagesArr = images.split("___");
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
