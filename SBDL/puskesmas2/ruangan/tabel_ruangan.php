<!DOCTYPE html>
<html>

<head>
	<title>DATABASE PUSKESMAS</title>
</head>

<body>
	<h2>DATA PUSKESMAS</h2>
	<p><a href="../index.php">Beranda</a> / <a href="form_ruangan.php">Tambah Data</a></p>
	<h3>Data Ruangan</h3>
	<table cellpadding="5" cellspacing="0" border="1">
		<tr bgcolor="#CCCCCC">
			<th>ID Ruangan</th>
			<th>Nama Ruangan</th>
			<th>Kelas Ruangan</th>
			<th>Opsi</th>
		</tr>
		<?php
		//iclude file koneksi ke database
		include('../config.php');

		//query ke database dg SELECT table dokter
		$sql = "SELECT * FROM ruangan";
		$query = mysqli_query($db, $sql) or die(mysql_error());

		//cek, apakakah hasil query di atas mendapatkan hasil atau tidak (data kosong atau tidak)
		if (mysqli_num_rows($query) == 0) {	//ini artinya jika data hasil query di atas kosong
			//jika data kosong, maka akan menampilkan row kosong
			echo '<tr><td colspan="6">Tidak ada data!</td></tr>';
		} else {	//else ini artinya jika data hasil query ada (data diu database tidak kosong)
			//jika data tidak kosong, maka akan melakukan perulangan while
			while ($data = mysqli_fetch_assoc($query)) {	//perulangan while dg membuat variabel $data yang akan mengambil data di database
				//menampilkan row dengan data di database
				echo '<tr>';
				echo '<td>' . $data['id_ruangan'] . '</td>';	//menampilkan data id_dokter dari database
				echo '<td>' . $data['nama_ruangan'] . '</td>';	//menampilkan data nama dari database
				echo '<td>' . $data['kelas_ruangan'] . '</td>';	//menampilkan data jenis_kelamin dari database
				echo '<td><a href="edit_ruangan.php?id=' . $data['id_ruangan'] . '">Edit</a> / <a href="hapus.php?id=' . $data['id_ruangan'] . '" onclick="return confirm(\'Yakin?\')">Hapus</a></td>';	//menampilkan link edit dan hapus dimana tiap link terdapat GET id
				echo '</tr>';
			}
		}
		?>
	</table>
</body>

</html>