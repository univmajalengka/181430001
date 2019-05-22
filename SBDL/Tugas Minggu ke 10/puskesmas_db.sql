-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2019 at 03:33 PM
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
('DR001', 'Enggi N', 'L', 'Mata'),
('DR003', 'Nugraha', 'L', 'Dokter Gigi'),
('DR004', 'Ridwan', 'L', 'Lambung');

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

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `kegunaan`, `stok`) VALUES
('O001', 'Ultraflu', 'Obat Flu disertai Batuk dan Bersin', 1000),
('O002', 'Procold', 'Obat demam dengan gejala Panas Tinggi', 1000),
('O003', 'Sangobion', 'Menambah stimulan Produksi Sel Darah Merah dalam T', 500);

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

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `alamat`, `penyakit`) VALUES
('PS001', 'Krisna', 'P', 'Garawangi', 'Flu'),
('PS002', 'Enggi', 'L', 'Majalengka', 'Demam');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` varchar(10) NOT NULL,
  `nama_penyakit` varchar(30) NOT NULL,
  `gejala_penyakit` varchar(50) NOT NULL,
  `obat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `nama_penyakit`, `gejala_penyakit`, `obat`) VALUES
('P001', 'Flu', 'Bersin-bersin dan Batuk', 'Ultraflu'),
('P002', 'Demam', 'Panas Tinggi', 'Procold'),
('P003', 'Anemia', 'Wajah Pucat dan Kondisi Tubuh melemah', 'Sangobion');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(30) NOT NULL,
  `jenis_kelamin` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`id_perawat`, `nama_perawat`, `jenis_kelamin`) VALUES
('PR0001', 'Nea', 'P'),
('PR0002', 'Nura', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `rawat`
--

CREATE TABLE `rawat` (
  `id_rawat` varchar(10) NOT NULL,
  `nama_ruangan` varchar(25) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `nama_penyakit` varchar(30) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `nama_perawat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat`
--

INSERT INTO `rawat` (`id_rawat`, `nama_ruangan`, `nama_pasien`, `nama_penyakit`, `nama_obat`, `nama_dokter`, `nama_perawat`) VALUES
('RW001', 'Magnolia', 'Krisna', 'Anemia', 'Sangobion', 'Ridwan', 'Nura'),
('RW002', 'Tulip', 'Enggi', 'Demam', 'Procold', 'Nugraha', 'Nea');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(30) NOT NULL,
  `kelas_ruangan` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama_ruangan`, `kelas_ruangan`) VALUES
('R001', 'Mawar', 'Bisnis'),
('R002', 'Melati', 'Bisnis'),
('R003', 'Tulip', 'VIP'),
('R004', 'Magnolia', 'VVIP');

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
  ADD KEY `nama_pasien` (`nama_pasien`),
  ADD KEY `penyakit` (`penyakit`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`),
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
  ADD PRIMARY KEY (`id_rawat`),
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
-- Constraints for dumped tables
--

--
-- Constraints for table `rawat`
--
ALTER TABLE `rawat`
  ADD CONSTRAINT `rawat_ibfk_1` FOREIGN KEY (`nama_ruangan`) REFERENCES `ruangan` (`nama_ruangan`),
  ADD CONSTRAINT `rawat_ibfk_2` FOREIGN KEY (`nama_pasien`) REFERENCES `pasien` (`nama_pasien`),
  ADD CONSTRAINT `rawat_ibfk_3` FOREIGN KEY (`nama_penyakit`) REFERENCES `penyakit` (`nama_penyakit`),
  ADD CONSTRAINT `rawat_ibfk_4` FOREIGN KEY (`nama_obat`) REFERENCES `obat` (`nama_obat`),
  ADD CONSTRAINT `rawat_ibfk_6` FOREIGN KEY (`nama_perawat`) REFERENCES `perawat` (`nama_perawat`),
  ADD CONSTRAINT `rawat_ibfk_7` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
