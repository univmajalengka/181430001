<?php
//mulai proses edit data
//cek dahulu, jika tombol simpan di klik
if (isset($_POST['simpan'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//jika tombol tambah benar di klik maka lanjut prosesnya
	$id_rawat = $_POST['id_rawat'];
	$nama_ruangan = $_POST['nama_ruangan'];
	$nama_pasien = $_POST['nama_pasien'];
	$nama_penyakit = $_POST['nama_penyakit'];
	$nama_obat = $_POST['nama_obat'];
	$nama_dokter = $_POST['nama_dokter'];
	$nama_perawat = $_POST['nama_perawat'];
	//melakukan query dengan perintah UPDATE untuk update data ke database dengan kondisi WHERE siswa_id='$id' <- diambil dari inputan hidden id
	$sql = "UPDATE rawat SET nama_ruangan='$nama_ruangan', nama_pasien='$nama_pasien', nama_penyakit='$nama_penyakit', nama_obat='$nama_obat', nama_dokter='$nama_dokter', nama_perawat='$nama_perawat' WHERE id_rawat='$id_rawat'";
	$update = mysqli_query($db, $sql) or die(mysqli_error($sql));

	//jika query update sukses
	if ($update) {
		echo 'Data berhasil di simpan! ';		//Pesan jika proses simpan sukses
		echo '<a href="tabel_rawat.php?id_rawat=' . $id_rawat . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	} else {
		echo 'Gagal menyimpan data! ';		//Pesan jika proses simpan gagal
		echo '<a href="tabel_rawat.php?id_rawat=' . $id_rawat . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	}
} else {	//jika tidak terdeteksi tombol simpan di klik
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
