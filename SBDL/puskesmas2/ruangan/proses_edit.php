<?php
//mulai proses edit data
//cek dahulu, jika tombol simpan di klik
if (isset($_POST['simpan'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//jika tombol tambah benar di klik maka lanjut prosesnya
	$id_ruangan			= $_POST['id_ruangan'];
	$nama_ruangan		= $_POST['nama_ruangan'];	//membuat variabel $nama_dokter dan datanya dari inputan Nama
	$kelas_ruangan		= $_POST['kelas_ruangan'];

	//melakukan query dengan perintah UPDATE untuk update data ke database
	$sql = "UPDATE ruangan SET nama_ruangan='$nama_ruangan', kelas_ruangan='$kelas_ruangan' WHERE id_ruangan='$id_ruangan'";
	$update = mysqli_query($db, $sql) or die(mysqli_error($sql));

	//jika query update sukses
	if ($update) {
		echo 'Data berhasil di simpan! ';		//Pesan jika proses simpan sukses
		echo '<a href="tabel_ruangan.php?id_perawat=' . $id_ruangan . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	} else {
		echo 'Gagal menyimpan data! ';		//Pesan jika proses simpan gagal
		echo '<a href=""tabel_ruangan.php?id_perawat=' . $id_perawat . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	}
} else {	//jika tidak terdeteksi tombol simpan di klik
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
