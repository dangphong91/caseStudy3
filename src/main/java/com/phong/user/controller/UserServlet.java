package com.phong.user.controller;

import com.phong.user.dao.UserDAO;
import com.phong.user.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("user");
        String password = request.getParameter("pass");
        if (!name.equals("") && !password.equals("") && userDAO.selectUser(name) == null) {
            String fullName = request.getParameter("fullname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            User user = new User(name, password, fullName, address, phone);
            userDAO.insertUser(user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("textup", "Error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/logup.jsp");
            dispatcher.forward(request, response);
        }
    }
}
