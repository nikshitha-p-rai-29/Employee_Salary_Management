package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private EmployeeDAO dao;

    public void init() {
        dao = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String letter = request.getParameter("letter");
        String yearsStr = request.getParameter("years");
        String minSalaryStr = request.getParameter("minSalary");

        // Default values if parameters are missing or invalid
        if (letter == null) letter = ""; 
        int years = 0;
        double minSalary = 0;

        try {
            if (yearsStr != null && !yearsStr.trim().isEmpty()) {
                years = Integer.parseInt(yearsStr.trim());
            }
        } catch (NumberFormatException e) {
            years = 0; // or handle invalid input error
        }

        try {
            if (minSalaryStr != null && !minSalaryStr.trim().isEmpty()) {
                minSalary = Double.parseDouble(minSalaryStr.trim());
            }
        } catch (NumberFormatException e) {
            minSalary = 0; // or handle invalid input error
        }

        // Call combined criteria method
        List<Employee> result = dao.getEmployeesByCriteria(letter, years, minSalary);

        request.setAttribute("reportResult", result);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}
