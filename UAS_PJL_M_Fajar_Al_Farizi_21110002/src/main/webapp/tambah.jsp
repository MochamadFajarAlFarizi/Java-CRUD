<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>


<!DOCTYPE html>
<html>
<head>
    <title>Tambah Data Mahasiswa</title>
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
    <h1 class="text-center">Tambah Data Mahasiswa</h1><br>
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <form class="form" action="tambah.jsp" method="post">
                <div class="form-group row">
                    <label for="nim" class="col-md-2 col-form-label">NIM</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="nim" name="nim" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nama" class="col-md-2 col-form-label">Nama</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="nama" name="nama" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tempat_lahir" class="col-md-2 col-form-label">Tempat Lahir</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="tempat_lahir" name="tempat_lahir" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl_lahir" class="col-md-2 col-form-label">Tanggal Lahir</label>
                    <div class="col-md-10">
                        <input type="date" class="form-control" id="tgl_lahir" name="tgl_lahir" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jenis_kelamin" class="col-md-2 col-form-label">Jenis Kelamin</label>
                    <div class="col-md-10">
                        <select class="form-control" id="jenis_kelamin" name="jenis_kelamin" required>
                            <option value="L">Laki-Laki</option>
                            <option value="P">Perempuan</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="alamat" class="col-md-2 col-form-label">Alamat</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="alamat" name="alamat" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kelurahan" class="col-md-2 col-form-label">Kelurahan</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="kelurahan" name="kelurahan" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kecamatan" class="col-md-2 col-form-label">Kecamatan</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="kecamatan" name="kecamatan" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kota" class="col-md-2 col-form-label">Kota</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="kota" name="kota" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="provinsi" class="col-md-2 col-form-label">Provinsi</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="provinsi" name="provinsi" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="no_hp" class="col-md-2 col-form-label">No. HP</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="no_hp" name="no_hp" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="strata" class="col-md-2 col-form-label">Strata</label>
                    <div class="col-md-10">
                        <select class="form-control" id="strata" name="strata" required>
                            <option value="D3">D3</option>
                            <option value="S1">S1</option>
                            <option value="S2">S2</option>
                            <option value="S3">S3</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="prodi" class="col-md-2 col-form-label">Program Studi</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="prodi" name="prodi" required>
                    </div>
                </div>
                <div class="btn-right">
                    <button type="submit" class="btn btn-primary mb-3">Tambah</button>
                </div>
            </form>

            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
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
                        String sql = "INSERT INTO data_mahasiswa (nim, nama, tempat_lahir, tgl_lahir, jenis_kelamin, alamat, kelurahan, kecamatan, kota, provinsi, no_hp, strata, prodi) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                        preparedStatement = connection.prepareStatement(sql);
                        preparedStatement.setString(1, nim);
                        preparedStatement.setString(2, nama);
                        preparedStatement.setString(3, tempat_lahir);
                        preparedStatement.setString(4, tgl_lahir);
                        preparedStatement.setString(5, jenis_kelamin);
                        preparedStatement.setString(6, alamat);
                        preparedStatement.setString(7, kelurahan);
                        preparedStatement.setString(8, kecamatan);
                        preparedStatement.setString(9, kota);
                        preparedStatement.setString(10, provinsi);
                        preparedStatement.setString(11, no_hp);
                        preparedStatement.setString(12, strata);
                        preparedStatement.setString(13, prodi);

                        int row = preparedStatement.executeUpdate();
                        if (row > 0) {
                            out.println("<div class='alert alert-success'>Data berhasil ditambahkan!</div>");
                            out.println("<script>setTimeout(function() { redirectToIndex(); }, 2000);</script>");
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
                }
            %>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
