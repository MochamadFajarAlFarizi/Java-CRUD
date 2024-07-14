<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
    <title>Proses Edit Data Mahasiswa</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 20px;
        }
        .alert {
            margin-top: 20px;
        }
        .body{
            background-color:#CDC6C3;
        }
    </style>
    <script>
        function redirectToIndex() {
            window.location.href = "halamanutama.jsp";
        }
    </script>
</head>
<body class="body">
<div class="container">
    <%
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String tempat_lahir = request.getParameter("tempat_lahir");
        String tgl_lahir = request.getParameter("tgl_lahir");
        String jenis_kelamin = request.getParameter("jenis_kelamin");
        String alamat = request.getParameter("alamat");
        String kelurahan = request.getParameter("kelurahan");
        String kecamatan = request.getParameter("kecamatan");
        String kota = request.getParameter("kota");
        String provinsi = request.getParameter("provinsi");
        String no_hp = request.getParameter("no_hp");
        String strata = request.getParameter("strata");
        String prodi = request.getParameter("prodi");

        String url = "jdbc:mysql://localhost:3306/uas_pjl";
        String user = "root";
        String password = "";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            String sql = "UPDATE data_mahasiswa SET nama=?, tempat_lahir=?, tgl_lahir=?, jenis_kelamin=?, alamat=?, kelurahan=?, kecamatan=?, kota=?, provinsi=?, no_hp=?, strata=?, prodi=? WHERE nim=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, nama);
            preparedStatement.setString(2, tempat_lahir);
            preparedStatement.setString(3, tgl_lahir);
            preparedStatement.setString(4, jenis_kelamin);
            preparedStatement.setString(5, alamat);
            preparedStatement.setString(6, kelurahan);
            preparedStatement.setString(7, kecamatan);
            preparedStatement.setString(8, kota);
            preparedStatement.setString(9, provinsi);
            preparedStatement.setString(10, no_hp);
            preparedStatement.setString(11, strata);
            preparedStatement.setString(12, prodi);
            preparedStatement.setString(13, nim);

            int row = preparedStatement.executeUpdate();
            if (row > 0) {
    %>
    <div class="alert alert-success">Data berhasil diperbarui!</div>
    <script>
        setTimeout(function() {
            redirectToIndex();
        }, 2000);
    </script>
    <%
    } else {
    %>
    <div class="alert alert-danger">Gagal memperbarui data.</div>
    <%
        }
    } catch (ClassNotFoundException e) {
    %>
    <div class="alert alert-danger">Driver tidak ditemukan: <%= e.getMessage() %></div>
    <%
    } catch (SQLException e) {
    %>
    <div class="alert alert-danger">Koneksi ke database gagal: <%= e.getMessage() %></div>
    <%
    } finally {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
    %>
    <div class="alert alert-danger">Gagal menutup preparedStatement: <%= e.getMessage() %></div>
    <%
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
    %>
    <div class="alert alert-danger">Gagal menutup koneksi: <%= e.getMessage() %></div>
    <%
                }
            }
        }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
