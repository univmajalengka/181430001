<?php
//memulai proses hapus data
//cek dahulu, apakah benar URL sudah ada GET id
if (isset($_GET['id'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//membuat variabel $id yg bernilai dari URL GET id
	$id = $_GET['id'];


	$sql1 = "SELECT id_ruangan FROM ruangan WHERE id_ruangan='$id'";
	$cek = mysqli_query($db, $sql1) or die(mysqli_error($sql1));


	$sql2 = "DELETE FROM ruangan WHERE id_ruangan='$id'";
	$del = mysqli_query($db, $sql2);

	//jika query DELETE berhasil
	if ($del) {
		echo 'Data berhasil di hapus! ';		//Pesan jika proses hapus berhasil
		echo '<a href="tabel_ruangan.php">Kembali</a>';	//membuat Link untuk kembali ke halaman tabel
	} else {
		echo 'Gagal menghapus data! ';		//Pesan jika proses hapus gagal
		echo '<a href="../index.php">Kembali</a>';	//membuat Link untuk kembali ke halaman index
	}
} else {
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
