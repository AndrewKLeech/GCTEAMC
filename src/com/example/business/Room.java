
package com.example.business;

import java.util.ArrayList;

import com.example.dao.RoomDao;

public class Room {

	private String roomNo = null;
	private String roomType = null;
	private String isSmoking = null;
	private String price =null;
	public Room(String roomNo, String roomType, String isSmoking,String price){
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.isSmoking = isSmoking;
		this.price = price;
	}
	public void setroomNo(String roomNo){
	
		this.roomNo=roomNo;
	}
	public String getRoomNo(){
		return roomNo;
	}
	public String getRoomType(){
		return roomType;
	}
	public String getIsSmoking(){
		return isSmoking;
	}
	public String getprice(){
		return price;
	}
}