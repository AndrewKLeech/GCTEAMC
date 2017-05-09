
package com.example.business;

public class User {

	protected String userId;
	protected String name;
	protected String email;
	protected String birthday;
	protected String privilege;
	
	public User(){}
	public User(String userId, String name, String email, String birthday, String privilege)
	{
		this.userId=userId;
		this.name=name;
		this.email=email;
		this.birthday=birthday;
		this.privilege=privilege;	
	}
	public String getuserId()
	{
		return this.userId;
	}
	public String getName()
	{
		return this.name;
	}
	public String getBirthday()
	{
		return this.birthday;
	}
	public String getEmail()
	{
		return this.email;
	}
	public String getPrivilege()
	{
		return this.privilege;
	}
	
}