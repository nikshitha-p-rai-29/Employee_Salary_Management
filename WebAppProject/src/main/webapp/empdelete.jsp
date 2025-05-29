<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Delete Employee</title>
  
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #121821;
      color: #e0e6e9;
      max-width: 450px;
      margin: 50px auto;
      padding: 25px 30px;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 191, 166, 0.25);
    }
    
    h2 {
      text-align: center;
      color: #00bfa6;
      margin-bottom: 25px;
      text-shadow: 0 2px 8px rgba(0, 191, 166, 0.6);
      letter-spacing: 1.5px;
    }
    
    form {
      display: flex;
      flex-direction: column;
      gap: 18px;
    }
    
    input[type="number"] {
      padding: 12px 15px;
      border-radius: 8px;
      border: none;
      font-size: 1rem;
      background: #1f2a37;
      color: #e0e6e9;
      box-sizing: border-box;
      transition: box-shadow 0.3s ease;
    }
    
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
    
    p.message {
      margin-top: 20px;
      padding: 14px 18px;
      border-radius: 8px;
      background: #b00020;
      color: #fff;
      font-weight: 600;
      text-align: center;
      box-shadow: 0 3px 10px rgba(176, 0, 32, 0.5);
    }
  </style>
  
  <script>
    function confirmDelete() {
      return confirm("Are you sure you want to delete this employee?");
    }
  </script>
</head>
<body>
  <h2>Delete Employee</h2>
  
  <form action="DeleteEmployeeServlet" method="post" onsubmit="return confirmDelete();">
    <label for="empno">Enter Employee Number to delete:</label>
    <input id="empno" type="number" name="empno" required />
    <input type="submit" value="Delete" />
  </form>

  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
  %>
    <p class="message"><%= message %></p>
  <% } %>
</body>
</html>
