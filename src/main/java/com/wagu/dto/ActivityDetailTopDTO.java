package com.wagu.dto;

public class ActivityDetailTopDTO {
	int ticket_id;
	String images;
	String[] image;
	int best;
	String video_url;
	String city;
	String goods_name;
	String category;
	int price;
	float discount;
	int dis_price;
	float score;
	String available;
	int coupon;
	
	public ActivityDetailTopDTO(int ticket_id, String images, int best, String video_url, String city,
			String goods_name, String category, int price, float discount, float score, String available, int coupon) {
		this.ticket_id = ticket_id;
		this.images = images;
		this.image = images.split("___");
		this.best = best;
		this.video_url = video_url;
		this.city = city;
		this.goods_name = goods_name;
		this.category = category;
		this.price = price;
		this.discount = discount;
		this.dis_price = (int)(price*(1.0f-discount));
		this.score = score;
		this.available = available;
		this.coupon = coupon;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String[] getImage() {
		return image;
	}

	public void setImage(String[] image) {
		this.image = image;
	}

	public int getBest() {
		return best;
	}

	public void setBest(int best) {
		this.best = best;
	}

	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getDis_price() {
		return dis_price;
	}

	public void setDis_price(int dis_price) {
		this.dis_price = dis_price;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public int getCoupon() {
		return coupon;
	}

	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	
	
}