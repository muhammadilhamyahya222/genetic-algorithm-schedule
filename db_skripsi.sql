-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2025 at 03:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` varchar(30) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nidn` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `nama`, `nidn`, `created_at`, `updated_at`) VALUES
('1', 'prof. drs. slamin, m.comp.sc., ph.d', '196704201992011001', NULL, NULL),
('10', 'anang andrianto, s.t., m.t', '19096151997021002', NULL, NULL),
('11', 'dr. dwiretno istiyadi s, st., m.kom', '197803302003121003', NULL, NULL),
('12', 'windy eka yulia r, s. kom, mt', '198403052010122002', NULL, NULL),
('13', 'm. arief hidayat, s. kom, m. kom', '198101232010121003', NULL, NULL),
('14', 'yanuar nurdiansyah, st, m.cs', '198201012010121004', NULL, NULL),
('15', 'katarina leba, s.ag., m.th', '197904292008122002', NULL, NULL),
('16', 'nova el maidah, s.si., m.cs', '198411012015042001', NULL, NULL),
('17', 'fajrin nurman arifin, st., m.eng', '198511282015041002', NULL, NULL),
('18', 'mohammad zarkasi, s.kom., m.kom', '199011112019031018', NULL, NULL),
('19', 'muhammad ‘ariful furqon, s.pd., m.kom', '196909281993021001', NULL, NULL),
('2', 'prof. dr. saiful bukhori, st., m.kom', '196811131994121001', NULL, NULL),
('20', 'beny prasetyo, s.kom., m.kom', '199110172020121002', NULL, NULL),
('21', 'tio dharmawan, s.kom., m.kom', '199111122022031011', NULL, NULL),
('22', 'diksy media firmansyah, s.kom., m.kom', '199112132023211015', NULL, NULL),
('23', 'januar adi putra, s.kom., m.kom', '199301312022031005', NULL, NULL),
('24', 'gayatri dwi santika, s.si., m.kom', '196811131994121001', NULL, NULL),
('25', 'qurrota a’yuni ar ruhimat, s.pd., m.sc', '760018029', NULL, NULL),
('26', 'yudha alif auliya, s.kom., m.kom', '199206302022031009', NULL, NULL),
('27', 'karina nine amalia, s.kom., m.kom', '199512092022032023', NULL, NULL),
('28', 'gama wisnu fajarianto, s.kom., m.kom', '196909281993021001', NULL, NULL),
('29', 'tri agustina nugrahani, s.kom., m.kom', '199208222022032014', NULL, NULL),
('3', 'prof. drs. antonius cahya p, m. app.sc., ph.d', '196909281993021001', NULL, NULL),
('30', 'harry soepandi, s.kom., m.kom', '197604252023211002', NULL, NULL),
('31', 'maliatul fitriyasari., m.sc', '199503152023212038', NULL, NULL),
('32', 'dwi wijonarko, s.kom., m.kom', '198511272023211013', NULL, NULL),
('33', 'khoirunnisa\' afandi., m.kom', '11111', NULL, NULL),
('34', 'martiana kholila fadhil., m.kom', '11112', NULL, NULL),
('35', 'm. habibullah arief., m.kom', '11113', NULL, NULL),
('36', 'akbar pandu segara., m.kom', '05111850010009', NULL, NULL),
('37', 'narandha arya ranggianto, s.kom., m.kom', '199803082024061001', NULL, NULL),
('38', 'brian rizqi paradisiaca darnoto, s.kom., m.kom', '11114', NULL, NULL),
('39', 'damar novtahaning., m.sc', '11115', NULL, NULL),
('4', 'achmad maududie, st., m.sc', '197004221995121001', NULL, NULL),
('40', 'dony bahtera firmawan, s.kom.,m.kom', '11116', NULL, NULL),
('41', 'erik yohan kartiko, s.pd., m.kom', '11117', NULL, NULL),
('42', 'muhammad andryan wahyu saputra., m.kom', '11118', NULL, NULL),
('43', 'rizky alfanio atmoko, s.si., m.sc', '11119', NULL, NULL),
('5', 'diah ayu retnani w, st., m.eng', '198603052014042001', NULL, NULL),
('6', 'fahrobby adnan, s.kom., m.msi', '198706192014041001', NULL, NULL),
('7', 'oktalia juwita, s.kom., m.mt', '198110202014042001', NULL, NULL),
('8', 'priza pandunata, s.kom., m.sc', '198301312015041001', NULL, NULL),
('9', 'nelly oktavia a, s.si., mt', '198410242009122008', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE `hari` (
  `kode_hari` bigint(20) UNSIGNED NOT NULL,
  `nama_hari` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hari`
--

INSERT INTO `hari` (`kode_hari`, `nama_hari`, `created_at`, `updated_at`) VALUES
(1, 'senin', NULL, NULL),
(2, 'selasa', NULL, NULL),
(3, 'rabu', NULL, NULL),
(4, 'kamis', NULL, NULL),
(5, 'jumat', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matkul` varchar(255) NOT NULL,
  `kode_prodi` char(10) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `dosen` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `jumlah_sks` varchar(10) NOT NULL,
  `nama_ruang` varchar(255) NOT NULL,
  `hari` varchar(255) NOT NULL,
  `jam_masuk` varchar(255) NOT NULL,
  `jam_keluar` varchar(255) NOT NULL,
  `perkuliahan_semester` char(10) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `tahun_ajaran` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `matkul`, `kode_prodi`, `jenis`, `dosen`, `kelas`, `jumlah_sks`, `nama_ruang`, `hari`, `jam_masuk`, `jam_keluar`, `perkuliahan_semester`, `semester`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(5789, 'implementasi dan pengujian perangkat lunak', 'IF', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom', 'A', '2', 'a 3.3', 'Senin', '07:50', '09:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5790, 'implementasi dan pengujian perangkat lunak', 'IF', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom', 'B', '2', 'a 3.4', 'Senin', '07:50', '09:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5791, 'riset operasi', 'IF', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, qurrota a’yuni ar ruhimat, s.pd., m.sc, diah ayu retnani w, st., m.eng', 'C', '2', 'b 1', 'Senin', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5792, 'penginderaan jauh', 'SI', 'Tatap Muka', 'achmad maududie, st., m.sc', 'A', '3', 'c 2.1', 'Senin', '07:50', '10:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5793, 'ui/ux desain', 'TI', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'A', '2', 'a 3.1', 'Senin', '08:50', '10:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5794, 'ui/ux desain', 'TI', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'B', '2', 'a 3.2', 'Senin', '08:50', '10:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5795, 'basis data terdistribusi', 'TI', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom', 'A', '3', 'cdast 2', 'Senin', '08:50', '11:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5796, 'metodologi penelitian', 'IF', 'Tatap Muka', 'anang andrianto, s.t., m.t, katarina leba, s.ag., m.th, gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, harry soepandi, s.kom., m.kom', 'E', '2', 'b 1', 'Senin', '09:40', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5797, 'metodologi penelitian', 'IF', 'Tatap Muka', 'anang andrianto, s.t., m.t, katarina leba, s.ag., m.th, gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, harry soepandi, s.kom., m.kom', 'F', '2', 'b 2', 'Senin', '09:40', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5798, 'rekayasa proses bisnis', 'SI', 'Tatap Muka', 'karina nine amalia, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'A', '2', 'a 3.1', 'Senin', '10:40', '12:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5799, 'rekayasa proses bisnis', 'SI', 'Tatap Muka', 'karina nine amalia, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'B', '2', 'a 3.2', 'Senin', '10:40', '12:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5800, 'enterprise architecture', 'TI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'A', '2', 'a 3.3', 'Senin', '10:40', '12:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5801, 'enterprise architecture', 'TI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'B', '2', 'a 3.4', 'Senin', '10:40', '12:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5802, 'audit ti', 'SI', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom', 'A', '3', 'c 2.1', 'Senin', '10:40', '13:10', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5803, 'functional programming', 'IF', 'Praktikum', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom', 'B', '3', 'cdast 2', 'Senin', '11:30', '14:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5804, 'cloud computing', 'TI', 'Tatap Muka', 'diksy media firmansyah, s.kom., m.kom', 'A', '3', 'b 2', 'Senin', '11:30', '14:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5805, 'information retrieval', 'IF', 'Tatap Muka', 'achmad maududie, st., m.sc', 'A', '3', 'c 2.2', 'Senin', '11:30', '14:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5806, 'interaksi manusia dan komputer', 'IF', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'C', '2', 'a 3.1', 'Senin', '12:30', '14:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5807, 'interaksi manusia dan komputer', 'IF', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'D', '2', 'a 3.2', 'Senin', '12:30', '14:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5808, 'iot dalam agroindustri', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, dr. dwiretno istiyadi s, st., m.kom, achmad maududie, st., m.sc', 'A', '2', 'b 1', 'Senin', '12:30', '14:10', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5809, 'manajemen dan kewirausahaan', 'TI', 'Tatap Muka', 'yudha alif auliya, s.kom., m.kom, karina nine amalia, s.kom., m.kom, nelly oktavia a, s.si., mt', 'A', '2', 'a 3.3', 'Senin', '13:20', '15:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5810, 'manajemen dan kewirausahaan', 'TI', 'Tatap Muka', 'yudha alif auliya, s.kom., m.kom, karina nine amalia, s.kom., m.kom, nelly oktavia a, s.si., mt', 'B', '2', 'a 3.4', 'Senin', '13:20', '15:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5811, 'dasar-dasar sistem informasi', 'SI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'A', '2', 'a 3.1', 'Senin', '14:20', '16:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5812, 'dasar-dasar sistem informasi', 'SI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'B', '2', 'a 3.2', 'Senin', '14:20', '16:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5813, 'manajemen dan kewirausahaan', 'IF', 'Tatap Muka', 'yudha alif auliya, s.kom., m.kom, karina nine amalia, s.kom., m.kom, nelly oktavia a, s.si., mt', 'C', '2', 'b 1', 'Senin', '14:20', '16:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5814, 'manajemen dan kewirausahaan', 'IF', 'Tatap Muka', 'yudha alif auliya, s.kom., m.kom, karina nine amalia, s.kom., m.kom, nelly oktavia a, s.si., mt', 'D', '2', 'b 2', 'Senin', '14:20', '16:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5815, 'pengantar kecerdasan buatan', 'SI', 'Praktikum', 'yanuar nurdiansyah, st, m.cs, nova el maidah, s.si., m.cs, gama wisnu fajarianto, s.kom., m.kom, maliatul fitriyasari., m.sc', 'A', '3', 'cdast 1', 'Senin', '14:20', '16:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5816, 'speech processing', 'IF', 'Tatap Muka', 'm. arief hidayat, s. kom, m. kom', 'A', '3', 'c 2.1', 'Senin', '14:20', '16:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5817, 'pemrograman jaringan', 'TI', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'A', '3', 'a 3.3', 'Senin', '15:10', '17:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5818, 'riset operasi', 'IF', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, qurrota a’yuni ar ruhimat, s.pd., m.sc, diah ayu retnani w, st., m.eng', 'D', '2', 'c 2.2', 'Senin', '16:10', '17:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5819, 'pengantar sistem informasi geografi', 'SI', 'Tatap Muka', 'achmad maududie, st., m.sc', 'A', '3', 'a 3.1', 'Senin', '16:10', '18:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5820, 'jaringan syaraf tiruan', 'IF', 'Tatap Muka', 'nova el maidah, s.si., m.cs, gama wisnu fajarianto, s.kom., m.kom', 'A', '3', 'a 3.2', 'Senin', '17:00', '19:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5821, 'metodologi penelitian', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, katarina leba, s.ag., m.th, gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, harry soepandi, s.kom., m.kom', 'A', '2', 'a 3.1', 'Selasa', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5822, 'metodologi penelitian', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, katarina leba, s.ag., m.th, gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, harry soepandi, s.kom., m.kom', 'B', '2', 'a 3.2', 'Selasa', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5823, 'grafika komputer', 'IF', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'A', '2', 'b 1', 'Selasa', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5824, 'grafika komputer', 'IF', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'B', '2', 'b 2', 'Selasa', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5825, 'etika profesi', 'TI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, katarina leba, s.ag., m.th, fahrobby adnan, s.kom., m.msi, oktalia juwita, s.kom., m.mt', 'C', '2', 'a 3.3', 'Selasa', '07:50', '09:30', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5826, 'etika profesi', 'TI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, katarina leba, s.ag., m.th, fahrobby adnan, s.kom., m.msi, oktalia juwita, s.kom., m.mt', 'D', '2', 'a 3.4', 'Selasa', '07:50', '09:30', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5827, 'e-business', 'SI', 'Tatap Muka', 'karina nine amalia, s.kom., m.kom, nelly oktavia a, s.si., mt', 'A', '3', 'c 2.1', 'Selasa', '07:50', '10:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5828, 'computer vision', 'IF', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, tio dharmawan, s.kom., m.kom, maliatul fitriyasari., m.sc', 'A', '3', 'c 2.2', 'Selasa', '07:50', '10:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5829, 'algoritma evolusi', 'IF', 'Tatap Muka', 'gayatri dwi santika, s.si., m.kom, yudha alif auliya, s.kom., m.kom', 'A', '3', 'cdast 1', 'Selasa', '07:50', '10:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5830, 'manajemen resiko', 'IF', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom', 'A', '3', 'cdast 2', 'Selasa', '08:50', '11:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5831, 'administrasi sistem', 'TI', 'Tatap Muka', 'diksy media firmansyah, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'A', '2', 'a 3.3', 'Selasa', '09:40', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5832, 'administrasi sistem', 'TI', 'Tatap Muka', 'diksy media firmansyah, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'B', '2', 'a 3.4', 'Selasa', '09:40', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5833, 'interaksi manusia dan komputer', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'A', '2', 'a 3.1', 'Selasa', '10:40', '12:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5834, 'interaksi manusia dan komputer', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'B', '2', 'a 3.2', 'Selasa', '10:40', '12:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5835, 'pengantar rekayasa perangkat lunak', 'IF', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom, harry soepandi, s.kom., m.kom', 'C', '2', 'b 1', 'Selasa', '10:40', '12:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5836, 'pengantar rekayasa perangkat lunak', 'IF', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom, harry soepandi, s.kom., m.kom', 'D', '2', 'b 2', 'Selasa', '10:40', '12:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5837, 'grafika komputer', 'IF', 'Praktikum', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'B', '3', 'cdast 2', 'Selasa', '11:30', '14:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5838, 'requirement engineering', 'SI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom, harry soepandi, s.kom., m.kom', 'A', '3', 'c 2.1', 'Selasa', '11:30', '14:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5839, 'manajemen kualitas perangkat lunak', 'TI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom', 'A', '3', 'c 2.2', 'Selasa', '11:30', '14:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5840, 'object oriented design', 'SI', 'Tatap Muka', 'tri agustina nugrahani, s.kom., m.kom, harry soepandi, s.kom., m.kom', 'A', '2', 'a 3.1', 'Selasa', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5841, 'object oriented design', 'SI', 'Tatap Muka', 'tri agustina nugrahani, s.kom., m.kom, harry soepandi, s.kom., m.kom', 'B', '2', 'a 3.2', 'Selasa', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5842, 'manajemen risiko', 'TI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, beny prasetyo, s.kom., m.kom', 'A', '2', 'a 3.3', 'Selasa', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5843, 'manajemen risiko', 'TI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, beny prasetyo, s.kom., m.kom', 'B', '2', 'a 3.4', 'Selasa', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5844, 'aljabar linier', 'IF', 'Tatap Muka', 'm. arief hidayat, s. kom, m. kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', '2', 'b 1', 'Selasa', '12:30', '14:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5845, 'aljabar linier', 'IF', 'Tatap Muka', 'm. arief hidayat, s. kom, m. kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'B', '2', 'b 2', 'Selasa', '12:30', '14:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5846, 'software design', 'IF', 'Tatap Muka', 'tri agustina nugrahani, s.kom., m.kom, harry soepandi, s.kom., m.kom', 'A', '3', 'cdast 1', 'Selasa', '12:30', '15:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5847, 'functional programming', 'IF', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom', 'A', '2', 'a 3.1', 'Selasa', '14:20', '16:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5848, 'functional programming', 'IF', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom', 'B', '2', 'a 3.2', 'Selasa', '14:20', '16:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5849, 'analisa dan perancangan sistem', 'SI', 'Praktikum', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'A', '3', 'c 2.2', 'Selasa', '14:20', '16:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5850, 'pengukuran dan implementasi perangkat lunak', 'SI', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom', 'A', '3', 'b 1', 'Selasa', '14:20', '16:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5851, 'sistem informasi akuntansi', 'SI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'A', '3', 'a 3.4', 'Selasa', '15:10', '17:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5852, 'algoritma dan pemrograman i', 'IF', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'E', '2', 'a 3.1', 'Selasa', '16:10', '17:50', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5853, 'algoritma dan pemrograman i', 'IF', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'F', '2', 'a 3.2', 'Selasa', '16:10', '17:50', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5854, 'pemrograman berbasis web', 'TI', 'Praktikum', 'mohammad zarkasi, s.kom., m.kom, yudha alif auliya, s.kom., m.kom', 'B', '3', 'c 2.1', 'Selasa', '16:10', '18:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5855, 'kriptografi', 'TI', 'Tatap Muka', 'prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', '3', 'b 2', 'Selasa', '16:10', '18:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5856, 'sistem device', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, dr. dwiretno istiyadi s, st., m.kom', 'A', '3', 'a 3.3', 'Selasa', '17:00', '19:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5857, 'e-government', 'SI', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom', 'A', '3', 'b 1', 'Selasa', '17:00', '19:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5858, 'riset operasi', 'SI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, qurrota a’yuni ar ruhimat, s.pd., m.sc, diah ayu retnani w, st., m.eng', 'A', '2', 'a 3.1', 'Rabu', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5859, 'riset operasi', 'SI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, qurrota a’yuni ar ruhimat, s.pd., m.sc, diah ayu retnani w, st., m.eng', 'B', '2', 'a 3.2', 'Rabu', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5860, 'spatial basis data', 'SI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom', 'A', '3', 'cdast 1', 'Rabu', '07:00', '09:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5861, 'manajemen proyek teknologi informasi', 'TI', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom, karina nine amalia, s.kom., m.kom', 'A', '2', 'a 3.3', 'Rabu', '07:50', '09:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5862, 'manajemen proyek teknologi informasi', 'TI', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom, karina nine amalia, s.kom., m.kom', 'B', '2', 'a 3.4', 'Rabu', '07:50', '09:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5863, 'statistika', 'IF', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc', 'A', '2', 'b 1', 'Rabu', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5864, 'statistika', 'IF', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc', 'B', '2', 'b 2', 'Rabu', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5865, 'matematika dasar', 'TI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, m. arief hidayat, s. kom, m. kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'D', '3', 'c 2.1', 'Rabu', '07:50', '10:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5866, 'pemrograman berbasis web', 'TI', 'Praktikum', 'mohammad zarkasi, s.kom., m.kom, yudha alif auliya, s.kom., m.kom', 'A', '3', 'c 2.2', 'Rabu', '07:50', '10:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5867, 'manajemen keamanan sistem informasi', 'SI', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, diksy media firmansyah, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', '3', 'a 3.1', 'Rabu', '08:50', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5868, 'manajemen keamanan sistem informasi', 'SI', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, diksy media firmansyah, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'B', '3', 'a 3.2', 'Rabu', '08:50', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5869, 'struktur data', 'IF', 'Tatap Muka', 'm. arief hidayat, s. kom, m. kom, muhammad ‘ariful furqon, s.pd., m.kom, dwi wijonarko, s.kom., m.kom', 'A', '2', 'b 1', 'Rabu', '09:40', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5870, 'struktur data', 'IF', 'Tatap Muka', 'm. arief hidayat, s. kom, m. kom, muhammad ‘ariful furqon, s.pd., m.kom, dwi wijonarko, s.kom., m.kom', 'B', '2', 'b 2', 'Rabu', '09:40', '11:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5871, 'algoritma dan pemrograman i', 'TI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'C', '2', 'a 3.3', 'Rabu', '10:40', '12:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5872, 'algoritma dan pemrograman i', 'TI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'D', '2', 'a 3.4', 'Rabu', '10:40', '12:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5873, 'analisa dan perancangan sistem', 'SI', 'Praktikum', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'B', '3', 'c 2.1', 'Rabu', '11:30', '14:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5874, 'data science', 'IF', 'Tatap Muka', 'gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, nelly oktavia a, s.si., mt', 'A', '3', 'b 1', 'Rabu', '11:30', '14:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5875, 'etika profesi', 'SI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, katarina leba, s.ag., m.th, fahrobby adnan, s.kom., m.msi, oktalia juwita, s.kom., m.mt', 'A', '2', 'a 3.1', 'Rabu', '12:30', '14:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5876, 'etika profesi', 'SI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, katarina leba, s.ag., m.th, fahrobby adnan, s.kom., m.msi, oktalia juwita, s.kom., m.mt', 'B', '2', 'a 3.2', 'Rabu', '12:30', '14:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5877, 'pemrograman berbasis web', 'TI', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, yudha alif auliya, s.kom., m.kom', 'A', '2', 'a 3.3', 'Rabu', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5878, 'pemrograman berbasis web', 'TI', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom, yudha alif auliya, s.kom., m.kom', 'B', '2', 'a 3.4', 'Rabu', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5879, 'matematika diskrit', 'TI', 'Tatap Muka', 'qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom', 'A', '2', 'a 3.1', 'Rabu', '14:20', '16:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5880, 'matematika diskrit', 'TI', 'Tatap Muka', 'qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom', 'B', '2', 'a 3.2', 'Rabu', '14:20', '16:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5881, 'matematika dasar', 'IF', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, m. arief hidayat, s. kom, m. kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'E', '3', 'a 3.3', 'Rabu', '14:20', '16:50', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5882, 'matematika dasar', 'IF', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, m. arief hidayat, s. kom, m. kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'F', '3', 'a 3.4', 'Rabu', '14:20', '16:50', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5883, 'game engine design & development', 'TI', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, gama wisnu fajarianto, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'A', '3', 'b 2', 'Rabu', '14:20', '16:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5884, 'deep learning', 'IF', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, m. arief hidayat, s. kom, m. kom, muhammad ‘ariful furqon, s.pd., m.kom, yudha alif auliya, s.kom., m.kom, nelly oktavia a, s.si., mt', 'A', '3', 'c 2.1', 'Rabu', '14:20', '16:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5885, 'manajemen agroindustri modern', 'SI', 'Tatap Muka', 'karina nine amalia, s.kom., m.kom, tri agustina nugrahani, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'A', '3', 'b 1', 'Rabu', '15:10', '17:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5886, 'blockchain', 'TI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, diksy media firmansyah, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'A', '2', 'cdast 1', 'Rabu', '16:10', '17:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5887, 'sistem pakar', 'IF', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, nova el maidah, s.si., m.cs, fajrin nurman arifin, st., m.eng, gayatri dwi santika, s.si., m.kom', 'A', '3', 'c 2.2', 'Rabu', '16:10', '18:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5888, 'pengolahan citra', 'IF', 'Tatap Muka', 'tio dharmawan, s.kom., m.kom, maliatul fitriyasari., m.sc', 'A', '3', 'a 3.2', 'Rabu', '17:00', '19:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5889, 'pemrograman berorientasi obyek', 'SI', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, tio dharmawan, s.kom., m.kom, achmad maududie, st., m.sc', 'A', '3', 'a 3.1', 'Rabu', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5890, 'grafika komputer', 'IF', 'Praktikum', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'A', '3', 'a 3.3', 'Rabu', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5891, 'pemrograman sql', 'TI', 'Praktikum', 'fajrin nurman arifin, st., m.eng, harry soepandi, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'A', '3', 'b 1', 'Rabu', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5892, 'pemrograman berorientasi obyek', 'SI', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, tio dharmawan, s.kom., m.kom, achmad maududie, st., m.sc', 'B', '3', 'b 2', 'Rabu', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5893, 'matematika dasar', 'TI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, m. arief hidayat, s. kom, m. kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'C', '3', 'cdast 1', 'Rabu', '19:50', '22:20', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5894, 'analisa dan perancangan sistem', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'A', '2', 'a 3.1', 'Kamis', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5895, 'analisa dan perancangan sistem', 'SI', 'Tatap Muka', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, dwi wijonarko, s.kom., m.kom', 'B', '2', 'a 3.2', 'Kamis', '07:00', '08:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5896, 'pemrograman sql', 'TI', 'Praktikum', 'fajrin nurman arifin, st., m.eng, harry soepandi, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'B', '3', 'cdast 2', 'Kamis', '07:00', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5897, 'arsitektur komputer', 'IF', 'Tatap Muka', 'nova el maidah, s.si., m.cs, diah ayu retnani w, st., m.eng', 'A', '2', 'a 3.3', 'Kamis', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5898, 'arsitektur komputer', 'IF', 'Tatap Muka', 'nova el maidah, s.si., m.cs, diah ayu retnani w, st., m.eng', 'B', '2', 'a 3.4', 'Kamis', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5899, 'sistem penunjang pengambilan keputusan', 'SI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, yanuar nurdiansyah, st, m.cs, gayatri dwi santika, s.si., m.kom', 'A', '3', 'a 3.1', 'Kamis', '08:50', '11:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5900, 'digital forensik', 'TI', 'Tatap Muka', 'diksy media firmansyah, s.kom., m.kom', 'A', '3', 'a 3.2', 'Kamis', '08:50', '11:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5901, 'machine learning', 'IF', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, nova el maidah, s.si., m.cs, yudha alif auliya, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'A', '3', 'b 1', 'Kamis', '09:40', '12:10', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5902, 'pola-pola perancangan', 'TI', 'Tatap Muka', 'tio dharmawan, s.kom., m.kom', 'A', '3', 'c 2.1', 'Kamis', '10:40', '13:10', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5903, 'jaringan nirkabel', 'IF', 'Tatap Muka', 'anang andrianto, s.t., m.t, diksy media firmansyah, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'A', '3', 'cdast 1', 'Kamis', '10:40', '13:10', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5904, 'algoritma dan pemrograman i', 'SI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'A', '2', 'a 3.1', 'Kamis', '11:30', '13:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5905, 'algoritma dan pemrograman i', 'SI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'B', '2', 'a 3.2', 'Kamis', '11:30', '13:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5906, 'pemrograman sql', 'TI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, harry soepandi, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'A', '2', 'a 3.3', 'Kamis', '11:30', '13:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5907, 'pemrograman sql', 'TI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, harry soepandi, s.kom., m.kom, priza pandunata, s.kom., m.sc', 'B', '2', 'a 3.4', 'Kamis', '11:30', '13:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5908, 'manajemen keamanan sistem informasi', 'IF', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, diksy media firmansyah, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'C', '2', 'b 1', 'Kamis', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5909, 'manajemen keamanan sistem informasi', 'IF', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, diksy media firmansyah, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'D', '2', 'b 2', 'Kamis', '12:30', '14:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5910, 'intelligent game theory', 'TI', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, prof. dr. saiful bukhori, st., m.kom', 'A', '3', 'c 2.2', 'Kamis', '12:30', '15:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5911, 'tata kelola teknologi informasi', 'TI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'A', '2', 'a 3.3', 'Kamis', '13:20', '15:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5912, 'tata kelola teknologi informasi', 'TI', 'Tatap Muka', 'fajrin nurman arifin, st., m.eng, oktalia juwita, s.kom., m.mt', 'B', '2', 'a 3.4', 'Kamis', '13:20', '15:00', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5913, 'pemrograman berorientasi obyek', 'SI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, tio dharmawan, s.kom., m.kom, achmad maududie, st., m.sc', 'A', '3', 'a 3.1', 'Kamis', '13:20', '15:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5914, 'pemrograman berorientasi obyek', 'SI', 'Tatap Muka', 'dr. dwiretno istiyadi s, st., m.kom, tio dharmawan, s.kom., m.kom, achmad maududie, st., m.sc', 'B', '3', 'a 3.2', 'Kamis', '13:20', '15:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5915, 'etika profesi', 'IF', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, katarina leba, s.ag., m.th, fahrobby adnan, s.kom., m.msi, oktalia juwita, s.kom., m.mt', 'E', '2', 'b 1', 'Kamis', '14:20', '16:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5916, 'etika profesi', 'IF', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, katarina leba, s.ag., m.th, fahrobby adnan, s.kom., m.msi, oktalia juwita, s.kom., m.mt', 'F', '2', 'b 2', 'Kamis', '14:20', '16:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5917, 'pengantar rekayasa perangkat lunak', 'TI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom, harry soepandi, s.kom., m.kom', 'A', '2', 'a 3.3', 'Kamis', '16:10', '17:50', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5918, 'pengantar rekayasa perangkat lunak', 'TI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom, harry soepandi, s.kom., m.kom', 'B', '2', 'a 3.4', 'Kamis', '16:10', '17:50', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5919, 'analitik dan visualisasi data', 'SI', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, gayatri dwi santika, s.si., m.kom, nelly oktavia a, s.si., mt', 'A', '3', 'a 3.1', 'Kamis', '16:10', '18:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5920, 'analitik dan visualisasi data', 'SI', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, gayatri dwi santika, s.si., m.kom, nelly oktavia a, s.si., mt', 'B', '3', 'a 3.2', 'Kamis', '16:10', '18:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5921, 'functional programming', 'IF', 'Praktikum', 'mohammad zarkasi, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom', 'A', '3', 'cdast 2', 'Kamis', '16:10', '18:40', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5922, 'manajemen risiko ti', 'SI', 'Tatap Muka', 'windy eka yulia r, s. kom, mt, beny prasetyo, s.kom., m.kom', 'A', '3', 'b 2', 'Kamis', '16:10', '18:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5923, 'data visualization', 'IF', 'Tatap Muka', 'gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, nelly oktavia a, s.si., mt', 'A', '3', 'c 2.2', 'Kamis', '16:10', '18:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5924, 'manajemen layanan ti', 'SI', 'Tatap Muka', 'beny prasetyo, s.kom., m.kom', 'A', '3', 'b 1', 'Kamis', '17:00', '19:30', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5925, 'pengantar kecerdasan buatan', 'SI', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, nova el maidah, s.si., m.cs, gama wisnu fajarianto, s.kom., m.kom, maliatul fitriyasari., m.sc', 'A', '1', 'a 3.1', 'Jumat', '07:00', '07:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5926, 'pengantar kecerdasan buatan', 'SI', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, nova el maidah, s.si., m.cs, gama wisnu fajarianto, s.kom., m.kom, maliatul fitriyasari., m.sc', 'B', '1', 'a 3.2', 'Jumat', '07:00', '07:50', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5927, 'metodologi penelitian', 'TI', 'Tatap Muka', 'anang andrianto, s.t., m.t, katarina leba, s.ag., m.th, gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, harry soepandi, s.kom., m.kom', 'C', '2', 'a 3.3', 'Jumat', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5928, 'metodologi penelitian', 'TI', 'Tatap Muka', 'anang andrianto, s.t., m.t, katarina leba, s.ag., m.th, gayatri dwi santika, s.si., m.kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, harry soepandi, s.kom., m.kom', 'D', '2', 'a 3.4', 'Jumat', '07:50', '09:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5929, 'pengantar kecerdasan buatan', 'SI', 'Praktikum', 'yanuar nurdiansyah, st, m.cs, nova el maidah, s.si., m.cs, gama wisnu fajarianto, s.kom., m.kom, maliatul fitriyasari., m.sc', 'B', '3', 'c 2.1', 'Jumat', '07:50', '10:20', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5930, 'perancangan keamnan sistem dan jaringan', 'IF', 'Tatap Muka', 'diksy media firmansyah, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'A', '3', 'cdast 2', 'Jumat', '07:50', '10:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5931, 'prinsip organisasi dan manajemen', 'SI', 'Tatap Muka', 'karina nine amalia, s.kom., m.kom, oktalia juwita, s.kom., m.mt', 'A', '2', 'a 3.1', 'Jumat', '08:50', '10:30', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5932, 'prinsip organisasi dan manajemen', 'SI', 'Tatap Muka', 'karina nine amalia, s.kom., m.kom, oktalia juwita, s.kom., m.mt', 'B', '2', 'a 3.2', 'Jumat', '08:50', '10:30', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5933, 'supply chain management', 'SI', 'Tatap Muka', 'prof. dr. saiful bukhori, st., m.kom, tri agustina nugrahani, s.kom., m.kom', 'A', '3', 'cdast 1', 'Jumat', '08:50', '11:20', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5934, 'algoritma dan pemrograman i', 'TI', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'D', '3', 'a 3.4', 'Jumat', '10:40', '13:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5935, 'algoritma dan pemrograman i', 'TI', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'C', '3', 'b 1', 'Jumat', '10:40', '13:10', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5936, 'aspek sosial dan ekonomi perangkat lunak', 'SI', 'Tatap Muka', 'yanuar nurdiansyah, st, m.cs, diah ayu retnani w, st., m.eng', 'A', '3', 'b 2', 'Jumat', '10:40', '13:10', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5937, 'kecerdasan buatan', 'IF', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, gayatri dwi santika, s.si., m.kom, yudha alif auliya, s.kom., m.kom, maliatul fitriyasari., m.sc', 'A', '2', 'c 2.1', 'Jumat', '11:30', '13:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5938, 'kecerdasan buatan', 'IF', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, gayatri dwi santika, s.si., m.kom, yudha alif auliya, s.kom., m.kom, maliatul fitriyasari., m.sc', 'B', '2', 'c 2.2', 'Jumat', '11:30', '13:10', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5939, 'matematika dasar', 'SI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, m. arief hidayat, s. kom, m. kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', '3', 'a 3.1', 'Jumat', '11:30', '14:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5940, 'matematika dasar', 'SI', 'Tatap Muka', 'prof. drs. slamin, m.comp.sc., ph.d, m. arief hidayat, s. kom, m. kom, qurrota a’yuni ar ruhimat, s.pd., m.sc, gama wisnu fajarianto, s.kom., m.kom, prof. drs. antonius cahya p, m. app.sc., ph.d', 'B', '3', 'a 3.2', 'Jumat', '11:30', '14:00', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5941, 'augment reality', 'TI', 'Tatap Muka', 'maliatul fitriyasari., m.sc', 'A', '3', 'cdast 2', 'Jumat', '11:30', '14:00', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5942, 'data warehousing', 'TI', 'Tatap Muka', 'm. arief hidayat, s. kom, m. kom', 'A', '3', 'a 3.4', 'Jumat', '13:20', '15:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5943, 'pemrosesan bahasa alami', 'IF', 'Tatap Muka', 'muhammad ‘ariful furqon, s.pd., m.kom, prof. dr. saiful bukhori, st., m.kom, achmad maududie, st., m.sc', 'A', '3', 'c 2.1', 'Jumat', '13:20', '15:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5944, 'rekayasa proses bisnis', 'SI', 'Praktikum', 'karina nine amalia, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'A', '3', 'a 3.1', 'Jumat', '14:20', '16:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5945, 'rekayasa proses bisnis', 'SI', 'Praktikum', 'karina nine amalia, s.kom., m.kom, diah ayu retnani w, st., m.eng', 'B', '3', 'b 2', 'Jumat', '14:20', '16:50', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5946, 'implementasi dan pengujian perangkat lunak', 'IF', 'Praktikum', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom', 'A', '3', 'a 3.3', 'Jumat', '15:10', '17:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5947, 'implementasi dan pengujian perangkat lunak', 'IF', 'Praktikum', 'windy eka yulia r, s. kom, mt, prof. dr. saiful bukhori, st., m.kom', 'B', '3', 'c 2.2', 'Jumat', '15:10', '17:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5948, 'algoritma dan pemrograman i', 'IF', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'E', '3', 'cdast 1', 'Jumat', '15:10', '17:40', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5949, 'algoritma dan pemrograman i', 'IF', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'F', '3', 'cdast 2', 'Jumat', '15:10', '17:40', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5950, 'sistem terdistribusi', 'SI', 'Tatap Muka', 'mohammad zarkasi, s.kom., m.kom', 'A', '3', 'c 2.1', 'Jumat', '16:10', '18:40', '5', 'Ganjil', '2024/2025', NULL, NULL),
(5951, 'algoritma dan pemrograman i', 'SI', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'A', '3', 'a 3.1', 'Jumat', '17:00', '19:30', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5952, 'algoritma dan pemrograman i', 'SI', 'Praktikum', 'dr. dwiretno istiyadi s, st., m.kom, mohammad zarkasi, s.kom., m.kom, tio dharmawan, s.kom., m.kom, gama wisnu fajarianto, s.kom., m.kom, achmad maududie, st., m.sc, priza pandunata, s.kom., m.sc', 'B', '3', 'a 3.2', 'Jumat', '17:00', '19:30', '1', 'Ganjil', '2024/2025', NULL, NULL),
(5953, 'ui/ux desain', 'TI', 'Praktikum', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'B', '3', 'a 3.3', 'Jumat', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5954, 'object oriented design', 'SI', 'Praktikum', 'tri agustina nugrahani, s.kom., m.kom, harry soepandi, s.kom., m.kom', 'B', '3', 'a 3.4', 'Jumat', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5955, 'ui/ux desain', 'TI', 'Praktikum', 'anang andrianto, s.t., m.t, tri agustina nugrahani, s.kom., m.kom, fahrobby adnan, s.kom., m.msi', 'A', '3', 'b 1', 'Jumat', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5956, 'kecerdasan buatan', 'IF', 'Praktikum', 'muhammad ‘ariful furqon, s.pd., m.kom, gayatri dwi santika, s.si., m.kom, yudha alif auliya, s.kom., m.kom, maliatul fitriyasari., m.sc', 'B', '3', 'b 2', 'Jumat', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5957, 'object oriented design', 'SI', 'Praktikum', 'tri agustina nugrahani, s.kom., m.kom, harry soepandi, s.kom., m.kom', 'A', '3', 'c 2.2', 'Jumat', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL),
(5958, 'kecerdasan buatan', 'IF', 'Praktikum', 'muhammad ‘ariful furqon, s.pd., m.kom, gayatri dwi santika, s.si., m.kom, yudha alif auliya, s.kom., m.kom, maliatul fitriyasari., m.sc', 'A', '3', 'cdast 2', 'Jumat', '18:00', '20:30', '3', 'Ganjil', '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `kode_jam` bigint(20) UNSIGNED NOT NULL,
  `jam` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`kode_jam`, `jam`, `created_at`, `updated_at`) VALUES
(1, '07:00', NULL, NULL),
(2, '07:50', NULL, NULL),
(3, '08:50', NULL, NULL),
(4, '09:40', NULL, NULL),
(5, '10:40', NULL, NULL),
(6, '11:30', NULL, NULL),
(7, '12:30', NULL, NULL),
(8, '13:20', NULL, NULL),
(9, '14:20', NULL, NULL),
(10, '15:10', NULL, NULL),
(11, '16:10', NULL, NULL),
(12, '17:00', NULL, NULL),
(13, '18:00', NULL, NULL),
(14, '18:50', NULL, NULL),
(15, '19:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `kode_kelas` varchar(40) NOT NULL,
  `nama_matkul` varchar(255) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `kelas` char(10) NOT NULL,
  `kode_prodi` char(10) NOT NULL,
  `kapasitas_kelas` int(10) UNSIGNED NOT NULL,
  `tahun_ajaran` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `nama_matkul`, `nama_dosen`, `kelas`, `kode_prodi`, `kapasitas_kelas`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, 'KSU1101TA', 'matematika dasar', 'prof. drs. slamin, m.comp.sc., ph.d; m. arief hidayat, s. kom, m. kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(2, 'KSU1101TB', 'matematika dasar', 'prof. drs. slamin, m.comp.sc., ph.d; m. arief hidayat, s. kom, m. kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(6, 'KSU1104TA', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(7, 'KSU1104TB', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(8, 'KSU1104PA', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(9, 'KSU1104PB', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(10, 'KSU1106TA', 'etika profesi', 'prof. drs. slamin, m.comp.sc., ph.d; katarina leba, s.ag., m.th; fahrobby adnan, s.kom., m.msi; oktalia juwita, s.kom., m.mt', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(11, 'KSU1106TB', 'etika profesi', 'prof. drs. slamin, m.comp.sc., ph.d; katarina leba, s.ag., m.th; fahrobby adnan, s.kom., m.msi; oktalia juwita, s.kom., m.mt', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(12, 'KSU1105TA', 'interaksi manusia dan komputer', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(13, 'KSU1105TB', 'interaksi manusia dan komputer', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(14, 'KSI1102TA', 'dasar-dasar sistem informasi', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(15, 'KSI1102TB', 'dasar-dasar sistem informasi', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(16, 'KSI1206TA', 'prinsip organisasi dan manajemen', 'karina nine amalia, s.kom., m.kom; oktalia juwita, s.kom., m.mt', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(17, 'KSI1206TB', 'prinsip organisasi dan manajemen', 'karina nine amalia, s.kom., m.kom; oktalia juwita, s.kom., m.mt', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(18, 'MKI1309TA', 'riset operasi', 'fajrin nurman arifin, st., m.eng; qurrota a’yuni ar ruhimat, s.pd., m.sc; diah ayu retnani w, st., m.eng', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(19, 'MKI1309TB', 'riset operasi', 'fajrin nurman arifin, st., m.eng; qurrota a’yuni ar ruhimat, s.pd., m.sc; diah ayu retnani w, st., m.eng', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(20, 'KSU1208TA', 'pemrograman berorientasi obyek', 'dr. dwiretno istiyadi s, st., m.kom; tio dharmawan, s.kom., m.kom; achmad maududie, st., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(21, 'KSU1208TB', 'pemrograman berorientasi obyek', 'dr. dwiretno istiyadi s, st., m.kom; tio dharmawan, s.kom., m.kom; achmad maududie, st., m.sc', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(22, 'KSU1208PA', 'pemrograman berorientasi obyek', 'dr. dwiretno istiyadi s, st., m.kom; tio dharmawan, s.kom., m.kom; achmad maududie, st., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(23, 'KSU1208PB', 'pemrograman berorientasi obyek', 'dr. dwiretno istiyadi s, st., m.kom; tio dharmawan, s.kom., m.kom; achmad maududie, st., m.sc', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(24, 'KSU1601TA', 'metodologi penelitian', 'anang andrianto, s.t., m.t; katarina leba, s.ag., m.th; gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; harry soepandi, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(25, 'KSU1601TB', 'metodologi penelitian', 'anang andrianto, s.t., m.t; katarina leba, s.ag., m.th; gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; harry soepandi, s.kom., m.kom', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(26, 'KSI1302TA', 'analisa dan perancangan sistem', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(27, 'KSI1302TB', 'analisa dan perancangan sistem', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(28, 'KSI1302PA', 'analisa dan perancangan sistem', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(29, 'KSI1302PB', 'analisa dan perancangan sistem', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(30, 'KSI1306TA', 'object oriented design', 'tri agustina nugrahani, s.kom., m.kom; harry soepandi, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(31, 'KSI1306TB', 'object oriented design', 'tri agustina nugrahani, s.kom., m.kom; harry soepandi, s.kom., m.kom', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(32, 'KSI1306PA', 'object oriented design', 'tri agustina nugrahani, s.kom., m.kom; harry soepandi, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(33, 'KSI1306PB', 'object oriented design', 'tri agustina nugrahani, s.kom., m.kom; harry soepandi, s.kom., m.kom', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(34, 'KSI1307TA', 'pengantar kecerdasan buatan', 'yanuar nurdiansyah, st, m.cs; nova el maidah, s.si., m.cs; gama wisnu fajarianto, s.kom., m.kom; maliatul fitriyasari., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(35, 'KSI1307TB', 'pengantar kecerdasan buatan', 'yanuar nurdiansyah, st, m.cs; nova el maidah, s.si., m.cs; gama wisnu fajarianto, s.kom., m.kom; maliatul fitriyasari., m.sc', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(36, 'KSI1307PA', 'pengantar kecerdasan buatan', 'yanuar nurdiansyah, st, m.cs; nova el maidah, s.si., m.cs; gama wisnu fajarianto, s.kom., m.kom; maliatul fitriyasari., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(37, 'KSI1307PB', 'pengantar kecerdasan buatan', 'yanuar nurdiansyah, st, m.cs; nova el maidah, s.si., m.cs; gama wisnu fajarianto, s.kom., m.kom; maliatul fitriyasari., m.sc', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(38, 'KSI1308TA', 'manajemen keamanan sistem informasi', 'yanuar nurdiansyah, st, m.cs; diksy media firmansyah, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(39, 'KSI1308TB', 'manajemen keamanan sistem informasi', 'yanuar nurdiansyah, st, m.cs; diksy media firmansyah, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(40, 'KSI1309TA', 'analitik dan visualisasi data', 'muhammad ‘ariful furqon, s.pd., m.kom; gayatri dwi santika, s.si., m.kom; nelly oktavia a, s.si., mt', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(41, 'KSI1309TB', 'analitik dan visualisasi data', 'muhammad ‘ariful furqon, s.pd., m.kom; gayatri dwi santika, s.si., m.kom; nelly oktavia a, s.si., mt', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(42, 'KSI1408TA', 'rekayasa proses bisnis', 'karina nine amalia, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(43, 'KSI1408TB', 'rekayasa proses bisnis', 'karina nine amalia, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(44, 'KSI1408PA', 'rekayasa proses bisnis', 'karina nine amalia, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(45, 'KSI1408PB', 'rekayasa proses bisnis', 'karina nine amalia, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'B', 'SI', 50, '2024/2025', NULL, NULL),
(51, 'KSU1101TC', 'matematika dasar', 'prof. drs. slamin, m.comp.sc., ph.d; m. arief hidayat, s. kom, m. kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'C', 'TI', 50, '2024/2025', NULL, NULL),
(52, 'KSU1101TD', 'matematika dasar', 'prof. drs. slamin, m.comp.sc., ph.d; m. arief hidayat, s. kom, m. kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'D', 'TI', 50, '2024/2025', NULL, NULL),
(53, 'KSU1205TA', 'pengantar rekayasa perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom; harry soepandi, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(54, 'KSU1205TB', 'pengantar rekayasa perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom; harry soepandi, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(55, 'KSU1106TC', 'etika profesi', 'prof. drs. slamin, m.comp.sc., ph.d; katarina leba, s.ag., m.th; fahrobby adnan, s.kom., m.msi; oktalia juwita, s.kom., m.mt', 'C', 'TI', 50, '2024/2025', NULL, NULL),
(56, 'KSU1106TD', 'etika profesi', 'prof. drs. slamin, m.comp.sc., ph.d; katarina leba, s.ag., m.th; fahrobby adnan, s.kom., m.msi; oktalia juwita, s.kom., m.mt', 'D', 'TI', 50, '2024/2025', NULL, NULL),
(57, 'KSU1207TA', 'matematika diskrit', 'qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(58, 'KSU1207TB', 'matematika diskrit', 'qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(59, 'KST1102TC', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'C', 'TI', 50, '2024/2025', NULL, NULL),
(60, 'KST1102TD', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'D', 'TI', 50, '2024/2025', NULL, NULL),
(61, 'KST1102PC', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'C', 'TI', 50, '2024/2025', NULL, NULL),
(62, 'KST1102PD', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'D', 'TI', 50, '2024/2025', NULL, NULL),
(63, 'MKI9007TA', 'manajemen dan kewirausahaan', 'yudha alif auliya, s.kom., m.kom; karina nine amalia, s.kom., m.kom; nelly oktavia a, s.si., mt', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(64, 'MKI9007TB', 'manajemen dan kewirausahaan', 'yudha alif auliya, s.kom., m.kom; karina nine amalia, s.kom., m.kom; nelly oktavia a, s.si., mt', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(65, 'KSU1601TC', 'metodologi penelitian', 'anang andrianto, s.t., m.t; katarina leba, s.ag., m.th; gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; harry soepandi, s.kom., m.kom', 'C', 'TI', 50, '2024/2025', NULL, NULL),
(66, 'KSU1601TD', 'metodologi penelitian', 'anang andrianto, s.t., m.t; katarina leba, s.ag., m.th; gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; harry soepandi, s.kom., m.kom', 'D', 'TI', 50, '2024/2025', NULL, NULL),
(67, 'KST1306TA', 'pemrograman sql', 'fajrin nurman arifin, st., m.eng; harry soepandi, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(68, 'KST1306TB', 'pemrograman sql', 'fajrin nurman arifin, st., m.eng; harry soepandi, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(69, 'KST1306PA', 'pemrograman sql', 'fajrin nurman arifin, st., m.eng; harry soepandi, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(70, 'KST1306PB', 'pemrograman sql', 'fajrin nurman arifin, st., m.eng; harry soepandi, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(71, 'KST1308TA', 'administrasi sistem', 'diksy media firmansyah, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(72, 'KST1308TB', 'administrasi sistem', 'diksy media firmansyah, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(73, 'KST1310TA', 'tata kelola teknologi informasi', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(74, 'KST1310TB', 'tata kelola teknologi informasi', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(75, 'KST1311TA', 'enterprise architecture', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(76, 'KST1311TB', 'enterprise architecture', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(77, 'KST1312TA', 'ui/ux desain', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(78, 'KST1312TB', 'ui/ux desain', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(79, 'KST1312PA', 'ui/ux desain', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(80, 'KST1312PB', 'ui/ux desain', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(81, 'KST1407TA', 'pemrograman berbasis web', 'mohammad zarkasi, s.kom., m.kom; yudha alif auliya, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(82, 'KST1407TB', 'pemrograman berbasis web', 'mohammad zarkasi, s.kom., m.kom; yudha alif auliya, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(83, 'KST1407PA', 'pemrograman berbasis web', 'mohammad zarkasi, s.kom., m.kom; yudha alif auliya, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(84, 'KST1407PB', 'pemrograman berbasis web', 'mohammad zarkasi, s.kom., m.kom; yudha alif auliya, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(85, 'KST1608TA', 'manajemen risiko', 'windy eka yulia r, s. kom, mt; beny prasetyo, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(86, 'KST1608TB', 'manajemen risiko', 'windy eka yulia r, s. kom, mt; beny prasetyo, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(87, 'KST1607TA', 'manajemen proyek teknologi informasi', 'beny prasetyo, s.kom., m.kom; karina nine amalia, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(88, 'KST1607TB', 'manajemen proyek teknologi informasi', 'beny prasetyo, s.kom., m.kom; karina nine amalia, s.kom., m.kom', 'B', 'TI', 50, '2024/2025', NULL, NULL),
(89, 'KSU1101TE', 'matematika dasar', 'prof. drs. slamin, m.comp.sc., ph.d; m. arief hidayat, s. kom, m. kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'E', 'IF', 50, '2024/2025', NULL, NULL),
(90, 'KSU1101TF', 'matematika dasar', 'prof. drs. slamin, m.comp.sc., ph.d; m. arief hidayat, s. kom, m. kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; gama wisnu fajarianto, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'F', 'IF', 50, '2024/2025', NULL, NULL),
(91, 'KSU1104TE', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'E', 'IF', 50, '2024/2025', NULL, NULL),
(92, 'KSU1104TF', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'F', 'IF', 50, '2024/2025', NULL, NULL),
(93, 'KSU1104PE', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'E', 'IF', 50, '2024/2025', NULL, NULL),
(94, 'KSU1104PF', 'algoritma dan pemrograman i', 'dr. dwiretno istiyadi s, st., m.kom; mohammad zarkasi, s.kom., m.kom; tio dharmawan, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; achmad maududie, st., m.sc; priza pandunata, s.kom., m.sc', 'F', 'IF', 50, '2024/2025', NULL, NULL),
(95, 'KSU1105TC', 'interaksi manusia dan komputer', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'C', 'IF', 50, '2024/2025', NULL, NULL),
(96, 'KSU1105TD', 'interaksi manusia dan komputer', 'anang andrianto, s.t., m.t; tri agustina nugrahani, s.kom., m.kom; fahrobby adnan, s.kom., m.msi', 'D', 'IF', 50, '2024/2025', NULL, NULL),
(97, 'KSU1106TE', 'etika profesi', 'prof. drs. slamin, m.comp.sc., ph.d; katarina leba, s.ag., m.th; fahrobby adnan, s.kom., m.msi; oktalia juwita, s.kom., m.mt', 'E', 'IF', 50, '2024/2025', NULL, NULL),
(98, 'KSU1106TF', 'etika profesi', 'prof. drs. slamin, m.comp.sc., ph.d; katarina leba, s.ag., m.th; fahrobby adnan, s.kom., m.msi; oktalia juwita, s.kom., m.mt', 'F', 'IF', 50, '2024/2025', NULL, NULL),
(99, 'KSU1205TC', 'pengantar rekayasa perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom; harry soepandi, s.kom., m.kom', 'C', 'IF', 50, '2024/2025', NULL, NULL),
(100, 'KSU1205TD', 'pengantar rekayasa perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom; harry soepandi, s.kom., m.kom', 'D', 'IF', 50, '2024/2025', NULL, NULL),
(101, 'KSF1101TA', 'aljabar linier', 'm. arief hidayat, s. kom, m. kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(102, 'KSF1101TB', 'aljabar linier', 'm. arief hidayat, s. kom, m. kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(103, 'MKI1309TC', 'riset operasi', 'fajrin nurman arifin, st., m.eng; qurrota a’yuni ar ruhimat, s.pd., m.sc; diah ayu retnani w, st., m.eng', 'C', 'IF', 50, '2024/2025', NULL, NULL),
(104, 'MKI1309TD', 'riset operasi', 'fajrin nurman arifin, st., m.eng; qurrota a’yuni ar ruhimat, s.pd., m.sc; diah ayu retnani w, st., m.eng', 'D', 'IF', 50, '2024/2025', NULL, NULL),
(105, 'MKI9007TC', 'manajemen dan kewirausahaan', 'yudha alif auliya, s.kom., m.kom; karina nine amalia, s.kom., m.kom; nelly oktavia a, s.si., mt', 'C', 'IF', 50, '2024/2025', NULL, NULL),
(106, 'MKI9007TD', 'manajemen dan kewirausahaan', 'yudha alif auliya, s.kom., m.kom; karina nine amalia, s.kom., m.kom; nelly oktavia a, s.si., mt', 'D', 'IF', 50, '2024/2025', NULL, NULL),
(107, 'KSU1302TA', 'arsitektur komputer', 'nova el maidah, s.si., m.cs; diah ayu retnani w, st., m.eng', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(108, 'KSU1302TB', 'arsitektur komputer', 'nova el maidah, s.si., m.cs; diah ayu retnani w, st., m.eng', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(109, 'KSU1601TE', 'metodologi penelitian', 'anang andrianto, s.t., m.t; katarina leba, s.ag., m.th; gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; harry soepandi, s.kom., m.kom', 'E', 'IF', 50, '2024/2025', NULL, NULL),
(110, 'KSU1601TF', 'metodologi penelitian', 'anang andrianto, s.t., m.t; katarina leba, s.ag., m.th; gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; harry soepandi, s.kom., m.kom', 'F', 'IF', 50, '2024/2025', NULL, NULL),
(111, 'KSF1304TA', 'kecerdasan buatan', 'muhammad ‘ariful furqon, s.pd., m.kom; gayatri dwi santika, s.si., m.kom; yudha alif auliya, s.kom., m.kom; maliatul fitriyasari., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(112, 'KSF1304TB', 'kecerdasan buatan', 'muhammad ‘ariful furqon, s.pd., m.kom; gayatri dwi santika, s.si., m.kom; yudha alif auliya, s.kom., m.kom; maliatul fitriyasari., m.sc', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(113, 'KSF1304PA', 'kecerdasan buatan', 'muhammad ‘ariful furqon, s.pd., m.kom; gayatri dwi santika, s.si., m.kom; yudha alif auliya, s.kom., m.kom; maliatul fitriyasari., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(114, 'KSF1304PB', 'kecerdasan buatan', 'muhammad ‘ariful furqon, s.pd., m.kom; gayatri dwi santika, s.si., m.kom; yudha alif auliya, s.kom., m.kom; maliatul fitriyasari., m.sc', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(115, 'KSF1308TA', 'grafika komputer', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(116, 'KSF1308TB', 'grafika komputer', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(117, 'KSF1308PA', 'grafika komputer', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(118, 'KSF1308PB', 'grafika komputer', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(119, 'KSF1309TA', 'functional programming', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(120, 'KSF1309TB', 'functional programming', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(121, 'KSF1309PA', 'functional programming', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(122, 'KSF1309PB', 'functional programming', 'mohammad zarkasi, s.kom., m.kom; gama wisnu fajarianto, s.kom., m.kom', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(123, 'KSF1408TC', 'manajemen keamanan sistem informasi', 'yanuar nurdiansyah, st, m.cs; diksy media firmansyah, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'C', 'IF', 50, '2024/2025', NULL, NULL),
(124, 'KSF1408TD', 'manajemen keamanan sistem informasi', 'yanuar nurdiansyah, st, m.cs; diksy media firmansyah, s.kom., m.kom; prof. drs. antonius cahya p, m. app.sc., ph.d', 'D', 'IF', 50, '2024/2025', NULL, NULL),
(125, 'KSF1412TA', 'statistika', 'muhammad ‘ariful furqon, s.pd., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(126, 'KSF1412TB', 'statistika', 'muhammad ‘ariful furqon, s.pd., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(127, 'KSF1503TA', 'struktur data', 'm. arief hidayat, s. kom, m. kom; muhammad ‘ariful furqon, s.pd., m.kom; dwi wijonarko, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(128, 'KSF1503TB', 'struktur data', 'm. arief hidayat, s. kom, m. kom; muhammad ‘ariful furqon, s.pd., m.kom; dwi wijonarko, s.kom., m.kom', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(129, 'KSF1506TA', 'implementasi dan pengujian perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(130, 'KSF1506TB', 'implementasi dan pengujian perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(131, 'KSF1506PA', 'implementasi dan pengujian perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(132, 'KSF1506PB', 'implementasi dan pengujian perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom', 'B', 'IF', 50, '2024/2025', NULL, NULL),
(134, 'KIU1011TA', 'pengantar sistem informasi geografi', 'achmad maududie, st., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(135, 'KIU1012TA', 'spatial basis data', 'dr. dwiretno istiyadi s, st., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(136, 'KIU1013TA', 'manajemen agroindustri modern', 'karina nine amalia, s.kom., m.kom; tri agustina nugrahani, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(137, 'KIU1014TA', 'sistem penunjang pengambilan keputusan', 'prof. drs. slamin, m.comp.sc., ph.d; yanuar nurdiansyah, st, m.cs; gayatri dwi santika, s.si., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(138, 'KIU1015TA', 'penginderaan jauh', 'achmad maududie, st., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(139, 'KIU1016TA', 'sistem device', 'anang andrianto, s.t., m.t; dr. dwiretno istiyadi s, st., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(140, 'KIU1017TA', 'iot dalam agroindustri', 'anang andrianto, s.t., m.t; dr. dwiretno istiyadi s, st., m.kom; achmad maududie, st., m.sc', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(141, 'KIU1031TA', 'sistem terdistribusi', 'mohammad zarkasi, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(142, 'KIU1022TA', 'sistem informasi akuntansi', 'fajrin nurman arifin, st., m.eng; oktalia juwita, s.kom., m.mt', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(143, 'KIU1023TA', 'e-business', 'karina nine amalia, s.kom., m.kom; nelly oktavia a, s.si., mt', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(144, 'KIU1024TA', 'supply chain management', 'prof. dr. saiful bukhori, st., m.kom; tri agustina nugrahani, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(145, 'KIU1025TA', 'aspek sosial dan ekonomi perangkat lunak', 'yanuar nurdiansyah, st, m.cs; diah ayu retnani w, st., m.eng', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(146, 'KIU1041TA', 'pengukuran dan implementasi perangkat lunak', 'beny prasetyo, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(147, 'KIU1042TA', 'audit ti', 'beny prasetyo, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(148, 'KIU1043TA', 'manajemen layanan ti', 'beny prasetyo, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(149, 'KIU1044TA', 'e-government', 'beny prasetyo, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(150, 'KIU1045TA', 'manajemen risiko ti', 'windy eka yulia r, s. kom, mt; beny prasetyo, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(151, 'KIU1046TA', 'requirement engineering', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom; harry soepandi, s.kom., m.kom', 'A', 'SI', 50, '2024/2025', NULL, NULL),
(152, 'KTU1011TA', 'pemrograman jaringan', 'mohammad zarkasi, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(153, 'KTU1012TA', 'blockchain', 'dr. dwiretno istiyadi s, st., m.kom; diksy media firmansyah, s.kom., m.kom; dwi wijonarko, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(154, 'KTU1014TA', 'kriptografi', 'prof. drs. antonius cahya p, m. app.sc., ph.d', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(155, 'KTU1015TA', 'digital forensik', 'diksy media firmansyah, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(156, 'KTU1016TA', 'basis data terdistribusi', 'mohammad zarkasi, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(157, 'KTU1017TA', 'cloud computing', 'diksy media firmansyah, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(158, 'KTU1024TA', 'data warehousing', 'm. arief hidayat, s. kom, m. kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(159, 'KTU1021TA', 'pola-pola perancangan', 'tio dharmawan, s.kom., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(160, 'KTU1026TA', 'manajemen kualitas perangkat lunak', 'windy eka yulia r, s. kom, mt; prof. dr. saiful bukhori, st., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(161, 'KTU1042TA', 'augment reality', 'maliatul fitriyasari., m.sc', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(162, 'KTU1044TA', 'game engine design & development', 'muhammad ‘ariful furqon, s.pd., m.kom; gama wisnu fajarianto, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(163, 'KTU1046TA', 'intelligent game theory', 'muhammad ‘ariful furqon, s.pd., m.kom; prof. dr. saiful bukhori, st., m.kom', 'A', 'TI', 50, '2024/2025', NULL, NULL),
(164, 'KFU1101TA', 'jaringan syaraf tiruan', 'nova el maidah, s.si., m.cs; gama wisnu fajarianto, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(165, 'KFU1103TA', 'data visualization', 'gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; nelly oktavia a, s.si., mt', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(166, 'KFU1104TA', 'data science', 'gayatri dwi santika, s.si., m.kom; qurrota a’yuni ar ruhimat, s.pd., m.sc; nelly oktavia a, s.si., mt', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(167, 'KFU1105TA', 'pengolahan citra', 'tio dharmawan, s.kom., m.kom; maliatul fitriyasari., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(168, 'KFU1108TA', 'machine learning', 'yanuar nurdiansyah, st, m.cs; nova el maidah, s.si., m.cs; yudha alif auliya, s.kom., m.kom; priza pandunata, s.kom., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(169, 'KFU1102TA', 'information retrieval', 'achmad maududie, st., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(170, 'KFU1203TA', 'pemrosesan bahasa alami', 'muhammad ‘ariful furqon, s.pd., m.kom; prof. dr. saiful bukhori, st., m.kom; achmad maududie, st., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(171, 'KFU1205TA', 'computer vision', 'dr. dwiretno istiyadi s, st., m.kom; tio dharmawan, s.kom., m.kom; maliatul fitriyasari., m.sc', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(172, 'KFU1107TA', 'sistem pakar', 'yanuar nurdiansyah, st, m.cs; nova el maidah, s.si., m.cs; fajrin nurman arifin, st., m.eng; gayatri dwi santika, s.si., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(173, 'KFU1202TA', 'algoritma evolusi', 'gayatri dwi santika, s.si., m.kom; yudha alif auliya, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(174, 'KFU1204TA', 'deep learning', 'dr. dwiretno istiyadi s, st., m.kom; m. arief hidayat, s. kom, m. kom; muhammad ‘ariful furqon, s.pd., m.kom; yudha alif auliya, s.kom., m.kom; nelly oktavia a, s.si., mt', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(175, 'KFU1208TA', 'speech processing', 'm. arief hidayat, s. kom, m. kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(176, 'KFU1302TA', 'software design', 'tri agustina nugrahani, s.kom., m.kom; harry soepandi, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(178, 'KFU1404TA', 'manajemen resiko', 'beny prasetyo, s.kom., m.kom', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(179, 'KFU1510TA', 'jaringan nirkabel', 'anang andrianto, s.t., m.t; diksy media firmansyah, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(180, 'KFU1512TA', 'perancangan keamnan sistem dan jaringan', 'diksy media firmansyah, s.kom., m.kom; diah ayu retnani w, st., m.eng', 'A', 'IF', 50, '2024/2025', NULL, NULL),
(182, 'MKI9007TG', 'manajemen dan kewirausahaan', 'karina nine amalia, s.kom., m.kom; nelly oktavia a, s.si., mt', 'G', 'SI', 50, '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kuliah`
--

CREATE TABLE `kuliah` (
  `id_kuliah` bigint(20) UNSIGNED NOT NULL,
  `kode_kuliah` varchar(40) NOT NULL,
  `kode_matkul` varchar(40) NOT NULL,
  `kode_dosen` varchar(30) NOT NULL,
  `kode_kelas` varchar(40) NOT NULL,
  `kode_prodi` char(10) NOT NULL,
  `perkuliahan_semester` char(10) NOT NULL,
  `kode_semester` char(10) NOT NULL,
  `tahun_ajaran` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kuliah`
--

INSERT INTO `kuliah` (`id_kuliah`, `kode_kuliah`, `kode_matkul`, `kode_dosen`, `kode_kelas`, `kode_prodi`, `perkuliahan_semester`, `kode_semester`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, '1', 'KSU1101T', '1; 13; 25; 28; 3', 'KSU1101TA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(2, '2', 'KSU1101T', '1; 13; 25; 28; 3', 'KSU1101TB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(5, '3', 'KSU1104T', '11; 18; 21; 28; 4; 8', 'KSU1104TA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(6, '4', 'KSU1104T', '11; 18; 21; 28; 4; 8', 'KSU1104TB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(7, '5', 'KSU1104P', '11; 18; 21; 28; 4; 8', 'KSU1104PA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(8, '6', 'KSU1104P', '11; 18; 21; 28; 4; 8', 'KSU1104PB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(9, '7', 'KSU1106T', '1; 15; 6; 7', 'KSU1106TA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(10, '8', 'KSU1106T', '1; 15; 6; 7', 'KSU1106TB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(11, '9', 'KSU1105T', '10; 29; 6', 'KSU1105TA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(12, '10', 'KSU1105T', '10; 29; 6', 'KSU1105TB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(13, '11', 'KSI1102T', '17; 7', 'KSI1102TA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(14, '12', 'KSI1102T', '17; 7', 'KSI1102TB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(15, '13', 'KSI1206T', '27; 7', 'KSI1206TA', 'SI', '1', '1', '2024/2025', NULL, NULL),
(16, '14', 'KSI1206T', '27; 7', 'KSI1206TB', 'SI', '1', '1', '2024/2025', NULL, NULL),
(17, '15', 'MKI1309T', '17; 25; 5', 'MKI1309TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(18, '16', 'MKI1309T', '17; 25; 5', 'MKI1309TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(19, '17', 'KSU1208T', '11; 21; 4', 'KSU1208TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(20, '18', 'KSU1208T', '11; 21; 4', 'KSU1208TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(21, '19', 'KSU1208P', '11; 21; 4', 'KSU1208PA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(22, '20', 'KSU1208P', '11; 21; 4', 'KSU1208PB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(23, '21', 'KSU1601T', '10; 15; 24; 25; 30', 'KSU1601TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(24, '22', 'KSU1601T', '10; 15; 24; 25; 30', 'KSU1601TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(25, '23', 'KSI1302T', '10; 29; 32', 'KSI1302TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(26, '24', 'KSI1302T', '10; 29; 32', 'KSI1302TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(27, '25', 'KSI1302P', '10; 29; 32', 'KSI1302PA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(28, '26', 'KSI1302P', '10; 29; 32', 'KSI1302PB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(29, '27', 'KSI1306T', '29; 30', 'KSI1306TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(30, '28', 'KSI1306T', '29; 30', 'KSI1306TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(31, '29', 'KSI1306P', '29; 30', 'KSI1306PA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(32, '30', 'KSI1306P', '29; 30', 'KSI1306PB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(33, '31', 'KSI1307T', '14; 16; 28; 31', 'KSI1307TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(34, '32', 'KSI1307T', '14; 16; 28; 31', 'KSI1307TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(35, '33', 'KSI1307P', '14; 16; 28; 31', 'KSI1307PA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(36, '34', 'KSI1307P', '14; 16; 28; 31', 'KSI1307PB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(37, '35', 'KSI1308T', '14; 22; 3', 'KSI1308TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(38, '36', 'KSI1308T', '14; 22; 3', 'KSI1308TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(39, '37', 'KSI1309T', '19; 24; 9', 'KSI1309TA', 'SI', '3', '1', '2024/2025', NULL, NULL),
(40, '38', 'KSI1309T', '19; 24; 9', 'KSI1309TB', 'SI', '3', '1', '2024/2025', NULL, NULL),
(41, '39', 'KSI1408T', '27; 5', 'KSI1408TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(42, '40', 'KSI1408T', '27; 5', 'KSI1408TB', 'SI', '5', '1', '2024/2025', NULL, NULL),
(43, '41', 'KSI1408P', '27; 5', 'KSI1408PA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(44, '42', 'KSI1408P', '27; 5', 'KSI1408PB', 'SI', '5', '1', '2024/2025', NULL, NULL),
(50, '43', 'KSU1101T', '1; 13; 25; 28; 3', 'KSU1101TC', 'TI', '1', '1', '2024/2025', NULL, NULL),
(51, '44', 'KSU1101T', '1; 13; 25; 28; 3', 'KSU1101TD', 'TI', '1', '1', '2024/2025', NULL, NULL),
(52, '45', 'KSU1205T', '12; 2; 30', 'KSU1205TA', 'TI', '1', '1', '2024/2025', NULL, NULL),
(53, '46', 'KSU1205T', '12; 2; 30', 'KSU1205TB', 'TI', '1', '1', '2024/2025', NULL, NULL),
(54, '47', 'KSU1106T', '1; 15; 6; 7', 'KSU1106TC', 'TI', '1', '1', '2024/2025', NULL, NULL),
(55, '48', 'KSU1106T', '1; 15; 6; 7', 'KSU1106TD', 'TI', '1', '1', '2024/2025', NULL, NULL),
(56, '49', 'KSU1207T', '25; 28', 'KSU1207TA', 'TI', '1', '1', '2024/2025', NULL, NULL),
(57, '50', 'KSU1207T', '25; 28', 'KSU1207TB', 'TI', '1', '1', '2024/2025', NULL, NULL),
(58, '51', 'KST1102T', '11; 18; 21; 28; 4; 8', 'KST1102TC', 'TI', '1', '1', '2024/2025', NULL, NULL),
(59, '52', 'KST1102T', '11; 18; 21; 28; 4; 8', 'KST1102TD', 'TI', '1', '1', '2024/2025', NULL, NULL),
(60, '53', 'KST1102P', '11; 18; 21; 28; 4; 8', 'KST1102PC', 'TI', '1', '1', '2024/2025', NULL, NULL),
(61, '54', 'KST1102P', '11; 18; 21; 28; 4; 8', 'KST1102PD', 'TI', '1', '1', '2024/2025', NULL, NULL),
(62, '55', 'MKI9007T', '26; 27; 9', 'MKI9007TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(63, '56', 'MKI9007T', '26; 27; 9', 'MKI9007TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(64, '57', 'KSU1601T', '10; 15; 24; 25; 30', 'KSU1601TC', 'TI', '3', '1', '2024/2025', NULL, NULL),
(65, '58', 'KSU1601T', '10; 15; 24; 25; 30', 'KSU1601TD', 'TI', '3', '1', '2024/2025', NULL, NULL),
(66, '59', 'KST1306T', '17; 30; 8', 'KST1306TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(67, '60', 'KST1306T', '17; 30; 8', 'KST1306TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(68, '61', 'KST1306P', '17; 30; 8', 'KST1306PA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(69, '62', 'KST1306P', '17; 30; 8', 'KST1306PB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(70, '63', 'KST1308T', '22; 32', 'KST1308TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(71, '64', 'KST1308T', '22; 32', 'KST1308TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(72, '65', 'KST1310T', '17; 7', 'KST1310TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(73, '66', 'KST1310T', '17; 7', 'KST1310TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(74, '67', 'KST1311T', '17; 7', 'KST1311TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(75, '68', 'KST1311T', '17; 7', 'KST1311TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(76, '69', 'KST1312T', '10; 29; 6', 'KST1312TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(77, '70', 'KST1312T', '10; 29; 6', 'KST1312TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(78, '71', 'KST1312P', '10; 29; 6', 'KST1312PA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(79, '72', 'KST1312P', '10; 29; 6', 'KST1312PB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(80, '73', 'KST1407T', '18; 26', 'KST1407TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(81, '74', 'KST1407T', '18; 26', 'KST1407TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(82, '75', 'KST1407P', '18; 26', 'KST1407PA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(83, '76', 'KST1407P', '18; 26', 'KST1407PB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(84, '77', 'KST1608T', '12; 20', 'KST1608TA', 'TI', '3', '1', '2024/2025', NULL, NULL),
(85, '78', 'KST1608T', '12; 20', 'KST1608TB', 'TI', '3', '1', '2024/2025', NULL, NULL),
(86, '79', 'KST1607T', '20; 27', 'KST1607TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(87, '80', 'KST1607T', '20; 27', 'KST1607TB', 'TI', '5', '1', '2024/2025', NULL, NULL),
(88, '81', 'KSU1101T', '1; 13; 25; 28; 3', 'KSU1101TE', 'IF', '1', '1', '2024/2025', NULL, NULL),
(89, '82', 'KSU1101T', '1; 13; 25; 28; 3', 'KSU1101TF', 'IF', '1', '1', '2024/2025', NULL, NULL),
(90, '83', 'KSU1104T', '11; 18; 21; 28; 4; 8', 'KSU1104TE', 'IF', '1', '1', '2024/2025', NULL, NULL),
(91, '84', 'KSU1104T', '11; 18; 21; 28; 4; 8', 'KSU1104TF', 'IF', '1', '1', '2024/2025', NULL, NULL),
(92, '85', 'KSU1104P', '11; 18; 21; 28; 4; 8', 'KSU1104PE', 'IF', '1', '1', '2024/2025', NULL, NULL),
(93, '86', 'KSU1104P', '11; 18; 21; 28; 4; 8', 'KSU1104PF', 'IF', '1', '1', '2024/2025', NULL, NULL),
(94, '87', 'KSU1105T', '10; 29; 6', 'KSU1105TC', 'IF', '1', '1', '2024/2025', NULL, NULL),
(95, '88', 'KSU1105T', '10; 29; 6', 'KSU1105TD', 'IF', '1', '1', '2024/2025', NULL, NULL),
(96, '89', 'KSU1106T', '1; 15; 6; 7', 'KSU1106TE', 'IF', '1', '1', '2024/2025', NULL, NULL),
(97, '90', 'KSU1106T', '1; 15; 6; 7', 'KSU1106TF', 'IF', '1', '1', '2024/2025', NULL, NULL),
(98, '91', 'KSU1205T', '12; 2; 30', 'KSU1205TC', 'IF', '1', '1', '2024/2025', NULL, NULL),
(99, '92', 'KSU1205T', '12; 2; 30', 'KSU1205TD', 'IF', '1', '1', '2024/2025', NULL, NULL),
(100, '93', 'KSF1101T', '13; 3', 'KSF1101TA', 'IF', '1', '1', '2024/2025', NULL, NULL),
(101, '94', 'KSF1101T', '13; 3', 'KSF1101TB', 'IF', '1', '1', '2024/2025', NULL, NULL),
(102, '95', 'MKI1309T', '17; 25; 5', 'MKI1309TC', 'IF', '3', '1', '2024/2025', NULL, NULL),
(103, '96', 'MKI1309T', '17; 25; 5', 'MKI1309TD', 'IF', '3', '1', '2024/2025', NULL, NULL),
(104, '97', 'MKI9007T', '26; 27; 9', 'MKI9007TC', 'IF', '3', '1', '2024/2025', NULL, NULL),
(105, '98', 'MKI9007T', '26; 27; 9', 'MKI9007TD', 'IF', '3', '1', '2024/2025', NULL, NULL),
(106, '99', 'KSU1302T', '16; 5', 'KSU1302TA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(107, '100', 'KSU1302T', '16; 5', 'KSU1302TB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(108, '101', 'KSU1601T', '10; 15; 24; 25; 30', 'KSU1601TE', 'IF', '3', '1', '2024/2025', NULL, NULL),
(109, '102', 'KSU1601T', '10; 15; 24; 25; 30', 'KSU1601TF', 'IF', '3', '1', '2024/2025', NULL, NULL),
(110, '103', 'KSF1304T', '19; 24; 26; 31', 'KSF1304TA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(111, '104', 'KSF1304T', '19; 24; 26; 31', 'KSF1304TB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(112, '105', 'KSF1304P', '19; 24; 26; 31', 'KSF1304PA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(113, '106', 'KSF1304P', '19; 24; 26; 31', 'KSF1304PB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(114, '107', 'KSF1308T', '18; 28; 8', 'KSF1308TA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(115, '108', 'KSF1308T', '18; 28; 8', 'KSF1308TB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(116, '109', 'KSF1308P', '18; 28; 8', 'KSF1308PA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(117, '110', 'KSF1308P', '18; 28; 8', 'KSF1308PB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(118, '111', 'KSF1309T', '18; 28', 'KSF1309TA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(119, '112', 'KSF1309T', '18; 28', 'KSF1309TB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(120, '113', 'KSF1309P', '18; 28', 'KSF1309PA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(121, '114', 'KSF1309P', '18; 28', 'KSF1309PB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(122, '115', 'KSF1408T', '14; 22; 3', 'KSF1408TC', 'IF', '3', '1', '2024/2025', NULL, NULL),
(123, '116', 'KSF1408T', '14; 22; 3', 'KSF1408TD', 'IF', '3', '1', '2024/2025', NULL, NULL),
(124, '117', 'KSF1412T', '19; 25', 'KSF1412TA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(125, '118', 'KSF1412T', '19; 25', 'KSF1412TB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(126, '119', 'KSF1503T', '13; 19; 32', 'KSF1503TA', 'IF', '3', '1', '2024/2025', NULL, NULL),
(127, '120', 'KSF1503T', '13; 19; 32', 'KSF1503TB', 'IF', '3', '1', '2024/2025', NULL, NULL),
(128, '121', 'KSF1506T', '12; 2', 'KSF1506TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(129, '122', 'KSF1506T', '12; 2', 'KSF1506TB', 'IF', '5', '1', '2024/2025', NULL, NULL),
(130, '123', 'KSF1506P', '12; 2', 'KSF1506PA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(131, '124', 'KSF1506P', '12; 2', 'KSF1506PB', 'IF', '5', '1', '2024/2025', NULL, NULL),
(133, '125', 'KIU1011T', '4', 'KIU1011TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(134, '126', 'KIU1012T', '11', 'KIU1012TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(135, '127', 'KIU1013T', '27; 29; 5', 'KIU1013TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(136, '128', 'KIU1014T', '1; 14; 24', 'KIU1014TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(137, '129', 'KIU1015T', '4', 'KIU1015TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(138, '130', 'KIU1016T', '10; 11', 'KIU1016TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(139, '131', 'KIU1017T', '10; 11; 4', 'KIU1017TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(140, '132', 'KIU1031T', '18', 'KIU1031TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(141, '133', 'KIU1022T', '17; 7', 'KIU1022TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(142, '134', 'KIU1023T', '27; 9', 'KIU1023TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(143, '135', 'KIU1024T', '2; 29', 'KIU1024TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(144, '136', 'KIU1025T', '14; 5', 'KIU1025TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(145, '137', 'KIU1041T', '20', 'KIU1041TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(146, '138', 'KIU1042T', '20', 'KIU1042TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(147, '139', 'KIU1043T', '20', 'KIU1043TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(148, '140', 'KIU1044T', '20', 'KIU1044TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(149, '141', 'KIU1045T', '12; 20', 'KIU1045TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(150, '142', 'KIU1046T', '12; 2; 30', 'KIU1046TA', 'SI', '5', '1', '2024/2025', NULL, NULL),
(151, '143', 'KTU1011T', '18; 32', 'KTU1011TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(152, '144', 'KTU1012T', '11; 22; 32', 'KTU1012TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(153, '145', 'KTU1014T', '3', 'KTU1014TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(154, '146', 'KTU1015T', '22', 'KTU1015TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(155, '147', 'KTU1016T', '18', 'KTU1016TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(156, '148', 'KTU1017T', '22', 'KTU1017TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(157, '149', 'KTU1024T', '13', 'KTU1024TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(158, '150', 'KTU1021T', '21', 'KTU1021TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(159, '151', 'KTU1026T', '12; 2', 'KTU1026TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(160, '152', 'KTU1042T', '31', 'KTU1042TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(161, '153', 'KTU1044T', '19; 28; 8', 'KTU1044TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(162, '154', 'KTU1046T', '19; 2', 'KTU1046TA', 'TI', '5', '1', '2024/2025', NULL, NULL),
(163, '155', 'KFU1101T', '16; 28', 'KFU1101TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(164, '156', 'KFU1103T', '24; 25; 9', 'KFU1103TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(165, '157', 'KFU1104T', '24; 25; 9', 'KFU1104TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(166, '158', 'KFU1105T', '21; 31', 'KFU1105TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(167, '159', 'KFU1108T', '14; 16; 26; 8', 'KFU1108TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(168, '160', 'KFU1102T', '4', 'KFU1102TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(169, '161', 'KFU1203T', '19; 2; 4', 'KFU1203TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(170, '162', 'KFU1205T', '11; 21; 31', 'KFU1205TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(171, '163', 'KFU1107T', '14; 16; 17; 24', 'KFU1107TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(172, '164', 'KFU1202T', '24; 26', 'KFU1202TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(173, '165', 'KFU1204T', '11; 13; 19; 26; 9', 'KFU1204TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(174, '166', 'KFU1208T', '13', 'KFU1208TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(175, '167', 'KFU1302T', '29; 30', 'KFU1302TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(177, '168', 'KFU1404T', '20', 'KFU1404TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(178, '169', 'KFU1510T', '10; 22; 5', 'KFU1510TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(179, '170', 'KFU1512T', '22; 5', 'KFU1512TA', 'IF', '5', '1', '2024/2025', NULL, NULL),
(181, '171', 'MKI9007T', '27; 9', 'MKI9007TG', 'SI', '2', '2', '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` bigint(20) UNSIGNED NOT NULL,
  `kode_matkul` varchar(40) NOT NULL,
  `nama_matkul` varchar(255) NOT NULL,
  `sks` varchar(10) NOT NULL,
  `kode_prodi` char(10) NOT NULL,
  `kode_semester` char(10) NOT NULL,
  `perkuliahan_semester` char(10) NOT NULL,
  `tahun_ajaran` varchar(255) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `kode_matkul`, `nama_matkul`, `sks`, `kode_prodi`, `kode_semester`, `perkuliahan_semester`, `tahun_ajaran`, `jenis`, `created_at`, `updated_at`) VALUES
(1, 'KSU1101T', 'matematika dasar', '3', 'SI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:28:07', '2025-04-22 00:28:07'),
(2, 'KSU1104T', 'algoritma dan pemrograman i', '2', 'SI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:29:44', '2025-04-22 00:29:44'),
(3, 'KSU1104P', 'algoritma dan pemrograman i', '1', 'SI', '1', '1', '2024/2025', 'Praktikum', '2025-04-22 00:29:44', '2025-04-22 00:29:44'),
(4, 'KSU1106T', 'etika profesi', '2', 'SI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:30:28', '2025-04-22 00:30:28'),
(5, 'KSU1105T', 'interaksi manusia dan komputer', '2', 'SI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:31:04', '2025-04-22 00:31:04'),
(6, 'KSI1102T', 'dasar-dasar sistem informasi', '2', 'SI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:31:23', '2025-04-22 00:31:23'),
(7, 'KSI1206T', 'prinsip organisasi dan manajemen', '2', 'SI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:31:44', '2025-04-22 00:31:44'),
(8, 'MKI1309T', 'riset operasi', '2', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:32:02', '2025-04-22 00:32:02'),
(9, 'KSU1208T', 'pemrograman berorientasi obyek', '3', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:32:29', '2025-04-22 00:32:29'),
(10, 'KSU1208P', 'pemrograman berorientasi obyek', '1', 'SI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:32:29', '2025-04-22 00:32:29'),
(11, 'KSU1601T', 'metodologi penelitian', '2', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:32:52', '2025-04-22 00:32:52'),
(12, 'KSI1302T', 'analisa dan perancangan sistem', '2', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:33:14', '2025-04-22 00:33:14'),
(13, 'KSI1302P', 'analisa dan perancangan sistem', '1', 'SI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:33:14', '2025-04-22 00:33:14'),
(14, 'KSI1306T', 'object oriented design', '2', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:33:35', '2025-04-22 00:33:35'),
(15, 'KSI1306P', 'object oriented design', '1', 'SI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:33:35', '2025-04-22 00:33:35'),
(16, 'KSI1307T', 'pengantar kecerdasan buatan', '1', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:34:02', '2025-04-22 00:34:02'),
(17, 'KSI1307P', 'pengantar kecerdasan buatan', '1', 'SI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:34:02', '2025-04-22 00:34:02'),
(18, 'KSI1308T', 'manajemen keamanan sistem informasi', '3', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:34:25', '2025-04-22 00:34:25'),
(19, 'KSI1309T', 'analitik dan visualisasi data', '3', 'SI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:34:45', '2025-04-22 00:34:45'),
(20, 'KSI1408T', 'rekayasa proses bisnis', '2', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 00:35:14', '2025-04-22 00:35:14'),
(21, 'KSI1408P', 'rekayasa proses bisnis', '1', 'SI', '1', '5', '2024/2025', 'Praktikum', '2025-04-22 00:35:14', '2025-04-22 00:35:14'),
(22, 'KSU1101T', 'matematika dasar', '3', 'TI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:49:19', '2025-04-22 00:49:19'),
(23, 'KSU1205T', 'pengantar rekayasa perangkat lunak', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:49:40', '2025-04-22 00:49:40'),
(24, 'KSU1106T', 'etika profesi', '2', 'TI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:50:02', '2025-04-22 00:50:02'),
(25, 'KSU1207T', 'matematika diskrit', '2', 'TI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:50:26', '2025-04-22 00:50:26'),
(26, 'KST1102T', 'algoritma dan pemrograman i', '2', 'TI', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:50:45', '2025-04-22 00:50:45'),
(27, 'KST1102P', 'algoritma dan pemrograman i', '1', 'TI', '1', '1', '2024/2025', 'Praktikum', '2025-04-22 00:50:45', '2025-04-22 00:50:45'),
(28, 'MKI9007T', 'manajemen dan kewirausahaan', '2', 'TI', '1', '2', '2024/2025', 'Tatap Muka', '2025-04-22 00:51:08', '2025-04-22 00:51:08'),
(29, 'KSU1601T', 'metodologi penelitian', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:51:32', '2025-04-22 00:51:32'),
(30, 'KST1306T', 'pemrograman sql', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:51:54', '2025-04-22 00:51:54'),
(31, 'KST1306P', 'pemrograman sql', '1', 'TI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:51:54', '2025-04-22 00:51:54'),
(32, 'KST1308T', 'administrasi sistem', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:52:12', '2025-04-22 00:52:12'),
(33, 'KST1310T', 'tata kelola teknologi informasi', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:52:34', '2025-04-22 00:52:34'),
(34, 'KST1311T', 'enterprise architecture', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:52:57', '2025-04-22 00:52:57'),
(35, 'KST1312T', 'ui/ux desain', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:53:17', '2025-04-22 00:53:17'),
(36, 'KST1312P', 'ui/ux desain', '1', 'TI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:53:17', '2025-04-22 00:53:17'),
(37, 'KST1407T', 'pemrograman berbasis web', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:53:36', '2025-04-22 00:53:36'),
(38, 'KST1407P', 'pemrograman berbasis web', '1', 'TI', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:53:37', '2025-04-22 00:53:37'),
(39, 'KST1608T', 'manajemen risiko', '2', 'TI', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:54:05', '2025-04-22 00:54:05'),
(40, 'KST1607T', 'manajemen proyek teknologi informasi', '2', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 00:54:22', '2025-04-22 00:54:22'),
(41, 'KSU1101T', 'matematika dasar', '3', 'IF', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:55:26', '2025-04-22 00:55:26'),
(42, 'KSU1104T', 'algoritma dan pemrograman i', '2', 'IF', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:55:46', '2025-04-22 00:55:46'),
(43, 'KSU1104P', 'algoritma dan pemrograman i', '1', 'IF', '1', '1', '2024/2025', 'Praktikum', '2025-04-22 00:55:46', '2025-04-22 00:55:46'),
(44, 'KSU1105T', 'interaksi manusia dan komputer', '2', 'IF', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:56:07', '2025-04-22 00:56:07'),
(45, 'KSU1106T', 'etika profesi', '2', 'IF', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:56:23', '2025-04-22 00:56:23'),
(46, 'KSU1205T', 'pengantar rekayasa perangkat lunak', '2', 'IF', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:56:42', '2025-04-22 00:56:42'),
(47, 'KSF1101T', 'aljabar linier', '2', 'IF', '1', '1', '2024/2025', 'Tatap Muka', '2025-04-22 00:57:02', '2025-04-22 00:57:02'),
(48, 'MKI1309T', 'riset operasi', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:57:20', '2025-04-22 00:57:20'),
(49, 'MKI9007T', 'manajemen dan kewirausahaan', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:57:39', '2025-04-22 00:57:39'),
(50, 'KSU1302T', 'arsitektur komputer', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:57:59', '2025-04-22 00:57:59'),
(51, 'KSU1601T', 'metodologi penelitian', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:58:20', '2025-04-22 00:58:20'),
(52, 'KSF1304T', 'kecerdasan buatan', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:58:39', '2025-04-22 00:58:39'),
(53, 'KSF1304P', 'kecerdasan buatan', '1', 'IF', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:58:39', '2025-04-22 00:58:39'),
(54, 'KSF1308T', 'grafika komputer', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:59:00', '2025-04-22 00:59:00'),
(55, 'KSF1308P', 'grafika komputer', '1', 'IF', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:59:00', '2025-04-22 00:59:00'),
(56, 'KSF1309T', 'functional programming', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:59:25', '2025-04-22 00:59:25'),
(57, 'KSF1309P', 'functional programming', '1', 'IF', '1', '3', '2024/2025', 'Praktikum', '2025-04-22 00:59:25', '2025-04-22 00:59:25'),
(58, 'KSF1408T', 'manajemen keamanan sistem informasi', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 00:59:42', '2025-04-22 00:59:42'),
(59, 'KSF1412T', 'statistika', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 01:00:11', '2025-04-22 01:00:11'),
(60, 'KSF1503T', 'struktur data', '2', 'IF', '1', '3', '2024/2025', 'Tatap Muka', '2025-04-22 01:00:28', '2025-04-22 01:00:28'),
(61, 'KSF1506T', 'implementasi dan pengujian perangkat lunak', '2', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 01:00:48', '2025-04-22 01:00:48'),
(62, 'KSF1506P', 'implementasi dan pengujian perangkat lunak', '1', 'IF', '1', '5', '2024/2025', 'Praktikum', '2025-04-22 01:00:48', '2025-04-22 01:00:48'),
(63, 'KIU1011T', 'pengantar sistem informasi geografi', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 01:28:17', '2025-04-22 01:28:17'),
(64, 'KIU1012T', 'spatial basis data', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 01:57:49', '2025-04-22 01:57:49'),
(65, 'KIU1013T', 'manajemen agroindustri modern', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 01:59:13', '2025-04-22 01:59:13'),
(66, 'KIU1014T', 'sistem penunjang pengambilan keputusan', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 01:59:33', '2025-04-22 01:59:33'),
(67, 'KIU1015T', 'penginderaan jauh', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 01:59:57', '2025-04-22 01:59:57'),
(68, 'KIU1016T', 'sistem device', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:00:24', '2025-04-22 02:00:24'),
(69, 'KIU1017T', 'iot dalam agroindustri', '2', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:00:42', '2025-04-22 02:00:42'),
(70, 'KIU1031T', 'sistem terdistribusi', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:00:59', '2025-04-22 02:00:59'),
(71, 'KIU1022T', 'sistem informasi akuntansi', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:01:20', '2025-04-22 02:01:20'),
(72, 'KIU1023T', 'e-business', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:01:35', '2025-04-22 02:01:35'),
(73, 'KIU1024T', 'supply chain management', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:01:52', '2025-04-22 02:01:52'),
(74, 'KIU1025T', 'aspek sosial dan ekonomi perangkat lunak', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:02:08', '2025-04-22 02:02:08'),
(77, 'KIU1042T', 'audit ti', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:02:49', '2025-04-22 02:02:49'),
(78, 'KIU1043T', 'manajemen layanan ti', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:03:06', '2025-04-22 02:03:06'),
(79, 'KIU1044T', 'e-government', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:03:21', '2025-04-22 02:03:21'),
(80, 'KIU1045T', 'manajemen risiko ti', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:03:36', '2025-04-22 02:03:36'),
(81, 'KIU1046T', 'requirement engineering', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:03:52', '2025-04-22 02:03:52'),
(82, 'KTU1011T', 'pemrograman jaringan', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:06:14', '2025-04-22 02:06:14'),
(83, 'KTU1012T', 'blockchain', '2', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:06:30', '2025-04-22 02:06:30'),
(84, 'KTU1014T', 'kriptografi', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:06:49', '2025-04-22 02:06:49'),
(85, 'KTU1015T', 'digital forensik', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:07:06', '2025-04-22 02:07:06'),
(86, 'KTU1016T', 'basis data terdistribusi', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:07:23', '2025-04-22 02:07:23'),
(87, 'KTU1017T', 'cloud computing', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:07:39', '2025-04-22 02:07:39'),
(88, 'KTU1024T', 'data warehousing', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:07:56', '2025-04-22 02:07:56'),
(89, 'KTU1021T', 'pola-pola perancangan', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:08:14', '2025-04-22 02:08:14'),
(90, 'KTU1026T', 'manajemen kualitas perangkat lunak', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:08:31', '2025-04-22 02:08:31'),
(91, 'KTU1042T', 'augment reality', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:08:48', '2025-04-22 02:08:48'),
(92, 'KTU1044T', 'game engine design & development', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:09:02', '2025-04-22 02:09:02'),
(93, 'KTU1046T', 'intelligent game theory', '3', 'TI', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:09:18', '2025-04-22 02:09:18'),
(94, 'KFU1101T', 'jaringan syaraf tiruan', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:11:53', '2025-04-22 02:11:53'),
(95, 'KFU1103T', 'data visualization', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:12:08', '2025-04-22 02:12:08'),
(96, 'KFU1104T', 'data science', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:12:23', '2025-04-22 02:12:23'),
(97, 'KFU1105T', 'pengolahan citra', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:12:40', '2025-04-22 02:12:40'),
(98, 'KFU1108T', 'machine learning', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:12:57', '2025-04-22 02:12:57'),
(99, 'KFU1102T', 'information retrieval', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:13:13', '2025-04-22 02:13:13'),
(100, 'KFU1203T', 'pemrosesan bahasa alami', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:13:30', '2025-04-22 02:13:30'),
(101, 'KFU1205T', 'computer vision', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:13:45', '2025-04-22 02:13:45'),
(102, 'KFU1107T', 'sistem pakar', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:14:02', '2025-04-22 02:14:02'),
(103, 'KFU1202T', 'algoritma evolusi', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:14:21', '2025-04-22 02:14:21'),
(104, 'KFU1204T', 'deep learning', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:14:36', '2025-04-22 02:14:36'),
(105, 'KFU1208T', 'speech processing', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:14:50', '2025-04-22 02:14:50'),
(106, 'KFU1302T', 'software design', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:15:03', '2025-04-22 02:15:03'),
(107, 'KFU1404T', 'manajemen resiko', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:15:18', '2025-04-22 02:15:18'),
(108, 'KFU1510T', 'jaringan nirkabel', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:15:34', '2025-04-22 02:15:34'),
(109, 'KFU1512T', 'perancangan keamnan sistem dan jaringan', '3', 'IF', '1', '5', '2024/2025', 'Tatap Muka', '2025-04-22 02:15:50', '2025-04-22 02:15:50'),
(111, 'KIU1041T', 'pengukuran dan implementasi perangkat lunak', '3', 'SI', '1', '5', '2024/2025', 'Tatap Muka', '2025-05-15 09:51:22', '2025-05-15 09:51:22'),
(112, 'MKI9007T', 'manajemen dan kewirausahaan', '2', 'SI', '2', '2', '2024/2025', 'Tatap Muka', '2025-06-08 06:38:08', '2025-06-08 06:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '2021_09_17_023717_create_prodi_table', 1),
(24, '2021_09_18_020953_create_semester_table', 1),
(35, '2021_09_23_014035_create_hari_table', 1),
(37, '2021_09_23_014235_create_jam_table', 1),
(40, '2021_09_27_011150_create_waktu_table', 1),
(43, '2014_10_12_000000_create_users_table', 1),
(54, '2021_12_25_123735_create_request_waktu_table', 1),
(55, '2021_09_21_091451_create_ruang_table', 1),
(57, '2021_12_23_085311_create_request_ruang_table', 1),
(59, '2021_09_14_140239_create_dosen_table', 1),
(62, '2021_10_27_214907_create_jadwal_table', 1),
(63, '2023_02_12_020411_create_tahun_ajaran_table', 1),
(65, '2021_09_16_044312_create_matkul_table', 1),
(67, '2021_11_17_235257_create_request_kuliah_table', 1),
(68, '2021_09_18_034140_create_kelas_table', 2),
(69, '2021_09_26_024355_create_kuliah_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` bigint(20) UNSIGNED NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `kode_prodi` char(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `kode_prodi`, `created_at`, `updated_at`) VALUES
(2, 'teknologi informasi', 'TI', '2025-04-20 10:46:58', '2025-04-20 10:46:58'),
(3, 'informatika', 'IF', '2025-04-20 10:47:05', '2025-04-20 10:47:05'),
(4, 'sistem informasi', 'SI', '2025-04-21 00:34:43', '2025-04-21 00:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `request_kuliah`
--

CREATE TABLE `request_kuliah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request` varchar(255) NOT NULL,
  `manage` varchar(255) NOT NULL,
  `kode_manage` varchar(40) NOT NULL,
  `nama_manage` varchar(255) NOT NULL,
  `sks` varchar(10) NOT NULL,
  `kode_prodi` char(10) NOT NULL,
  `kode_semester` varchar(255) NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `nama_matkul` varchar(255) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `kapasitas_kelas` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_ruang`
--

CREATE TABLE `request_ruang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request` varchar(255) NOT NULL,
  `kode_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(255) NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_waktu`
--

CREATE TABLE `request_waktu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request` varchar(255) NOT NULL,
  `manage` varchar(255) NOT NULL,
  `kode_waktu` int(11) NOT NULL,
  `kode_hari` int(11) NOT NULL,
  `nama_hari` varchar(255) NOT NULL,
  `kode_jam` varchar(255) NOT NULL,
  `jam` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` bigint(20) UNSIGNED NOT NULL,
  `nama_ruang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `nama_ruang`, `created_at`, `updated_at`) VALUES
(1, 'a 3.1', NULL, NULL),
(2, 'a 3.2', NULL, NULL),
(3, 'a 3.3', NULL, NULL),
(4, 'a 3.4', NULL, NULL),
(5, 'b 1', NULL, NULL),
(6, 'b 2', NULL, NULL),
(7, 'c 2.1', NULL, NULL),
(8, 'c 2.2', NULL, NULL),
(9, 'cdast 1', NULL, NULL),
(10, 'cdast 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `kode_semester` bigint(20) UNSIGNED NOT NULL,
  `nama_semester` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`kode_semester`, `nama_semester`, `created_at`, `updated_at`) VALUES
(1, 'Ganjil', NULL, NULL),
(2, 'Genap', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun_ajaran` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(128) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `is_active` int(10) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `username`, `email`, `image`, `role_id`, `is_active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', 'default.jpg', 1, 1, NULL, '$2y$10$iMs.oTGdRJFSFp5AFGYvteIQOAdCwKhszFizcQOEb7XGQPeFMrtz2', NULL, '2024-09-17 18:26:49', NULL),
(2, 'Dosen', 'dosen', 'dosen@gmail.com', 'default.jpg', 2, 1, NULL, '$2y$10$4AkWn5.Hhlps0GqSWcjpOuVdo2KHZ2XeITR7QktZqpMkvz5f9GdOe', NULL, '2024-09-29 03:48:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `waktu`
--

CREATE TABLE `waktu` (
  `kode_waktu` bigint(20) UNSIGNED NOT NULL,
  `kode_hari` varchar(30) NOT NULL,
  `kode_jam` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waktu`
--

INSERT INTO `waktu` (`kode_waktu`, `kode_hari`, `kode_jam`, `created_at`, `updated_at`) VALUES
(1, '1', '2', NULL, NULL),
(2, '1', '3', NULL, NULL),
(3, '1', '4', NULL, NULL),
(4, '1', '5', NULL, NULL),
(5, '1', '6', NULL, NULL),
(6, '1', '7', NULL, NULL),
(7, '1', '8', NULL, NULL),
(8, '1', '9', NULL, NULL),
(9, '1', '10', NULL, NULL),
(10, '1', '11', NULL, NULL),
(11, '1', '12', NULL, NULL),
(12, '2', '1', NULL, NULL),
(13, '2', '2', NULL, NULL),
(14, '2', '3', NULL, NULL),
(15, '2', '4', NULL, NULL),
(16, '2', '5', NULL, NULL),
(17, '2', '6', NULL, NULL),
(18, '2', '7', NULL, NULL),
(19, '2', '8', NULL, NULL),
(20, '2', '9', NULL, NULL),
(21, '2', '10', NULL, NULL),
(22, '2', '11', NULL, NULL),
(23, '2', '12', NULL, NULL),
(24, '2', '13', NULL, NULL),
(25, '2', '14', NULL, NULL),
(26, '3', '1', NULL, NULL),
(27, '3', '2', NULL, NULL),
(28, '3', '3', NULL, NULL),
(29, '3', '4', NULL, NULL),
(30, '3', '5', NULL, NULL),
(31, '3', '6', NULL, NULL),
(32, '3', '7', NULL, NULL),
(33, '3', '8', NULL, NULL),
(34, '3', '9', NULL, NULL),
(35, '3', '10', NULL, NULL),
(36, '3', '11', NULL, NULL),
(37, '3', '12', NULL, NULL),
(38, '3', '13', NULL, NULL),
(39, '3', '14', NULL, NULL),
(40, '3', '15', NULL, NULL),
(41, '4', '1', NULL, NULL),
(42, '4', '2', NULL, NULL),
(43, '4', '3', NULL, NULL),
(44, '4', '4', NULL, NULL),
(45, '4', '5', NULL, NULL),
(46, '4', '6', NULL, NULL),
(47, '4', '7', NULL, NULL),
(48, '4', '8', NULL, NULL),
(49, '4', '9', NULL, NULL),
(50, '4', '10', NULL, NULL),
(51, '4', '11', NULL, NULL),
(52, '4', '12', NULL, NULL),
(53, '4', '13', NULL, NULL),
(54, '4', '14', NULL, NULL),
(55, '4', '15', NULL, NULL),
(56, '5', '1', NULL, NULL),
(57, '5', '2', NULL, NULL),
(58, '5', '3', NULL, NULL),
(59, '5', '4', NULL, NULL),
(60, '5', '5', NULL, NULL),
(61, '5', '6', NULL, NULL),
(62, '5', '7', NULL, NULL),
(63, '5', '8', NULL, NULL),
(64, '5', '9', NULL, NULL),
(65, '5', '10', NULL, NULL),
(66, '5', '11', NULL, NULL),
(67, '5', '12', NULL, NULL),
(68, '5', '13', NULL, NULL),
(69, '5', '14', NULL, NULL),
(70, '5', '15', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`kode_hari`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`kode_jam`),
  ADD UNIQUE KEY `jam_jam_unique` (`jam`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `kuliah`
--
ALTER TABLE `kuliah`
  ADD PRIMARY KEY (`id_kuliah`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD UNIQUE KEY `prodi_nama_prodi_unique` (`nama_prodi`),
  ADD UNIQUE KEY `prodi_kode_prodi_unique` (`kode_prodi`),
  ADD UNIQUE KEY `nama_prodi` (`nama_prodi`),
  ADD UNIQUE KEY `nama_prodi_2` (`nama_prodi`);

--
-- Indexes for table `request_kuliah`
--
ALTER TABLE `request_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_ruang`
--
ALTER TABLE `request_ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_waktu`
--
ALTER TABLE `request_waktu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`kode_semester`),
  ADD UNIQUE KEY `semester_nama_semester_unique` (`nama_semester`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`kode_waktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `kode_hari` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5959;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `kode_jam` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `kuliah`
--
ALTER TABLE `kuliah`
  MODIFY `id_kuliah` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request_kuliah`
--
ALTER TABLE `request_kuliah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `request_ruang`
--
ALTER TABLE `request_ruang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_waktu`
--
ALTER TABLE `request_waktu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `kode_ruang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `kode_semester` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `waktu`
--
ALTER TABLE `waktu`
  MODIFY `kode_waktu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
