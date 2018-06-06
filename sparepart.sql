-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01 Jun 2018 pada 14.02
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sparepart`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_barang`
--

CREATE TABLE `m_barang` (
  `kode_barang` int(15) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `harga_jual` int(25) NOT NULL,
  `harga_beli` int(25) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `stok_barang` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_barang`
--

INSERT INTO `m_barang` (`kode_barang`, `nama_barang`, `harga_jual`, `harga_beli`, `satuan`, `kategori`, `stok_barang`) VALUES
(1, 'sparepart ku saja', 330000, 335000, 'box', 'spare', 100),
(21, 'sparepart 3', 55000, 50000, 'pcs', 'sparepart motor', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_penjualan`
--

CREATE TABLE `m_penjualan` (
  `kode_penjualan` int(15) NOT NULL,
  `nama_pembeli` varchar(25) NOT NULL,
  `kode_barang` int(15) NOT NULL,
  `no_faktur` int(15) NOT NULL,
  `tgl_faktur` date NOT NULL,
  `jumlah_barang` int(15) NOT NULL,
  `harga_satuan` int(15) NOT NULL,
  `total_harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_penjualan`
--

INSERT INTO `m_penjualan` (`kode_penjualan`, `nama_pembeli`, `kode_barang`, `no_faktur`, `tgl_faktur`, `jumlah_barang`, `harga_satuan`, `total_harga`) VALUES
(1, 'Doni', 1, 11, '2018-06-12', 2, 55000, 110000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `m_penjualan`
--
ALTER TABLE `m_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `kode_barang` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `m_penjualan`
--
ALTER TABLE `m_penjualan`
  MODIFY `kode_penjualan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
