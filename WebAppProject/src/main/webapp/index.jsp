<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Employee Salary Management</title>

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
    rel="stylesheet"
  />

  <!-- Font Awesome CDN -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />

  <style>
    /* Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: #121821;
      color: #e0e6e9;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 60px 20px;
      overflow-x: hidden;
    }

    h2 {
      font-weight: 600;
      font-size: 3rem;
      margin-bottom: 50px;
      color: #00bfa6;
      letter-spacing: 2px;
      text-shadow: 0 3px 8px rgba(0, 191, 166, 0.5);
      opacity: 0;
      animation: fadeInDown 0.9s ease forwards;
    }

    ul {
      list-style: none;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 40px;
      max-width: 720px;
      width: 100%;
      opacity: 0;
      animation: fadeInUp 1.1s ease forwards;
      animation-delay: 0.3s;
    }

    li {
      background: #1f2a37;
      padding: 22px 38px;
      border-radius: 18px;
      box-shadow: 0 8px 20px rgba(0, 191, 166, 0.15);
      transition: background 0.3s ease, box-shadow 0.3s ease,
        transform 0.35s cubic-bezier(0.4, 0, 0.2, 1);
      cursor: pointer;
      min-width: 200px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    li:hover {
      background: #00bfa6;
      box-shadow: 0 15px 25px rgba(0, 191, 166, 0.5);
      transform: translateY(-6px);
    }

    a {
      color: #e0e6e9;
      font-weight: 600;
      font-size: 1.25rem;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 14px;
      transition: color 0.3s ease;
    }

    li:hover a {
      color: #121821;
    }

    a i {
      font-size: 1.8rem;
      transition: transform 0.3s ease;
      filter: drop-shadow(0 0 2px rgba(0, 191, 166, 0.8));
    }

    li:hover a i {
      transform: translateX(5px) scale(1.1);
      filter: drop-shadow(0 0 8px rgba(255, 255, 255, 0.8));
    }

    /* Animations */
    @keyframes fadeInDown {
      0% {
        opacity: 0;
        transform: translateY(-30px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes fadeInUp {
      0% {
        opacity: 0;
        transform: translateY(30px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Responsive */
    @media (max-width: 520px) {
      ul {
        flex-direction: column;
        gap: 25px;
        max-width: 90%;
      }

      li {
        min-width: auto;
        padding: 18px 28px;
      }

      a {
        font-size: 1.1rem;
      }

      a i {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>
  <h2>Employee Salary Management</h2>

  <ul id="menuList">
    <li>
      <a href="empadd.jsp" title="Add a new employee">
        <i class="fas fa-user-plus" aria-hidden="true"></i>
        Add Employee
      </a>
    </li>
    <li>
      <a href="empupdate.jsp" title="Update existing employee">
        <i class="fas fa-user-edit" aria-hidden="true"></i>
        Update Employee
      </a>
    </li>
    <li>
      <a href="empdelete.jsp" title="Delete employee">
        <i class="fas fa-user-minus" aria-hidden="true"></i>
        Delete Employee
      </a>
    </li>
    <li>
      <a href="displayEmployees" title="View all employees">
        <i class="fas fa-users" aria-hidden="true"></i>
        Display Employees
      </a>
    </li>
    <li>
      <a href="report_form.jsp" title="Generate reports">
        <i class="fas fa-chart-line" aria-hidden="true"></i>
        Reports
      </a>
    </li>
  </ul>

  <script>
    // Add fadeInUp animation on menu after page load
    window.addEventListener('load', () => {
      document.getElementById('menuList').style.opacity = 1;
    });
  </script>
</body>
</html>
