package com.model;
import java.sql.Date;

public class Employee {
    private int empno;
    private String empName;
    private String doj;  // Storing date as String (yyyy-mm-dd)
    private String gender;
    private double bsalary;

    public Employee() {}

    public Employee(int empno, String empName, String doj, String gender, double bsalary) {
        this.empno = empno;
        this.empName = empName;
        this.doj = doj;
        this.gender = gender;
        this.bsalary = bsalary;
    }

    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getDoj() {
        return doj;
    }

    public void setDoj(String doj) {
        this.doj = doj;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public double getBsalary() {
        return bsalary;
    }

    public void setBsalary(double bsalary) {
        this.bsalary = bsalary;
    }
}
