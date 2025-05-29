package com.servlet;

import com.dao.EmployeeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private EmployeeDAO dao;

    public void init() {
        dao = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int empno = Integer.parseInt(request.getParameter("empno"));

        try {
            boolean success = dao.deleteEmployee(empno);
            HttpSession session = request.getSession();

            if (success) {
                session.setAttribute("message", "Employee deleted successfully!");
            } else {
                session.setAttribute("message", "Employee not found or delete failed.");
            }

            response.sendRedirect("displayEmployees");

        } catch (Exception e) {
            request.setAttribute("message", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("empdelete.jsp").forward(request, response);
        }
    }
}
