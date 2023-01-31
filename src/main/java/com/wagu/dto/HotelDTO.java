package com.wagu.dto;

public class HotelDTO {
	private int hotelID; 
	private String images; 
	private String[] imagesArr;
	private String name;
	private String location;
	private int lowestPrice;
	
	public HotelDTO(int hotelID, String images, String name, String location, int lowestPrice) {
		this.hotelID = hotelID;
		this.images = images;
		this.imagesArr = images.split("___");	// images 문자열을 '___' 기준으로 배열에 담기.
		this.name = name;
		this.location = location;
		this.lowestPrice = lowestPrice;
	}
	
	public int getHotelID() {
		return hotelID;
	}
	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getLowestPrice() {
		return lowestPrice;
	}
	public void setLowestPrice(int lowestPrice) {
		this.lowestPrice = lowestPrice;
	}
}
