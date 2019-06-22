<?php
//mulai proses edit data
//cek dahulu, jika tombol simpan di klik
if (isset($_POST['simpan'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//jika tombol tambah benar di klik maka lanjut prosesnya
	$id_dokter			= $_POST['id_dokter'];	//membuat variabel $id_dokter dan datanya dari inputan hidden id
	$nama_dokter		= $_POST['nama_dokter'];	//membuat variabel $nama_dokter dan datanya dari inputan Nama
	$jenis_kelamin		= $_POST['jenis_kelamin'];	//membuat variabel $jenis_kelamin dan datanya dari inputan dropdown Jenis Kelamin
	$spesialis	= $_POST['spesialis'];	//membuat variabel $spesialis dan datanya dari inputan Spesialis

	//melakukan query dengan perintah UPDATE untuk update data ke database dengan kondisi WHERE siswa_id='$id' <- diambil dari inputan hidden id
	$sql = "UPDATE dokter SET nama_dokter='$nama_dokter', jenis_kelamin='$jenis_kelamin', spesialis='$spesialis' WHERE id_dokter='$id_dokter'";
	$update = mysqli_query($db, $sql) or die(mysqli_error($sql));

	//jika query update sukses
	if ($update) {
		echo 'Data berhasil di simpan! ';		//Pesan jika proses simpan sukses
		echo '<a href="tabel_dokter.php?id_dokter=' . $id_dokter . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	} else {
		echo 'Gagal menyimpan data! ';		//Pesan jika proses simpan gagal
		echo '<a href="tabel_dokter.php?id_dokter=' . $id_dokter . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	}
} else {	//jika tidak terdeteksi tombol simpan di klik
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
