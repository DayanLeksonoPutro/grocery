-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 05:18 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `contoh`
--

CREATE TABLE `contoh` (
  `id` int(11) NOT NULL,
  `contoh_produk` varchar(128) NOT NULL,
  `contoh_harga` int(11) NOT NULL,
  `cre_or_up_by` varchar(50) NOT NULL,
  `cre_or_up_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contoh`
--

INSERT INTO `contoh` (`id`, `contoh_produk`, `contoh_harga`, `cre_or_up_by`, `cre_or_up_date`) VALUES
(1, 'Buku', 1000, '', '0000-00-00 00:00:00'),
(2, 'Java Fundamental', 50000, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fitur`
--

CREATE TABLE `fitur` (
  `id_fitur` int(11) NOT NULL,
  `judul_fitur` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fitur`
--

INSERT INTO `fitur` (`id_fitur`, `judul_fitur`, `keterangan`, `status`) VALUES
(1, 'CAPTCHA neturmeric ', 'mengunakan CAPTCHA neturmeri', 0),
(2, 'Membuat modul edit on admin', '<p>\r\n	membuat modul yang bisa di edit via web , modul tersebut akan menjadi sebuah file yang akan ditampilkan sebagai crud</p>\r\n', 0),
(3, 'halaman login edit', 'Fitur edit halaman login bisa dilakukan di setting', 0),
(4, 'Judul Halaman dan Breadcum', 'menampilan judul halam dan breadcum', 0),
(5, 'seluruh edit dasar harus meggunakan Grocery', 'User , Managemen Groub', 0),
(6, 'ada modul halaman html', 'modul ini bersifat html / php murni yang di gunakan untuk membuat halaman dashboard', 0),
(7, 'inputer dan input_time', 'fitur inputer / updater dan input_time  harus bisa di globalkan , supaya saat membuat modul crud tidak perlu membuat ulang', 0);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_modul`
--

CREATE TABLE `kategori_modul` (
  `id_kategori_modul` int(11) NOT NULL,
  `nama_kategori_modul` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_modul`
--

INSERT INTO `kategori_modul` (`id_kategori_modul`, `nama_kategori_modul`) VALUES
(1, 'CRUD'),
(2, 'Static Page'),
(3, 'Header');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(2, '::1', 'administrator', 1649033037),
(3, '::1', 'administrator', 1649033047),
(4, '::1', 'dayan', 1649082098),
(5, '::1', 'dayan', 1649082106);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(20171017120422);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL,
  `fa_icon` varchar(100) NOT NULL,
  `nama_modul` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `id_kategori_modul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `fa_icon`, `nama_modul`, `url`, `id_kategori_modul`) VALUES
(1, 'fa-home', 'Dashboard', 'home', 2),
(2, 'fa-object-group', 'Manajemen Master', 'home', 3),
(3, 'fa-server', 'Data Master', '#', 3),
(4, 'fa-book', 'Contoh', 'contoh', 1),
(5, 'fa-list', 'Fitur', 'fitur', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opd`
--

CREATE TABLE `opd` (
  `id_opd` int(5) NOT NULL,
  `id_parent_opd` int(5) NOT NULL,
  `id_level_opd` int(2) NOT NULL,
  `kode_opd` varchar(20) NOT NULL,
  `nama_opd` varchar(255) NOT NULL,
  `view_nama_opd` varchar(255) NOT NULL,
  `list_nama_opd` varchar(255) NOT NULL,
  `header_opd` int(1) NOT NULL DEFAULT 0,
  `akses_opd` varchar(20) NOT NULL,
  `opd_rekonsiliasi` int(1) NOT NULL DEFAULT 0,
  `transfer_antar_opd` int(1) NOT NULL DEFAULT 0,
  `aktif` int(1) NOT NULL DEFAULT 1,
  `inputer` varchar(30) NOT NULL DEFAULT 'SYSTEM-AUTO',
  `input_timer` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opd`
--

INSERT INTO `opd` (`id_opd`, `id_parent_opd`, `id_level_opd`, `kode_opd`, `nama_opd`, `view_nama_opd`, `list_nama_opd`, `header_opd`, `akses_opd`, `opd_rekonsiliasi`, `transfer_antar_opd`, `aktif`, `inputer`, `input_timer`) VALUES
(0, 0, 1, '0', 'SEMUA UNIT', 'SEMUA UNIT', '[0] SEMUA UNIT', 1, '0', 0, 0, 0, 'SYSTEM-AUTO', '2020-11-05 16:29:18'),
(1, 0, 1, '1', 'URUSAN WAJIB PELAYANAN DASAR', 'URUSAN WAJIB PELAYANAN DASAR', '[1] URUSAN WAJIB PELAYANAN DASAR', 1, '0.1', 0, 0, 1, 'SYSTEM-AUTO', '2020-07-27 00:31:05'),
(6, 1, 2, '1.02', 'KESEHATAN', '&nbsp;&nbsp;&nbsp;&nbsp;KESEHATAN', '[1.02] KESEHATAN', 1, '0.1.02', 0, 0, 1, 'SYSTEM-AUTO', '2020-07-27 00:31:04'),
(46, 6, 3, '1.02.02', 'RUMAH SAKIT UMUM DR. H. KOESNADI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUMAH SAKIT UMUM DR. H. KOESNADI', '[1.02.02] RUMAH SAKIT UMUM DR. H. KOESNADI', 1, '0.1.02.02', 1, 0, 1, 'SYSTEM-AUTO', '2020-07-27 00:31:04'),
(123, 46, 4, '1.02.02.01', 'RUMAH SAKIT UMUM DR. H. KOESNADI - BLUD', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUMAH SAKIT UMUM DR. H. KOESNADI - BLUD', '[1.02.02.01] RUMAH SAKIT UMUM DR. H. KOESNADI - BLUD', 0, '0.1.02.02.01', 0, 1, 1, 'SYSTEM-AUTO', '2020-07-27 00:31:04'),
(194, 46, 4, '1.02.02.02', 'GUDANG FARMASI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GUDANG FARMASI', '[1.02.02.02] GUDANG FARMASI', 0, '0.1.02.02.02', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(195, 46, 4, '1.02.02.03', 'APOTIK RAWAT JALAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APOTIK RAWAT JALAN', '[1.02.02.03] APOTIK RAWAT JALAN', 0, '0.1.02.02.03', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(196, 46, 4, '1.02.02.04', 'APOTIK RAWAT INAP', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APOTIK RAWAT INAP', '[1.02.02.04] APOTIK RAWAT INAP', 0, '0.1.02.02.04', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(197, 46, 4, '1.02.02.05', 'DEPO KAMAR OPERASI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DEPO KAMAR OPERASI', '[1.02.02.05] DEPO KAMAR OPERASI', 0, '0.1.02.02.05', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(198, 46, 4, '1.02.02.06', 'DEPO IGD', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DEPO IGD', '[1.02.02.06] DEPO IGD', 0, '0.1.02.02.06', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(199, 46, 4, '1.02.02.07', 'EXP HAPUS', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EXP HAPUS', '[1.02.02.07] EXP HAPUS', 0, '0.1.02.02.07', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(200, 46, 4, '1.02.02.08', 'EXP RETUR', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EXP RETUR', '[1.02.02.08] EXP RETUR', 0, '0.1.02.02.08', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(201, 46, 4, '1.02.02.09', 'AMBULANCE', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AMBULANCE', '[1.02.02.09] AMBULANCE', 0, '0.1.02.02.09', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(202, 46, 4, '1.02.02.10', 'CHATLAB', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CHATLAB', '[1.02.02.10] CHATLAB', 0, '0.1.02.02.10', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(203, 46, 4, '1.02.02.11', 'INSTALASI BEDAH SENTRAL', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI BEDAH SENTRAL', '[1.02.02.11] INSTALASI BEDAH SENTRAL', 0, '0.1.02.02.11', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(204, 46, 4, '1.02.02.12', 'INSTALASI ENDOSCOPY', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI ENDOSCOPY', '[1.02.02.12] INSTALASI ENDOSCOPY', 0, '0.1.02.02.12', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(205, 46, 4, '1.02.02.13', 'INSTALASI GAWAT DARURAT', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI GAWAT DARURAT', '[1.02.02.13] INSTALASI GAWAT DARURAT', 0, '0.1.02.02.13', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(206, 46, 4, '1.02.02.14', 'INSTALASI GIZI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI GIZI', '[1.02.02.14] INSTALASI GIZI', 0, '0.1.02.02.14', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(207, 46, 4, '1.02.02.15', 'INSTALASI LABORATORIUM', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI LABORATORIUM', '[1.02.02.15] INSTALASI LABORATORIUM', 0, '0.1.02.02.15', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(208, 46, 4, '1.02.02.16', 'INSTALASI RADIOLOGI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI RADIOLOGI', '[1.02.02.16] INSTALASI RADIOLOGI', 0, '0.1.02.02.16', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(209, 46, 4, '1.02.02.17', 'KEMOTERAPI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KEMOTERAPI', '[1.02.02.17] KEMOTERAPI', 0, '0.1.02.02.17', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(210, 46, 4, '1.02.02.18', 'PAVILYUN ANGREK', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN ANGREK', '[1.02.02.18] PAVILYUN ANGREK', 0, '0.1.02.02.18', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(211, 46, 4, '1.02.02.19', 'PAVILYUN BOUGENVIL', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN BOUGENVIL', '[1.02.02.19] PAVILYUN BOUGENVIL', 0, '0.1.02.02.19', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(212, 46, 4, '1.02.02.20', 'PAVILYUN DAHLIA', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN DAHLIA', '[1.02.02.20] PAVILYUN DAHLIA', 0, '0.1.02.02.20', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(213, 46, 4, '1.02.02.21', 'PAVILYUN MAWAR', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN MAWAR', '[1.02.02.21] PAVILYUN MAWAR', 0, '0.1.02.02.21', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(214, 46, 4, '1.02.02.22', 'PAVILYUN MELATI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN MELATI', '[1.02.02.22] PAVILYUN MELATI', 0, '0.1.02.02.22', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(215, 46, 4, '1.02.02.23', 'PAVILYUN RENGGANIS', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN RENGGANIS', '[1.02.02.23] PAVILYUN RENGGANIS', 0, '0.1.02.02.23', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(216, 46, 4, '1.02.02.24', 'PAVILYUN SEROJA', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN SEROJA', '[1.02.02.24] PAVILYUN SEROJA', 0, '0.1.02.02.24', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(217, 46, 4, '1.02.02.25', 'PAVILYUN SERUNI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN SERUNI', '[1.02.02.25] PAVILYUN SERUNI', 0, '0.1.02.02.25', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(218, 46, 4, '1.02.02.26', 'PAVILYUN TERATAI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN TERATAI', '[1.02.02.26] PAVILYUN TERATAI', 0, '0.1.02.02.26', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(219, 46, 4, '1.02.02.27', 'PENDAFTARAN RWI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PENDAFTARAN RWI', '[1.02.02.27] PENDAFTARAN RWI', 0, '0.1.02.02.27', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(220, 46, 4, '1.02.02.28', 'PENDAFTARAN RWJ', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PENDAFTARAN RWJ', '[1.02.02.28] PENDAFTARAN RWJ', 0, '0.1.02.02.28', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(221, 46, 4, '1.02.02.29', 'INSTALASI PENGENDALI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTALASI PENGENDALI', '[1.02.02.29] INSTALASI PENGENDALI', 0, '0.1.02.02.29', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(222, 46, 4, '1.02.02.30', 'POLI ANAK', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI ANAK', '[1.02.02.30] POLI ANAK', 0, '0.1.02.02.30', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(223, 46, 4, '1.02.02.31', 'POLI DALAM', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI DALAM', '[1.02.02.31] POLI DALAM', 0, '0.1.02.02.31', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(224, 46, 4, '1.02.02.32', 'POLI GIGI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI GIGI', '[1.02.02.32] POLI GIGI', 0, '0.1.02.02.32', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(225, 46, 4, '1.02.02.33', 'POLI HEMODIALISA', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI HEMODIALISA', '[1.02.02.33] POLI HEMODIALISA', 0, '0.1.02.02.33', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(226, 46, 4, '1.02.02.34', 'POLI JANTUNG', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI JANTUNG', '[1.02.02.34] POLI JANTUNG', 0, '0.1.02.02.34', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(227, 46, 4, '1.02.02.35', 'POLI KANDUNGAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI KANDUNGAN', '[1.02.02.35] POLI KANDUNGAN', 0, '0.1.02.02.35', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(228, 46, 4, '1.02.02.36', 'POLI KULIT & KELAMIN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI KULIT & KELAMIN', '[1.02.02.36] POLI KULIT & KELAMIN', 0, '0.1.02.02.36', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(229, 46, 4, '1.02.02.37', 'POLI MATA', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI MATA', '[1.02.02.37] POLI MATA', 0, '0.1.02.02.37', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(230, 46, 4, '1.02.02.38', 'POLI ONKOLOGI & ORTHOPEDI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI ONKOLOGI & ORTHOPEDI', '[1.02.02.38] POLI ONKOLOGI & ORTHOPEDI', 0, '0.1.02.02.38', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(231, 46, 4, '1.02.02.39', 'POLI PARU', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI PARU', '[1.02.02.39] POLI PARU', 0, '0.1.02.02.39', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(232, 46, 4, '1.02.02.40', 'POLI PATOLOGI ANATOMI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI PATOLOGI ANATOMI', '[1.02.02.40] POLI PATOLOGI ANATOMI', 0, '0.1.02.02.40', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(233, 46, 4, '1.02.02.41', 'POLI PSIKIATRI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI PSIKIATRI', '[1.02.02.41] POLI PSIKIATRI', 0, '0.1.02.02.41', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(234, 46, 4, '1.02.02.42', 'POLI REHABILITASI MEDIS', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI REHABILITASI MEDIS', '[1.02.02.42] POLI REHABILITASI MEDIS', 0, '0.1.02.02.42', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(235, 46, 4, '1.02.02.43', 'POLI SARAF', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI SARAF', '[1.02.02.43] POLI SARAF', 0, '0.1.02.02.43', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(236, 46, 4, '1.02.02.44', 'POLI THT', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI THT', '[1.02.02.44] POLI THT', 0, '0.1.02.02.44', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(237, 46, 4, '1.02.02.45', 'POLI UMUM', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI UMUM', '[1.02.02.45] POLI UMUM', 0, '0.1.02.02.45', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(238, 46, 4, '1.02.02.46', 'POLI VCT', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI VCT', '[1.02.02.46] POLI VCT', 0, '0.1.02.02.46', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(239, 46, 4, '1.02.02.47', 'RS OKSIGEN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RS OKSIGEN', '[1.02.02.47] RS OKSIGEN', 0, '0.1.02.02.47', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(240, 46, 4, '1.02.02.48', 'RUANG / KAMAR JENAZAH', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG / KAMAR JENAZAH', '[1.02.02.48] RUANG / KAMAR JENAZAH', 0, '0.1.02.02.48', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(241, 46, 4, '1.02.02.49', 'RUANG CSSD', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG CSSD', '[1.02.02.49] RUANG CSSD', 0, '0.1.02.02.49', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(242, 46, 4, '1.02.02.50', 'RUANG ICCU', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG ICCU', '[1.02.02.50] RUANG ICCU', 0, '0.1.02.02.50', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(243, 46, 4, '1.02.02.51', 'RUANG ICU', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG ICU', '[1.02.02.51] RUANG ICU', 0, '0.1.02.02.51', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(244, 46, 4, '1.02.02.52', 'RUANG INVENTARIS', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG INVENTARIS', '[1.02.02.52] RUANG INVENTARIS', 0, '0.1.02.02.52', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(245, 46, 4, '1.02.02.53', 'RUANG IPS', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG IPS', '[1.02.02.53] RUANG IPS', 0, '0.1.02.02.53', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(246, 46, 4, '1.02.02.54', 'RUANG KEUANGAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG KEUANGAN', '[1.02.02.54] RUANG KEUANGAN', 0, '0.1.02.02.54', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(247, 46, 4, '1.02.02.55', 'RUANG PENUNJANG', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG PENUNJANG', '[1.02.02.55] RUANG PENUNJANG', 0, '0.1.02.02.55', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(248, 46, 4, '1.02.02.56', 'RUANG PERENCANAAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG PERENCANAAN', '[1.02.02.56] RUANG PERENCANAAN', 0, '0.1.02.02.56', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(249, 46, 4, '1.02.02.57', 'RUANG PKRS', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG PKRS', '[1.02.02.57] RUANG PKRS', 0, '0.1.02.02.57', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(250, 46, 4, '1.02.02.58', 'RUANG REKAM MEDIK', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG REKAM MEDIK', '[1.02.02.58] RUANG REKAM MEDIK', 0, '0.1.02.02.58', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(251, 46, 4, '1.02.02.59', 'RUANG SANITASI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG SANITASI', '[1.02.02.59] RUANG SANITASI', 0, '0.1.02.02.59', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(252, 46, 4, '1.02.02.60', 'SERVER IT', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SERVER IT', '[1.02.02.60] SERVER IT', 0, '0.1.02.02.60', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(253, 46, 4, '1.02.02.61', 'TRACER', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TRACER', '[1.02.02.61] TRACER', 0, '0.1.02.02.61', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(254, 46, 4, '1.02.02.62', 'BAGIAN KASIR', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BAGIAN KASIR', '[1.02.02.62] BAGIAN KASIR', 0, '0.1.02.02.62', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(255, 46, 4, '1.02.02.63', 'BAGIAN TATA USAHA', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BAGIAN TATA USAHA', '[1.02.02.63] BAGIAN TATA USAHA', 0, '0.1.02.02.63', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(256, 46, 4, '1.02.02.64', 'POLI BEDAH', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;POLI BEDAH', '[1.02.02.64] POLI BEDAH', 0, '0.1.02.02.64', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(257, 46, 4, '1.02.02.65', 'RUANG KEPEGAWAIAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RUANG KEPEGAWAIAN', '[1.02.02.65] RUANG KEPEGAWAIAN', 0, '0.1.02.02.65', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(258, 46, 4, '1.02.02.66', 'SEKRETARIAT AKREDITASI', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SEKRETARIAT AKREDITASI', '[1.02.02.66] SEKRETARIAT AKREDITASI', 0, '0.1.02.02.66', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(259, 46, 4, '1.02.02.67', 'BIDANG KEPERAWATAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BIDANG KEPERAWATAN', '[1.02.02.67] BIDANG KEPERAWATAN', 0, '0.1.02.02.67', 0, 1, 0, 'SYSTEM-AUTO', '2020-08-16 15:02:45'),
(800, 46, 4, '1.02.02.68', 'KOMITE KEPERAWATAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KOMITE KEPERAWATAN', '[1.02.02.68] KOMITE KEPERAWATAN', 0, '0.1.02.02.68', 0, 1, 0, 'SYSTEM-AUTO', '2020-12-18 06:24:09'),
(801, 46, 4, '1.02.02.69', 'PALANG MERAH INDONESIA (PMI)', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PALANG MERAH INDONESIA (PMI)', '[1.02.02.69] PALANG MERAH INDONESIA (PMI)', 0, '0.1.02.02.69', 0, 1, 0, 'SYSTEM-AUTO', '2020-12-18 06:24:09'),
(802, 46, 4, '1.02.02.70', 'PAVILYUN KRISAN', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAVILYUN KRISAN', '[1.02.02.70] PAVILYUN KRISAN', 0, '0.1.02.02.70', 0, 1, 0, 'SYSTEM-AUTO', '2020-12-18 06:24:09'),
(803, 46, 4, '1.02.02.71', 'STAF MEDIK FUNGSIONAL (SMF)', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STAF MEDIK FUNGSIONAL (SMF)', '[1.02.02.71] STAF MEDIK FUNGSIONAL (SMF)', 0, '0.1.02.02.71', 0, 1, 0, 'SYSTEM-AUTO', '2020-12-18 06:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `reg` varchar(50) NOT NULL,
  `established` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `founder` varchar(100) NOT NULL,
  `slogan` varchar(500) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `cre_or_up_by` varchar(50) NOT NULL,
  `cre_or_up_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `reg`, `established`, `address`, `founder`, `slogan`, `file_path`, `email`, `contact`, `cre_or_up_by`, `cre_or_up_date`, `status`) VALUES
(1, 'Ulun Nuha', '12345678', '2019-09-16', 'Jember', 'Uln', 'Lihat, Tiru Modifikasi', '', 'info@example.com', '01851334235', '1', '2022-04-04 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `file_path`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$ImF1EG/1jgGNpo4A.Ev7TuSNZpH1HCMvlmi4148ggFliP9sZLBjRq', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 2019, 2022, 1, 'Admin', 'istrator', 'ADMIN', '01851334578', 'assets/images/user/1568612588.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(8, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contoh`
--
ALTER TABLE `contoh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fitur`
--
ALTER TABLE `fitur`
  ADD PRIMARY KEY (`id_fitur`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_modul`
--
ALTER TABLE `kategori_modul`
  ADD PRIMARY KEY (`id_kategori_modul`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `opd`
--
ALTER TABLE `opd`
  ADD PRIMARY KEY (`id_opd`),
  ADD UNIQUE KEY `kode_opd` (`kode_opd`),
  ADD KEY `fk_level_opd` (`id_level_opd`),
  ADD KEY `aktif` (`aktif`),
  ADD KEY `header_opd` (`header_opd`),
  ADD KEY `id_parent_opd` (`id_parent_opd`),
  ADD KEY `akses_opd` (`akses_opd`),
  ADD KEY `opd_rekonsiliasi` (`opd_rekonsiliasi`),
  ADD KEY `transfer_antar_opd` (`transfer_antar_opd`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contoh`
--
ALTER TABLE `contoh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fitur`
--
ALTER TABLE `fitur`
  MODIFY `id_fitur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori_modul`
--
ALTER TABLE `kategori_modul`
  MODIFY `id_kategori_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `opd`
--
ALTER TABLE `opd`
  MODIFY `id_opd` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=804;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
