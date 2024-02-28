-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 28, 2024 at 09:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Absensi`
--
CREATE DATABASE IF NOT EXISTS `Absensi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Absensi`;

-- --------------------------------------------------------

--
-- Table structure for table `Absensi`
--

CREATE TABLE `Absensi` (
  `Siswa` varchar(10) NOT NULL,
  `Kehadiran` enum('Hadir','Sakit','Izin','Alpa','Belum Absen') NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Administrator`
--

CREATE TABLE `Administrator` (
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Administrator`
--

INSERT INTO `Administrator` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `Jurusan`
--

CREATE TABLE `Jurusan` (
  `id` int(11) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Kelas`
--

CREATE TABLE `Kelas` (
  `Kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Siswa`
--

CREATE TABLE `Siswa` (
  `NIS` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Kelas` int(11) NOT NULL,
  `Gender` enum('L','P') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Absensi`
--
ALTER TABLE `Absensi`
  ADD KEY `Siswa` (`Siswa`);

--
-- Indexes for table `Administrator`
--
ALTER TABLE `Administrator`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `Jurusan`
--
ALTER TABLE `Jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `Kelas`
--
ALTER TABLE `Kelas`
  ADD PRIMARY KEY (`Kelas`);

--
-- Indexes for table `Siswa`
--
ALTER TABLE `Siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD KEY `Kelas` (`Kelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Jurusan`
--
ALTER TABLE `Jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Absensi`
--
ALTER TABLE `Absensi`
  ADD CONSTRAINT `Absensi_ibfk_1` FOREIGN KEY (`Siswa`) REFERENCES `Siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Jurusan`
--
ALTER TABLE `Jurusan`
  ADD CONSTRAINT `Jurusan_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `Kelas` (`Kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Siswa`
--
ALTER TABLE `Siswa`
  ADD CONSTRAINT `Siswa_ibfk_1` FOREIGN KEY (`Kelas`) REFERENCES `Jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `absensii`
--
CREATE DATABASE IF NOT EXISTS `absensii` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `absensii`;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `employee_id` int(8) NOT NULL,
  `tgl` varchar(255) DEFAULT NULL,
  `clock_in` varchar(255) DEFAULT NULL,
  `clock_out` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `employee_id`, `tgl`, `clock_in`, `clock_out`) VALUES
(1, 101, '2023-01-15', '14:56:29', NULL),
(2, 101, '2023-01-16', '14:57:14', NULL),
(35, 101, '2023-01-17', '17:59:26', '19:53:18'),
(36, 102, '2023-01-17', '19:54:42', '19:54:47'),
(37, 105, '2023-01-18', '21:01:46', NULL),
(38, 106, '2023-01-20', '17:52:43', NULL),
(39, 102, '2023-01-22', '14:36:41', '14:36:45'),
(40, 104, '2023-01-22', '15:10:12', '15:13:29'),
(41, 105, '2023-01-22', '15:15:53', '15:15:57'),
(42, 105, '2024-01-05', '19:30:15', '19:30:21'),
(43, 104, '2024-01-05', '19:33:05', '19:33:08'),
(44, 102, '2024-01-05', '19:37:31', '19:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` int(8) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `fullname`, `role`, `password`) VALUES
(1, 101, 'Altap', 'admin', '$2y$10$alm5wQPKmazD76Pbe8KVAuIt7b3cyVeIqKMkIUPaj0AGELG4pMwHG'),
(2, 102, 'Ani Hanifah', 'packaging', '$2y$10$03mwoSbp83Nrd3BCRcQpVOj8HRDfrK1Bqd7jiCGOF1nO7RvNnNPdK'),
(3, 103, 'Sigit Raharjo', 'admin', '$2y$10$sT5u.xTYqIA0b/AuQbCYp.ix.VL3uHWkBYrRck6PK/n8csm5PpIf.'),
(4, 104, 'Rania Alia Nefta', 'operator', '$2y$10$xTbBVr1Szal7Re70JL9gK.jAH2dlON8nbfelR6tXNzCrKOQ/.IiPO'),
(5, 105, 'Tafta ganteng', 'operator', '$2y$10$ZZZLuC98a3io0V92TertYe8zk1ph2vu5npD8IpCuFHmfFrJnJGoGy'),
(7, 106, 'Tafta Junior', 'admin', '$2y$10$1wj5a6cs2L733X2uerwh8eGgecbHPpZZrUBdbi/lJcJpIbG.xc4IW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `crud_api`
--
CREATE DATABASE IF NOT EXISTS `crud_api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud_api`;

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
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namabarang` enum('Kopi','Teh','Pasta Gigi','Sabun Mandi','Sampo') NOT NULL,
  `stok` varchar(255) NOT NULL,
  `jumlahterjual` varchar(255) NOT NULL,
  `tanggaltransaksi` date NOT NULL,
  `jenisbarang` enum('Pembersih','Konsumsi') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `namabarang`, `stok`, `jumlahterjual`, `tanggaltransaksi`, `jenisbarang`, `created_at`, `updated_at`) VALUES
(1, 'Sabun Mandi', '100', '100', '2024-02-27', 'Konsumsi', '2024-02-27 10:37:25', '2024-02-27 10:37:25'),
(2, 'Kopi', '50', '32', '2024-01-29', 'Pembersih', '2024-02-27 10:45:57', '2024-02-27 10:45:57'),
(3, 'Teh', '123', '22', '2024-01-27', 'Konsumsi', '2024-02-27 10:46:17', '2024-02-27 10:46:17'),
(4, 'Sampo', '20', '5', '2024-01-11', 'Pembersih', '2024-02-27 10:46:36', '2024-02-27 10:46:36'),
(5, 'Kopi', '10', '2', '2024-02-09', 'Konsumsi', '2024-02-27 10:47:13', '2024-02-27 10:47:13'),
(6, 'Teh', '100', '5', '2024-02-12', 'Konsumsi', '2024-02-27 10:47:39', '2024-02-27 10:47:39');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_27_124704_create_inventories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'qtasnim', 'qtasnim@gmail.com', NULL, '$2y$12$2euqE0kivtdClPwwuLfYue4qzVBdcmhsBz5PLKNGX3Q5fJONJiXdW', NULL, '2024-02-27 10:33:29', '2024-02-27 10:33:29'),
(2, 'testaja', 'testaja@gmail.com', NULL, '$2y$12$EDca0zj93lx6FGNFjJv8GuZPwIluLLXTjZd9fUb6Jnes4N3YvUmGm', NULL, '2024-02-28 10:01:50', '2024-02-28 10:01:50'),
(3, 'ariqaqilla', 'ariqaqila@gmail.com', NULL, '$2y$12$BYSWnYBRea.jmd97vQJQEuChXGE50etFX9LPsBSACDb0jw3HUHw4W', NULL, '2024-02-28 12:37:14', '2024-02-28 12:37:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `hondacorp`
--
CREATE DATABASE IF NOT EXISTS `hondacorp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hondacorp`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Personal', 'personaldepth', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(2, 'Programming', 'programes', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(3, 'Designer', 'designers', '2024-02-20 09:00:51', '2024-02-20 09:00:51');

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
-- Table structure for table `homes`
--

CREATE TABLE `homes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uname` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_28_071026_create_posts_table', 1),
(6, '2024_01_31_135023_create_categories_table', 1),
(7, '2024_02_19_173545_create_home_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `home_id` bigint(20) UNSIGNED NOT NULL,
  `titles` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text NOT NULL,
  `body` text NOT NULL,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `home_id`, `titles`, `slug`, `excerpt`, `body`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 'Qui molestiae porro.', 'enim-dignissimos-culpa-veritatis-hic-velit-vel-officia-velit', 'Est aut cum aspernatur repellendus ipsa necessitatibus distinctio mollitia. Aperiam alias et repellat aliquam voluptas omnis quis. Enim impedit eos quam nostrum.', '<p>Reiciendis nemo blanditiis et. Voluptas veritatis et itaque beatae. Cupiditate minima enim reiciendis consequuntur numquam.</p><p>Atque consequuntur error earum consequuntur nihil velit. Hic quas et quae porro voluptatem non. Atque minima id ipsa voluptate. Cumque aliquid alias repudiandae adipisci ut repellat.</p><p>Libero tempore et et id aspernatur a. Tempore voluptate ut dignissimos culpa et repellendus. Natus voluptatem cum asperiores. Optio sint est vel itaque et vel qui illum.</p><p>Et quo ut non aut incidunt. Debitis soluta corporis iusto voluptates. Nisi officiis nihil tempore laboriosam qui rerum neque eum.</p><p>Minima facere quia incidunt reiciendis placeat. Incidunt soluta cum ex dolorem. Debitis mollitia qui voluptates quaerat. Cum excepturi dolorem vel ipsum.</p><p>Suscipit quia rem deleniti eum tempore quia maiores doloribus. Aut ut officia aut adipisci voluptate rerum et exercitationem. Unde unde sit numquam reiciendis omnis inventore optio.</p><p>Harum perferendis eligendi eveniet dolore. Molestiae facere a ipsam sit possimus. Et vel aut quas quos sit veritatis et.</p><p>Ullam quas quia magni amet blanditiis. Voluptatum sit iure vitae et suscipit iusto aut. Necessitatibus veniam repudiandae et voluptas.</p><p>Temporibus nobis qui omnis non omnis quam. Ea aut ipsa ullam ut qui perferendis ratione. Quia magnam unde qui nihil et nobis omnis.</p><p>Temporibus odit sint inventore quasi dolorem. Assumenda natus est sit in. Commodi qui quibusdam harum explicabo. Architecto quidem ut eligendi.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(2, 2, 3, 2, 'Et sit qui.', 'necessitatibus-officia-et-est', 'Consectetur laboriosam cumque sint magni. Est et aut iusto. Temporibus harum nostrum quia. Error aut nihil est tempore omnis distinctio.', '<p>Id vero esse porro officiis. Minima sit quia molestiae nostrum qui. Possimus numquam nihil tempore libero reiciendis consequuntur temporibus. Omnis tempore rerum quaerat ipsum eum.</p><p>Nisi nostrum maxime est magni itaque. Atque sed aut exercitationem occaecati architecto. Sunt minus voluptate est. Atque laudantium aspernatur aut consequatur illo necessitatibus qui.</p><p>Officiis beatae rerum animi officiis. Libero et aliquid sunt similique in architecto deserunt quae. Vitae ut eius enim. Culpa id eum consequuntur sed autem. Ullam aliquid id sit earum iure velit non.</p><p>Corrupti quibusdam facilis sapiente. Sequi sed nostrum atque enim dolorem sapiente. Velit corrupti facilis non sequi magni dolor. Atque cumque facilis quas beatae sit.</p><p>Et beatae necessitatibus quis eum qui qui. Quia voluptas unde quia occaecati et voluptatem deserunt. Doloremque cum sed et sit fuga sed. In nihil est autem consectetur porro rerum ut.</p><p>Dolores est reiciendis sint ipsam. Assumenda aliquam facilis et doloremque sit. Laborum dolor inventore consequatur similique et qui delectus.</p><p>Et nisi placeat voluptas mollitia asperiores ut impedit quos. Totam praesentium vel delectus aut ullam rerum sed. Quas vel labore mollitia iure accusamus commodi nostrum eveniet. Occaecati quisquam ut a id. Dolorem aliquam maxime hic dolores id omnis.</p><p>Cupiditate omnis soluta ut enim in. Iusto sunt rem non. Ratione eos sit aut beatae repellat maiores corrupti. Est adipisci veniam qui maxime.</p><p>Autem voluptatem dignissimos possimus sit voluptatem enim. Exercitationem non hic sint sint dolorem. At eveniet possimus nostrum et dolor sunt. Qui dolor magnam quo maxime quia voluptatem amet.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(3, 3, 3, 1, 'Maiores ullam.', 'blanditiis-vel-laboriosam-deserunt-reiciendis-maiores', 'Et necessitatibus odio et autem nihil optio veniam optio. Enim dolorem fugiat commodi doloribus voluptate eius quaerat dolorem. Sit consequatur ipsa quia magnam.', '<p>Eum et numquam sit adipisci iste veniam non. Magnam fugit voluptatem autem quia eaque nulla doloremque et. Commodi animi exercitationem velit dolores voluptas voluptas. Autem exercitationem vel corrupti autem consequatur enim voluptates.</p><p>Aut necessitatibus laborum voluptatem aspernatur. Assumenda beatae eaque facere ut.</p><p>Id molestiae voluptates dolor. Voluptatum voluptatem similique qui rerum vel dolor sed facilis. A impedit magnam explicabo molestias reprehenderit quia enim a. Nihil rerum perspiciatis illo perspiciatis aspernatur repellat. Reiciendis voluptas soluta eius amet numquam ex et.</p><p>Aut placeat consequatur molestiae magnam possimus aut. Et iusto nesciunt beatae minima tenetur non asperiores maxime.</p><p>Inventore explicabo id illum qui ut temporibus commodi. Doloremque quis alias animi unde provident harum in. Neque sed laboriosam neque placeat. Eos molestiae id quia autem et temporibus architecto.</p><p>Facere eos ex qui illum aut nostrum. Cumque aspernatur voluptate qui ex voluptatem vitae. Sed qui et quos. Non fugiat eum enim et.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(4, 2, 3, 1, 'Rerum maiores aliquam.', 'aut-molestias-est-eius-vero-nihil', 'Explicabo est et facilis est eum at vitae. Consequatur qui enim autem ipsam cum et distinctio. Impedit sed nulla consequatur et. Ea consequatur sequi molestiae corporis exercitationem delectus temporibus. Voluptatem facere qui fugit illo.', '<p>Nobis alias amet sed et. Ab occaecati aut rerum exercitationem. Unde quam laborum fugiat animi praesentium. Quasi recusandae magni autem porro voluptates ut natus.</p><p>Aperiam consectetur quae consequatur. Explicabo molestiae temporibus dolorem id excepturi perspiciatis. Sed perferendis alias ea delectus. Architecto illo illo magnam veritatis fugit fugit iste.</p><p>Aspernatur totam culpa quae beatae et repellat. Voluptas recusandae at alias. Nam sint aut dolorem quo. Ut consequatur placeat qui placeat voluptates.</p><p>Qui sunt qui soluta beatae. Et nostrum natus qui et deserunt et nam. Inventore qui quos possimus porro. Perferendis et facere expedita placeat.</p><p>Inventore non dolores illo ipsa. Quasi rerum quisquam et voluptates minima ut placeat.</p><p>Adipisci distinctio excepturi ex aperiam cum mollitia. Sed veniam nisi molestias totam quo ut pariatur. Eum minima temporibus voluptatem architecto.</p><p>Ut quas corporis est numquam fugit eos. Quasi deserunt assumenda sint harum ad. Sit tempore expedita aperiam qui ut.</p><p>Reprehenderit nam sit maiores et occaecati nostrum. Deserunt et et cupiditate quam. Neque ducimus repellat ab eveniet aut. Assumenda nobis iste doloribus placeat ullam earum beatae.</p><p>Est sint saepe aperiam temporibus ratione velit aut. Non porro molestiae eos odio et. Ut minima minima nisi cumque omnis culpa est.</p><p>Ut dolores voluptate et in. Doloremque aperiam quisquam consequatur quae explicabo sed. Est fugiat molestias dolor quaerat molestias tempore. Necessitatibus at in eum doloribus nostrum ea.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(5, 2, 3, 1, 'Illum id est.', 'adipisci-sed-quis-corporis-expedita-sed-odio-incidunt', 'Possimus nobis architecto aut. Nihil autem nemo consequatur quaerat odio aut eligendi. Inventore similique eum illum repellendus non magni. Ut facilis quas omnis sequi quia commodi tempora dolorem.', '<p>Quia ratione modi dolores animi eum. Consequatur architecto optio dicta illo id. Id non aliquam fugiat exercitationem ut cumque aspernatur. In maxime officiis unde qui temporibus dolor.</p><p>Modi perspiciatis rerum rerum dolores hic repudiandae perspiciatis aliquam. Provident quos a consequuntur eveniet nam modi vel sed. Saepe ex sint est tenetur. Nihil porro a repellendus iure non nesciunt cumque dolor.</p><p>Voluptas dolore qui minima aut et exercitationem aperiam molestiae. Quam id inventore cumque voluptatibus et odio voluptas. Esse aliquam et voluptatum. Eum est et ipsa quaerat consequatur numquam alias.</p><p>Et vel ducimus facere a blanditiis dolores. Sed quis voluptatum consequatur ducimus quod repellat. Libero ut nobis qui doloribus itaque voluptas cupiditate.</p><p>Id sit eum illo. Illo aut ut et non nulla. Voluptate sit voluptas voluptas ea sed aspernatur.</p><p>Possimus rerum est facere reprehenderit exercitationem blanditiis. Eius sed molestiae iusto recusandae praesentium. Esse adipisci quo earum hic. Soluta quam explicabo quidem sit.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(6, 1, 1, 2, 'Consequatur officiis exercitationem.', 'molestias-magnam-quos-eum-ut-explicabo', 'Ullam accusantium inventore aut. In aut provident cumque ea tempore. Repellendus optio ex voluptatem sint modi fuga ipsum. Culpa reprehenderit officia delectus voluptas officia natus minus.', '<p>Error totam voluptatem dolorum voluptatem. Aut est repellendus fuga quidem nam. Inventore aut praesentium qui qui et. Dignissimos possimus omnis voluptates veniam. Et consectetur sint eum quia et doloremque explicabo.</p><p>Consequuntur qui recusandae et vel quia libero dolores. Aliquam quidem eum omnis ut doloremque id placeat. Occaecati sed repudiandae quia sed voluptatem. Eos fugit quas architecto aut maxime ipsum quis.</p><p>Illo nihil et maiores voluptatem. Perspiciatis maiores ratione tempore rerum aut exercitationem illo. Ut nulla voluptatem assumenda tenetur dolorem velit magni.</p><p>Excepturi minima voluptatem voluptatem illo. Tenetur occaecati vitae similique omnis qui quisquam. Consequatur cum sit unde deleniti nam adipisci fuga. Consequatur eligendi aut ipsam porro veniam.</p><p>Porro debitis aut et exercitationem quo ut. Rerum id quia ut facere voluptatem quo. Impedit aut voluptatibus quia.</p><p>Quia incidunt odio dolor sed ducimus quia qui. Enim et doloribus sapiente nobis nihil cupiditate. Modi expedita ipsa fugiat blanditiis accusamus dolores. In totam neque mollitia unde occaecati.</p><p>Unde repellendus minus quam vel ipsam ad. Odio officia quia voluptas expedita voluptas vel occaecati. Est neque saepe ea provident provident nemo cupiditate velit. Iste ut veniam qui aut fugit. Sed ad molestias voluptates.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(7, 2, 2, 2, 'Molestias veniam totam.', 'ut-est-sunt-ut-perspiciatis', 'Consequatur non est accusantium perspiciatis occaecati sit. Dolores delectus accusamus sint nihil quo sint dicta.', '<p>Rem harum modi aut dolores. Error officia ea reiciendis quia et deserunt. Praesentium saepe vero voluptatem necessitatibus fugiat eligendi placeat.</p><p>Maxime ullam odio odit nemo ipsa. Perspiciatis molestiae voluptatibus eos ipsum perferendis eveniet omnis.</p><p>Ut eveniet libero harum commodi quia ducimus veniam. Et eaque minima minus ad. Qui et ut unde voluptatem sequi minima beatae.</p><p>Voluptas illo nihil perferendis facilis ut est vel. Facere praesentium velit rerum. Dicta ex nihil odit consectetur blanditiis. Qui vel dolore natus ratione voluptatem eveniet.</p><p>Aut delectus quam aut autem soluta aut totam. Quae id recusandae dolor odit debitis. Non in fugiat iusto est vel. Nesciunt aut sapiente blanditiis velit sed.</p><p>Atque vel incidunt necessitatibus sunt odio. Fugit soluta ex ratione expedita et quae et nesciunt. Cupiditate a nemo cumque eum nemo.</p><p>Tempore sunt quos facere totam cumque eligendi aspernatur. Adipisci aliquam officiis sit velit enim. Voluptatem amet omnis repellat ipsam dolore voluptatum alias. Reiciendis quidem quam et earum odit in itaque.</p>', '2024-02-20 16:00:51', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(8, 2, 3, 2, 'Iste nostrum.', 'fugit-fugiat-placeat-in-qui-et-eum-quis-quam', 'Illo a hic voluptas magni nihil vitae est perferendis. Velit quia quo minus non corporis debitis tenetur. Autem voluptate alias aut minus quibusdam quia qui.', '<p>Et ut ut dolor iure enim et. Necessitatibus iure unde veniam nemo incidunt quo. Voluptatibus quidem dicta magni sint. Ut omnis et velit perferendis unde recusandae non.</p><p>Vitae repellat debitis necessitatibus quo officia. Quam vel necessitatibus non qui. Aut omnis ad qui non.</p><p>Sapiente quia sint perferendis laboriosam dolor magni id nihil. Voluptatem cum doloribus et libero cum consequuntur voluptatem molestiae. Officia beatae consequuntur quis expedita quis dolor voluptatem quia. Quasi corporis officia commodi id necessitatibus.</p><p>Enim officia et similique consequatur aut voluptatem in. Expedita maiores eveniet eos sequi. Et amet omnis ea quia.</p><p>Ea unde qui sint quasi ullam et. Non ducimus occaecati laboriosam. Aliquam aut at sed porro qui. Impedit aut facilis est. Eveniet quia ut quae qui ut dolorem laboriosam expedita.</p><p>Rerum dolorum id voluptatem sint assumenda qui id soluta. A dolor molestiae ut est. Libero id qui nisi laboriosam qui. A odio error omnis voluptate suscipit illo ad.</p>', '2024-02-20 16:00:52', '2024-02-20 09:00:52', '2024-02-20 09:00:52'),
(9, 1, 1, 2, 'Harum delectus.', 'laborum-eaque-ab-qui-sed-est-doloremque-voluptates', 'Ut sed labore iste sed et deleniti. Ut libero eos consequatur nemo temporibus similique.', '<p>Nisi possimus quia dolore et modi sit. Quidem molestias excepturi esse reprehenderit cum. Est doloremque esse ipsa dolores cum consequatur optio.</p><p>In placeat facere hic voluptatum quia recusandae quo. Ut placeat quo occaecati voluptates eius. Est inventore nisi voluptatem nobis suscipit earum et debitis. Accusantium in delectus ex odio.</p><p>Quo aliquid dolor fuga nisi alias consequatur corporis. Doloremque dolorem voluptatem fuga eum quo quis facere. Est quasi placeat nulla rerum molestiae.</p><p>Et est nam consequatur sapiente. Voluptatem neque natus esse. Nulla doloremque qui quod dolorem corrupti aperiam voluptate.</p><p>Incidunt nihil rerum corporis accusamus qui aut quo dolorum. Ut ipsam fugiat nisi ut vel omnis. Recusandae distinctio numquam quod dolorem dolorem exercitationem. Error omnis blanditiis reiciendis magnam eveniet sint vitae minima.</p><p>Dolore quis iusto distinctio eius. Quia animi tenetur similique blanditiis quod. Voluptatem possimus rem doloremque qui officia harum voluptates. Illum quia in consequatur odit libero quia.</p><p>Assumenda aliquid itaque omnis. Unde laborum assumenda totam libero occaecati neque architecto. Incidunt molestiae voluptate necessitatibus.</p>', '2024-02-20 16:00:52', '2024-02-20 09:00:52', '2024-02-20 09:00:52'),
(10, 2, 1, 1, 'Culpa quas rem.', 'beatae-ipsam-hic-magni-mollitia-inventore-eum-odit', 'Natus dolorum voluptas fugit optio. Et ullam odio placeat ut voluptatem sit maxime. Nesciunt deleniti laborum occaecati rerum enim quo beatae.', '<p>Blanditiis laudantium optio facilis excepturi delectus suscipit aut. Facere dolores natus exercitationem iure. Iste accusantium aspernatur et quidem consequatur voluptas id. Dolorem magnam rem doloribus assumenda cumque vero.</p><p>Veniam dolor consequatur illo ratione et voluptas in. Aut quos mollitia impedit. Aspernatur eveniet iste dolor voluptate optio. Error laudantium repellendus magni architecto quasi ipsam reprehenderit.</p><p>Dolorum et nihil dolores et blanditiis libero. Repellendus aut adipisci voluptatem et ut odio eos. Nostrum impedit harum sapiente quaerat praesentium laudantium deserunt quo. Autem laboriosam eaque a quam.</p><p>Cum veritatis voluptatem itaque et. Temporibus ratione et quae aut. Unde illum facere minus non. Rerum consequatur officia minima nostrum.</p><p>Enim ab et incidunt accusantium. Iste quia fugit neque quis quaerat velit.</p><p>Nulla omnis et qui. Dolor et harum sapiente est vero cum.</p><p>Labore et itaque voluptate dolores. Delectus omnis fugit nostrum pariatur. Nesciunt neque et autem eum omnis magnam quis. Et incidunt rem recusandae accusantium cupiditate rerum.</p><p>Rerum sit quam pariatur iure enim. Et ex aliquid perspiciatis est facilis. Quidem est repudiandae accusantium.</p>', '2024-02-20 16:00:52', '2024-02-20 09:00:52', '2024-02-20 09:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mulyono Widodo', 'ttamba', 'palastri.bagiya@example.net', '2024-02-20 09:00:49', '$2y$12$27tvpdqTiATLa0vWVV7veu9q.Gr/i3TWLHQ7/4YRbIaQHS3pQH506', 'niefGbnXLS', '2024-02-20 09:00:50', '2024-02-20 09:00:50'),
(2, 'Novi Dalima Mandasari', 'msamosir', 'natalia.yuliarti@example.org', '2024-02-20 09:00:50', '$2y$12$27tvpdqTiATLa0vWVV7veu9q.Gr/i3TWLHQ7/4YRbIaQHS3pQH506', 'mt37s70qUz', '2024-02-20 09:00:50', '2024-02-20 09:00:50'),
(3, 'Jabal Anggriawan', 'balidin42', 'mhartati@example.org', '2024-02-20 09:00:50', '$2y$12$27tvpdqTiATLa0vWVV7veu9q.Gr/i3TWLHQ7/4YRbIaQHS3pQH506', 'ZK8kOJfAIy', '2024-02-20 09:00:51', '2024-02-20 09:00:51'),
(17, 'ariqaqilla', 'ariqaqilla', 'ariqaqilla@gmail.com', NULL, '$2y$12$fviPXn3nMRQHNzwzHPj4nu7rAGIUpljv/7DNbOkkbH9U/sAAP/mG2', NULL, '2024-02-25 00:57:53', '2024-02-25 00:57:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `homes`
--
ALTER TABLE `homes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homes_uname_unique` (`uname`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homes`
--
ALTER TABLE `homes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Database: `laravel_learning`
--
CREATE DATABASE IF NOT EXISTS `laravel_learning` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel_learning`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"crud_api\",\"table\":\"inventories\"},{\"db\":\"crud_api\",\"table\":\"users\"},{\"db\":\"hondacorp\",\"table\":\"users\"},{\"db\":\"hondacorp\",\"table\":\"posts\"},{\"db\":\"hondacorp\",\"table\":\"categories\"},{\"db\":\"hondacorp\",\"table\":\"homes\"},{\"db\":\"hondacorp\",\"table\":\"home\"},{\"db\":\"hondacorp\",\"table\":\"failed_jobs\"},{\"db\":\"hondacorp\",\"table\":\"password_reset_tokens\"},{\"db\":\"hondacorp\",\"table\":\"migrations\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'absensii', 'attendances', '{\"sorted_col\":\"`attendances`.`tgl` DESC\"}', '2024-01-05 12:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-02-28 20:17:14', '{\"Console\\/Mode\":\"collapse\",\"ThemeDefault\":\"blueberry\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
