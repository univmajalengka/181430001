<?php

// cek apakah tombol daftar sudah diklik atau blum?
if (isset($_POST['daftar'])) {
    // ambil data dari form
    $id_pasien = $_POST['id_pasien'];
    $nama_pasien = $_POST['nama_pasien'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $alamat = $_POST['alamat'];
    $penyakit = $_POST['penyakit'];

    $conn = mysqli_connect("localhost", "root", "", "puskesmas_db");

    // buat query
    $sql = "INSERT INTO pasien (id_pasien, nama_pasien, jenis_kelamin, alamat, penyakit) VALUES ('$id_pasien', '$nama_pasien', '$jenis_kelamin', '$alamat', '$penyakit')";
    $query = mysqli_query($conn, $sql) or die(mysqli_error($conn));

    // apakah query simpan berhasil?
    if ($query) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: ../index.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: ../index.php?status=gagal');
    }
} else {
    die("Akses dilarang...");
}
