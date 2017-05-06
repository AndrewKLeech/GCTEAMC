

package com.example.service;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		String regGender = request.getParameter("regGender");
		String regBirth = request.getParameter("regBirth");
		String regEmail = request.getParameter("regEmail");
		String regContactNumber = request.getParameter("regContactNumber");
		controller.register(regUsername, regPassword, regConfirmPassword, regFirstName, regLastName, regGender, regBirth, regEmail, regContactNumber);
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
		String forwardToJsp = "";	
		String checkInDate = null;
		String checkOutDate = null;
		String roomType = null;
		String numOfPeople = null;
		checkInDate = request.getParameter("checkInDate");		//TODO:
		checkOutDate = request.getParameter("checkOutDate");		//Change according to front end
		roomType = request.getParameter("bedType");
		numOfPeople = request.getParameter("numOfPeople");
		controller.searchRoom(checkInDate, checkOutDate, roomType, numOfPeople);
		forwardToJsp = "/reservation_nouser.jsp";
		return forwardToJsp;
	}

	public String removeRoom(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String roomNo = request.getParameter("roomNo");
		controller.removeRoom(roomNo);
		forwardToJsp = "/homepage.html";
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

	public String getBooking(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String userId = null;
		String referenceNo=null;
		userId=request.getParameter("userId");
		referenceNo= request.getParameter("referenceNo");
		controller.getBooking(userId,referenceNo);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}
	
	public String searchAvailableRoom(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String checkInDatetemp = request.getParameter("checkInDate");
		String checkOutDatetemp = request.getParameter("checkOutDate");
		String roomType = request.getParameter("roomType");
		Date checkInDate=convertDate(checkInDatetemp);
		Date checkOutDate=convertDate(checkOutDatetemp);
		controller.searchAvailableRoom(checkInDate,checkOutDate,roomType);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}

	public String makeBooking(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String userId = request.getParameter("userId");
		String roomNo = request.getParameter("roomNo");
		String referenceNo = request.getParameter("referenceNo");
		String reserveTime = request.getParameter("reserveTime");
		String arrDatetemp =request.getParameter("checkIn");
		String depDatetemp =request.getParameter("checkOut");
		Date arrDate=convertDate(arrDatetemp);//need to convert string to Date;
		Date depDate=convertDate(depDatetemp);//need to convert string to Date;
		controller.makeBooking(userId,roomNo,referenceNo,reserveTime,arrDate,depDate,"not arrived");
		forwardToJsp = "/homepage.html";
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
		String forwardToJsp = "";	
		
		String referenceNo = request.getParameter("referenceNo");
	
		controller.checkIn(referenceNo);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}
	public String checkOut(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		
		String referenceNo = request.getParameter("referenceNo");
	
		controller.checkIn(referenceNo);
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}
}