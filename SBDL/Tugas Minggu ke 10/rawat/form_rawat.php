<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Perawatan</h3>
    </header>
    <p><a href="../index.php">Kembali</a></p>
    <form action="daftar_rawat.php" method="POST">
        <fieldset>
            <p>
                <label for="id_rawat">ID Perawatan: </label>
                <input type="text" name="id_rawat" placeholder="RWxxx" />
            </p>
            <p>
                <label for="nama_ruangan">Nama Ruangan: </label>
                <input type="text" name="nama_ruangan" placeholder="Nama Ruangan" />
            </p>
            <p>
                <label for="nama_pasien">Nama Pasien: </label>
                <input type="text" name="nama_pasien" placeholder="Nama Pasien" />
            </p>
            <p>
                <label for="nama_penyakit">Nama Penyakit: </label>
                <input type="text" name="nama_penyakit" placeholder="Nama Penyakit" />
            </p>
            <p>
                <label for="nama_obat">Nama Obat: </label>
                <input type="text" name="nama_obat" placeholder="Nama Obat" />
            </p>
            <p>
                <label for="nama_dokter">Nama Dokter: </label>
                <input type="text" name="nama_dokter" placeholder="Nama Dokter" />
            </p>
            <p>
                <label for="nama_perawat">Nama Perawat: </label>
                <input type="text" name="nama_perawat" placeholder="Nama Perawat" />
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>

    </form>

</body>

</html>