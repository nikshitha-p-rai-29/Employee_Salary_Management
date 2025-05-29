<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Employee</title>
  
  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
    rel="stylesheet"
  />
  
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #121821;
      color: #e0e6e9;
      margin: 40px auto;
      max-width: 500px;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 191, 166, 0.3);
    }

    h2 {
      color: #00bfa6;
      text-align: center;
      margin-bottom: 30px;
      letter-spacing: 1.5px;
      text-shadow: 0 2px 8px rgba(0, 191, 166, 0.6);
      animation: fadeInDown 0.8s ease forwards;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 18px;
      animation: fadeInUp 1s ease forwards;
    }

    label {
      font-weight: 600;
      margin-bottom: 6px;
    }

    input[type="text"],
    input[type="date"],
    select {
      background: #1f2a37;
      border: none;
      border-radius: 8px;
      padding: 10px 15px;
      color: #e0e6e9;
      font-size: 1rem;
      transition: box-shadow 0.3s ease;
      width: 100%;
      box-sizing: border-box;
    }

    input[type="text"]:focus,
    input[type="date"]:focus,
    select:focus {
      outline: none;
      box-shadow: 0 0 8px #00bfa6;
      background: #273240;
    }

    input[type="submit"] {
      margin-top: 10px;
      background: #00bfa6;
      border: none;
      padding: 12px 0;
      color: #121821;
      font-weight: 700;
      font-size: 1.15rem;
      border-radius: 10px;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.3s ease;
    }

    input[type="submit"]:hover {
      background: #00e0b3;
      transform: translateY(-3px);
      box-shadow: 0 6px 20px rgba(0, 191, 166, 0.4);
    }

    p.message {
      font-weight: 600;
      color: #4caf50;
      background: #123a29;
      padding: 12px 16px;
      border-radius: 8px;
      box-shadow: 0 3px 10px rgba(76, 175, 80, 0.3);
      animation: fadeIn 1.2s ease forwards;
      text-align: center;
    }

    /* Animations */
    @keyframes fadeInDown {
      0% {
        opacity: 0;
        transform: translateY(-20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes fadeInUp {
      0% {
        opacity: 0;
        transform: translateY(20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }
  </style>
</head>
<body>
  <h2>Update Employee</h2>
  <form action="UpdateEmployeeServlet" method="post">
    <label for="empno">Employee No:</label>
    <input id="empno" type="text" name="empno" required />

    <label for="name">Name:</label>
    <input id="name" type="text" name="name" required />

    <label for="doj">Date of Joining:</label>
    <input id="doj" type="date" name="doj" required />

    <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
      <option value="" disabled selected>Select Gender</option>
      <option value="Male">Male</option>
      <option value="Female">Female</option>
    </select>

    <label for="salary">Salary:</label>
    <input id="salary" type="text" name="salary" required />

    <input type="submit" value="Update" />
  </form>

  <%
    String message = (String) request.getAttribute("message");
    if (message != null && !message.trim().isEmpty()) {
  %>
    <p class="message"><%= message %></p>
  <%
    }
  %>
</body>
</html>
