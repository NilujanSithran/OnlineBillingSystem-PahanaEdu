<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="dashboard-container">
        <header>
            <h1>Admin Dashboard</h1>
            <div class="user-info">
                Welcome, <%= session.getAttribute("username") %> 
                (<%= session.getAttribute("role") %>)
                <a href="logout">Logout</a>
            </div>
        </header>
        
        <div class="dashboard-content">
            <h2>Administrative Functions</h2>
            <ul>
                <li>User Management</li>
                <li>System Configuration</li>
                <li>Reports and Analytics</li>
                <li>Database Administration</li>
            </ul>
        </div>
    </div>
</body>
</html>