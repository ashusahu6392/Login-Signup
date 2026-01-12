<%@page import="com.app.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    User user = (User) request.getAttribute("user");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserDashboard</title>

<link rel="stylesheet" href="css/dashboard.css">


</head>
<body>

<div class="container">
	<div class="side-bar">
	
		<div class="user">
			<img alt="avatar" src="images/avatar.png">
			<h1><%= user.getFname()+ " " + user.getLname() %></h1>
			<h5>Admin</h5>
		</div>
		
		<ul class="menu">
			<li><a>Dashboard</a></li>
			<li><a>Analytics</a></li>
			<li><a>Messages</a></li>
			<li><a>Projects</a></li>
			<li><a>Tasks</a></li>
			<li><a>Setting</a></li>
			<li><a href="editUser.jsp">Edit Profile</a></li>
		</ul>
		
		<form action="logoutServlet" method="post">
			<button class="logout">Logout</button>
		</form>
		
	</div>
	
	
	<div class="main-content"></div>
</div>

</body>
</html>
