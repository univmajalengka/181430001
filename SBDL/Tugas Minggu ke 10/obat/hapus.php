<?php
//memulai proses hapus data
//cek dahulu, apakah benar URL sudah ada GET id
if (isset($_GET['id'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//membuat variabel $id yg bernilai dari URL GET id
	$id = $_GET['id'];

	//cek ke database apakah ada data siswa dengan id_dokter='$id'
	$sql1 = "SELECT id_obat FROM obat WHERE id_obat='$id'";
	$cek = mysqli_query($db, $sql1) or die(mysqli_error($sql1));

	//jika data ada di database, maka melakukan query DELETE table dokter dengan kondisi WHERE id_dokter='$id'
	$sql2 = "DELETE FROM obat WHERE id_obat='$id'";
	$del = mysqli_query($db, $sql2) or die(mysqli_error($sql1));

	//jika query DELETE berhasil
	if ($del) {
		echo 'Data berhasil di hapus! ';		//Pesan jika proses hapus berhasil
		echo '<a href="tabel_obat.php">Kembali</a>';	//membuat Link untuk kembali ke halaman tabel
	} else {
		echo 'Gagal menghapus data! ';		//Pesan jika proses hapus gagal
		echo '<a href="../index.php">Kembali</a>';	//membuat Link untuk kembali ke halaman index
	}
} else {
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
