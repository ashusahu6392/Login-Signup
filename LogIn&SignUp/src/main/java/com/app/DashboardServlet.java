
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


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		resp.setHeader("Pragma", "no-cache");
		resp.setDateHeader("Expires", 0);
		
		
		HttpSession session = req.getSession(false);
		
		if(session == null || session.getAttribute("userId") == null) {
			resp.sendRedirect("index.jsp");
			return;
		}
		
		 Integer userId = (Integer) session.getAttribute("userId");

	        // 2️⃣ Fetch user from DB
		 	UserDAO userDao = new UserDAO();
	        User user = userDao.findById(userId);

	        if (user == null) {
	            session.invalidate();
	            resp.sendRedirect("login.jsp");
	            return;
	        }

	        // 3️⃣ Forward to JSP
	        req.setAttribute("user", user);
	        req.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(req, resp);
	}

}
