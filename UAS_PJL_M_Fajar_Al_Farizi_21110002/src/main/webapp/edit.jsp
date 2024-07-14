<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>


<!DOCTYPE html>
<html>
<head>
    <title>Edit Data</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 20px;
        }
        .form{
            border: 1px solid #A38F85;
            padding: 20px;
            border-radius: 5px;
        }
        .btn-right {
            display: flex;
            justify-content: flex-end;
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
        .body{
            background-color: #CDC6C3;
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
    <h1 class="text-center">Edit Data Mahasiswa</h1><br>

    <%
        String nim = request.getParameter("nim");
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
            resultSet = statement.executeQuery("SELECT * FROM data_mahasiswa WHERE nim='" + nim + "'");

            if (resultSet.next()) {
                String nama = resultSet.getString("nama");
                String tempat_lahir = resultSet.getString("tempat_lahir");
                String tgl_lahir = resultSet.getString("tgl_lahir");
                String jenis_kelamin = resultSet.getString("jenis_kelamin");
                String alamat = resultSet.getString("alamat");
                String kelurahan = resultSet.getString("kelurahan");
                String kecamatan = resultSet.getString("kecamatan");
                String kota = resultSet.getString("kota");
                String provinsi = resultSet.getString("provinsi");
                String no_hp = resultSet.getString("no_hp");
                String strata = resultSet.getString("strata");
                String prodi = resultSet.getString("prodi");
    %>

    <div class="row">
        <div class="col-md-6 offset-md-3">
            <form class="form" action="proses_edit.jsp" method="post">
                <input type="hidden" name="nim" value="<%= nim %>">
                <div class="form-group row">
                    <label for="nama" class="col-md-4 col-form-label">Nama</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="nama" name="nama" value="<%= nama %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tempat_lahir" class="col-md-4 col-form-label">Tempat Lahir</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="tempat_lahir" name="tempat_lahir" value="<%= tempat_lahir %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl_lahir" class="col-md-4 col-form-label">Tanggal Lahir</label>
                    <div class="col-md-8">
                        <input type="date" class="form-control" id="tgl_lahir" name="tgl_lahir" value="<%= tgl_lahir %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jenis_kelamin" class="col-md-4 col-form-label">Jenis Kelamin</label>
                    <div class="col-md-8">
                        <select class="form-control" id="jenis_kelamin" name="jenis_kelamin" required>
                            <option value="L" <%= jenis_kelamin.equals("L") ? "selected" : "" %>>Laki-Laki</option>
                            <option value="P" <%= jenis_kelamin.equals("P") ? "selected" : "" %>>Perempuan</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="alamat" class="col-md-4 col-form-label">Alamat</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="alamat" name="alamat" value="<%= alamat %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kelurahan" class="col-md-4 col-form-label">Kelurahan</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="kelurahan" name="kelurahan" value="<%= kelurahan %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kecamatan" class="col-md-4 col-form-label">Kecamatan</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="kecamatan" name="kecamatan" value="<%= kecamatan %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kota" class="col-md-4 col-form-label">Kabupaten</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="kota" name="kota" value="<%= kota %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="provinsi" class="col-md-4 col-form-label">Provinsi</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="provinsi" name="provinsi" value="<%= provinsi %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="no_hp" class="col-md-4 col-form-label">No. HP</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="no_hp" name="no_hp" value="<%= no_hp %>" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="strata" class="col-md-4 col-form-label">Strata</label>
                    <div class="col-md-8">
                        <select class="form-control" id="strata" name="strata" required>
                            <option value="D3" <%= strata.equals("D3") ? "selected" : "" %>>D3</option>
                            <option value="S1" <%= strata.equals("S1") ? "selected" : "" %>>S1</option>
                            <option value="S2" <%= strata.equals("S2") ? "selected" : "" %>>S2</option>
                            <option value="S3" <%= strata.equals("S3") ? "selected" : "" %>>S3</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="prodi" class="col-md-4 col-form-label">Program Studi</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="prodi" name="prodi" value="<%= prodi %>" required>
                    </div>
                </div>
                <div class="btn-right">
                    <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                </div><br>
            </form>
        </div>
    </div>

    <%
            } else {
                out.println("<div class='alert alert-danger'>Data mahasiswa dengan NIM " + nim + " tidak ditemukan.</div>");
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
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
