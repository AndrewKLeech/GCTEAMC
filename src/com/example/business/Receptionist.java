package com.example.business;

public class Receptionist extends User{

	public Receptionist(String fName,String lName,String userId,String password,String birthday)
	{
		this.userId=userId;
		this.fName=fName;
		this.lName=lName;
		this.password=password;
		this.birthday=birthday;	
	}
}
