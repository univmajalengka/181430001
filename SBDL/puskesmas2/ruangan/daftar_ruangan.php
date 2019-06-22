<?php

include("../config.php");

// cek apakah tombol daftar sudah diklik atau blum?
if (isset($_POST['daftar'])) {
    // ambil data dari form
    $id_ruangan = $_POST['id_ruangan'];
    $nama_ruangan = $_POST['nama_ruangan'];
    $kelas_ruangan = $_POST['kelas_ruangan'];

    // buat query
    $sql = "INSERT INTO ruangan (id_ruangan, nama_ruangan, kelas_ruangan) VALUE ('$id_ruangan','$nama_ruangan','$kelas_ruangan')";
    $query = mysqli_query($db, $sql);

    // apakah query simpan berhasil?
    if ($query) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: ../index.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman index.php dengan status=gagal
        header('Location: ../index.php?status=gagal');
    }
} else {
    die("Akses dilarang...");
}
