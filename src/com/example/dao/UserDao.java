package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.Room;
import com.example.business.User;
import com.example.exceptions.DaoException;


public class UserDao extends Dao {

    public boolean login(String username, String password) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        //by default success full login is set to false 
        boolean success = false;
        try {
            con = this.getConnection();
            String query = "SELECT userId, password FROM user WHERE userId = ?;";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                String pWord = rs.getString("password");
                if (pWord.equals(password)) {
                	//Password matches
                	success = true;
                }
                else{
                	success = false;
                }
            }
        } 
        catch (SQLException e) {
            throw new DaoException("login: " + e.getMessage());    
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
                throw new DaoException("login: " + e.getMessage());
            }//end catch
        }//end finally
        return success;
    }//End login
    
    
    public User getUser(String username) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            con = this.getConnection();
            String query = "SELECT userId, name, email, birthday, privilege FROM user WHERE userId = ?;";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            while (rs.next()) {
            	String userId = null;
            	String name = null;
            	String email = null;
            	String birthday = null;
            	String privilege = null;
            	
            	userId = rs.getString("userId");
                name = rs.getString("name");
                email = rs.getString("email");
                birthday = rs.getString("birthday");
                privilege = rs.getString("privilege");
        
                user = new User(userId, name, email, birthday, privilege);
            }
        } 
        catch (SQLException e) {
            throw new DaoException("getUser: " + e.getMessage());    
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
                throw new DaoException("getUser: " + e.getMessage());
            }//end catch
        }//end finally
        return user;
    }//End getUser
    
    
    public ArrayList<User> getAllUsers() throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<User>();
        try {
            con = this.getConnection();
            String query = "SELECT userId, name, email, birthday, privilege FROM user;";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
            	String userId = null;
            	String name = null;
            	String email = null;
            	String birthday = null;
            	String privilege = null;
            	
            	userId = rs.getString("userId");
                name = rs.getString("name");
                email = rs.getString("email");
                birthday = rs.getString("birthday");
                privilege = rs.getString("privilege");
        
                User user = new User(userId, name, email, birthday, privilege);
                users.add(user);
            }
        } 
        catch (SQLException e) {
            throw new DaoException("getAllUsers: " + e.getMessage());    
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
                throw new DaoException("getAllUsers: " + e.getMessage());
            }//end catch
        }//end finally
        return users;
    }//End getUser
    
    
    public String checkPermission(String username) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String permission = null;;
        try {
            con = this.getConnection();
            String query = "SELECT userId, privilege FROM user WHERE userId = ?;";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                permission = rs.getString("privilege");
            }
        } 
        catch (SQLException e) {
            throw new DaoException("checkPermission: " + e.getMessage());    
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
                throw new DaoException("checkPermission: " + e.getMessage());
            }//end catch
        }//end finally
        return permission;
    }//End checkPermission
    
    
    
    public boolean register(String regUsername,String regPassword,String regConfirmPassword,String regFirstName,String regLastName, String regBirth, String regEmail, String regContactNumber) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        boolean success = false;
        try {
            con = this.getConnection();
            String query = "INSERT INTO user (userId, password, name, email, birthday, privilege) VALUES (?,?,?,?,?,'user');";
            ps = con.prepareStatement(query);
            ps.setString(1, regUsername);
            ps.setString(2, regPassword);
            ps.setString(3, regFirstName);
            ps.setString(4, regEmail);
            ps.setString(5, regBirth);
            ps.executeUpdate();
            success = true;
        } 
        catch (SQLException e) {
            throw new DaoException("register: " + e.getMessage());    
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
                throw new DaoException("register: " + e.getMessage());
            }//end catch
        }//end finally
        return success;
    }//End register
    
    public boolean addStaff(String regUsername, String regPassword, String regConfirmPassword, String registerEmail, String regDOB, String regContactNumber, String regPriv) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        boolean success = false;
        try {
            con = this.getConnection();
            String query = "INSERT INTO user (userId, password, name, birthday, privilege) VALUES (?,?,?,?,?);";
            ps = con.prepareStatement(query);
            ps.setString(1, regUsername);
            ps.setString(2, regPassword);
            ps.setString(3, regUsername);
            ps.setString(4, regDOB);
            ps.setString(5, regPriv);
            ps.executeUpdate();
            success = true;
        } 
        catch (SQLException e) 
        {
            throw new DaoException("addStaff: " + e.getMessage());    
        }//End catch
        finally {
            try {
                if (ps != null) {
                    ps.close();
                }//End if
                if (con != null) {
                    freeConnection(con);
                }//End if
            }//End try 
            catch (SQLException e) {
                throw new DaoException("addStaff: " + e.getMessage());
            }//End catch
        }//End finally
        return success;
    }//End addStaff
    
    
    public boolean removeUser(String username) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        boolean success = false;
        try {
            con = this.getConnection();
            String query = "DELETE userId FROM user WHERE userId = ?;";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        }//End try
        catch (SQLException e) {
            throw new DaoException("removeUser: " + e.getMessage());    
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
                throw new DaoException("removeUser: " + e.getMessage());
            }//end catch
        }//end finally
        return success;
    }//End removeUser
}//end UserDao
