package com.app;

import java.io.IOException;

import com.app.dao.UserDAO;
import com.app.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/signUp")
public class SaveServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String terms = req.getParameter("terms");
		
		User user = new User();
		user.setFname(fname);
		user.setLname(lname);
		user.setEmail(email);
		user.setDob(age);
		user.setGender(gender);
		user.setPassword(password);
		user.setTerms(terms);
		
		
		UserDAO dao = new UserDAO();
		boolean success = dao.saveUser(user);
		
		if(success) {
			resp.sendRedirect("index.jsp");
		}else {
			resp.sendRedirect("errorPage.jsp");
		}
	}
	
	

}













