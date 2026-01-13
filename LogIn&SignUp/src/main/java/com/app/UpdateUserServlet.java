package com.app;

import java.io.IOException;

import com.app.dao.UserDAO;
import com.app.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		resp.setHeader("Pragma", "no-cache");
		resp.setDateHeader("Expires", 0);
		
		
		HttpSession session = req.getSession(false);
		
		if(session == null || session.getAttribute("userId") == null) {
			resp.sendRedirect("index.jsp");
			return;
		}
		
		User user = new User();
		user.setId(Integer.parseInt(req.getParameter("id")));
		user.setFname(req.getParameter("fname"));
		user.setLname(req.getParameter("lname"));
		user.setGender(req.getParameter("gender"));
		user.setEmail(req.getParameter("email"));
		user.setDob(req.getParameter("dob"));
		user.setPassword(req.getParameter("password"));
		
		UserDAO dao = new UserDAO();
		boolean isChange = dao.updateUser(user);
		
		if (isChange) {
            resp.sendRedirect("editServlet"); // reload edit page
        } else {
            resp.getWriter().println("User not updated!");
        }
		
	}

}
