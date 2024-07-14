<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
    <title>Hapus Data</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="text-center">Hapus Data Mahasiswa</h1><br>
    <%
        String nim = request.getParameter("nim");

        String url = "jdbc:mysql://localhost:3306/uas_pjl";
        String user = "root";
        String password = "";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            String sql = "DELETE FROM data_mahasiswa WHERE nim=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, nim);

            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                out.println("<div class='alert alert-success'>Data berhasil dihapus!</div>");
            } else {
                out.println("<div class='alert alert-danger'>Gagal menghapus data.</div>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<div class='alert alert-danger'>Driver tidak ditemukan: " + e.getMessage() + "</div>");
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger'>Koneksi ke database gagal: " + e.getMessage() + "</div>");
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Gagal menutup preparedStatement: " + e.getMessage() + "</div>");
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Gagal menutup koneksi: " + e.getMessage() + "</div>");
                }
            }
        }
    %>
    <script>
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 2000);
    </script>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
