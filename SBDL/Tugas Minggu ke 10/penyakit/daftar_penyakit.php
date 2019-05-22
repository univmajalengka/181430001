<?php

include("../config.php");

// cek apakah tombol daftar sudah diklik atau blum?
if (isset($_POST['daftar'])) {
    // ambil data dari form
    $id_penyakit = $_POST['id_penyakit'];
    $nama_penyakit = $_POST['nama_penyakit'];
    $gejala_penyakit = $_POST['gejala_penyakit'];
    $obat = $_POST['obat'];
    // buat query
    $sql = "INSERT INTO penyakit (id_penyakit, nama_penyakit, gejala_penyakit, obat) VALUE ('$id_penyakit','$nama_penyakit','$gejala_penyakit','$obat')";
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
