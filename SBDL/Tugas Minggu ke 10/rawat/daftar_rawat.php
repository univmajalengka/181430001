<?php

include("../config.php");

// cek apakah tombol daftar sudah diklik atau blum?
if (isset($_POST['daftar'])) {
    // ambil data dari form
    $id_rawat = $_POST['id_rawat'];
    $nama_ruangan = $_POST['nama_ruangan'];
    $nama_pasien = $_POST['nama_pasien'];
    $nama_penyakit = $_POST['nama_penyakit'];
    $nama_obat = $_POST['nama_obat'];
    $nama_dokter = $_POST['nama_dokter'];
    $nama_perawat = $_POST['nama_perawat'];

    // buat query
    $sql = "INSERT INTO rawat (id_rawat, nama_ruangan, nama_pasien, nama_penyakit, nama_obat, nama_dokter, nama_perawat) VALUE ('$id_rawat','$nama_ruangan','$nama_pasien','$nama_penyakit','$nama_obat','$nama_dokter','$nama_perawat')";
    $query = mysqli_query($db, $sql) or die(mysqli_error($db));

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
