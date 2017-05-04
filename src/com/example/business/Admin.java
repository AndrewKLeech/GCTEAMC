package com.example.business;

public class Admin extends User{

	public Admin(String fName,String lName,String userId,String password,String birthday)
	{
		this.userId=userId;
		this.fName=fName;
		this.lName=lName;
		this.password=password;
		this.birthday=birthday;	
	}
}
