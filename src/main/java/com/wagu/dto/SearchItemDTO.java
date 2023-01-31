package com.wagu.dto;

public class SearchItemDTO {
	private int itemID;
	private String itemName;
	
	public SearchItemDTO(int itemID, String itemName) {
		this.itemID = itemID;
		this.itemName = itemName;
	}
	
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public String getItemName() {
		return itemName;
	}
	public void setGoodsName(String itemName) {
		this.itemName = itemName;
	}
}
