<!DOCTYPE html>
<html>

<head>
    <title>DATABASE PUSKESMAS</title>
</head>

<body>
    <header>
        <h3>Form Ruangan</h3>
    </header>

    <p><a href="../index.php">Kembali</a></p>

    <form action="daftar_ruangan.php" method="POST">
        <fieldset>
            <p>
                <label for="id_ruangan">ID Ruangan: </label>
                <input type="text" name="id_ruangan" placeholder="Rxxxx" />
            </p>
            <p>
                <label for="nama_ruangan">Nama Ruangan: </label>
                <input type="text" name="nama_ruangan" placeholder="Nama Ruangan" />
            </p>

            <p>
                <label for="kelas_ruangan">Kelas Ruangan: </label>
                <label><input type="radio" name="kelas_ruangan" value="Ekonomi"> Ekonomi</label>
                <label><input type="radio" name="kelas_ruangan" value="Bisnis"> Bisnis</label>
                <label><input type="radio" name="kelas_ruangan" value="VIP"> VIP</label>
                <label><input type="radio" name="kelas_ruangan" value="VVIP"> VVIP</label>
            </p>
            <p>
                <input type="submit" value="Daftar" name="daftar" />
            </p>

        </fieldset>
    </form>
</body>

</html>