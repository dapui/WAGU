package com.wagu.dto;

public class HotelDetailinfoDTO {
	private String amenities;
	private String[] amenitiesArr;
//	private String location;
//	private String latitude;
//	private String longitude;
	
	public HotelDetailinfoDTO(String amenities) {
		this.amenitiesArr = amenities.split("___");
	}


	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}

	public String[] getAmenitiesArr() {
		return amenitiesArr;
	}

	public void setAmenitiesArr(String[] amenitiesArr) {
		this.amenitiesArr = amenitiesArr;
	}
	
	
}
