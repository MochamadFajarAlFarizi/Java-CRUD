<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String url = "jdbc:mysql://localhost:3306/uas_pjl";
    String user = "root";
    String dbPassword = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String errorMessage = null;
    String successMessage = null;

    if (username != null && password != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, dbPassword);
            String query = "INSERT INTO users (username, password) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                successMessage = "Registrasi berhasil! Silakan login dengan akun Anda.";
            } else {
                errorMessage = "Registrasi gagal!";
            }
        } catch (ClassNotFoundException | SQLException e) {
            if (e.getMessage().contains("Duplicate entry")) {
                errorMessage = "Username sudah terdaftar!";
            } else {
                errorMessage = "Koneksi ke database gagal: " + e.getMessage();
            }
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    errorMessage = "Gagal menutup preparedStatement: " + e.getMessage();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    errorMessage = "Gagal menutup koneksi: " + e.getMessage();
                }
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #CDC6C3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #A38F85;
            border-color: #A38F85;
        }
        .btn-primary:active {
            background-color: #A38F85;
            border-color: #A38F85;
        }
        .btn.btn-primary:hover{
            background-color: #6E4F3F;
            border-color: #6E4F3F;
        }
        .tlogin{
            color: #6E4F3F;
        }
        .tlogin:hover {
            color: #6E4F3F;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2 class="text-center">Register</h2>
    <% if (successMessage != null) { %>
    <div id="successAlert" class="alert alert-success"><%= successMessage %></div>
    <script>
        // JavaScript to display popup dialog and redirect after delay
        setTimeout(function() {
            $('#successAlert').fadeIn();
            setTimeout(function() {
                $('#successAlert').fadeOut();
                window.location.href = 'index.jsp';
            }, 3000); // 3000 milliseconds = 3 seconds
        }, 100); // 100 milliseconds = 0.1 second
    </script>
    <% } else if (errorMessage != null) { %>
    <div class="alert alert-danger"><%= errorMessage %></div>
    <% } %>
    <form action="register.jsp" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Register</button>
        <p class="text-center mt-3">Sudah punya akun? <a class="tlogin" href="index.jsp">Login</a></p>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
