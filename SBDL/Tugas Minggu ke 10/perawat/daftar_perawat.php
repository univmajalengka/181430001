<?php

include("../config.php");

// cek apakah tombol daftar sudah diklik atau blum?
if (isset($_POST['daftar'])) {
    // ambil data dari form
    $id_perawat = $_POST['id_perawat'];
    $nama_perawat = $_POST['nama_perawat'];
    $jenis_kelamin = $_POST['jenis_kelamin'];

    // buat query
    $sql = "INSERT INTO perawat (id_perawat, nama_perawat, jenis_kelamin) VALUE ('$id_perawat','$nama_perawat','$jenis_kelamin')";
    $query = mysqli_query($db, $sql);

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
