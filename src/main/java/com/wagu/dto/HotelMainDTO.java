package com.wagu.dto;

public class HotelMainDTO {
	private String city;
	private int hotelId;
	private String hotelName;
	private String hotelLocation;
	private String hotelStar;
	private String images;
	private String[] imagesArr;
	private int price;
	private String details;
	
	
	public HotelMainDTO() {}


	public HotelMainDTO(String city, int hotelId, String hotelName, String hotelLocation, String hotelStar,
			String images, int price, String details) {
		this.city = city;
		this.hotelId = hotelId;
		this.hotelName = hotelName;
		this.hotelLocation = hotelLocation;
		this.hotelStar = hotelStar;
		this.imagesArr = images.split("___");
		this.price = price;
		this.details = details;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public int getHotelId() {
		return hotelId;
	}


	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}


	public String getHotelName() {
		return hotelName;
	}


	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}


	public String getHotelLocation() {
		return hotelLocation;
	}


	public void setHotelLocation(String hotelLocation) {
		this.hotelLocation = hotelLocation;
	}


	public String getHotelStar() {
		return hotelStar;
	}


	public void setHotelStar(String hotelStar) {
		this.hotelStar = hotelStar;
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

	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}
	

	
	
}
