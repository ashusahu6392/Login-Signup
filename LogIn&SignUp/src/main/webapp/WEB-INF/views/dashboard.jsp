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
<!-- ✅ Icons CDN (for sidebar icons like in image) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>


</head>
<body>

<div class="container">
	<div class="side-bar">
	
		 <div class="user">
            <img alt="avatar"
                 src="<%= (user.getProfileImage() != null && !user.getProfileImage().isEmpty())
                            ? "uploads/" + user.getProfileImage()
                            : "images/avatar.png" %>">
            <h1><%= user.getFname() + " " + user.getLname() %></h1>
            <h5>Admin</h5>
        </div>
		
		<ul class="menu">
            <li>
                <a href="dashboard">
                    <i class="fa-solid fa-house"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <!-- ✅ active menu -->
            <li class="active">
                <a href="editServlet">
                    <i class="fa-solid fa-user-pen"></i>
                    <span>Edit Profile</span>
                </a>
            </li>
            
             <li class="active">
                <a href="editServlet">
                   <i class="ri-bar-chart-grouped-line"></i>
                    <span>Projects</span>
                </a>
            </li>
            
        </ul>
		
		<form action="logoutServlet" method="post">
			<button class="logout">Logout</button>
		</form>
		
	</div>
	
	
	<div class="main-content"></div>
</div>

</body>
</html>