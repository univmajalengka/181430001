<?php
//mulai proses edit data
//cek dahulu, jika tombol simpan di klik
if (isset($_POST['simpan'])) {
	//inlcude atau memasukkan file koneksi ke database
	include('../config.php');

	//jika tombol tambah benar di klik maka lanjut prosesnya
	$id_pasien			= $_POST['id_pasien'];
	$nama_pasien		= $_POST['nama_pasien'];
	$jenis_kelamin		= $_POST['jenis_kelamin'];
	$alamat	= $_POST['alamat'];
	$penyakit	= $_POST['penyakit'];

	$sql = "UPDATE pasien SET nama_pasien='$nama_pasien', jenis_kelamin='$jenis_kelamin', alamat='$alamat', penyakit='$penyakit' WHERE id_pasien='$id_pasien'";
	$update = mysqli_query($db, $sql) or die(mysqli_error($sql));

	//jika query update sukses
	if ($update) {
		echo 'Data berhasil di simpan! ';		//Pesan jika proses simpan sukses
		echo '<a href="tabel_pasien.php?id_pasien=' . $id_pasien . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	} else {
		echo 'Gagal menyimpan data! ';		//Pesan jika proses simpan gagal
		echo '<a href="tabel_pasien.php?id_pasien=' . $id_pasien . '">Kembali ke Tabel</a>';	//membuat Link untuk kembali ke halaman edit
	}
} else {	//jika tidak terdeteksi tombol simpan di klik
	//redirect atau dikembalikan ke halaman sebelumnya
	echo '<script>window.history.back()</script>';
}
