<!DOCTYPE html>
<html>

<head>
	<title>DATABASE PUSKESMAS</title>
</head>

<body>
	<h2>DATA PUSKESMAS</h2>
	<p><a href="../index.php">Beranda</a> / <a href="form_rawat.php">Tambah Data</a></p>
	<h3>Edit Data Perawatan</h3>

	<?php
	//proses mengambil data ke database untuk ditampilkan di form edit berdasarkan id_dokter
	//include atau memasukkan file koneksi ke database
	include('../config.php');

	//membuat variabel $id yg nilainya adalah dari URL GET id
	$id = $_GET['id'];

	//melakukan query ke database dg SELECT table siswa dengan kondisi WHERE siswa_id = '$id'
	$sql = "SELECT * FROM rawat WHERE id_rawat='$id'";
	$show = mysqli_query($db, $sql) or die(mysqli_error($sql));
	$data = mysqli_fetch_assoc($show);	//mengambil data ke database yang nantinya akan ditampilkan di form edit di bawah
	?>

	<form action="proses_edit.php" method="post">
		<input type="hidden" name="id_rawat" value="<?php echo $id; ?>"> <!-- membuat ID hilang/ Hidden, karena ID merupakan Primary Key. Kalau diganti, takutnya akan konflik dengan ID yang sudah ada. -->
		<table cellpadding="3" cellspacing="0">
			<tr>
				<td>Nama Ruangan</td>
				<td>:</td>
				<td><input type="text" name="nama_ruangan" size="30" value="<?php echo $data['nama_ruangan']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Nama Pasien</td>
				<td>:</td>
				<td><input type="text" name="nama_pasien" size="30" value="<?php echo $data['nama_pasien']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Nama Penyakit</td>
				<td>:</td>
				<td><input type="text" name="nama_penyakit" size="30" value="<?php echo $data['nama_penyakit']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Nama Obat</td>
				<td>:</td>
				<td><input type="text" name="nama_obat" size="30" value="<?php echo $data['nama_obat']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Nama Dokter</td>
				<td>:</td>
				<td><input type="text" name="nama_dokter" size="30" value="<?php echo $data['nama_dokter']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Nama Perawat</td>
				<td>:</td>
				<td><input type="text" name="nama_perawat" size="30" value="<?php echo $data['nama_perawat']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td></td>
				<td><input type="submit" name="simpan" value="Simpan"></td>
			</tr>
		</table>
	</form>
</body>

</html>