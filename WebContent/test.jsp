<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>insert title here</title>
</head>
<body>
 <%
 	if(session.getAttribute("username")==null){
 		response.sendRedirect("homepage.jsp");
 		}
 %>
 Welcome ${username}
 </body></html>