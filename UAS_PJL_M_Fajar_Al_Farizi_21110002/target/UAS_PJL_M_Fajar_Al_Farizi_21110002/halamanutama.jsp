<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <title>M Fajar Al Farizi | Data Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        table.table {
            table-layout: auto;
            width: 100%;
            white-space: nowrap;
            align-items: center;
            text-align: center;
        }
        .table thead.thead-dark {
            background-color: #A38F85;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
            align-items: center;
            text-align: center;
        }
        body {
            background-color: #CDC6C3;
        }
        .mb-3 {
            align-items: center;
            justify-content: center;
            text-align: center;
            padding-top: 25px;
        }
        .btn-primary.btn {
            align-items: center;
            background-color: #A38F85;
            justify-content: center;
            text-align: center;
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
        .container {
            margin-top: 20px;
        }
        .aksi-buttons {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }
        .aksi-buttons .btn {
            margin-left: 5px;
        }
        table {
            margin-top: 10px;
        }
        .aksi-buttons .btn {
            width: 60px;
        }
        h2.text-stmik {
            text-align: center;
            font-size: 150%;
        }
        h3.text-alamat {
            text-align: center;
            font-size: 100%;
        }
        .navbar-brand{
            color: white;
        }
        .nav-link{
            color:white;
        }
        .btn-edit{
            background-color: #C19A6B;
            margin-right: 10px;
            width: 75px;
            color: black;
            border-color: #C19A6B;
        }
        .btn-delete{
            background-color: #C36241;
            border-color: #C36241;
            color: black;
            width: 75px;
        }

    </style>
</head>
<body>

<nav class="navbar" style="background-color: #6E4F3F; color: white;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Data Mahasiswa</a>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="confirmLogout()">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h1 class="text-center">Data Mahasiswa</h1>
    <h2 class="text-stmik">STMIK Mardira Indonesia</h2>
    <h3 class="text-alamat">Jl. Soekarno Hatta Jl. Leuwi Panjang No.211, Situsaeur, Kec. Bojongloa Kidul, Kota Bandung, Jawa Barat 40233</h3>

    <div class="table-responsive">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th>Nim</th>
                <th>Nama</th>
                <th>Tempat Lahir</th>
                <th>Tanggal Lahir</th>
                <th>Jenis Kelamin</th>
                <th>Alamat</th>
                <th>Kelurahan</th>
                <th>Kecamatan</th>
                <th>Kota</th>
                <th>Provinsi</th>
                <th>No Telp</th>
                <th>Strata</th>
                <th>Prodi</th>
                <th>Aksi</th>
            </tr>
            </thead>
            <tbody>
            <%
                String url = "jdbc:mysql://localhost:3306/uas_pjl";
                String user = "root";
                String password = "";
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT nim, nama, tempat_lahir, tgl_lahir, jenis_kelamin, alamat, kelurahan, kecamatan, kota, provinsi, no_hp, strata, prodi FROM data_mahasiswa");

                    while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getString("nim") %></td>
                <td><%= resultSet.getString("nama") %></td>
                <td><%= resultSet.getString("tempat_lahir") %></td>
                <td><%= resultSet.getString("tgl_lahir") %></td>
                <td><%= resultSet.getString("jenis_kelamin") %></td>
                <td><%= resultSet.getString("alamat") %></td>
                <td><%= resultSet.getString("kelurahan") %></td>
                <td><%= resultSet.getString("kecamatan") %></td>
                <td><%= resultSet.getString("kota") %></td>
                <td><%= resultSet.getString("provinsi") %></td>
                <td><%= resultSet.getString("no_hp") %></td>
                <td><%= resultSet.getString("strata") %></td>
                <td><%= resultSet.getString("prodi") %></td>
                <td class="aksi-buttons">
                    <button class="btn-edit" onclick="editData('<%= resultSet.getString("nim") %>')">Edit</button>
                    <button class="btn-delete" onclick="hapusData('<%= resultSet.getString("nim") %>')">Hapus</button>
                </td>
            </tr>
            <%
                    }
                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger'>Driver tidak ditemukan: " + e.getMessage() + "</div>");
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Koneksi ke database gagal: " + e.getMessage() + "</div>");
                } finally {
                    if (resultSet != null) {
                        try {
                            resultSet.close();
                        } catch (SQLException e) {
                            out.println("<div class='alert alert-danger'>Gagal menutup resultSet: " + e.getMessage() + "</div>");
                        }
                    }
                    if (statement != null) {
                        try {
                            statement.close();
                        } catch (SQLException e) {
                            out.println("<div class='alert alert-danger'>Gagal menutup statement: " + e.getMessage() + "</div>");
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
            </tbody>
        </table>
    </div>
    <div class="mb-3">
        <a href="tambah.jsp" class="btn btn-primary">Tambah Data Mahasiswa</a>
    </div>
</div>

<script>
    function editData(nim) {
        window.location.href = "edit.jsp?nim=" + nim;
    }
    function hapusData(nim) {
        if (confirm("Apakah Anda yakin ingin menghapus data ini?")) {
            window.location.href = "hapus.jsp?nim=" + nim;
        }
    }

    function confirmLogout() {
        if (confirm("Apakah Anda yakin ingin logout?")) {
            window.location.href = "logout.jsp";
        }
    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
