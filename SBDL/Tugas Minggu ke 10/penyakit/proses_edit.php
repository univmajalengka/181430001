<?php
//mulai proses edit data
//cek dahulu, jika tombol simpan di klik
if (isset($_POST['simpan'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//jika tombol tambah benar di klik maka lanjut prosesnya
	$id_penyakit			= $_POST['id_penyakit'];
	$nama_penyakit		= $_POST['nama_penyakit'];
	$gejala_penyakit		= $_POST['gejala_penyakit'];
	$obat	= $_POST['obat'];

	//melakukan query dengan perintah UPDATE untuk update data ke database dengan kondisi WHERE siswa_id='$id' <- diambil dari inputan hidden id
	$sql = "UPDATE penyakit SET nama_penyakit='$nama_penyakit', gejala_penyakit='$gejala_penyakit', obat='$obat' WHERE id_penyakit='$id_penyakit'";
	$update = mysqli_query($db, $sql) or die(mysqli_error($sql));

	//jika query update sukses
	if ($update) {
		echo 'Data berhasil di simpan! ';		//Pesan jika proses simpan sukses
		echo '<a href="tabel_penyakit.php?id_penyakit=' . $id_penyakit . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	} else {
		echo 'Gagal menyimpan data! ';		//Pesan jika proses simpan gagal
		echo '<a href="tabel_penyakit.php?id_penyakit=' . $id_penyakit . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	}
} else {	//jika tidak terdeteksi tombol simpan di klik
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
