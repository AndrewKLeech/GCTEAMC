
package com.example.business;

import java.util.ArrayList;
import java.sql.Date;

public class Booking {

	private String userId;
	private String roomNo;
	private String referenceNo;
	private String reserveTime;
	private Date arrDate;
	private Date depDate;
	private String checkInStatus;
	public Booking(String userId,String roomNo,String referenceNo,String reserveTime,Date arrDate,Date depDate,String checkInStatus)
	{
		this.userId=userId;
		this.roomNo=roomNo;
		this.referenceNo=referenceNo;
		this.reserveTime=reserveTime;
		this.arrDate=arrDate;
		this.depDate=depDate;
		this.checkInStatus=checkInStatus;
	}

	public Date getarrDate()
	{
		return this.arrDate;
	}
	public Date getdepDate()
	{
		return this.depDate;
	}
	public String getuserId()
	{
		return userId;
	}
	public String roomNo()
	{
		return this.roomNo;
	}
}