-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2018 at 01:15 PM
-- Server version: 5.6.24-log
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `artist.co1`
--

-- --------------------------------------------------------

--
-- Table structure for table `artis`
--
-- Creation: Apr 29, 2018 at 11:05 AM
--

CREATE TABLE IF NOT EXISTS `artis` (
  `Kode_Artis` varchar(8) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Agensi` varchar(30) NOT NULL,
  `Harga` int(12) NOT NULL,
  `Jadwal` datetime(6) NOT NULL,
  `Syarat` text NOT NULL,
  `ID_PAPPRI` varchar(10) NOT NULL,
  `Kd_PortoArtis` varchar(8) NOT NULL,
  `Kd_Kategori` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `artis`:
--   `ID_PAPPRI`
--       `data_pappri` -> `Kode_PAPPRI`
--   `Kd_PortoArtis`
--       `portofolio_artis` -> `Kode_Portofolio`
--   `Kd_Kategori`
--       `kategori` -> `Kode_Kategeri`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_pappri`
--
-- Creation: Apr 29, 2018 at 11:08 AM
--

CREATE TABLE IF NOT EXISTS `data_pappri` (
  `Kode_PAPPRI` varchar(8) NOT NULL,
  `Nama_Artis` varchar(20) NOT NULL,
  `Umur_Artis` int(2) NOT NULL,
  `Agensi` varchar(29) NOT NULL,
  `Jenis_Kelamin` varchar(2) NOT NULL,
  `Alamat` varchar(60) NOT NULL,
  `Contact` varchar(30) NOT NULL,
  `Lagu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `data_pappri`:
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--
-- Creation: Apr 29, 2018 at 11:04 AM
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `Kode_Kategeri` varchar(8) NOT NULL,
  `JenisKatgerori` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `kategori`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pemesan`
--
-- Creation: Apr 29, 2018 at 10:34 AM
--

CREATE TABLE IF NOT EXISTS `pemesan` (
  `Kode_Pemesan` varchar(8) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis_Kelamin` varchar(2) NOT NULL,
  `Institusi` varchar(30) NOT NULL,
  `Alamat` varchar(60) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Telepon` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `pemesan`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--
-- Creation: Apr 29, 2018 at 11:00 AM
--

CREATE TABLE IF NOT EXISTS `pemesanan` (
  `Kode_Pemesanan` varchar(8) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Jadwal_Acara` datetime(6) NOT NULL,
  `Nama_Acara` varchar(20) NOT NULL,
  `Alamat_Acara` varchar(60) NOT NULL,
  `Tanggal_Pemesanan` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Total_Harga` int(12) NOT NULL,
  `Kd_artis` varchar(8) NOT NULL,
  `Ka_Pemesan` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `pemesanan`:
--   `Kd_artis`
--       `artis` -> `Kode_Artis`
--   `Ka_Pemesan`
--       `pemesan` -> `Kode_Pemesan`
--

-- --------------------------------------------------------

--
-- Table structure for table `portofolio_artis`
--
-- Creation: Apr 29, 2018 at 10:46 AM
--

CREATE TABLE IF NOT EXISTS `portofolio_artis` (
  `Kode_Portofolio` varchar(8) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Umur` int(2) NOT NULL,
  `Jenis_Kelamin` varchar(2) NOT NULL,
  `Alamat` varchar(60) NOT NULL,
  `Prestasi` text NOT NULL,
  `Lagu` text NOT NULL,
  `Pengalaman_Panggung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `portofolio_artis`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artis`
--
ALTER TABLE `artis`
  ADD PRIMARY KEY (`Kode_Artis`), ADD UNIQUE KEY `ID_PAPPRI` (`ID_PAPPRI`), ADD UNIQUE KEY `Kd_PortoArtis` (`Kd_PortoArtis`), ADD UNIQUE KEY `kategorisiartis` (`Kd_Kategori`);

--
-- Indexes for table `data_pappri`
--
ALTER TABLE `data_pappri`
  ADD PRIMARY KEY (`Kode_PAPPRI`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Kode_Kategeri`);

--
-- Indexes for table `pemesan`
--
ALTER TABLE `pemesan`
  ADD PRIMARY KEY (`Kode_Pemesan`), ADD UNIQUE KEY `Username_pemesan` (`Username`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`Kode_Pemesanan`), ADD UNIQUE KEY `Kd_artis` (`Kd_artis`), ADD UNIQUE KEY `Ka_Pemesan` (`Ka_Pemesan`);

--
-- Indexes for table `portofolio_artis`
--
ALTER TABLE `portofolio_artis`
  ADD PRIMARY KEY (`Kode_Portofolio`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artis`
--
ALTER TABLE `artis`
ADD CONSTRAINT `Keaslian` FOREIGN KEY (`ID_PAPPRI`) REFERENCES `data_pappri` (`Kode_PAPPRI`),
ADD CONSTRAINT `Portofolio_artis` FOREIGN KEY (`Kd_PortoArtis`) REFERENCES `portofolio_artis` (`Kode_Portofolio`),
ADD CONSTRAINT `kategoriartis` FOREIGN KEY (`Kd_Kategori`) REFERENCES `kategori` (`Kode_Kategeri`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
ADD CONSTRAINT `SiArtisYgdipesan` FOREIGN KEY (`Kd_artis`) REFERENCES `artis` (`Kode_Artis`),
ADD CONSTRAINT `SiPemesan` FOREIGN KEY (`Ka_Pemesan`) REFERENCES `pemesan` (`Kode_Pemesan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
