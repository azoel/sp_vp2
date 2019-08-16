-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13 Agu 2019 pada 15.52
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_sampah_zahra`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_sampah`
--

CREATE TABLE `item_sampah` (
  `kodeItem` int(4) NOT NULL,
  `itemSampah` varchar(70) NOT NULL,
  `hargaNasabah` int(6) NOT NULL,
  `hargaMitra` int(6) NOT NULL,
  `updateTerakhir` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kas`
--

CREATE TABLE `kas` (
  `idTransaksi` int(10) NOT NULL,
  `tglTransaksi` date NOT NULL,
  `descTransaksi` varchar(200) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `kodeTransaksi` varchar(20) NOT NULL,
  `masuk` int(10) NOT NULL,
  `keluar` int(10) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nasabah`
--

CREATE TABLE `nasabah` (
  `noNasabah` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `namaPanggilan` varchar(30) NOT NULL,
  `jenisKelamin` char(1) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `alamatRT` varchar(3) NOT NULL,
  `alamatRW` varchar(3) NOT NULL,
  `alamatKel` varchar(20) NOT NULL,
  `alamatKec` varchar(20) NOT NULL,
  `tandaPengenal` varchar(20) NOT NULL,
  `noPengenal` varchar(20) NOT NULL,
  `noTelp` varchar(30) NOT NULL,
  `tglDaftar` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penarikan`
--

CREATE TABLE `penarikan` (
  `idPenarikan` int(20) NOT NULL,
  `noPenarikan` varchar(20) NOT NULL,
  `tglPenarikan` date NOT NULL,
  `noNasabah` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setoran`
--

CREATE TABLE `setoran` (
  `idSetoran` int(20) NOT NULL,
  `noSetoran` varchar(30) NOT NULL,
  `noNasabah` varchar(15) NOT NULL,
  `tglSetoran` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setoran_detail`
--

CREATE TABLE `setoran_detail` (
  `idSetoranDetail` int(20) NOT NULL,
  `noSetoran` varchar(30) NOT NULL,
  `kodeItem` varchar(4) NOT NULL,
  `itemSampah` varchar(70) NOT NULL,
  `jumlah` float NOT NULL,
  `hargaNasabah` int(6) NOT NULL,
  `hargaMitra` int(6) NOT NULL,
  `jumlahHargaNasabah` int(11) NOT NULL,
  `jumlahHargaMitra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `isAktif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item_sampah`
--
ALTER TABLE `item_sampah`
  ADD PRIMARY KEY (`kodeItem`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`idTransaksi`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`noNasabah`);

--
-- Indexes for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD PRIMARY KEY (`idPenarikan`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`idSetoran`);

--
-- Indexes for table `setoran_detail`
--
ALTER TABLE `setoran_detail`
  ADD PRIMARY KEY (`idSetoranDetail`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item_sampah`
--
ALTER TABLE `item_sampah`
  MODIFY `kodeItem` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penarikan`
--
ALTER TABLE `penarikan`
  MODIFY `idPenarikan` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `setoran`
--
ALTER TABLE `setoran`
  MODIFY `idSetoran` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `setoran_detail`
--
ALTER TABLE `setoran_detail`
  MODIFY `idSetoranDetail` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
