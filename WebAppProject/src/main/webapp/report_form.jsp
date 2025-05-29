<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Report Selection</title>
<style>
  body {
    font-family: 'Inter', sans-serif;
    background: #121821;
    color: #e0e6e9;
    max-width: 500px;
    margin: 60px auto;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 191, 166, 0.3);
  }
  h2 {
    color: #00bfa6;
    text-align: center;
    margin-bottom: 30px;
    text-shadow: 0 2px 8px rgba(0, 191, 166, 0.7);
    letter-spacing: 1.3px;
  }
  form {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  label {
    font-weight: 600;
    font-size: 1rem;
    margin-bottom: 6px;
    display: block;
  }
  input[type="text"],
  input[type="number"] {
    padding: 10px 15px;
    border-radius: 8px;
    border: none;
    background: #1f2a37;
    color: #e0e6e9;
    font-size: 1rem;
    width: 100%;
    transition: box-shadow 0.3s ease;
  }
  input[type="text"]:focus,
  input[type="number"]:focus {
    outline: none;
    box-shadow: 0 0 8px #00bfa6;
    background: #273240;
  }
  input[type="submit"] {
    padding: 12px 0;
    background: #00bfa6;
    border: none;
    border-radius: 10px;
    font-weight: 700;
    font-size: 1.15rem;
    color: #121821;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.3s ease;
  }
  input[type="submit"]:hover {
    background: #00e0b3;
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(0, 191, 166, 0.4);
  }
</style>
</head>
<body>
  <h2>Select Report Criteria</h2>
  <form action="ReportServlet" method="get">
    <label for="letter">1. Name starts with:</label>
    <input type="text" id="letter" name="letter" maxlength="1" placeholder="Enter first letter" />

    <label for="years">2. Minimum Years of Service:</label>
    <input type="number" id="years" name="years" min="0" placeholder="Enter minimum years" />

    <label for="minSalary">3. Minimum Salary:</label>
    <input type="number" id="minSalary" name="minSalary" min="0" step="0.01" placeholder="Enter minimum salary" />

    <input type="submit" value="Generate Report" />
  </form>
</body>
</html>
