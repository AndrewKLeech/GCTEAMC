package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
            System.out.println("works");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                String pWord = rs.getString("password");
                if (pWord.equals(password)) {
                	//Password matches
                	System.out.printf("true");
                	success = true;
                }
                else{
                	System.out.printf("false");
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
    
    
    
    public boolean register(String regUsername, String regPassword, String regConfirmPassword, String registerEmail, String regDOB, String regContactNumber) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        boolean success = false;
        try {
            con = this.getConnection();
            String query = "INSERT INTO user (userId, password, name, birthday, gender, privilege) VALUES (?,?,?,?,'M','user');";
            ps = con.prepareStatement(query);
            ps.setString(1, regUsername);
            ps.setString(2, regPassword);
            ps.setString(3, regUsername);
            ps.setString(4, regDOB);
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
            String query = "INSERT INTO user (userId, password, name, birthday, gender, privilege) VALUES (?,?,?,?,'M','?');";
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
}//end UserDao
