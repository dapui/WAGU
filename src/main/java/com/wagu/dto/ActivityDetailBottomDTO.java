package com.wagu.dto;

public class ActivityDetailBottomDTO {
	private int ticket_id;
	private String checks;
	private String point;
	private float score;
	private int best_review;
	private int review_count;
	private String program;
	private String include;
	private String exclude;
	private String how_to_use;
	private String detail_notice;
	private String caution;
	private String refund;
	private String location;
	private String longitude;
	private String latitude;
	
	public ActivityDetailBottomDTO(int ticket_id, String checks, String point, float score, int best_review,
			int review_count, String program, String include, String exclude, String how_to_use, String detail_notice,
			String caution, String refund, String location, String longitude, String latitude) {
		this.ticket_id = ticket_id;
		this.checks = checks;
		this.point = point;
		this.score = score;
		this.best_review = best_review;
		this.review_count = review_count;
		this.program = program;
		this.include = include;
		this.exclude = exclude;
		this.how_to_use = how_to_use;
		this.detail_notice = detail_notice;
		this.caution = caution;
		this.refund = refund;
		this.location = location;
		this.longitude = longitude;
		this.latitude = latitude;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}

	public String getChecks() {
		return checks;
	}

	public void setChecks(String checks) {
		this.checks = checks;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getBest_review() {
		return best_review;
	}

	public void setBest_review(int best_review) {
		this.best_review = best_review;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public String getInclude() {
		return include;
	}

	public void setInclude(String include) {
		this.include = include;
	}

	public String getExclude() {
		return exclude;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}

	public String getHow_to_use() {
		return how_to_use;
	}

	public void setHow_to_use(String how_to_use) {
		this.how_to_use = how_to_use;
	}

	public String getDetail_notice() {
		return detail_notice;
	}

	public void setDetail_notice(String detail_notice) {
		this.detail_notice = detail_notice;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
}