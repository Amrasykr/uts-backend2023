-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2023 at 07:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_uts_backend2023`
--

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
(5, '2023_11_17_013133_create_patients_statuses_table', 1),
(6, '2023_11_17_013434_create_patients_rooms_table', 1),
(7, '2023_11_17_015234_create_patients_table', 1);

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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `in_date_at` date DEFAULT NULL,
  `out_date_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `phone`, `address`, `status_id`, `room_id`, `in_date_at`, `out_date_at`, `created_at`, `updated_at`) VALUES
(1, 'Ammar Asysyakur', '081289777970', 'Pondok Cabe Ilir', 2, 6, '2023-11-17', NULL, '2023-11-16 20:27:25', '2023-11-16 20:27:25'),
(2, 'Muhammad Fauzi', '081200001', 'Margonda', 1, 11, '2023-11-17', NULL, '2023-11-16 20:34:36', '2023-11-16 22:36:43'),
(3, 'Abdul Fatahillah', '0812000002', 'puncak', 3, 1, '2023-01-01', NULL, '2023-11-16 22:47:51', '2023-11-16 22:47:51'),
(4, 'Aa Da Hudan', '0812000003', 'bekasi', 3, 2, '2023-01-02', NULL, '2023-11-16 22:48:37', '2023-11-16 22:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `patients_rooms`
--

CREATE TABLE `patients_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_room` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients_rooms`
--

INSERT INTO `patients_rooms` (`id`, `no_room`, `floor`, `class`, `created_at`, `updated_at`) VALUES
(1, '101', '1', '1', '2023-11-16 20:14:59', '2023-11-16 20:14:59'),
(2, '102', '1', '1', '2023-11-16 20:21:29', '2023-11-16 20:21:29'),
(3, '103', '1', '1', '2023-11-16 20:21:34', '2023-11-16 20:21:34'),
(4, '104', '1', '1', '2023-11-16 20:21:37', '2023-11-16 20:21:37'),
(5, '105', '1', '1', '2023-11-16 20:21:41', '2023-11-16 20:21:41'),
(6, '201', '2', '2', '2023-11-16 20:21:50', '2023-11-16 20:21:50'),
(7, '202', '2', '2', '2023-11-16 20:21:53', '2023-11-16 20:21:53'),
(8, '203', '2', '2', '2023-11-16 20:21:56', '2023-11-16 20:21:56'),
(9, '204', '2', '2', '2023-11-16 20:21:58', '2023-11-16 20:21:58'),
(10, '205', '2', '2', '2023-11-16 20:22:01', '2023-11-16 20:22:01'),
(11, '301', '3', '3', '2023-11-16 20:22:09', '2023-11-16 20:22:09'),
(12, '302', '3', '3', '2023-11-16 20:22:11', '2023-11-16 20:22:11'),
(13, '303', '3', '3', '2023-11-16 20:22:14', '2023-11-16 20:22:14'),
(14, '304', '3', '3', '2023-11-16 20:22:17', '2023-11-16 20:22:17'),
(15, '305', '3', '3', '2023-11-16 20:22:19', '2023-11-16 20:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `patients_statuses`
--

CREATE TABLE `patients_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients_statuses`
--

INSERT INTO `patients_statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'positive', '2023-11-16 20:16:30', '2023-11-16 20:16:30'),
(2, 'recovered', '2023-11-16 20:16:43', '2023-11-16 20:16:43'),
(3, 'dead', '2023-11-16 20:16:50', '2023-11-16 20:16:50');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'a937b132dc10e08e9a99a438158f73dfc77b3c08689f1398f204df2c09d1ca52', '[\"*\"]', NULL, NULL, '2023-11-16 23:38:28', '2023-11-16 23:38:28'),
(2, 'App\\Models\\User', 1, 'my_token', '77998d3a0744cdbe1c3b03da23605851d0ccbb0abf7af56060e72c647921b8b8', '[\"*\"]', NULL, NULL, '2023-11-16 23:41:37', '2023-11-16 23:41:37'),
(3, 'App\\Models\\User', 1, 'my_token', '933c2683670b18b2f58182b70569962aa3070d9744a3e5197942d426b0d742c5', '[\"*\"]', '2023-11-16 23:43:27', NULL, '2023-11-16 23:42:23', '2023-11-16 23:43:27');

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
(1, 'ammar asysyakur', 'ammarasysyakur723@gmail.com', NULL, '$2y$12$poAJgH.sC2zFP.SmTFb7l.iOGiMgtrFFElhhDDY4FVdGzchHKhvYO', NULL, '2023-11-16 23:38:28', '2023-11-16 23:38:28');

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
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_status_id_foreign` (`status_id`),
  ADD KEY `patients_room_id_foreign` (`room_id`);

--
-- Indexes for table `patients_rooms`
--
ALTER TABLE `patients_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients_statuses`
--
ALTER TABLE `patients_statuses`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patients_rooms`
--
ALTER TABLE `patients_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patients_statuses`
--
ALTER TABLE `patients_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `patients_rooms` (`id`),
  ADD CONSTRAINT `patients_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `patients_statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
