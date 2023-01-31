package com.wagu.dto;

public class WeatherDTO {
	private String city;
	private String latitude;	// 위도
	private String longitude;	// 경도
	private String weather;
	private String icon;
	private double temp;
	
	public WeatherDTO() { }
	public WeatherDTO(String city, String latitude, String longitude, String weather, String icon, double temp) {
		this.city = city;
		this.latitude = latitude;
		this.longitude = longitude;
		this.weather = weather;
		this.icon = icon;
		this.temp = temp;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public double getTemp() {
		return temp;
	}
	public void setTemp(double temp) {
		this.temp = temp;
	}
}
