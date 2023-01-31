package com.wagu.dto;

public class KorailTimeTableDTO {
	private String trainType;
	private int trainNum;
	private String startTime;
	private String arriveTime;
	private String timeTaken;
	private int sumPrice;
	
	public KorailTimeTableDTO(String trainType, int trainNum, String startTime, String arriveTime, String timeTaken,
			int sumPrice) {
		super();
		this.trainType = trainType;
		this.trainNum = trainNum;
		this.startTime = startTime;
		this.arriveTime = arriveTime;
		this.timeTaken = timeTaken;
		this.sumPrice = sumPrice;
	}
	public String getTrainType() {
		return trainType;
	}
	public void setTrainType(String trainType) {
		this.trainType = trainType;
	}
	public int getTrainNum() {
		return trainNum;
	}
	public void setTrainNum(int trainNum) {
		this.trainNum = trainNum;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}
	public String getTimeTaken() {
		return timeTaken;
	}
	public void setTimeTataken(String timeTaken) {
		this.timeTaken = timeTaken;
	}
	public int getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}
	
	
	
	
}
