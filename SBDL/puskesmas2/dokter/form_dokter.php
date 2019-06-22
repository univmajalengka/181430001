<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Tambah Dokter</h3>
    </header>
    <p><a href="tabel_dokter.php">Kembali</a></p>
    <form action="daftar_dokter.php" method="POST">
        <fieldset>
            <p>
                <label for="id_dokter">ID Dokter: </label>
                <input type="text" name="id_dokter" placeholder="ID Dokter" />
            </p>
            <p>
                <label for="nama_dokter">Nama Dokter: </label>
                <input type="text" name="nama_dokter" placeholder="Nama Dokter" />
            </p>

            <p>
                <label for="jenis_kelamin">Jenis Kelamin: </label>
                <label><input type="radio" name="jenis_kelamin" value="L"> Laki-laki</label>
                <label><input type="radio" name="jenis_kelamin" value="P"> Perempuan</label>
            </p>
            <p>
                <label for="spesialis">Spesialis: </label>
                <input type="text" name="spesialis" placeholder="Spesialis" />
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>

    </form>

</body>

</html>