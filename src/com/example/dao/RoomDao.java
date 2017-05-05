
package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.Room;
import com.example.exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomDao extends Dao {

	public ArrayList<Room> searchRoom(String checkInDate, String checkOutDate, String roomType) throws DaoException{
		ArrayList<Room> roomList = new ArrayList<Room>();
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM room WHERE  = ?;";  //TODO: make search query for finding avalible rooms
            ps = con.prepareStatement(query);
            ps.setString(1, checkInDate);
            ps.setString(2, checkOutDate);
            ps.setString(3, roomType);
            rs = ps.executeQuery();
            
            while (rs.next()) {
            	//Add all room data to room object then add to array list.
            	String no = null;
            	String type = null;
            	String isSmoking = null;
            	
                no = rs.getString("roomId");				//TODO:
                type = rs.getString("type");				//Change according to
                isSmoking = rs.getString("isSmoking");	//database attributes
                
                //Room room = new Room(no,type,isSmoking);
                //roomList.add(room);
            }
        } 
        catch (SQLException e) {
            throw new DaoException("room search: " + e.getMessage());    
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
                throw new DaoException("room search: " + e.getMessage());
            }//end catch
        }//end finally
        return roomList;
	}
	public boolean removeRoom(String roomNo) throws DaoException{
		
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean success=false;
        try {
            con = this.getConnection();
            String query = "DELETE FROM room WHERE roomNo = ?;";  
            ps = con.prepareStatement(query);
            ps.setString(1, roomNo);
            rs = ps.executeQuery();
            success=true;
         } 
        catch (SQLException e) {
            throw new DaoException("room remove: " + e.getMessage());    
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
                throw new DaoException("room remove: " + e.getMessage());
            }//end catch
        }//end finally
        return success;
	}
	public boolean addRoom(String roomNo,String bedType,String smoking,String price) throws DaoException{
		
		Connection con = null;
        PreparedStatement ps = null;
        boolean success=false;
        try {
            con = this.getConnection();
           
            String query = "INSERT INTO room (roomNo, bedType, smoking, price) VALUES (?,?,'Y',?);";
            
            ps = con.prepareStatement(query);
            ps.setString(1, roomNo);
            ps.setString(2, bedType);
            //ps.setString(3, smoking);
            ps.setString(3, price);
            ps.executeUpdate();
            success=true;
         } 
        catch (SQLException e) {
            throw new DaoException("room add: " + e.getMessage());    
        }
        finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            }//end try 
            catch (SQLException e) {
                throw new DaoException("room add: " + e.getMessage());
            }//end catch
        }//end finally
        return success;
	}

	public boolean ammendRoom(String roomNo,String bedType,String smoking,String price) throws DaoException{
		
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean success=false;
        try {
            con = this.getConnection();
           
            String query ="UPDATE ROOM SET bedType = ? , smoking = ?, price = ? WHERE roomNo= ?;";    
            
            ps = con.prepareStatement(query);
           
            ps.setString(1, bedType);
            ps.setString(2, smoking);
            ps.setString(3, price);
            ps.setString(4, roomNo);
            
            rs = ps.executeQuery();
            success=true;
         } 
        catch (SQLException e) {
            throw new DaoException("room ammend: " + e.getMessage());    
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
                throw new DaoException("room ammend: " + e.getMessage());
            }//end catch
        }//end finally
        return success;
	}
}
