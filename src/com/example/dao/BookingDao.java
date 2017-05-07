package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import com.example.business.Booking;
import com.example.business.Room;
import com.example.business.User;
import com.example.exceptions.DaoException;

public class BookingDao extends Dao {

	public String bookingCode(String roomNo) throws DaoException
	{
		String bookingCode = null;
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM reservation WHERE roomNo = ?;";
            ps = con.prepareStatement(query);
            ps.setString(1, roomNo);
            int count=0;
            rs = ps.executeQuery();
            do{
            	count++;
                
            }while(rs.next());
            String counttemp =String.format("%04d", count);
            String random=String.format("%02d",(count*777)/100);
            bookingCode=roomNo+counttemp+random;
        } 
        catch (SQLException e) {
            throw new DaoException("bookingCode search: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("bookingCode search: " + e.getMessage());
            }//end catch
        }//end finally

		return bookingCode;
	}
	
	public boolean checkAvailable(Date arrDateTemp,Date depDateTemp,Date checkInDate,Date checkOutDate)
	{
		//check date of booking.
		if(depDateTemp.after(checkInDate)||depDateTemp.equals(checkInDate)) 
		{
			return true;
		}

		if(arrDateTemp.before(checkOutDate)||arrDateTemp.equals(checkInDate))
		{
			return true;
		}
		return false;
	}

	public ArrayList<Room> searchAvailableRoom(Date checkInDate, Date checkOutDate, String roomType) throws DaoException{
		//search rooms with certain condition.
		ArrayList<Room> roomList = new ArrayList<Room>();
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM room WHERE bedType = ?;";
            ps = con.prepareStatement(query);
            ps.setString(1, roomType);
            
            rs = ps.executeQuery();
            
            do{
            	String roomNoTemp=rs.getString("roomNo");
            	 PreparedStatement psTemp = null;
                 ResultSet rsTemp = null;
            	String query2= "SELECT * FROM reservation WHERE roomNo= ?;";
                psTemp= con.prepareStatement(query2);
                psTemp.setString(1, roomNoTemp);		
                boolean valid=true;
                rsTemp=psTemp.executeQuery();
                do{
                	Date arrDateTemp=rsTemp.getDate("arrDate");
                	Date depDateTemp=rsTemp.getDate("depDate");
                	if(checkAvailable(arrDateTemp,depDateTemp,checkInDate,checkOutDate)==false)
                	{
                		valid=false;
                	}
                	
                }while(rsTemp.next());
                
            	if(valid) {
            		String priceTemp=rs.getString("price");
            		String smokingTemp=rs.getString("smoking");
            		Room roomTemp=new Room(roomNoTemp,roomType,smokingTemp,priceTemp);
            		roomList.add(roomTemp);
            	}
            	
            }while(rs.next());
            
            return roomList;
        } 
        catch (SQLException e) {
            throw new DaoException("roomavailable search: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("roomavailable search: " + e.getMessage());
            }//end catch
        }//end finally

	}
	
	public boolean makeBooking(String userId,String roomNo,String referenceNo,String reserveTime,Date arrDate,Date depDate,String checkInStatus) throws DaoException
	{
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean success=false;
        try {
            con = this.getConnection();
           
            String query = "INCERT INTO reservation (referenceNo, roomNo,userId,reserveTime,checkIn,checkOut,checkInStatus) VALUES (?,?,?,?,?,?.?);";
            
            ps = con.prepareStatement(query);
            ps.setString(1, referenceNo);
            ps.setString(2, roomNo);
            ps.setString(3, userId);
            ps.setString(4, reserveTime);
            ps.setDate(5, arrDate);
            ps.setDate(6, depDate);
            ps.setString(7,checkInStatus);
            rs = ps.executeQuery();
            success=true;
         } 
        catch (SQLException e) {
            throw new DaoException("makeBooking add: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("makeBooking add: " + e.getMessage());
            }//end catch
        }//end finally
        return success;	
	}	

	public ArrayList<Booking> getBooking(String userId,String referenceNo) throws DaoException
	{
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Booking> bookingList=new ArrayList<Booking>();
        try {
            con = this.getConnection();
           
            String query = "SELECT * FROM reservation;";
            
            ps = con.prepareStatement(query);
            if(userId!=null)
            	ps.setString(1, userId);
            else
            	ps.setString(1, referenceNo);
            rs = ps.executeQuery();
            while (rs.next()) {
            	String userIdt=rs.getString("userId");
            	String roomNo=rs.getString("roomNo");
            	String referenceNot=rs.getString("referenceNo");
            	String reserverTime=rs.getString("reserverTime");
            	Date arrDate=rs.getDate("checkIn");
            	Date depDate=rs.getDate("checkOut");
            	String checkInStatus=rs.getString("checkInStatus");
                Booking booking=new Booking(userIdt,roomNo,referenceNot,reserverTime,arrDate,depDate,checkInStatus);
                bookingList.add(booking);
                }
            return bookingList;
        } 
        catch (SQLException e) {
            throw new DaoException("getBooking add: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("getBooking add: " + e.getMessage());
            }//end catch
        }//end finally	
	}
	public boolean canselBooking(String referenceNo) throws DaoException
	{
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = this.getConnection();
           
            String query = "DELETE FROM reservation WHERE referenceNo=?;";
            
            ps = con.prepareStatement(query);
            ps.setString(1, referenceNo);
            rs = ps.executeQuery();
           
            return true;
        } 
        catch (SQLException e) {
           	throw new DaoException("cancelBooking add: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("cancelBooking add: " + e.getMessage());
            }//end catch
        }//end finally	
	}
	

	public boolean checkIn(String referenceNo) throws DaoException
	{
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = this.getConnection();
           
            String query = "UPDATE reservation SET checkInStatus = ? WHERE referernceNo = ?  ";
            
            ps = con.prepareStatement(query);
            ps.setString(1, "checked in");
            ps.setString(2, referenceNo);
           
            rs = ps.executeQuery();
           
            return true;
        } 
        catch (SQLException e) {
           	throw new DaoException("checked in add: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("checked in add: " + e.getMessage());
            }//end catch
        }//end finally	
	}
	public boolean checkOut(String referenceNo) throws DaoException
	{
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = this.getConnection();
           
            String query = "UPDATE reservation SET checkInStatus = ? WHERE referernceNo = ?  ";
            
            ps = con.prepareStatement(query);
            ps.setString(1, "checked out");
            ps.setString(2, referenceNo);
           
            rs = ps.executeQuery();
           
            return true;
        } 
        catch (SQLException e) {
           	throw new DaoException("checked out add: " + e.getMessage());    
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("checked out add: " + e.getMessage());
            }//end catch
        }//end finally	
	}
}