-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2019 at 01:28 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

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
-- Stand-in structure for view `data_perawatan`
-- (See below for the actual view)
--
CREATE TABLE `data_perawatan` (
`Nama` varchar(30)
,`JK` char(2)
,`Alamat` varchar(50)
,`Penyakit` varchar(20)
,`Gejala` varchar(50)
,`Obat` varchar(30)
);

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
('DR001', 'Enggi', 'L', 'Mata'),
('DR002', 'Nugie', 'L', 'Paru'),
('DR003', 'Nugraha', 'L', 'Dokter Gigi'),
('DR004', 'Sugiana', 'L', 'Gigi'),
('DR005', 'Ridwan', 'L', 'Lambung');

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
('O001', 'AsmaSoho', 'Meredakan Gejala sakit Asma', 500),
('O002', 'Ultraflu', 'Obat Flu disertai Batuk dan Bersin', 500),
('O003', 'Procold', 'Obat demam dengan gejala Panas Tinggi', 500);

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
('PS001', 'Krisna', 'P', 'Garawangi', 'Asma'),
('PS002', 'Yuni', 'P', 'Cikarang', 'Flu'),
('PS003', 'Asih', 'P', 'Majalengka', 'Demam'),
('PS004', 'Ridwan', 'L', 'Majalengka', 'Flu');

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
('P001', 'Asma', 'Sesak Nafas', 'AsmaSoho'),
('P002', 'Flu', 'Bersin-bersin dan Batuk', 'Ultraflu'),
('P003', 'Demam', 'Panas Tinggi', 'Procold');

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
('PR001', 'Nura', 'P'),
('PR002', 'Nea', 'P'),
('PR003', 'Nida', 'P'),
('PR004', 'Nana', 'P'),
('PR005', 'Nurul', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `rawat`
--

CREATE TABLE `rawat` (
  `id_rawat` varchar(10) NOT NULL,
  `nama_ruangan` varchar(50) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL,
  `nama_perawat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat`
--

INSERT INTO `rawat` (`id_rawat`, `nama_ruangan`, `nama_pasien`, `nama_penyakit`, `nama_obat`, `nama_dokter`, `nama_perawat`) VALUES
('RW001', 'Tulip', 'Krisna', 'Asma', 'AsmaSoho', 'Nugraha', 'Nura');

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
('R001', 'Tulip', 'VVIP'),
('R002', 'Magnolia', 'VIP'),
('R003', 'Anggrek', 'Bisnis'),
('R004', 'Mawar', 'Ekonomi'),
('R005', 'Melati', 'Ekonomi');

-- --------------------------------------------------------

--
-- Structure for view `data_perawatan`
--
DROP TABLE IF EXISTS `data_perawatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_perawatan`  AS  select `pasien`.`nama_pasien` AS `Nama`,`pasien`.`jenis_kelamin` AS `JK`,`pasien`.`alamat` AS `Alamat`,`pasien`.`penyakit` AS `Penyakit`,`penyakit`.`gejala_penyakit` AS `Gejala`,`penyakit`.`obat` AS `Obat` from (`pasien` join `penyakit` on(`pasien`.`penyakit` = `penyakit`.`nama_penyakit`)) ;

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
  ADD KEY `nama_pasien` (`nama_pasien`);

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
  ADD KEY `nama_pasien` (`nama_pasien`),
  ADD KEY `nama_penyakit` (`nama_penyakit`),
  ADD KEY `nama_ruangan` (`nama_ruangan`),
  ADD KEY `nama_obat` (`nama_obat`),
  ADD KEY `nama_dokter` (`nama_dokter`),
  ADD KEY `nama_perawat` (`nama_perawat`);

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
  ADD CONSTRAINT `rawat_ibfk_1` FOREIGN KEY (`nama_ruangan`) REFERENCES `ruangan` (`nama_ruangan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_ibfk_2` FOREIGN KEY (`nama_pasien`) REFERENCES `pasien` (`nama_pasien`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_ibfk_3` FOREIGN KEY (`nama_penyakit`) REFERENCES `penyakit` (`nama_penyakit`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_ibfk_4` FOREIGN KEY (`nama_obat`) REFERENCES `obat` (`nama_obat`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_ibfk_5` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_ibfk_6` FOREIGN KEY (`nama_perawat`) REFERENCES `perawat` (`nama_perawat`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
