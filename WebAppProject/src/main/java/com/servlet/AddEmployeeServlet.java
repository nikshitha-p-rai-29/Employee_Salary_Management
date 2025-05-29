package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addEmployee")
public class AddEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            String doj = request.getParameter("doj");
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));

            Employee newEmployee = new Employee(empno, empName, doj, gender, bsalary);
            employeeDAO.insertEmployee(newEmployee);

            // Redirect to displayEmployees after successful insert
            response.sendRedirect("displayEmployees");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
