package com.example.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.service.MainUI;


/**
 * Servlet implementation class FrontController
 */
@WebServlet(urlPatterns={"/FrontController"})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MainUI mainUi;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
    	this.mainUi = new MainUI();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest (request, response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}	
	
	
	/**
	 * Common method to process all client requests (GET and POST)
	 */
	private void processRequest(HttpServletRequest request, HttpServletResponse response) {

		String forwardToJsp = null;						
		String action;
		if((action = request.getParameter("action")) == null) {
			action = "";
		}
		System.out.println(action);
		switch (action) {
		case "login":
			forwardToJsp = mainUi.login(request, response);
			break;
			
		case "logout":
			forwardToJsp = mainUi.logout(request, response);
			break;
			
		case "register":
			forwardToJsp = mainUi.register(request, response);
			break;
			
		case "addStaff":
			forwardToJsp = mainUi.addStaff(request, response);
			break;
			
		case "removeUser":
			forwardToJsp = mainUi.removeUser(request, response);
			break;
			
		case "searchRoom":
			forwardToJsp = mainUi.searchRoom(request, response);
			break;
			
		case "removeRoom":
			forwardToJsp = mainUi.removeRoom(request, response);
			break;
			
		case "addRoom":
			forwardToJsp = mainUi.addRoom(request,response);
			break;
			
		case "ammendRoom":
			forwardToJsp = mainUi.ammendRoom(request, response);
			break;
			
		case "invoice":
			forwardToJsp = mainUi.invoice(request, response);
			break;
		
		case "book":
			forwardToJsp = mainUi.makeBooking(request, response);
			break;
			
		case "getBooking":
			forwardToJsp = mainUi.getBooking(request, response);
			break;
			
		case "getBookings":
			forwardToJsp = mainUi.getBookings(request, response);
			break;
			
		case "cancelBooking":
			//forwardToJsp = mainUi.canselBooking(request, response);
			break;	
			
		case "checkIn":
			forwardToJsp = mainUi.checkIn(request, response);
			break;
			
		case "checkOut":
			forwardToJsp = mainUi.checkOut(request, response);
			break;
			
		default: 
			forwardToJsp = "/errorPage.jsp";
			break;
		}
		
		forwardToPage(request, response, forwardToJsp);
	}
	
	/**
	 * Forward to server to the supplied page
	 */
	private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page){
		
		//Get the request dispatcher object and forward the request to the appropriate JSP page...
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
		try {
			dispatcher.forward(request, response);
			HttpSession session = request.getSession();
			session.setAttribute("rooms", null);
			session.setAttribute("bookings", null);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
