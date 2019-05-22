<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Penyakit</h3>
    </header>
    <p><a href="../index.php">Kembali</a></p>
    <form action="daftar_penyakit.php" method="POST">
        <fieldset>
            <p>
                <label for="id_penyakit">ID Penyakit: </label>
                <input type="text" name="id_penyakit" placeholder="Pxxx" />
            </p>
            <p>
                <label for="nama_penyakit">Nama Penyakit: </label>
                <input type="text" name="nama_penyakit" placeholder="Nama Penyakit" />
            </p>
            <p>
                <label for="gejala_penyakit">Gejala: </label>
                <input type="text" name="gejala_penyakit" placeholder="Gejala" />
            </p>
            <p>
                <label for="obat">Obat: </label>
                <input type="text" name="obat" placeholder="Obat" />
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>

    </form>

</body>

</html>