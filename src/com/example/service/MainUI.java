

package com.example.service;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.Booking;
import com.example.business.Room;
import com.example.business.User;
import com.example.command.Controller;

public class MainUI {
	public MainUI(){
	
	}
		
	public String login(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		Boolean success = false;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		success = controller.login(username, password);
		HttpSession session = request.getSession();
		if(success){
			String permission = checkPermission(username);
			session.setAttribute("username", username);
			session.setAttribute("priv", permission);
			switch (permission) {
			case "user":
				forwardToJsp = "/homepage_onlineuser.jsp";	 //user page
				break;
				
			case "receptionist":
				forwardToJsp = "/homepage_reception.jsp";//receptionist page
				break;
				
			case "admin":
				forwardToJsp = "/homepage_admin.jsp";//admin page
				break;
			
			default: 
				forwardToJsp = "/homepage_main.jsp";
				break;
			}	
		}
		else{
			session.setAttribute("username", null);
			forwardToJsp = "/homepage_main.jsp";  //not logged in page
		}
		
		return forwardToJsp;
	}
	
	public String checkPermission(String username){
		Controller controller = new Controller();
		String permission = null;
		permission = controller.checkPermission(username);
		return permission;
	}
	
	public String logout(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";		
		controller.logout();
		HttpSession session = request.getSession();
		session.setAttribute("username", null);
		session.setAttribute("priv", null);
		forwardToJsp = "/homepage_main.jsp";
		return forwardToJsp;
	}
	
	public String register(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String regUsername = request.getParameter("regUsername");
		String regPassword = request.getParameter("regPassword");
		String regConfirmPassword = request.getParameter("regConfirmPassword");
		String regFirstName = request.getParameter("regFirstName");
		String regLastName = request.getParameter("regLastName");
		String regBirth = request.getParameter("regBirth");
		String regEmail = request.getParameter("regEmail");
		String regContactNumber = request.getParameter("regContactNumber");
		controller.register(regUsername, regPassword, regConfirmPassword, regFirstName, regLastName, regBirth, regEmail, regContactNumber);
		forwardToJsp = "/homepage_main.jsp";
		return forwardToJsp;
	}
	
	public String addStaff(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String regUsername = request.getParameter("regUsername");
		String regPassword = request.getParameter("regPassword");
		String regConfirmPassword = request.getParameter("regConfirmPassword");
		String registerEmail = request.getParameter("registerEmail");
		String regDOB = request.getParameter("regDOB");
		String regContactNumber = request.getParameter("regContactNumber");
		String regPriv = request.getParameter("regPriv");
		controller.addStaff(regUsername, regPassword, regConfirmPassword, registerEmail, regDOB, regContactNumber, regPriv);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}
	
	public String removeUser(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		controller.removeUser(username, password);
		HttpSession session = request.getSession();
		session.setAttribute("username", null);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}//End remove user
	
	public String searchRoom(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		HttpSession session = request.getSession();
		String forwardToJsp = "";
		//Set varables to null;
		java.sql.Date checkInDate = null;
		java.sql.Date checkOutDate = null;
		String checkInString = null;
		String checkOutString = null;
		String roomType = null;
		String numOfPeople = null;
		String userName = null;
		//Get string values from frontend form
		checkInString = request.getParameter("checkIn");		
		checkOutString = request.getParameter("checkOut");
		roomType = request.getParameter("bedType");
		numOfPeople = request.getParameter("numOfPeople");
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1 = null;;
		try {
			date1 = sdf1.parse(checkInString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 checkInDate = new java.sql.Date(date1.getTime()); 
		java.util.Date date2 = null;
		try {
			date2 = sdf1.parse(checkOutString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		checkOutDate = new java.sql.Date(date2.getTime());

		//Get list of rooms from controller
		List<Room> rooms = controller.searchRoom(checkInDate, checkOutDate, roomType, numOfPeople);
		//TEMP BOOKING OBJECT
		if(session.getAttribute("username")!=null){
			userName = (String) session.getAttribute("username");
		}
		Booking booking = new Booking(userName, checkInDate, checkOutDate);
		
		//Send list of rooms to frontend
		
		session.setAttribute("rooms", rooms);
		session.setAttribute("booking", booking);
		
		String permission = null;
		if(session.getAttribute("priv")!=null){
			permission = (String) session.getAttribute("priv");
		}
		if(permission!=null){
			switch (permission) {
			case "user":
				forwardToJsp = "/reservation_onlineuser.jsp";	 //user page
				break;
				
			case "receptionist":
				forwardToJsp = "/reservation_reception.jsp";//receptionist page
				break;
				
			case "admin":
				forwardToJsp = "/reservation_admin.jsp";//admin page
				break;
			
			default: 
				forwardToJsp = "/reservation_nouser.jsp";
				break;
			}
		}
		else{
			forwardToJsp = "/reservation_nouser.jsp";
		}
		return forwardToJsp;
	}
	
	public String getRooms(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		HttpSession session = request.getSession();
		String forwardToJsp = "";
		//Get list of rooms from controller
		List<Room> rooms = controller.getRooms();
		session.setAttribute("rooms", rooms);
		String permission = null;
		if(session.getAttribute("priv")!=null){
			permission = (String) session.getAttribute("priv");
		}
		if(permission!=null){
			switch (permission) {
			case "user":
				forwardToJsp = "/homepage_onlineuser.jsp";	 //user page
				break;
				
			case "receptionist":
				forwardToJsp = "/homepage_reception.jsp";//receptionist page
				break;
				
			case "admin":
				forwardToJsp = "/manageRoom.jsp";//admin page
				break;
			
			default: 
				forwardToJsp = "/homepage_main.jsp";
				break;
			}
		}
		else{
			forwardToJsp = "/homepage_main.jsp";
		}
		return forwardToJsp;
	}

	public String removeRoom(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String roomNo = null;
		roomNo = request.getParameter("roomNo");
		controller.removeRoom(roomNo);
		forwardToJsp = "/manageRoom.jsp";
		return forwardToJsp;
	}
	
	public String addRoom(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String addRoomNumber = request.getParameter("addRoomNumber");
		String bedType = request.getParameter("bedType");
		String smoking = request.getParameter("smoking");
		String addRoomPrice = request.getParameter("addRoomPrice");
		controller.addRoom(addRoomNumber,bedType,smoking,addRoomPrice);
		forwardToJsp = "/manageRoom.jsp";
		return forwardToJsp;
	}

	public String ammendRoom(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String roomNo = request.getParameter("roomNo");
		String bedType = request.getParameter("bedType");
		String smoking = request.getParameter("smoking");
		String price = request.getParameter("price");
		controller.ammendRoom(roomNo,bedType,smoking,price);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}
	//for checkin checkout page
	public String getBooking(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		HttpSession session = request.getSession();
		String forwardToJsp = "";
		List<Booking> bookings = controller.getBooking();
		session.setAttribute("bookings", bookings);	
		forwardToJsp = "/checkInOut_reception.jsp";
		return forwardToJsp;
	}
	//for user
	public String getBookings(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		HttpSession session = request.getSession();
		String forwardToJsp = "";
		String username = null;
		username = (String) session.getAttribute("username");
		List<Booking> bookings = controller.getBooking(username);
		session.setAttribute("bookings", bookings);	
		forwardToJsp = "/account_onlineuser.jsp";
		return forwardToJsp;
	}
	
	public String invoice(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		HttpSession session = request.getSession();
		String forwardToJsp = "";
		String userName = "";
		//ROOM
		String roomNo = "";
		roomNo = request.getParameter("invoice");		
		Room room = controller.searchRoom(roomNo);
		session.setAttribute("room", room);
		
		if(session.getAttribute("username")!=null){
			userName = (String) session.getAttribute("username");
		}
		User user = controller.getUser(userName);
		
		//Send room info to front end
		session.setAttribute("room", room);
		session.setAttribute("user", user);
		
		String permission = null;
		if(session.getAttribute("priv")!=null){
			permission = (String) session.getAttribute("priv");
		}
		if(permission!=null){
			switch (permission) {
			case "user":
				forwardToJsp = "/invoice.jsp";	 //user page
				break;
				
			case "receptionist":
				forwardToJsp = "/invoice_reception.jsp";//receptionist page
				break;
				
			case "admin":
				forwardToJsp = "/invoice_admin.jsp";//admin page TODO: make invoice admin page
				break;
			
			default: 
				forwardToJsp = "/please_login.jsp";
				break;
			}
		}
		else{
			forwardToJsp = "/invoice_reception.jsp";
		}
		return forwardToJsp;
	}

	public String makeBooking(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		HttpSession session = request.getSession();
		Booking booking = (Booking) session.getAttribute("booking");
		Room room = (Room) session.getAttribute("room");
		booking.setRoom(room.getRoomNo());
		controller.makeBooking(booking);
		forwardToJsp = "/homepage_main.jsp";
		return forwardToJsp;
	}
	
	public String cancelBooking(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		HttpSession session = request.getSession();
		String bookingId = null;
		bookingId = request.getParameter("cancelBooking");
		controller.cancelBooking(bookingId);
		forwardToJsp = "/account_onlineuser.jsp";
		return forwardToJsp;
	}

	public Date convertDate(String temp)
	{
		Date da=new Date(0);
		
		da.setYear(temp.indexOf(4,7));
		da.setMonth(temp.lastIndexOf(2,3));
		da.setDate(temp.indexOf(0,1));
		return da;
	}
	public String checkIn(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String referenceNo = null;
		String forwardToJsp = "";	
		referenceNo = request.getParameter("refNo");
		controller.checkIn(referenceNo);
		forwardToJsp = "/checkInOut_reception.jsp";
		return forwardToJsp;
	}
	public String checkOut(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String referenceNo = null;
		String forwardToJsp = "";	
		referenceNo = request.getParameter("refNo");
		controller.checkOut(referenceNo);
		forwardToJsp = "/checkInOut_reception.jsp";
		return forwardToJsp;
	}
}