<?php
//mulai proses edit data
//cek dahulu, jika tombol simpan di klik
if (isset($_POST['simpan'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//jika tombol tambah benar di klik maka lanjut prosesnya
	$id_perawat			= $_POST['id_perawat'];	//membuat variabel $id_dokter dan datanya dari inputan hidden id
	$nama_perawat		= $_POST['nama_perawat'];	//membuat variabel $nama_dokter dan datanya dari inputan Nama
	$jenis_kelamin		= $_POST['jenis_kelamin'];	//membuat variabel $jenis_kelamin dan datanya dari inputan dropdown Jenis Kelamin

	//melakukan query dengan perintah UPDATE untuk update data ke database
	$sql = "UPDATE perawat SET nama_perawat='$nama_perawat', jenis_kelamin='$jenis_kelamin' WHERE id_perawat='$id_perawat'";
	$update = mysqli_query($db, $sql) or die(mysqli_error($sql));

	//jika query update sukses
	if ($update) {
		echo 'Data berhasil di simpan! ';		//Pesan jika proses simpan sukses
		echo '<a href="tabel_perawat.php?id_perawat=' . $id_perawat . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	} else {
		echo 'Gagal menyimpan data! ';		//Pesan jika proses simpan gagal
		echo '<a href=""tabel_perawat.php?id_perawat=' . $id_perawat . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	}
} else {	//jika tidak terdeteksi tombol simpan di klik
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
