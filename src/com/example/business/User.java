
package com.example.business;

public class User {

	protected String fName;
	protected String lName;
	protected String userId;
	protected String password;
	protected String birthday;
	protected String gender;
	
	public User(){}
	public User(String fName,String lName,String userId,String password,String birthday,String gender)
	{
		this.fName=fName;
		this.lName=lName;
		this.userId=userId;
		this.password=password;
		this.birthday=birthday;	
		this.gender=gender;
	}
	public String getuserId()
	{
		return this.userId;
	}
	public String getfName()
	{
		return this.fName;
	}
	public String getlName()
	{
		return this.lName;
	}
	public String getpassword()
	{
		return this.password;
	}
	public String getbirthday()
	{
		return this.birthday;
	}
	public String getgender()
	{
		return this.gender;
	}
	
}