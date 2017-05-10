
package com.example.command;

import com.example.dao.BookingDao;
import com.example.dao.RoomDao;
import com.example.dao.UserDao;
import com.example.exceptions.DaoException;
import com.example.business.Booking;
import com.example.business.Room;
import com.example.business.User;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controller {
	
	UserDao userdao = new UserDao();
	RoomDao roomdao = new RoomDao();
	BookingDao bookingdao= new BookingDao();
	
	public boolean login(String username, String password){
		Boolean success = false;
		try {			
			success = userdao.login(username, password);
			
		} 
		catch (DaoException e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}//End login
	
	
	public String checkPermission(String username){
		String permission = null;
		try {			
			permission = userdao.checkPermission(username);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return permission;
	}//end checkPermission
	
	public User getUser(String userName){
		User user = null;
		try {			
			user = userdao.getUser(userName);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean logout(){
		return true;
	}//End logout
	
	public boolean register(String regUsername,String regPassword,String regConfirmPassword,String regFirstName,String regLastName, String regBirth, String regEmail, String regContactNumber){
		try {			
			userdao.register(regUsername, regPassword, regConfirmPassword, regFirstName, regLastName, regBirth, regEmail, regContactNumber);
			return true;
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}//End register
	
	public boolean addStaff(String regUsername, String regPassword, String regConfirmPassword, String registerEmail, String regDOB, String regContactNumber, String regPriv){
		try {			
			userdao.addStaff(regUsername, regPassword, regConfirmPassword, registerEmail, regDOB, regContactNumber, regPriv);
			return true;
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}//End addStaff
	
	
	
	public boolean removeUser(String username){
		Boolean success = false;
		try {			
			success = userdao.removeUser(username);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return success;
	}//End login
	
	
	
	public ArrayList<Room> searchRoom(Date checkInDate, Date checkOutDate, String roomType, String numOfPeople){
		
		try {			
			return roomdao.searchRoom(checkInDate, checkOutDate, roomType, numOfPeople);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<User> getAllUsers(){
		
		try {			
			return userdao.getAllUsers();
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return null;
		}
	}
	
public ArrayList<Room> getRooms(){
		
		try {			
			return roomdao.getRooms();
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Room searchRoom(String roomNo){
		
		try {			
			return roomdao.searchRoom(roomNo);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean removeRoom(String roomNo){
		
		try {
			return roomdao.removeRoom(roomNo);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean addRoom(String roomNo,String bedType,String smoking, String price){
		
		try {			
			return roomdao.addRoom(roomNo,bedType,smoking,price);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean ammendRoom(String roomNo,String bedType,String smoking, String price){
		
		try {			
			return roomdao.ammendRoom(roomNo,bedType,smoking,price);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}
	//for check in check out page
	public ArrayList<Booking> getBooking()
	{
		try {			
			return bookingdao.getBooking();
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return null;
	}
	// for user account page
	public ArrayList<Booking> getBooking(String username)
	{
		try {			
			return bookingdao.getBooking(username);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean makeBooking(Booking booking) 
	{
		
		
		String userId = null;
		String roomNo = null;
		Date arrDate = null;
		Date depDate = null;
		userId = booking.getuserId();
		roomNo = booking.roomNo();
		arrDate = booking.getarrDate();
		depDate = booking.getdepDate();
		
		try {			
			return bookingdao.makeBooking(userId,roomNo,arrDate,depDate);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean cancelBooking(String bookingId)
	{
		try {			
			return bookingdao.cancelBooking(bookingId);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean checkIn(String bookingId)
	{
		try {			
			return bookingdao.checkIn(bookingId);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean checkOut(String bookingId)
	{
		try {			
			return bookingdao.checkOut(bookingId);
		} 
		catch (DaoException e) {
			e.printStackTrace();
			return false;
		}
	}

}