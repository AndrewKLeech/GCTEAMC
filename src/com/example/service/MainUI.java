
package com.example.service;
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
			session.setAttribute("username", username);
			String permission = checkPermission(username);
			switch (permission) {
			case "user":
				forwardToJsp = "/homepage_onlineuser.jsp";	 //user page
				break;
				
			case "receptionist":
				forwardToJsp = "/homepage.jsp";//receptionist page
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
		forwardToJsp = "/homepage.html";
		return forwardToJsp;
	}
	
	public String register(HttpServletRequest request, HttpServletResponse repsonse){
		Controller controller = new Controller();
		String forwardToJsp = "";	
		String regUsername = request.getParameter("regUsername");
		String regPassword = request.getParameter("regPassword");
		String regConfirmPassword = request.getParameter("regConfirmPassword");
		String registerEmail = request.getParameter("registerEmail");
		String regDOB = request.getParameter("regDOB");
		String regContactNumber = request.getParameter("regContactNumber");
		controller.register(regUsername, regPassword, regConfirmPassword, registerEmail, regDOB, regContactNumber);
		forwardToJsp = "/homepage.html";
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
		String checkInDate = request.getParameter("checkInDate");		//TODO:
		String checkOutDate = request.getParameter("checkOutDate");		//Change according to front end
		String roomType = request.getParameter("roomType");
		//System.out.printf("regDOB: %s",regDOB);
		controller.searchRoom(checkInDate, checkOutDate, roomType);
		forwardToJsp = "/homepage.html";
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
		String roomNo = request.getParameter("roomNo");
		String bedType = request.getParameter("bedType");
		String smoking = request.getParameter("smoking");
		String price = request.getParameter("price");
		controller.addRoom(roomNo,bedType,smoking,price);
		forwardToJsp = "/homepage.html";
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
}
