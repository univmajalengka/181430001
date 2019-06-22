<?php

include("../config.php");

// cek apakah tombol daftar sudah diklik atau blum?
if (isset($_POST['daftar'])) {
    // ambil data dari form
    $id_obat = $_POST['id_obat'];
    $nama_obat = $_POST['nama_obat'];
    $kegunaan = $_POST['kegunaan'];
    $stok = $_POST['stok'];
    // buat query
    $sql = "INSERT INTO obat (id_obat, nama_obat, kegunaan, stok) VALUE ('$id_obat','$nama_obat','$kegunaan','$stok')";
    $query = mysqli_query($db, $sql) or die(mysqli_error($sql));

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
