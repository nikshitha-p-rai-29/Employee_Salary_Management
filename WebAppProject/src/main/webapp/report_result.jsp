<%@ page import="java.util.*, com.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Report Results</title>
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #121821;
      color: #e0e6e9;
      margin: 40px auto;
      max-width: 900px;
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
    table {
      width: 100%;
      border-collapse: collapse;
      background: #1f2a37;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0, 191, 166, 0.2);
      animation: fadeIn 1.5s ease forwards;
      overflow: hidden;
    }
    th, td {
      padding: 12px 20px;
      border-bottom: 1.5px solid #273240;
      text-align: left;
      font-size: 1rem;
      color: #e0e6e9;
    }
    th {
      background-color: #00bfa6;
      font-weight: 700;
      letter-spacing: 0.05em;
    }
    tr:nth-child(even) {
      background-color: #273240;
    }
    tr:hover {
      background-color: #00bfa6;
      color: #121821;
      transition: background-color 0.3s ease;
    }
    td[colspan="5"] {
      text-align: center;
      font-weight: 700;
      color: #ff6b6b; /* soft red */
      padding: 20px;
    }
    form {
      margin-top: 30px;
      text-align: center;
    }
    input[type="submit"] {
      background: #00bfa6;
      border: none;
      padding: 12px 28px;
      color: #121821;
      font-size: 1rem;
      border-radius: 10px;
      cursor: pointer;
      font-weight: 700;
      transition: background 0.3s ease, transform 0.3s ease;
    }
    input[type="submit"]:hover {
      background: #00e0b3;
      transform: translateY(-3px);
      box-shadow: 0 6px 20px rgba(0, 191, 166, 0.4);
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
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
  </style>
</head>
<body>

  <h2>Report Results</h2>

  <table>
    <tr>
      <th>Empno</th>
      <th>Name</th>
      <th>Date of Joining</th>
      <th>Gender</th>
      <th>Basic Salary</th>
    </tr>

    <%
      List<Employee> employees = (List<Employee>) request.getAttribute("reportResult");
      if (employees != null && !employees.isEmpty()) {
        for (Employee emp : employees) {
    %>
    <tr>
      <td><%= emp.getEmpno() %></td>
      <td><%= emp.getEmpName() %></td>
      <td><%= emp.getDoj() %></td>
      <td><%= emp.getGender() %></td>
      <td><%= emp.getBsalary() %></td>
    </tr>
    <%
        }
      } else {
    %>
    <tr>
      <td colspan="5">No matching records found.</td>
    </tr>
    <%
      }
    %>
  </table>

  <form action="index.jsp" method="get">
    <input type="submit" value="Back to Home" />
  </form>

</body>
</html>
