<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Tambah Pasien</h3>
    </header>
    <p><a href="../index.php">Kembali</a></p>
    <form action="daftar_pasien.php" method="POST">
        <fieldset>
            <p>
                <label for="id_pasien">ID Pasien: </label>
                <input type="text" name="id_pasien" placeholder="PSxxx" />
            </p>
            <p>
                <label for="nama_pasien">Nama Pasien: </label>
                <input type="text" name="nama_pasien" placeholder="Nama Pasien" />
            </p>

            <p>
                <label for="jenis_kelamin">Jenis Kelamin: </label>
                <label><input type="radio" name="jenis_kelamin" value="L"> Laki-laki</label>
                <label><input type="radio" name="jenis_kelamin" value="P"> Perempuan</label>
            </p>
            <p>
                <label for="alamat">Alamat: </label>
                <input type="text" name="alamat" placeholder="Alamat" />
            </p>
            <p>
                <label for="penyakit">Penyakit: </label>
                <input type="text" name="penyakit" placeholder="Penyakit" />
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>

    </form>

</body>

</html>