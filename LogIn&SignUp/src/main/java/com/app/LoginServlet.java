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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    	HttpSession oldSession = req.getSession(false);
		if (oldSession != null) {
		    oldSession.invalidate();
		}
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, password);

        if (user != null) {
            
            req.getSession().setAttribute("userId", user.getId());
            resp.sendRedirect("dashboard");
        } else {
            resp.sendRedirect("errorPage.jsp?error=invalid");
        }
    }
}
