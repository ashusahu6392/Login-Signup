<%@page import="com.app.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    User user = (User) request.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<link rel="stylesheet" href="css/newCss.css">

<!-- ✅ Icons CDN (for sidebar icons like in image) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

</head>
<body>

<div class="container">

    <!-- ✅ Sidebar -->
    <div class="side-bar">

        <!-- profile section -->
        <div class="user">
            <img alt="avatar"
                 src="<%= (user.getProfileImage() != null && !user.getProfileImage().isEmpty())
                            ? "uploads/" + user.getProfileImage()
                            : "images/avatar.png" %>">
            <h1><%= user.getFname() + " " + user.getLname() %></h1>
            <h5>Admin</h5>
        </div>

        <!-- menu -->
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
        </ul>

        <!-- logout -->
        <form action="logoutServlet" method="post" class="logout-form">
            <button class="logout" type="submit">Logout</button>
        </form>
    </div>


    <!-- ✅ Main Content -->
    <div class="main-content">

        <!-- ✅ Header title like image -->
        <div class="page-header">
            <h1>Edit Profile</h1>
        </div>

        <div class="profile-wrapper">

            <!-- ✅ Card 1 -->
            <div class="card">
                <h2>Edit Profile Details</h2>

                <form action="updateUserServlet" method="post" class="form-grid">
                    <input type="hidden" name="id" value="<%= user.getId() %>">

                    <div class="field">
                        <label>First Name</label>
                        <input type="text" name="fname" value="<%= user.getFname() %>" required>
                    </div>

                    <div class="field">
                        <label>Last Name</label>
                        <input type="text" name="lname" value="<%= user.getLname() %>" required>
                    </div>

                    <div class="field">
                        <label>Gender</label>
                        <select name="gender" required>
                            <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                            <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                            <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                        </select>
                    </div>

                    <div class="field">
                        <label>Email</label>
                        <input type="email" name="email" value="<%= user.getEmail() %>" required>
                    </div>

                    <div class="field">
                        <label>Password</label>
                        <input type="text" name="password" value="<%= user.getPassword() %>" required>
                    </div>

                    <div class="field">
                        <label>DOB</label>
                        <input type="date" name="dob" value="<%= user.getDob() %>" required>
                    </div>

                    <div class="actions">
                        <button type="submit" class="btn-primary">Update Details</button>
                    </div>
                </form>
            </div>


            <!-- ✅ Card 2 -->
            <div class="card">
                <h2>Upload Profile Photo</h2>

                <form action="uploadImageServlet" method="post"
                      enctype="multipart/form-data"
                      class="upload-form">

                    <input type="hidden" name="id" value="<%= user.getId() %>">

                    <div class="upload-box">
                        <input type="file" name="profilePhoto" accept="image/*" required>
                        <button type="submit" class="btn-primary">Upload Photo</button>
                    </div>

                </form>
            </div>

        </div>
    </div>

</div>

</body>
</html>
