<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login - Authentication System</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h2>Login to System</h2>

            <% if (request.getAttribute("errorMessage") != null) {%>
            <div class="error-message">
                <%= request.getAttribute("errorMessage")%>
            </div>
            <% }%>

            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <button type="submit">Login</button>
            </form>

            <div class="demo-accounts">
                <h3>Demo Accounts:</h3>
                <p>Admin: admin / admin123</p>
                <p>User: user1 / user123</p>
                <p>Customer: customer1 / customer123</p>
            </div>
        </div>
    </body>
</html>