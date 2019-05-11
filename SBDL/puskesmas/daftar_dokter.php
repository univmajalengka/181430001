<?php

    include("config.php");

    // cek apakah tombol daftar sudah diklik atau blum?
    if(isset($_POST['daftar'])){
        // ambil data dari form
        $id_dokter = $_POST['id_dokter'];
        $nama_dokter = $_POST['nama_dokter'];
        $jenis_kelamin = $_POST['jenis_kelamin'];
        $spesialis = $_POST['spesialis'];

        // buat query
        $sql = "INSERT INTO dokter (id_dokter, nama_dokter, jenis_kelamin, spesialis) VALUE ('$id_dokter','$nama_dokter','$jenis_kelamin','$spesialis')";
        $query = mysqli_query($db, $sql);

        // apakah query simpan berhasil?
        if( $query ) {
            // kalau berhasil alihkan ke halaman index.php dengan status=sukses
            header('Location: index.php?status=sukses');
        } 
        else {
            // kalau gagal alihkan ke halaman indek.php dengan status=gagal
            header('Location: index.php?status=gagal');
        }
    } 
    else {
        die("Akses dilarang...");
    }
?>