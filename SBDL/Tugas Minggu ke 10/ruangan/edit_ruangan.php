<!DOCTYPE html>
<html>

<head>
	<title>DATABASE PUSKESMAS</title>
</head>

<body>
	<h2>DATA PUSKESMAS</h2>
	<p><a href="../index.php">Beranda</a> / <a href="form_ruangan.php">Tambah Data</a></p>
	<h3>Edit Data Ruangan</h3>

	<?php
	//proses mengambil data ke database untuk ditampilkan di form edit berdasarkan id_dokter
	//include atau memasukkan file koneksi ke database
	include('../config.php');

	//membuat variabel $id yg nilainya adalah dari URL GET id
	$id = $_GET['id'];

	$sql = "SELECT * FROM ruangan WHERE id_ruangan='$id'";
	$show = mysqli_query($db, $sql);
	$data = mysqli_fetch_assoc($show);	//mengambil data ke database yang nantinya akan ditampilkan di form edit di bawah
	?>

	<form action="proses_edit.php" method="post">
		<input type="hidden" name="id_ruangan" value="<?php echo $id; ?>"> <!-- membuat ID hilang/ Hidden, karena ID merupakan Primary Key. Kalau diganti, takutnya akan konflik dengan ID yang sudah ada. -->
		<table cellpadding="3" cellspacing="0">
			<tr>
				<td>Nama Ruangan</td>
				<td>:</td>
				<td><input type="text" name="nama_ruangan" size="30" value="<?php echo $data['nama_ruangan']; ?>" required></td> <!-- value diambil dari hasil query -->
			</tr>
			<tr>
				<td>Kelas Ruangan</td>
				<td>:</td>
				<td>
					<select name="kelas_ruangan" required>
						<option value="">Pilih Kelas Ruangan</option>
						<option value="Ekonomi" <?php if ($data['kelas_ruangan'] == 'Ekonomi') {
													echo 'selected';
												} ?>>Ekonomi</option> <!-- jika data di database sama dengan value maka akan terselect/terpilih -->
						<option value="Bisnis" <?php if ($data['kelas_ruangan'] == 'Bisnis') {
													echo 'selected';
												} ?>>Bisnis</option>
						<option value="VIP" <?php if ($data['kelas_ruangan'] == 'VIP') {
												echo 'selected';
											} ?>>VIP</option>
						<option value="VVIP" <?php if ($data['kelas_ruangan'] == 'VVIP') {
													echo 'selected';
												} ?>>VVIP</option>
					</select>
				</td>
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