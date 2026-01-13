package com.app;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.app.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/uploadImageServlet")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        // ✅ safer: take id from session
        int id = (int) session.getAttribute("userId");

        Part filePart = req.getPart("profilePhoto");
        if (filePart == null || filePart.getSize() == 0) {
            resp.getWriter().println("No file selected!");
            return;
        }

        // ✅ create uploads folder
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String newFileName = "user_" + id + "_" + System.currentTimeMillis() + "_" + fileName;

        filePart.write(uploadPath + File.separator + newFileName);

        // ✅ update DB ONLY image
        UserDAO dao = new UserDAO();
        boolean ok = dao.updateProfileImage(id, newFileName);

        if (ok) {
            resp.sendRedirect("editServlet");
        } else {
            resp.getWriter().println("Image not updated!");
        }
    }
}
