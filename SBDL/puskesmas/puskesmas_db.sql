-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:18 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puskesmas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `jenis_kelamin` char(2) NOT NULL,
  `spesialis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `jenis_kelamin`, `spesialis`) VALUES
('DR003', 'Nugraha', 'L', 'Dokter Gigi');

-- --------------------------------------------------------

--
-- Table structure for table `jaga`
--

CREATE TABLE `jaga` (
  `nama_dokter` varchar(30) NOT NULL,
  `nama_perawat` varchar(30) NOT NULL,
  `nama_staf` varchar(30) NOT NULL,
  `waktu_jaga` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(10) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `kegunaan` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `jenis_kelamin` char(2) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `penyakit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `nama_penyakit` varchar(30) NOT NULL,
  `gejala_penyakit` varchar(50) NOT NULL,
  `obat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(30) NOT NULL,
  `jenis_kelamin` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat`
--

CREATE TABLE `rawat` (
  `nama_ruangan` varchar(25) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `nama_penyakit` varchar(30) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `nama_perawat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(30) NOT NULL,
  `kelas_ruangan` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staf`
--

CREATE TABLE `staf` (
  `id_staf` varchar(10) NOT NULL,
  `nama_staf` varchar(30) NOT NULL,
  `jenis_kelamin` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `nama dokter` (`nama_dokter`);

--
-- Indexes for table `jaga`
--
ALTER TABLE `jaga`
  ADD KEY `nama_dokter` (`nama_dokter`),
  ADD KEY `nama_perawat` (`nama_perawat`),
  ADD KEY `nama_staf` (`nama_staf`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`),
  ADD KEY `nama_obat` (`nama_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `nama_pasien` (`nama_pasien`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD KEY `nama_penyakit` (`nama_penyakit`),
  ADD KEY `obat` (`obat`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`),
  ADD KEY `nama_perawat` (`nama_perawat`);

--
-- Indexes for table `rawat`
--
ALTER TABLE `rawat`
  ADD KEY `nama_ruangan` (`nama_ruangan`),
  ADD KEY `nama_pasien` (`nama_pasien`),
  ADD KEY `nama_penyakit` (`nama_penyakit`),
  ADD KEY `nama_obat` (`nama_obat`),
  ADD KEY `nama dokter` (`nama_dokter`),
  ADD KEY `nama perawat` (`nama_perawat`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`),
  ADD KEY `nama_ruangan` (`nama_ruangan`);

--
-- Indexes for table `staf`
--
ALTER TABLE `staf`
  ADD PRIMARY KEY (`id_staf`),
  ADD KEY `nama_staf` (`nama_staf`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jaga`
--
ALTER TABLE `jaga`
  ADD CONSTRAINT `jaga_ibfk_1` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`),
  ADD CONSTRAINT `jaga_ibfk_2` FOREIGN KEY (`nama_perawat`) REFERENCES `perawat` (`nama_perawat`),
  ADD CONSTRAINT `jaga_ibfk_3` FOREIGN KEY (`nama_staf`) REFERENCES `staf` (`nama_staf`);

--
-- Constraints for table `rawat`
--
ALTER TABLE `rawat`
  ADD CONSTRAINT `rawat_ibfk_1` FOREIGN KEY (`nama_ruangan`) REFERENCES `ruangan` (`nama_ruangan`),
  ADD CONSTRAINT `rawat_ibfk_2` FOREIGN KEY (`nama_pasien`) REFERENCES `pasien` (`nama_pasien`),
  ADD CONSTRAINT `rawat_ibfk_3` FOREIGN KEY (`nama_penyakit`) REFERENCES `penyakit` (`nama_penyakit`),
  ADD CONSTRAINT `rawat_ibfk_4` FOREIGN KEY (`nama_obat`) REFERENCES `obat` (`nama_obat`),
  ADD CONSTRAINT `rawat_ibfk_5` FOREIGN KEY (`nama_dokter`) REFERENCES `jaga` (`nama_dokter`),
  ADD CONSTRAINT `rawat_ibfk_6` FOREIGN KEY (`nama_perawat`) REFERENCES `jaga` (`nama_perawat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
