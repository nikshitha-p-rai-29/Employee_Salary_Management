package com.dao;

import com.model.Employee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/employeemarks";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employee WHERE Empno = ?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employee";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employee WHERE Empno = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employee SET EmpName = ?, DoJ = ?, Gender = ?, Bsalary = ? WHERE Empno = ?";

    // Database connection
    protected Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertEmployee(Employee employee) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            ps.setInt(1, employee.getEmpno());
            ps.setString(2, employee.getEmpName());
            ps.setDate(3, Date.valueOf(employee.getDoj()));
            ps.setString(4, employee.getGender());
            ps.setDouble(5, employee.getBsalary());
            ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver not found", e);
        }
    }

    public Employee selectEmployee(int empno) {
        Employee employee = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            ps.setInt(1, empno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                employee = extractEmployee(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employee;
    }

    public List<Employee> selectAllEmployees() {
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_EMPLOYEES)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractEmployee(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean updated;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            ps.setString(1, employee.getEmpName());
            ps.setDate(2, Date.valueOf(employee.getDoj()));
            ps.setString(3, employee.getGender());
            ps.setDouble(4, employee.getBsalary());
            ps.setInt(5, employee.getEmpno());
            updated = ps.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver not found", e);
        }
        return updated;
    }

    public boolean deleteEmployee(int empno) throws SQLException {
        boolean deleted;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            ps.setInt(1, empno);
            deleted = ps.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver not found", e);
        }
        return deleted;
    }

    // REPORT 1: Employees whose name starts with a letter
    public List<Employee> getEmployeesByStartingLetter(String letter) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE EmpName LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, letter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractEmployee(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // REPORT 2: Employees with N+ years of service
    public List<Employee> getEmployeesByYearsOfService(int years) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, years);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractEmployee(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // REPORT 3: Employees with minimum salary
    public List<Employee> getEmployeesByMinSalary(double salary) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE Bsalary >= ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, salary);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractEmployee(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // REPORT 4: Salary in range and specific gender
    public List<Employee> selectEmployeesBySalaryAndGender(double minSalary, double maxSalary, String gender) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE Bsalary BETWEEN ? AND ? AND Gender = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, minSalary);
            ps.setDouble(2, maxSalary);
            ps.setString(3, gender);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractEmployee(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
 // Add this method inside EmployeeDAO class
    public List<Employee> getEmployeesByCriteria(String startLetter, int minYears, double minSalary) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee WHERE EmpName LIKE ? AND TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ? AND Bsalary >= ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, startLetter + "%");
            ps.setInt(2, minYears);
            ps.setDouble(3, minSalary);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractEmployee(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // Utility method
    private Employee extractEmployee(ResultSet rs) throws SQLException {
        return new Employee(
                rs.getInt("Empno"),
                rs.getString("EmpName"),
                rs.getDate("DoJ").toString(),
                rs.getString("Gender"),
                rs.getDouble("Bsalary")
        );
    }
}
