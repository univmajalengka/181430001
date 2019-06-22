<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Obat</h3>
    </header>
    <p><a href="tabel_obat.php">Kembali</a></p>
    <form action="daftar_obat.php" method="POST">
        <fieldset>
            <p>
                <label for="id_obat">ID Obat: </label>
                <input type="text" name="id_obat" placeholder="Oxxx" />
            </p>
            <p>
                <label for="nama_obat">Nama Obat: </label>
                <input type="text" name="nama_obat" placeholder="Nama Obat" />
            </p>
            <p>
                <label for="kegunaan">Kegunaan: </label>
                <input type="text" name="kegunaan" placeholder="Kegunaan" />
            </p>
            <p>
                <label for="stok">Stok: </label>
                <input type="text" name="stok" placeholder="Jumlah Stok Obat" />
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>

    </form>

</body>

</html>