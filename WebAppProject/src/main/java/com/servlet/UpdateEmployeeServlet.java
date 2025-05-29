package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
    private EmployeeDAO dao;

    public void init() {
        dao = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int empno = Integer.parseInt(request.getParameter("empno"));
        String name = request.getParameter("name");
        String doj = request.getParameter("doj");
        String gender = request.getParameter("gender");
        double salary = Double.parseDouble(request.getParameter("salary"));

        Employee updatedEmp = new Employee(empno, name, doj, gender, salary);

        try {
            boolean success = dao.updateEmployee(updatedEmp);

            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("message", "✅ Employee updated successfully!");
            } else {
                session.setAttribute("message", "⚠️ Employee not found or update failed.");
            }

            // 🔁 Redirect to displayEmployees servlet
            response.sendRedirect("displayEmployees");

        } catch (Exception e) {
            request.setAttribute("message", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("empupdate.jsp").forward(request, response);
        }
    }
}
