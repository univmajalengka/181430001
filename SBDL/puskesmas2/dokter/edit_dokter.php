<!DOCTYPE html>
<html>

<head>
	<title>DATABASE PUSKESMAS</title>
</head>

<body>
	<h2>DATA PUSKESMAS</h2>
	<p><a href="../index.php">Beranda</a> / <a href="form_dokter.php">Tambah Data</a></p>
	<h3>Edit Data</h3>

	<?php
	//proses mengambil data ke database untuk ditampilkan di form edit berdasarkan id_dokter
	//include atau memasukkan file koneksi ke database
	include('../config.php');

	//membuat variabel $id yg nilainya adalah dari URL GET id
	$id = $_GET['id'];

	//melakukan query ke database dg SELECT table siswa dengan kondisi WHERE siswa_id = '$id'
	$sql = "SELECT * FROM dokter WHERE id_dokter='$id'";
	$show = mysqli_query($db, $sql);
	$data = mysqli_fetch_assoc($show);	//mengambil data ke database yang nantinya akan ditampilkan di form edit di bawah
	?>

	<form action="proses_edit.php" method="post">
		<input type="hidden" name="id_dokter" value="<?php echo $id; ?>"> <!-- membuat ID hilang/ Hidden, karena ID merupakan Primary Key. Kalau diganti, takutnya akan konflik dengan ID yang sudah ada. -->
		<table cellpadding="3" cellspacing="0">
			<tr>
				<td>Nama Dokter</td>
				<td>:</td>
				<td><input type="text" name="nama_dokter" size="30" value="<?php echo $data['nama_dokter']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Jenis Kelamin</td>
				<td>:</td>
				<td>
					<select name="jenis_kelamin" required>
						<option value="">Pilih Jenis Kelamin</option>
						<option value="L" <?php if ($data['jenis_kelamin'] == 'L') {
												echo 'selected';
											} ?>>Laki-laki</option> <!-- jika data di database sama dengan value maka akan terselect/terpilih -->
						<option value="P" <?php if ($data['jenis_kelamin'] == 'P') {
												echo 'selected';
											} ?>>Perempuan</option> <!-- jika data di database sama dengan value maka akan terselect/terpilih -->
					</select>
				</td>
			</tr>
			<tr>
				<td>Spesialis</td>
				<td>:</td>
				<td><input type="text" name="spesialis" value="<?php echo $data['spesialis']; ?>" required></td> <!-- value diambil dari hasil query -->
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