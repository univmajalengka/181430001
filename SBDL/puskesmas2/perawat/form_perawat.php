<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Tambah Perawat</h3>
    </header>

    <p><a href="tabel_perawat.php">Kembali</a></p>

    <form action="daftar_perawat.php" method="POST">
        <fieldset>
            <p>
                <label for="id_perawat">ID Perawat: </label>
                <input type="text" name="id_perawat" placeholder="PRxxxx" />
            </p>
            <p>
                <label for="nama_perawat">Nama Perawat: </label>
                <input type="text" name="nama_perawat" placeholder="Nama Perawat" />
            </p>

            <p>
                <label for="jenis_kelamin">Jenis Kelamin: </label>
                <label><input type="radio" name="jenis_kelamin" value="L"> Laki-laki</label>
                <label><input type="radio" name="jenis_kelamin" value="P"> Perempuan</label>
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>
    </form>
</body>

</html>