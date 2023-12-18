-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2023 at 09:08 AM
-- Server version: 5.7.36
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zidschedule`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type_set` int(11) DEFAULT '0',
  `action` enum('0','1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '                0 =>  نشر المنتجات,\r\n                1 =>  الغاء نشر المنتجات,\r\n                2 =>  تخفيضات على المنتجات,\r\n                3 =>  تغير فى السعر المنتجات,\r\n                4 =>  اضافة الترميزات الخاصة للمنتجات,\r\n                5 =>  حذف الترميزات الخاصة للمنتجات\r\n            ',
  `status` int(11) NOT NULL DEFAULT '0',
  `progress` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_logs`
--

DROP TABLE IF EXISTS `campaign_logs`;
CREATE TABLE IF NOT EXISTS `campaign_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_logs_campaign_id_foreign` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_11_17_140650_create_campaigns_table', 1),
(14, '2022_12_17_134302_create_schedules_table', 1),
(15, '2022_12_17_143515_create_products_table', 1),
(16, '2022_12_21_223052_create_zid_authorizes_table', 1),
(18, '2023_02_09_094338_create_attachments_table', 2),
(19, '2023_05_30_151446_create_campaign_logs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('andrewazmigendi@gmail.com', '$2y$10$lPpGs9YlTfmMpFltzDunOebJRFM.s9Kc9bi0ci6JHR2tAau5RSNU2', '2023-04-25 18:37:57'),
('mohamedellithyfreelancer@gmail.com', '$2y$10$IRDerZxxXofYS17tJDlI6emgggbk6jfQrtlt/dpDJczPYiTq5gJBW', '2023-04-25 18:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(61, 'App\\Models\\User', 8, 'authToken', '950910f9c580f03adb98ade9d64458100eee2b9f0b0f769a0818e1e8f97fc848', '[\"*\"]', '2023-02-13 16:31:26', '2023-02-13 16:30:46', '2023-02-13 16:31:26'),
(60, 'App\\Models\\User', 8, 'authToken', 'ffb3f5b9f2a0b885e2ca8c941ead0b5ccced3d0cce95bc2a3e567ec68ac1d977', '[\"*\"]', '2023-02-13 16:30:06', '2023-02-13 15:51:01', '2023-02-13 16:30:06'),
(59, 'App\\Models\\User', 6, 'authToken', 'e0817708a77e80846989930c6b34c2b1c7760fb1e6a932694c80d8b15c596366', '[\"*\"]', '2023-02-13 07:41:16', '2023-02-13 01:19:55', '2023-02-13 07:41:16'),
(58, 'App\\Models\\User', 6, 'authToken', '216138ea6e4920969c6112dff109282abb140cd635ed084c580e4b2209f6e333', '[\"*\"]', NULL, '2023-02-12 23:12:03', '2023-02-12 23:12:03'),
(57, 'App\\Models\\User', 6, 'authToken', '7c0471f97f7fb79ab7755a84f2decec0c2b972ff15489a4b9671d601572ef065', '[\"*\"]', '2023-02-12 23:11:58', '2023-02-12 23:11:13', '2023-02-12 23:11:58'),
(56, 'App\\Models\\User', 9, 'authToken', '6bf600bbc20f4ef67816ec6360a4de27d13761a6cf729936a76044456e4dab7e', '[\"*\"]', '2023-02-12 23:11:07', '2023-02-12 23:08:12', '2023-02-12 23:11:07'),
(55, 'App\\Models\\User', 5, 'authToken', '8b3b62839de369993d0a6f1a9aa234fe47ae04400930f615f57c6017bf342fff', '[\"*\"]', NULL, '2023-02-12 20:09:31', '2023-02-12 20:09:31'),
(54, 'App\\Models\\User', 5, 'authToken', '6eeabe86afeb7e66e1070db58123ac2e463588e6b0aaa15d4bc239d983ce1c08', '[\"*\"]', '2023-02-12 20:09:21', '2023-02-12 20:09:01', '2023-02-12 20:09:21'),
(53, 'App\\Models\\User', 6, 'authToken', '73f0e97dea1dc10676bcda62dd47452e336ca504f6e5ccea7435ef6b40d8afc4', '[\"*\"]', '2023-02-12 20:08:56', '2023-02-12 20:06:12', '2023-02-12 20:08:56'),
(52, 'App\\Models\\User', 5, 'authToken', '97c30855e136a83a64aa1aa8e470dcaf605ea46a13a85102276553556f72b708', '[\"*\"]', '2023-02-12 20:06:06', '2023-02-12 20:04:45', '2023-02-12 20:06:06'),
(51, 'App\\Models\\User', 5, 'authToken', '45fa1a1acd6c6e0efb3e2412663946422de3e3e99301ae6d04dcae155bd869c9', '[\"*\"]', NULL, '2023-02-12 20:03:50', '2023-02-12 20:03:50'),
(50, 'App\\Models\\User', 5, 'authToken', '09e574f643c91cd6f6f7e708ae64f4fc8d60218238b83e6393378fc5bb815a15', '[\"*\"]', '2023-02-12 19:49:08', '2023-02-12 19:49:00', '2023-02-12 19:49:08'),
(49, 'App\\Models\\User', 5, 'authToken', '00804cdefc5a3b5f594a67ed73a0dfa36a142deaa5fe98fe1202a821de59f4d4', '[\"*\"]', NULL, '2023-02-12 19:39:34', '2023-02-12 19:39:34'),
(48, 'App\\Models\\User', 6, 'authToken', 'a98bd47f498329301022750d5db44abfee50e8fbf211c3fd9e9ea953a7b405e2', '[\"*\"]', '2023-02-12 19:39:29', '2023-02-12 19:37:38', '2023-02-12 19:39:29'),
(47, 'App\\Models\\User', 6, 'authToken', '6450a38c3f692821b9fdca5fba305f8e0f209ea143ee05b05487b73b60958baa', '[\"*\"]', NULL, '2023-02-12 18:19:22', '2023-02-12 18:19:22'),
(46, 'App\\Models\\User', 6, 'authToken', 'b1794b6d8d247c24411bf4de846c6b4eba3a025071916f5996dd78eb785bbc3a', '[\"*\"]', '2023-02-12 18:19:19', '2023-02-12 17:59:33', '2023-02-12 18:19:19'),
(45, 'App\\Models\\User', 8, 'authToken', 'dbe3262069c0afa4f4a4918ae2c6f218b1de4a169cddf574ac48aa390032cc2b', '[\"*\"]', '2023-02-13 15:50:48', '2023-02-12 17:49:16', '2023-02-13 15:50:48'),
(44, 'App\\Models\\User', 8, 'authToken', 'bc9371773778a3578a18ee14e268978ef960697c0f9534f456307fa72c057222', '[\"*\"]', NULL, '2023-02-12 17:45:41', '2023-02-12 17:45:41'),
(43, 'App\\Models\\User', 8, 'authToken', '5784991cd53ac9e2777d40a362c996f38510dae42148c43319e8ffa0823e3a0a', '[\"*\"]', NULL, '2023-02-12 17:45:27', '2023-02-12 17:45:27'),
(42, 'App\\Models\\User', 7, 'authToken', 'eedabc9f4a6b501a1ac9946263d4a8d9d5bd30a50bb325392dfdf588e6d58cd2', '[\"*\"]', NULL, '2023-02-12 17:41:56', '2023-02-12 17:41:56'),
(41, 'App\\Models\\User', 7, 'authToken', '8116537455d234d55e58d2e98f1081c7437ba393ef855702273b41012e7b465e', '[\"*\"]', NULL, '2023-02-12 17:41:56', '2023-02-12 17:41:56'),
(40, 'App\\Models\\User', 7, 'authToken', 'be22f83565ded6b67231bc78cc4dd06627bae4abff4ce2045dd3bf33c6c1fa92', '[\"*\"]', NULL, '2023-02-12 17:39:51', '2023-02-12 17:39:51'),
(39, 'App\\Models\\User', 6, 'authToken', '319a1ee280982850ba40d28b5f0124bfd46897ece858deb043e12d956d8924cb', '[\"*\"]', NULL, '2023-02-12 17:37:54', '2023-02-12 17:37:54'),
(38, 'App\\Models\\User', 5, 'authToken', 'a0f4e83b4d830fbaae3aefec108995c70d2769a62335a3efe8fe1344cde1eb09', '[\"*\"]', '2023-02-12 17:36:07', '2023-02-12 17:35:03', '2023-02-12 17:36:07'),
(37, 'App\\Models\\User', 5, 'authToken', '6ab3a4c1ff6fe2051cfaa7915b0da2ccca6680fcee73eeaf298577fa6a4c5390', '[\"*\"]', NULL, '2023-02-12 06:23:44', '2023-02-12 06:23:44'),
(36, 'App\\Models\\User', 5, 'authToken', '48b457c3f73e32b48d85b73468a4ed2e811c0894ccb5160fa508ad710f15be7f', '[\"*\"]', NULL, '2023-02-12 06:19:28', '2023-02-12 06:19:28'),
(35, 'App\\Models\\User', 5, 'authToken', '4a82739c82782ed748b4e59292be38739be28e3fc37ab81e1cab5914d66e2363', '[\"*\"]', '2023-02-12 06:18:48', '2023-02-12 06:18:25', '2023-02-12 06:18:48'),
(34, 'App\\Models\\User', 5, 'authToken', '5f73be8f7388a3b17138c4875a682fe85a2f29d25090a47db7d646e44b82700d', '[\"*\"]', NULL, '2023-02-12 06:16:15', '2023-02-12 06:16:15'),
(33, 'App\\Models\\User', 5, 'authToken', '694fdc1b7712f5f0a859534b3c237644d189737658a86283efaea78e414ded31', '[\"*\"]', '2023-02-12 06:17:55', '2023-02-12 06:13:25', '2023-02-12 06:17:55'),
(32, 'App\\Models\\User', 5, 'authToken', 'e13605b889c45dad0efb1ad42db589cc5fbac6376ddcfd6a2933d2440e0068ca', '[\"*\"]', '2023-02-12 06:13:17', '2023-02-12 03:47:30', '2023-02-12 06:13:17'),
(62, 'App\\Models\\User', 8, 'authToken', '82430e406ef26dae3fa06e8bc5ece557a922a25e59bf6f65b4f6d4d8eed1cf5c', '[\"*\"]', NULL, '2023-02-13 16:33:12', '2023-02-13 16:33:12'),
(63, 'App\\Models\\User', 8, 'authToken', '98c930e5579f633a40e59d47cb8fd9ea441d95ec11861b5af2fabac45a0ec6fb', '[\"*\"]', NULL, '2023-02-13 17:29:42', '2023-02-13 17:29:42'),
(64, 'App\\Models\\User', 8, 'authToken', 'cc3c3542318841f060fdcce15b964495a80a869d0f2acf13102b85dc1c5ab721', '[\"*\"]', NULL, '2023-02-14 05:34:03', '2023-02-14 05:34:03'),
(65, 'App\\Models\\User', 8, 'authToken', '3e46b25b60accf546b12c172e38bcec7c96361829ad94f1a5d49a1f2ce9e05b9', '[\"*\"]', '2023-02-14 05:58:06', '2023-02-14 05:35:54', '2023-02-14 05:58:06'),
(66, 'App\\Models\\User', 8, 'authToken', 'f9edb2e85df86ff89facedb0ce1f899bdb01a9769859b4ed6ca2f79325893791', '[\"*\"]', '2023-02-16 17:37:44', '2023-02-16 17:25:53', '2023-02-16 17:37:44'),
(67, 'App\\Models\\User', 5, 'authToken', 'acf5a7abada1560d0cf93e9cb53d3f48e20251abd6a838d33c97d56d77733d72', '[\"*\"]', NULL, '2023-02-16 17:37:53', '2023-02-16 17:37:53'),
(68, 'App\\Models\\User', 5, 'authToken', 'a264b0468c8a300c1d20df3175cb0adc02f586b79fb9d7e512faf90ea2d92cae', '[\"*\"]', NULL, '2023-02-16 17:40:34', '2023-02-16 17:40:34'),
(69, 'App\\Models\\User', 6, 'authToken', 'ffa3d555b9863bc82b0642e97d3c7455227d67e413b20c1aae549d8329dc63a7', '[\"*\"]', NULL, '2023-02-16 17:41:11', '2023-02-16 17:41:11'),
(70, 'App\\Models\\User', 6, 'authToken', '2041070271938c4a1f95e22658a0d3a12d1c06eeef85c189111c65fb926c673a', '[\"*\"]', NULL, '2023-02-16 17:42:11', '2023-02-16 17:42:11'),
(71, 'App\\Models\\User', 6, 'authToken', '49faefdc42e974131d18abe0199fdf5085a4573a0971346fa60ea00adf4ef37c', '[\"*\"]', NULL, '2023-02-16 17:46:36', '2023-02-16 17:46:36'),
(72, 'App\\Models\\User', 8, 'authToken', 'd185d0c5b95a2745588d9d1a4a3e5b6aca7457c5b4e26e35d74c15955afe5f12', '[\"*\"]', NULL, '2023-02-16 17:46:58', '2023-02-16 17:46:58'),
(73, 'App\\Models\\User', 8, 'authToken', '4fd52eb0cd90d312bad49b0ff85722d1ee53605debd83bc0541af0902a5bbf0b', '[\"*\"]', NULL, '2023-02-16 17:47:19', '2023-02-16 17:47:19'),
(74, 'App\\Models\\User', 8, 'authToken', '7f8c0ebbf55cade2496d4a8daf17e0fcd0ddb66b0da0067956567c2361da34de', '[\"*\"]', '2023-02-16 17:50:45', '2023-02-16 17:50:32', '2023-02-16 17:50:45'),
(76, 'App\\Models\\User', 6, 'authToken', '1d9d7c227c97171b37d189fd2d561a017cd03a3908460f528a1093feac449c10', '[\"*\"]', NULL, '2023-02-17 01:56:07', '2023-02-17 01:56:07'),
(77, 'App\\Models\\User', 8, 'authToken', 'e4cc73b295ed214b0a6a407bac69adac162b0b298103e5783afa1a322c8e9a79', '[\"*\"]', '2023-02-26 21:21:41', '2023-02-26 21:21:28', '2023-02-26 21:21:41'),
(79, 'App\\Models\\User', 8, 'authToken', '2f733f5fd914e25a5938cde0cff8f8a49e7a5d8847e66e24c7e125fc659a1a1b', '[\"*\"]', '2023-03-12 08:50:08', '2023-03-12 08:44:07', '2023-03-12 08:50:08'),
(80, 'App\\Models\\User', 8, 'authToken', '8da67d68a2a244c54d1f0a934ecb455a904e06fc9942500a5ffab026aae2e6bb', '[\"*\"]', NULL, '2023-03-13 22:04:32', '2023-03-13 22:04:32'),
(81, 'App\\Models\\User', 7, 'authToken', '68daccfb3db7c23fa975cf40882efbc70d009aa11fe75d32f44f058eb6b1f230', '[\"*\"]', '2023-03-15 00:29:31', '2023-03-15 00:28:49', '2023-03-15 00:29:31'),
(82, 'App\\Models\\User', 7, 'authToken', 'eded8d27b864fee6abe9f8859dadb95468fbb5ac9daf6a643f6297ffc799e063', '[\"*\"]', NULL, '2023-03-15 00:29:51', '2023-03-15 00:29:51'),
(83, 'App\\Models\\User', 7, 'authToken', 'd4890ea40ecb8c461c4a1bee157cb9f371706a25c87b201a8cdabf42f304261e', '[\"*\"]', NULL, '2023-03-15 00:29:53', '2023-03-15 00:29:53'),
(84, 'App\\Models\\User', 7, 'authToken', 'a743318934b4082d1d9596ecbad3d5a76067ba2ae974b4465036d75dede950a7', '[\"*\"]', NULL, '2023-03-15 00:29:56', '2023-03-15 00:29:56'),
(85, 'App\\Models\\User', 7, 'authToken', '9c2ad2db65ddff0d53ec9fe3f678a7a96d79632696f6617bdb9ab8aeebb0f730', '[\"*\"]', '2023-03-16 23:33:49', '2023-03-15 00:30:01', '2023-03-16 23:33:49'),
(86, 'App\\Models\\User', 8, 'authToken', '481fee853d1f03f3896d6d5e9aba3e81261359ee058734777a94b72090b2d6af', '[\"*\"]', NULL, '2023-03-16 04:02:59', '2023-03-16 04:02:59'),
(87, 'App\\Models\\User', 8, 'authToken', '4b0367b93574a4efc7b540aeac5146ab67671f951808ac966c37ad2618e9e0f0', '[\"*\"]', '2023-03-18 14:18:20', '2023-03-18 14:17:51', '2023-03-18 14:18:20'),
(88, 'App\\Models\\User', 10, 'authToken', '09d201d78d0579d0b5bd6c364101a648f1c4d993c6c47465fb866ffafb9b25c1', '[\"*\"]', NULL, '2023-03-26 13:28:39', '2023-03-26 13:28:39'),
(89, 'App\\Models\\User', 10, 'authToken', '02b0b2518a82c9c7c21d9e1e6160b65c06f8c78a6090231bfe1c34d8a751391e', '[\"*\"]', '2023-03-27 11:21:36', '2023-03-26 14:37:40', '2023-03-27 11:21:36'),
(90, 'App\\Models\\User', 8, 'authToken', '8adc53bcee39e20bc32557e501667ba7c870960e4633234363a08888d728664d', '[\"*\"]', NULL, '2023-03-27 09:44:40', '2023-03-27 09:44:40'),
(91, 'App\\Models\\User', 8, 'authToken', 'da0e678d872e5c557cc2b8161f0af08da5b3cdda269a6ba5a5492f707f8ace20', '[\"*\"]', NULL, '2023-03-27 09:45:39', '2023-03-27 09:45:39'),
(92, 'App\\Models\\User', 8, 'authToken', 'c672e6fe1db7eca1d2e82612c31307d8c25702106ab5fb649f0af9d484c7e8e6', '[\"*\"]', '2023-03-27 09:53:38', '2023-03-27 09:48:39', '2023-03-27 09:53:38'),
(93, 'App\\Models\\User', 8, 'authToken', '8bc93b472b732d3dd24454b4cdeb9099ecfecd871361cebf40f98df8c7695acd', '[\"*\"]', '2023-03-27 09:53:45', '2023-03-27 09:53:40', '2023-03-27 09:53:45'),
(94, 'App\\Models\\User', 8, 'authToken', 'b537e219f7003337e752e3740866bda3856ea34761b6550e343c0c95985781b5', '[\"*\"]', NULL, '2023-03-27 11:21:44', '2023-03-27 11:21:44'),
(95, 'App\\Models\\User', 8, 'authToken', 'ead1d60b257d6a9db4568b9ae6dd98ea81eaea19e6a783f5505059732900c5dc', '[\"*\"]', NULL, '2023-03-27 11:22:35', '2023-03-27 11:22:35'),
(96, 'App\\Models\\User', 8, 'authToken', 'bbc8f6f4acd45d1448cdcaf1fc548a8e12e7ba2079005eae468b8bb46918aab8', '[\"*\"]', '2023-03-28 15:13:13', '2023-03-27 11:23:51', '2023-03-28 15:13:13'),
(97, 'App\\Models\\User', 8, 'authToken', 'af68510779c2efa39625b0b401321bcd17912eb5e359c7583b327a99fd2453d3', '[\"*\"]', '2023-03-27 11:33:36', '2023-03-27 11:28:53', '2023-03-27 11:33:36'),
(98, 'App\\Models\\User', 8, 'authToken', '883ad524152cdadae59d80f28f98777c36790d94a42579ffc68bc5b74908e186', '[\"*\"]', '2023-03-27 21:44:49', '2023-03-27 11:33:38', '2023-03-27 21:44:49'),
(99, 'App\\Models\\User', 11, 'authToken', '0954f7948b3eeec7ed5b7c26e88ebcea761673a179e0735fb0f0e40a3f44932c', '[\"*\"]', '2023-03-28 00:22:02', '2023-03-28 00:20:47', '2023-03-28 00:22:02'),
(100, 'App\\Models\\User', 11, 'authToken', 'eb8902c02594113e0a9899288d7b4c7ee19e3fb4684decbe52301785953bec84', '[\"*\"]', '2023-03-30 13:22:26', '2023-03-28 00:22:09', '2023-03-30 13:22:26'),
(101, 'App\\Models\\User', 8, 'authToken', '7a5c91872c04a9c1c4bf39b84bf19b4fc04f4a6193e97b203a5d956fdf85d04b', '[\"*\"]', '2023-03-28 13:46:13', '2023-03-28 09:52:00', '2023-03-28 13:46:13'),
(102, 'App\\Models\\User', 8, 'authToken', '5f34621d2d1d4a10003357e2997ecbfc190d7231d20e4bf3619beda6603b24f3', '[\"*\"]', '2023-03-29 01:36:51', '2023-03-28 13:46:15', '2023-03-29 01:36:51'),
(103, 'App\\Models\\User', 8, 'authToken', '932818a9561465376287d6581781e38ca8f3651e2a1fcd59b5931f904e86741f', '[\"*\"]', '2023-04-05 13:44:53', '2023-03-28 15:13:18', '2023-04-05 13:44:53'),
(104, 'App\\Models\\User', 8, 'authToken', '9becc3656113b6d0b569e69e468ba8abb427c73853d1aa9eb697f0c38bdf3e79', '[\"*\"]', '2023-03-29 01:49:24', '2023-03-29 01:36:55', '2023-03-29 01:49:24'),
(105, 'App\\Models\\User', 8, 'authToken', 'b21d16dd9c932202b614be7214c8c1d0b67f5138a364ff74da424913581090a5', '[\"*\"]', NULL, '2023-03-29 01:51:22', '2023-03-29 01:51:22'),
(106, 'App\\Models\\User', 8, 'authToken', '3aeccfb305e31e7bb2b7229d3a7aa752e95abc8c6781c7c97d34ff315d64d0dc', '[\"*\"]', '2023-03-29 22:55:47', '2023-03-29 10:24:55', '2023-03-29 22:55:47'),
(107, 'App\\Models\\User', 8, 'authToken', '8c73e9a9857c4d0bedbf73d28d49faaf88d222d06451f9f43943b5f74409f6e2', '[\"*\"]', '2023-03-29 10:45:18', '2023-03-29 10:27:01', '2023-03-29 10:45:18'),
(108, 'App\\Models\\User', 8, 'authToken', 'faf746c01c5e06d345da2c7860387e15bb6a64f2a544b8c3a18bbb4d6c1213b2', '[\"*\"]', NULL, '2023-03-29 10:39:20', '2023-03-29 10:39:20'),
(109, 'App\\Models\\User', 8, 'authToken', '413079e1f89dfd560bb9001b28a95adc844801cbb0e39781fa468ca455635be5', '[\"*\"]', '2023-03-29 19:05:04', '2023-03-29 10:45:22', '2023-03-29 19:05:04'),
(110, 'App\\Models\\User', 8, 'authToken', '88a86c3816b3f7c66186d334afaf103913777f22c388ab46e3868ce55bc29403', '[\"*\"]', NULL, '2023-03-29 10:57:51', '2023-03-29 10:57:51'),
(111, 'App\\Models\\User', 8, 'authToken', '4c9783c01df8726ebf0a1e859809465dd6dabea94737ff2cef08d23a3316618d', '[\"*\"]', '2023-04-13 16:50:27', '2023-03-29 10:58:34', '2023-04-13 16:50:27'),
(112, 'App\\Models\\User', 8, 'authToken', '0e5d2e4bb697db54a40c54a46f16282f888f7e6eb10b3307825606b19c2d2ae0', '[\"*\"]', '2023-03-29 19:06:12', '2023-03-29 11:08:24', '2023-03-29 19:06:12'),
(113, 'App\\Models\\User', 8, 'authToken', '2919b08cf5854d71180b79508a5276d73cc53f28399a601e99bd97aea88325a2', '[\"*\"]', '2023-03-29 19:27:08', '2023-03-29 15:29:22', '2023-03-29 19:27:08'),
(114, 'App\\Models\\User', 8, 'authToken', '60fa32b354ce35ee242e0c13c5ad0dca55b96b95ed79c4b956fd5dd84e5297e7', '[\"*\"]', NULL, '2023-03-29 19:09:27', '2023-03-29 19:09:27'),
(115, 'App\\Models\\User', 8, 'authToken', 'f1ec472d0ea43c3b7eacd786e2606fc1085b30bf5e6ee270f98866e98ade4681', '[\"*\"]', NULL, '2023-03-29 19:29:09', '2023-03-29 19:29:09'),
(116, 'App\\Models\\User', 8, 'authToken', '1550317502a7b7b4ff34a1856984210aab861ddf9fed2fdf02984b2421ab31e2', '[\"*\"]', '2023-03-29 22:56:27', '2023-03-29 19:32:51', '2023-03-29 22:56:27'),
(117, 'App\\Models\\User', 8, 'authToken', '9d88936f112bf648551a329745be5f0729108cd90bfc8b056926f576399825cd', '[\"*\"]', '2023-03-30 10:18:10', '2023-03-29 22:55:50', '2023-03-30 10:18:10'),
(118, 'App\\Models\\User', 8, 'authToken', '78a94aa6f9b420a3f9106fbc2873afa6dbf28877e9e38b6102f732f0d77eb51d', '[\"*\"]', NULL, '2023-03-29 22:57:18', '2023-03-29 22:57:18'),
(119, 'App\\Models\\User', 11, 'authToken', '482af30fe4376d25c07f41a3d14fb82dce3f188ddfab64ad91f85fd836cffb76', '[\"*\"]', '2023-03-31 21:40:04', '2023-03-30 13:22:35', '2023-03-31 21:40:04'),
(120, 'App\\Models\\User', 11, 'authToken', 'f0e0ee4166ade45402e12567b3cc015c2f76905a0dd82f606043bbf6fb3aadc4', '[\"*\"]', '2023-04-02 23:51:39', '2023-03-31 21:41:19', '2023-04-02 23:51:39'),
(121, 'App\\Models\\User', 11, 'authToken', 'f68bb8f24b137656ff98f327d6040dfadef4e275718a5538e5e8258ddf0de598', '[\"*\"]', NULL, '2023-04-02 23:51:53', '2023-04-02 23:51:53'),
(122, 'App\\Models\\User', 8, 'authToken', 'e37381ba1d728754aa4b1d1e4bd0b2164f02d8d68d9b069fc31cc34e1c876443', '[\"*\"]', NULL, '2023-04-04 22:09:41', '2023-04-04 22:09:41'),
(123, 'App\\Models\\User', 8, 'authToken', '474016607855f37bc61b01284daeb93ce1b4c533fc373008f257cd05f03a92de', '[\"*\"]', '2023-04-04 22:53:00', '2023-04-04 22:09:46', '2023-04-04 22:53:00'),
(124, 'App\\Models\\User', 8, 'authToken', '475666e18c83c4d297ed9fdd093e91cc6ea72183532929200cd6877fd48a4c5f', '[\"*\"]', '2023-04-16 20:29:55', '2023-04-04 22:53:16', '2023-04-16 20:29:55'),
(125, 'App\\Models\\User', 8, 'authToken', '3f4ec3319311130bf109930bcd220ac083f420684fd1fe52c3c175ed3e28c955', '[\"*\"]', '2023-04-05 17:36:43', '2023-04-04 22:54:32', '2023-04-05 17:36:43'),
(126, 'App\\Models\\User', 8, 'authToken', 'cf5629d0eed9903903b5b9ab5c7656f3e285b07eeaa2cef3770529b4cfeea351', '[\"*\"]', '2023-04-05 21:21:09', '2023-04-05 13:44:59', '2023-04-05 21:21:09'),
(129, 'App\\Models\\User', 8, 'authToken', '2b92fc9767aa08f93a08a2c6b2261ca6a49e9bc7e8a330858b27ec9ccdc45f57', '[\"*\"]', '2023-04-13 15:26:07', '2023-04-09 18:12:35', '2023-04-13 15:26:07'),
(128, 'App\\Models\\User', 8, 'authToken', '98833c2cfbd983137f35be199dc84f6ee2937be61bbae1fd0104f04751cf8fde', '[\"*\"]', '2023-04-13 14:16:54', '2023-04-05 21:21:10', '2023-04-13 14:16:54'),
(130, 'App\\Models\\User', 8, 'authToken', '18549da81eec12abc3d70b5b7e576859f4d855e5e295b12e67a7054b68966330', '[\"*\"]', NULL, '2023-04-13 14:16:56', '2023-04-13 14:16:56'),
(131, 'App\\Models\\User', 8, 'authToken', '46f85363fbe2cfa6acc218b66df27555e6033e121b717392f26695e4e66c1db4', '[\"*\"]', NULL, '2023-04-13 14:21:10', '2023-04-13 14:21:10'),
(132, 'App\\Models\\User', 8, 'authToken', 'ab830d86c5701f977d96931d598f7d0e4561926eb6beb8a2c7c57ad83d699ccb', '[\"*\"]', NULL, '2023-04-13 14:29:24', '2023-04-13 14:29:24'),
(133, 'App\\Models\\User', 8, 'authToken', '61d863f30935af38b696223257e12eebd23f26554128015bb18c02ee7a2bb515', '[\"*\"]', NULL, '2023-04-13 15:22:10', '2023-04-13 15:22:10'),
(134, 'App\\Models\\User', 8, 'authToken', '60572b2ff013df858a07d8150e33c6ab2d2a2ce93b039beca857a0623d93c386', '[\"*\"]', '2023-04-16 20:05:14', '2023-04-13 15:26:10', '2023-04-16 20:05:14'),
(135, 'App\\Models\\User', 8, 'authToken', '972f931a2d5c30159d1c7ffc214b0753ae3c351556c230aab85f656cc4233295', '[\"*\"]', NULL, '2023-04-13 15:28:15', '2023-04-13 15:28:15'),
(136, 'App\\Models\\User', 8, 'authToken', '682b2adcbebd2e80b5e4eb69115e64e10a6d05963cf2006fb058605642893d9a', '[\"*\"]', NULL, '2023-04-13 15:41:27', '2023-04-13 15:41:27'),
(137, 'App\\Models\\User', 8, 'authToken', '8a0e882a77c00c82894fb19ea46a1be9184bd080fbced8e3df2b2da2f8b5bc14', '[\"*\"]', NULL, '2023-04-13 15:41:28', '2023-04-13 15:41:28'),
(138, 'App\\Models\\User', 8, 'authToken', 'cefa42e7066fd5e132a841ca8ca9212b4a590d0ada81638be1dddf08c80fc322', '[\"*\"]', NULL, '2023-04-13 15:41:28', '2023-04-13 15:41:28'),
(139, 'App\\Models\\User', 8, 'authToken', 'aa0581e32a961983575cb0b839304e272a2c2f51e128ccdbfdadf165ede3cfb4', '[\"*\"]', NULL, '2023-04-13 15:42:15', '2023-04-13 15:42:15'),
(140, 'App\\Models\\User', 8, 'authToken', '19edc5d01fab00655d077c6bfec98db629ab3ac4037bc9272239a431721122b2', '[\"*\"]', NULL, '2023-04-13 16:36:02', '2023-04-13 16:36:02'),
(141, 'App\\Models\\User', 8, 'authToken', '3614112834be5278367fc57660339785bb041ca72f6ef0af13c2165f791f2d99', '[\"*\"]', NULL, '2023-04-13 16:45:11', '2023-04-13 16:45:11'),
(142, 'App\\Models\\User', 8, 'authToken', 'eee6d9d178db060bebbae972c4ea0adda0fd86cf35d6818fa9473a35ffc1a025', '[\"*\"]', '2023-04-16 12:25:13', '2023-04-13 16:46:39', '2023-04-16 12:25:13'),
(143, 'App\\Models\\User', 8, 'authToken', 'b5332955a03fca4cea64a640435647807b051a5503fd26ca0e2eea4e8d53ae47', '[\"*\"]', NULL, '2023-04-13 16:46:56', '2023-04-13 16:46:56'),
(144, 'App\\Models\\User', 8, 'authToken', '16f2c1a97ecb8e2b807bea6670fa04f5aaddfd8b5d0349a1f2abcdeba3ca368e', '[\"*\"]', NULL, '2023-04-13 16:47:18', '2023-04-13 16:47:18'),
(145, 'App\\Models\\User', 8, 'authToken', '17cd4b6983b08a319100994f303cacf2bc9f6d969d365262fdcaa144089aac21', '[\"*\"]', NULL, '2023-04-13 16:48:38', '2023-04-13 16:48:38'),
(146, 'App\\Models\\User', 8, 'authToken', '2f76e4f1a109e1af317bdfed0767022be1ee0e7597c2cc271e035ab889a8cb50', '[\"*\"]', NULL, '2023-04-13 16:50:16', '2023-04-13 16:50:16'),
(147, 'App\\Models\\User', 8, 'authToken', 'ec7685aa2bedb07d8f6bca8bb4e6bffc57fc8f4a99ad62373b4eb84abaa7fa4b', '[\"*\"]', NULL, '2023-04-13 16:50:29', '2023-04-13 16:50:29'),
(148, 'App\\Models\\User', 8, 'authToken', '769e3c2d06dea50ca41f7550e12e534b38caa7c31566f90402a8cb5440fd0fc0', '[\"*\"]', '2023-04-23 05:42:45', '2023-04-16 20:05:17', '2023-04-23 05:42:45'),
(149, 'App\\Models\\User', 8, 'authToken', '5caa2cb5a0a07a2ce67236de564b7c7e4e85999e01a72bada9dfda7c9ff848ed', '[\"*\"]', '2023-04-17 18:52:32', '2023-04-16 20:28:48', '2023-04-17 18:52:32'),
(150, 'App\\Models\\User', 8, 'authToken', 'a3750adeb3735886c606b5a4a9ff5708efce06689a818642ecf47a5f56a218e2', '[\"*\"]', '2023-04-18 13:57:50', '2023-04-16 20:29:58', '2023-04-18 13:57:50'),
(151, 'App\\Models\\User', 8, 'authToken', '66b7a84fa668ebab3c3605f77722ab63c391f5686f20972ce09f2ee32a4c1a4f', '[\"*\"]', '2023-04-20 08:05:54', '2023-04-17 18:52:36', '2023-04-20 08:05:54'),
(152, 'App\\Models\\User', 8, 'authToken', '864bdc0e2351bb4cbb104f1b4cae3907d31678d7fb5161795dc74d22b832dd85', '[\"*\"]', '2023-04-24 04:06:03', '2023-04-23 05:42:50', '2023-04-24 04:06:03'),
(153, 'App\\Models\\User', 8, 'authToken', '85ef43f52e499fb20be21aead49a7a3d40477885e57cf1c7c052024764ad4eb9', '[\"*\"]', '2023-04-24 20:12:36', '2023-04-24 20:12:28', '2023-04-24 20:12:36'),
(154, 'App\\Models\\User', 8, 'authToken', 'db3b686c0c9f5de012ccced9e190c361d8b07242b0bb96bf0762a483d76b983b', '[\"*\"]', '2023-04-24 20:18:34', '2023-04-24 20:18:29', '2023-04-24 20:18:34'),
(155, 'App\\Models\\User', 8, 'authToken', '64ff860f409ef3cff6bab656ebc2738f65fc2c52bd8badab9600f79d1923c737', '[\"*\"]', '2023-04-27 07:05:03', '2023-04-27 07:02:48', '2023-04-27 07:05:03'),
(156, 'App\\Models\\User', 8, 'authToken', 'a3ce5710dfa4878d4e7e90e8fd36b667f8594ef9dda5cfd5acbc45bc4a10d909', '[\"*\"]', '2023-04-27 07:05:28', '2023-04-27 07:05:10', '2023-04-27 07:05:28'),
(157, 'App\\Models\\User', 8, 'authToken', 'cecb5f5d60f4c9fb26649f7d285cab4482334170702fb3973716f93e62563522', '[\"*\"]', '2023-05-10 08:37:36', '2023-04-27 07:10:02', '2023-05-10 08:37:36'),
(158, 'App\\Models\\User', 8, 'authToken', 'aa45ab42c0a78750cef278f76ed55a87de108e8738648964d276486d53118970', '[\"*\"]', '2023-05-10 12:23:23', '2023-05-10 08:37:41', '2023-05-10 12:23:23'),
(159, 'App\\Models\\User', 5, 'authToken', 'fb97ecc13a195a0730a848ce1a18da606c6c72db68852ec1ddcb09062b1c24b4', '[\"*\"]', '2023-05-10 12:27:07', '2023-05-10 12:26:44', '2023-05-10 12:27:07'),
(160, 'App\\Models\\User', 8, 'authToken', '79e0094e9d9897e9023d91ad3a25f7321f0484f14c215c2ec2595a46f3c8f172', '[\"*\"]', '2023-05-10 12:27:36', '2023-05-10 12:27:14', '2023-05-10 12:27:36'),
(161, 'App\\Models\\User', 8, 'authToken', '7de31780f86e0251e2e819d3a2891bf99ad0b87eebb8430e648d698349ae272c', '[\"*\"]', '2023-05-10 12:27:58', '2023-05-10 12:27:52', '2023-05-10 12:27:58'),
(162, 'App\\Models\\User', 5, 'authToken', '3ad88491882feaaa8fef96ef00c5087cfb07b146cd173e5aa5ae3ca0936840d6', '[\"*\"]', '2023-05-10 12:28:57', '2023-05-10 12:28:49', '2023-05-10 12:28:57'),
(163, 'App\\Models\\User', 8, 'authToken', 'd30c8d6e75d2aaf36a2e2c6a007c70305a6c8017e6b9719ad0d3a4a715741907', '[\"*\"]', '2023-05-10 12:42:22', '2023-05-10 12:29:03', '2023-05-10 12:42:22'),
(164, 'App\\Models\\User', 5, 'authToken', '5e771030f0d3ccfa4a184c0019de1412ea165dce7555efeb5fa8d60ee60f9bab', '[\"*\"]', '2023-05-10 12:44:23', '2023-05-10 12:42:26', '2023-05-10 12:44:23'),
(165, 'App\\Models\\User', 5, 'authToken', 'e889a969fa1e98f0696c79b2949e573d37bfcfe26b761c0ee4205577963c18f0', '[\"*\"]', '2023-05-10 12:45:36', '2023-05-10 12:44:31', '2023-05-10 12:45:36'),
(166, 'App\\Models\\User', 5, 'authToken', 'e81c44ed899110dc9c7d894b369c92c169174928cfc513331ee6f604f86fa4fd', '[\"*\"]', NULL, '2023-05-10 12:45:43', '2023-05-10 12:45:43'),
(167, 'App\\Models\\User', 5, 'authToken', '21a34dd18a57e72a237dcc621fff1c7a2a7ed58fe28814071f725651e490aefb', '[\"*\"]', NULL, '2023-05-10 12:46:22', '2023-05-10 12:46:22'),
(168, 'App\\Models\\User', 5, 'authToken', '75f78cfcd1341a1f8d61ecbeb06bc7a85b78afe7507169a08c969d7055d181b3', '[\"*\"]', '2023-05-10 12:47:44', '2023-05-10 12:47:39', '2023-05-10 12:47:44'),
(169, 'App\\Models\\User', 5, 'authToken', '33dc95a0d35041af26f7a974370fa62c36643815958fa52164df46226e35225f', '[\"*\"]', '2023-05-10 12:51:43', '2023-05-10 12:51:34', '2023-05-10 12:51:43'),
(170, 'App\\Models\\User', 8, 'authToken', '581218180784e5f3bc0fb534122598b391772c93672fb4f42262f3af05291954', '[\"*\"]', '2023-05-10 12:52:00', '2023-05-10 12:51:51', '2023-05-10 12:52:00'),
(171, 'App\\Models\\User', 5, 'authToken', '271bc2474ea242524620d3537e76ce9304f6c1971a1fd94f8d4c1facd4422cc7', '[\"*\"]', '2023-05-10 12:55:25', '2023-05-10 12:55:20', '2023-05-10 12:55:25'),
(172, 'App\\Models\\User', 5, 'authToken', '745c80c2b5a380c0c9d0c9d1ad8c182e0aa19f7506e39a7015ef198def849214', '[\"*\"]', '2023-05-10 13:02:58', '2023-05-10 13:02:50', '2023-05-10 13:02:58'),
(173, 'App\\Models\\User', 5, 'authToken', 'f1a54dc0197b9a02900bf02d400f89e2c9fbc9842572399bdc87985885a07f28', '[\"*\"]', '2023-05-10 13:05:39', '2023-05-10 13:03:11', '2023-05-10 13:05:39'),
(175, 'App\\Models\\User', 5, 'authToken', 'f93a29a797dc889e4b5abf19cd289a5ee7dec85ea7fe6ee6f037fd6a478a3bbb', '[\"*\"]', '2023-05-10 13:08:56', '2023-05-10 13:06:36', '2023-05-10 13:08:56'),
(176, 'App\\Models\\User', 5, 'authToken', 'cedc4d1c38b41556d7ba5eb161d7867598f9ad9866e3f7ccc4982c294ee0b452', '[\"*\"]', '2023-05-10 13:10:53', '2023-05-10 13:10:45', '2023-05-10 13:10:53'),
(177, 'App\\Models\\User', 5, 'authToken', '4210361b441c095b6d74dafd90b17841cca8a6fa8a56fedb5fad6750aa50326d', '[\"*\"]', NULL, '2023-05-10 13:12:59', '2023-05-10 13:12:59'),
(178, 'App\\Models\\User', 5, 'authToken', 'edf852203ad50d76efda1014a09e0c51fd65a2c20a4156fb45a50c7861648403', '[\"*\"]', NULL, '2023-05-10 13:13:09', '2023-05-10 13:13:09'),
(179, 'App\\Models\\User', 5, 'authToken', '9cc510f319cf3e4553eb1a4a766a27f0ec063cc342e2b0a27b4c91119e5da0c9', '[\"*\"]', '2023-05-10 13:14:25', '2023-05-10 13:14:20', '2023-05-10 13:14:25'),
(180, 'App\\Models\\User', 5, 'authToken', '1c619081fc0e39dedea7f0dda2d49532abd0e44fc26f93a63738a8e9f23a7bc8', '[\"*\"]', '2023-05-10 13:34:28', '2023-05-10 13:34:24', '2023-05-10 13:34:28'),
(181, 'App\\Models\\User', 5, 'authToken', '24167e97ce91ba7ab3916384c93754d6d631ea47e5f1e28720be002ce3d07608', '[\"*\"]', '2023-05-10 13:35:03', '2023-05-10 13:34:59', '2023-05-10 13:35:03'),
(182, 'App\\Models\\User', 5, 'authToken', '6be375117d76decbc1b3a8827db9ae0ecf4d03c67b54b1d4dcca3113928fb789', '[\"*\"]', NULL, '2023-05-10 13:38:30', '2023-05-10 13:38:30'),
(183, 'App\\Models\\User', 5, 'authToken', '7a6481b27cdea052e11d7eb57622bf80eec637921df8d0d418f3445d2c7339e4', '[\"*\"]', '2023-05-10 16:16:35', '2023-05-10 16:16:27', '2023-05-10 16:16:35'),
(185, 'App\\Models\\User', 5, 'authToken', '7654e564693b79be0b669d5b6c8709b6e2e852b4265da568c1e1f08f14ab178d', '[\"*\"]', NULL, '2023-05-10 16:18:36', '2023-05-10 16:18:36'),
(186, 'App\\Models\\User', 8, 'authToken', '377388f27408b2063102b31e3227a8212cafe7e30fbb553dcc2b9ec22f4fdfef', '[\"*\"]', NULL, '2023-05-10 16:18:55', '2023-05-10 16:18:55'),
(187, 'App\\Models\\User', 8, 'authToken', '3d58921c9bf59eedfacd9b16630c2e8c7dc00fd40e258539949c120d4b0b7ddf', '[\"*\"]', NULL, '2023-05-10 16:19:55', '2023-05-10 16:19:55'),
(188, 'App\\Models\\User', 5, 'authToken', '8a55d6e46922b11b53ec3d4591cb860d080859345a7218bc80f9075de9f00f6a', '[\"*\"]', NULL, '2023-05-10 16:20:21', '2023-05-10 16:20:21'),
(189, 'App\\Models\\User', 8, 'authToken', '12637d92cd3ec0c2041f125b10bb05709f293528308d89db8907bcd73b4b99cc', '[\"*\"]', NULL, '2023-05-10 16:36:21', '2023-05-10 16:36:21'),
(190, 'App\\Models\\User', 8, 'authToken', '46fa8a509a83c6e20075c949052fddc1b9a892516ab87ba64d0ea3463a7aa121', '[\"*\"]', NULL, '2023-05-10 16:37:10', '2023-05-10 16:37:10'),
(191, 'App\\Models\\User', 5, 'authToken', '055d784b29bbd04c6e1fabf267ce0cb35e563066fcb98fce37054523023dc1f3', '[\"*\"]', NULL, '2023-05-13 07:56:58', '2023-05-13 07:56:58'),
(192, 'App\\Models\\User', 8, 'authToken', 'd60b89d0f31e2db0b7905980ecefb51e4c24d2c69bc04de5a4048b2d6036847c', '[\"*\"]', NULL, '2023-05-13 09:02:14', '2023-05-13 09:02:14'),
(193, 'App\\Models\\User', 5, 'authToken', '16ef2c8d5014ffbb5ff762f2d64c61ba4294156a7a44fe7f7af68842d4c74145', '[\"*\"]', NULL, '2023-05-13 09:02:26', '2023-05-13 09:02:26'),
(194, 'App\\Models\\User', 8, 'authToken', '19cfa6f9784054f9d010657a028b65cd578ea6711587d446ebd2cfd08bd8c5bd', '[\"*\"]', NULL, '2023-05-13 09:09:48', '2023-05-13 09:09:48'),
(195, 'App\\Models\\User', 5, 'authToken', '03ac2bbf01fb531d434e52cfd09ec71f2a012ce2153d2d2658387e0826cf0114', '[\"*\"]', NULL, '2023-05-13 09:10:00', '2023-05-13 09:10:00'),
(196, 'App\\Models\\User', 5, 'authToken', '2e6dff96250e62ceca877b40df69dbd58ccffbdbb999169e034572097181b8e4', '[\"*\"]', NULL, '2023-05-13 09:10:30', '2023-05-13 09:10:30'),
(197, 'App\\Models\\User', 5, 'authToken', 'cf73acd1a9e8802d45f670f42ae6bdb78e6d5079f77e62e661468537482a7bc9', '[\"*\"]', NULL, '2023-05-13 09:12:22', '2023-05-13 09:12:22'),
(198, 'App\\Models\\User', 5, 'authToken', '337776b0f61da761742b9966df0809496d3925a9da0f27a5e888c7d52a3ae7b8', '[\"*\"]', NULL, '2023-05-13 09:12:52', '2023-05-13 09:12:52'),
(199, 'App\\Models\\User', 5, 'authToken', '64af723e6d0deffe8043e4ab8b6e453e0f5eead508e3ee0cc3f9ccb671e556da', '[\"*\"]', NULL, '2023-05-13 09:13:19', '2023-05-13 09:13:19'),
(200, 'App\\Models\\User', 5, 'authToken', '3cc24aad092d5aba1c8d01d7c8b8f97da57ac554351f64be6f3439b081d73c19', '[\"*\"]', NULL, '2023-05-13 09:15:57', '2023-05-13 09:15:57'),
(201, 'App\\Models\\User', 5, 'authToken', '9f0940fad308406f86b5a1bb9add54d33e1b51021d0fc1a6c6b6b69eb5b13ee8', '[\"*\"]', NULL, '2023-05-13 09:24:00', '2023-05-13 09:24:00'),
(202, 'App\\Models\\User', 5, 'authToken', 'e3e09d1300c672a6ebbf00bc64a43f5c78553daee5f068cce3c3885ddbe5dde8', '[\"*\"]', NULL, '2023-05-13 09:24:46', '2023-05-13 09:24:46'),
(203, 'App\\Models\\User', 5, 'authToken', '72976066f98e29f5984af3d4ad18e241bd65256909be325aab65cd9c3288321e', '[\"*\"]', NULL, '2023-05-13 09:25:07', '2023-05-13 09:25:07'),
(204, 'App\\Models\\User', 5, 'authToken', '6d7f17a2866fc09d4b3c485543e324a3c58065e44b3dd0aea1ec2703e99a07ac', '[\"*\"]', NULL, '2023-05-13 09:26:06', '2023-05-13 09:26:06'),
(205, 'App\\Models\\User', 5, 'authToken', '98e470114685138ca43dd587baee4d7e2d1f71da38a13c066f591ef7a7e3a275', '[\"*\"]', NULL, '2023-05-13 09:27:20', '2023-05-13 09:27:20'),
(206, 'App\\Models\\User', 5, 'authToken', 'caa6a2034c2dff2a61fcba134e5c81bc4bada2b91201b6f7bd877f28ad2c198b', '[\"*\"]', NULL, '2023-05-13 09:28:19', '2023-05-13 09:28:19'),
(207, 'App\\Models\\User', 5, 'authToken', '16a105cb3297cebb4676fed1349708d41e49650fccd6129292912b8e36fb32ec', '[\"*\"]', NULL, '2023-05-13 09:28:41', '2023-05-13 09:28:41'),
(208, 'App\\Models\\User', 5, 'authToken', '28187a6596f77d4f03c15a56eb67e2b26f76d14c5041a0a4337675edd7703c5b', '[\"*\"]', NULL, '2023-05-13 09:29:47', '2023-05-13 09:29:47'),
(209, 'App\\Models\\User', 5, 'authToken', '33f9ce046893c184c3334f92ef79be9d82dd0f88c014365b32de8b3f31d60cff', '[\"*\"]', NULL, '2023-05-13 09:30:07', '2023-05-13 09:30:07'),
(210, 'App\\Models\\User', 5, 'authToken', 'bb7272b33b99c2b5336364414b576d212369d2d5751af1ce1f660ac8b874ea78', '[\"*\"]', NULL, '2023-05-13 09:30:18', '2023-05-13 09:30:18'),
(211, 'App\\Models\\User', 5, 'authToken', '3877241338e793cd5de8225255fa131097a51e2fb71d1451f3122d019a9fbb87', '[\"*\"]', NULL, '2023-05-13 09:31:24', '2023-05-13 09:31:24'),
(212, 'App\\Models\\User', 5, 'authToken', '28437c3e1c2bed414507262ceced713adf3cbbb44fef5ea8937fa280171f319b', '[\"*\"]', NULL, '2023-05-13 09:35:43', '2023-05-13 09:35:43'),
(214, 'App\\Models\\User', 13, 'authToken', 'c5a902185a415dc65eb134670225fcdec896d0513a99efed782ebc9948e6b437', '[\"*\"]', NULL, '2023-05-14 08:23:32', '2023-05-14 08:23:32'),
(215, 'App\\Models\\User', 8, 'authToken', 'bd21273526099f91bf97dcce86ef41cd825ba4a48a4ddf88325e1cdb1b726635', '[\"*\"]', NULL, '2023-05-14 08:59:15', '2023-05-14 08:59:15'),
(216, 'App\\Models\\User', 8, 'authToken', 'eb7a9b7a8e806ad061056597beee2ecef44d716a5917a0baf86f46242246e90a', '[\"*\"]', NULL, '2023-05-16 07:58:03', '2023-05-16 07:58:03'),
(217, 'App\\Models\\User', 5, 'authToken', '798db378c012f21cc7e3f4e664789762ab41648d67440af2a2cb6362710bed28', '[\"*\"]', NULL, '2023-05-16 08:02:08', '2023-05-16 08:02:08'),
(225, 'App\\Models\\User', 5, 'authToken', '70e62dbb71a0f68afda4e2d62246e23d5e601d72119e5c5b0b22699a0c1df73a', '[\"*\"]', '2023-05-31 05:48:55', '2023-05-23 05:46:34', '2023-05-31 05:48:55'),
(221, 'App\\Models\\User', 8, 'authToken', '708218a29c75058253b97c2a1ea09b5c1a6272e5f2329b2d4f12cbc987546257', '[\"*\"]', NULL, '2023-05-18 08:07:37', '2023-05-18 08:07:37'),
(222, 'App\\Models\\User', 8, 'authToken', '4924354417306bb4f5f2f2fc63b97f518262afcef13f074f0e7dec6adfd5b1d8', '[\"*\"]', NULL, '2023-05-18 08:09:11', '2023-05-18 08:09:11'),
(223, 'App\\Models\\User', 8, 'authToken', '44acd01c653cd8df7036aba45e6415de66dd8baa9c6d6887fd374fa34bbc0f64', '[\"*\"]', '2023-05-21 05:09:22', '2023-05-18 08:12:14', '2023-05-21 05:09:22'),
(226, 'App\\Models\\User', 8, 'authToken', 'dbb0c3dbf7fe2dd9d4b436d956b63e9e5b825c04a7a410deb11e55988cea26f6', '[\"*\"]', NULL, '2023-05-23 08:15:20', '2023-05-23 08:15:20'),
(228, 'App\\Models\\User', 8, 'authToken', 'c417a5f7644927b7b4d77084af34a8b187ad35f3962f35ae403549ffa796bf47', '[\"*\"]', NULL, '2023-05-31 05:58:16', '2023-05-31 05:58:16'),
(229, 'App\\Models\\User', 8, 'authToken', '40beed0a631a651dd8150d314d5060c0dd9566c997ac608c80d9b923ca697bf8', '[\"*\"]', NULL, '2023-05-31 05:58:39', '2023-05-31 05:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `values` text COLLATE utf8mb4_unicode_ci,
  `notes` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_campaign_id_foreign` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `repeate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count_repeate` int(11) DEFAULT NULL,
  `unit_repeate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeate_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeate_at_time` text COLLATE utf8mb4_unicode_ci,
  `end_type_cal` int(11) NOT NULL COMMENT '0 => never , 1 => at',
  `type_repeate` int(11) NOT NULL DEFAULT '0' COMMENT '0 => never , 1 => according count_repeate',
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_campaign_id_foreign` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `time_zone`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'tester account', 'admin@admin.com', NULL, '$2y$10$Fmn.Vk.oQZ7nBETULAMoMO0EpObgkZPEre7NBIfVIrOaB5Wa46MB6', '201026051966', 'Africa/Cairo', 0, NULL, '2023-02-12 03:47:30', '2023-02-16 17:37:53'),
(8, 'tester account', 'andrewazmigendi@gmail.com', NULL, '$2y$10$Fmn.Vk.oQZ7nBETULAMoMO0EpObgkZPEre7NBIfVIrOaB5Wa46MB6', '097553476132', 'Asia/Dubai', 1, NULL, '2023-02-12 17:45:27', '2023-04-13 14:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `zid_authorizes`
--

DROP TABLE IF EXISTS `zid_authorizes`;
CREATE TABLE IF NOT EXISTS `zid_authorizes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci,
  `token_type` text COLLATE utf8mb4_unicode_ci,
  `expires_in` text COLLATE utf8mb4_unicode_ci,
  `authorization` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zid_authorizes_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zid_authorizes`
--

INSERT INTO `zid_authorizes` (`id`, `user_id`, `access_token`, `token_type`, `expires_in`, `authorization`, `refresh_token`, `created_at`, `updated_at`) VALUES
(10, 8, 'eyJpdiI6InVuNDBhNWw0NHpSR296ZnF4dEdNL0E9PSIsInZhbHVlIjoiZTVROHlIVS9RWHRicVd3cytac2lIZ2NGVG5peTRXMnpMU3pobHpLdEpJMnNIcFhpcXpvdnI3WnRBWFBvTi9PdEZpYjRRSytvVkhsd2xSVFcwUWljWkpmcW5CV3hFcWdxdytMa3p6RW9SQjk3SkhFdWEvQzJsS0ttbzFpWDJkdkxjZHJmVmFIMU9CL3pSTUpFWFVTMXBEK09POGhUVGF6cUV6Tm9aOEdXK3ZFbCtocnFneG1DVy9NRXcrS1U3NUNzWE5LOGROQUZUMXdKMnh1aEJISjJsUGxXN2JpQkhpbVlSamxjMFR2NGZ5Yz0iLCJtYWMiOiJhM2YyNTBiZDdkZjA0YzgzODdmYmM3NzU2YWFkNmMwYzA0NWJlYWFlMDQyNDI1Y2FhYjVjMjRiMDg0ODcwMTk2IiwidGFnIjoiIn0=', 'Bearer', '31622400', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxODQyIiwianRpIjoiOGZkOTE0Yjc4YjJhZThlMjcyZTViZjgyNWYzMmFmOGM2MmFmNDc5MzE1ZjAyZTc3ZDFjNmM1YTU0MDg3ZGIzZWRiODJiZjAwYjdmZGZlMDIiLCJpYXQiOjE2ODQzMTE1OTAuNjI2NjI4LCJuYmYiOjE2ODQzMTE1OTAuNjI2NjMxLCJleHAiOjE3MTU5MzM5OTAuNTc4ODI1LCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfY2F0ZWdvcmllc19yZWFkIiwidGhpcmRfY2F0ZWdvcmllc193cml0ZSIsInRoaXJkX3dlYmhvb2tfcmVhZCIsInRoaXJkX3dlYmhvb2tfd3JpdGUiLCJ0aGlyZF9wcm9kdWN0X3JlYWQiLCJ0aGlyZF9wcm9kdWN0X3dyaXRlIiwidGhpcmRfY291bnRyaWVzX3JlYWQiLCJ0aGlyZF9jYXRhbG9nX3dyaXRlIiwidGhpcmRfYWNjb3VudF93cml0ZSJdfQ.KPXrFbpYRqVKJDWbI-26gw-DidkSK6GYBJnod4W2FZMho7imwgpVeTe92y-I6Navaz4Fxu4Q3vvrls1l4aiHrLEPEmCgcSdZHqUZalPEgn5aHRn30vBaLmHUFHRJb1GCPwQOGvTTOd18ETGAuyXpj7mgvua3MEnSoA8WGeFq_qV9sQGgCYjY911Y_w-aqcJQlIqJ0BdFLkbVkeNh7l0pBL6ntqgUO-Dr5qDKwC7khnpZMknhuFd34lIVvrhQcjrh_H7rRhbfpbWux-GzItflBhUdMmn6zs7fUCeBdc16cc-x1Da7RUq-HMVEObg9oKK5foo60QHobtaw0rOp3o5bpCd7eo-7sPybPOyTITRzdh_cJtuhJ5ooUMYt9eu3_cmrOsvcCjT1o5Sst4YqD7qyDweBKRLV8DDQ-QI_didObs9VsgbKCYsMixE0YyqRhOgvrxEWpQ9vMPm-DgUm8vv1DjE2ArFqoEArJVm8AIU9rLeHOsYSF94gzwDjNY9FBesqqEWaNXEFImKfROSr3jLzlUQBX_pjJy0eaFs6JjLrr_ZvVB445GnjoQqS3Kspn8DNOsDFnZn6bdXWH5-FYofp7nDP2IL6_uh4Q71QjJQB8D8-eZvNHYPpNkzBT2NrmziYzlYONDD77YMRUMXs6q2KhkVV96hP0gc8BjomoFliBaQ', 'def502007d783854d17a65e3e18e883deea40d713614c25fe463461ec3e989d00ce94c8d38a76da028f1f078b27ec6c2ed602997cdf0cb4fcb8a4a0ad3011accdc0bb9ba899051b882a8abeebc4ac15a66bd86ea5227096e3055dc3b99cd300263228b51f18e151ac8dc069b4e4b2ac49129bad9a85767ae90db8c3cdc611d296af3850a974beaae17a93240340631243a11e6b539fffb1f132855695dbae04028fc48217734f362ee60658c18889876b9c15711f599af1efef42f2c3bfe5cbd42cfc97698da94a652fde669d47b035a5802e217143a971032524bfec872c065583f0283fcc88ee2b09b4635ef9ce3c700680127049886121c296dd0994f2e91cea4200583765568669a256047997852a5384f4236c048f8af58c2480b7530734c93b97cfb26c32481713aedeeef5acdbe614edeaa1da9da69535668b966bb2d8d50791c6418c366414aaa429d48bc466b207acced653661e4e37ddd1d8996494792a9e8132818daace869e5dc927ac6677bb37b0610e2a7d3a3e2b1179c4fddfe5c3d4d1fda485e1368a43d43e518895cac758bd6a0a1c11f35e2465967f8d33f30ac2156e52f0f45b8c13e541398e1886c550ca510c952e90f55d42d9f5b6dac11737789114e700d81dfa790425ae9540bf8201267a322718e7802962887444ac6508d8e3aea2692f0a07b6e35112b96def3e505c29ea0c84a63c9f8ff38e8dd327b4230312b1c55c6943170bdb8b4b2501fe8efb35a3902cb6f8389241d0e0a52596bcbaf65bec5ce53e9b2a48a237cf0f2b5fd699616648e354680de2aa7da2da282b5f47b133664f2af67277ba3d647e61917d9d39c2afda659efcc9d876c3ce741a1a27092836ef00bb68259c4643c620f1b07e44570f5c1b573175293d231cedb79f98de6d6267701136f85e8b794e1f3cd5c6cfe4ca99b14bbf67a0f5a262622dccd1a45653b74fc61c043f44b22c63137c7cbcf8fed6e53defc4c0f1d338e958551cfa78028cc6375d5da135b4d3bc463173db88237df387a5d574443ee7644b0133452e8bfdc1f95efc3e7334ee30d2ee2cf5e607522933dc434754337ca93265c096d1ef1124790f06759090a515514fb793d909e4f00459a221f3a396b293e1a64c8392e2d7d8abf354fe53a2458f6621a50398e22e2930bdc237aa7b7ad0cec38cde1ca5ef1ddfb3b25cf79baa03b38de6dc595189e9ab91b7cb172757387baf0a85feeda7e7ab5f34690d29768bb2edb3ed68e7c7b4253ab28b03726caf4bb4e36ab61', '2023-02-13 15:54:38', '2023-04-13 14:29:29'),
(12, 5, 'eyJpdiI6IkRKTTNzcDdqR3hVOXFyK0wzQUFMMkE9PSIsInZhbHVlIjoiTjhHZG02M2YzZEFRaUVlVkRqVWRSSmlBbUV6STVybGV6ekdFeTQ0aHFWdWpiQjRTTi9YZVErSXVta3lacGg4R0ZVVFlLYU53WHhWM0NHSVhLSnBObTMxemdCamgrb1BNQktWUG1NM0ZyR1pabkh2VURMZDI4ajJRS2tlc2VycFo5OXp0eVFnaEhxRkhjdG04S1BaNUZGMVp3ZXl3VE9JMGpIOEttYjk1ZjVVVHF4VVpCNEtleVpCTDhqNU05eU9SZmZSRWUyeE5lQk1rK3JOa1A5SlV3ZjhhaWxESXZPMUZWQ0M3UWl0aG5maz0iLCJtYWMiOiJjYmIzODlmYjhiYzUxZTJkY2RmNDc0ZDFlNjQ5NGE3MTQ2Zjg4MzNlNmNkNGI5NGM0MDJhYjYyYjY0OTA4ZDI5IiwidGFnIjoiIn0=', 'Bearer', '31622400', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiNTk4ZWJmY2EyOWFjZGMzZjY5YWNkZGYzOTNiM2UwYmFiYWQwZmMzMDYzZTRmZTVjNzJkNzEzNTRlNjdmZTcxMmQ3NWNjZmZkNTU3YjU4NTQiLCJpYXQiOjE2ODAzMDcyMDMuOTc2MzcyLCJuYmYiOjE2ODAzMDcyMDMuOTc2Mzc1LCJleHAiOjE3MTE5Mjk2MDMuOTUzMDA2LCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.f2NRB4rJ_q83-d9Qa7asEQHvQ5Q40UnUbhxYevaUqWL-UDpLx_cmmiE7TnAje6dxuQfENvABbIdTjOvcR-ON5z-3ZpQCMSwhf0eVnwvEv56f2VRjQ_PvvSXahtKKGhqD4EhEovXjV4UuiAGSrPrRi75LiPXQBdbwSSG66pagKOdjvoLBV07ot8y61OGT95rpDrAAfQJ8dDa8Q7IRL3SG4AJ-YS7l366ZOPal5nMsl02ZPxnOTxK6L7LBGeP0mH_9vU7_hrghK4NyPpRE4l9FOlAr8qrOfAsocNC9HT-clNrCvbkHo47lsiu8olb-KRrbOGSqnGLOTGlSFdMKdLAlyzI-N_ag6gpyWb7QbNaOz9_6W058xWvCz7IoYEyEPA3WVxKpN6PojohvxAdoZ4FOhDk2VdpPICbEq7bfO_xCM2UEy_X6oXD6Uhn43kkyZIXwLAT5cAC5o25TYcFUzPoLWlqJzN733nwpZZeRsLExaKYD2_mgCfHxltUxnBR7Jcm6VU3Xyey8adraw0ibDdHb5GErxVcSmPH0SIE25CN0Qi3wZEY82JGtCU7PL5jSzSAGUxJSJzKPAvNf8-QfHEo07YJl56Cue99Sg5i4ptyt8zSIYS6TWCgXQTsrgduFp5Iq6Id2Yc-Odkm1WczK20iDz1SUrEavaywNbUelKo9QcGc', 'def50200ddcf12219494179b357a1bbbe5ca3a8b3659de6eeb3a3366553963fd4b11eca7131865769e0185eaa4d9da9937bdb59815ae25d0be5b740aa544e9eb7981c025f99eeabe840166302e8f39ab9c6403e563dca22627a6cb61f306d9713c5aa641be57e665d6b7f126a5a8dd3e891b2b48e3d5d14582245edce3cd7ef57a7e2eb3820d543a627952b7fec79f038cb7180674a3999b968a3bcada9b9af30759c180e310e97c75d02040af87a0acb3efef9d826c1070299a07635984d97db184a659c015ecbceec5fc729d3a001583baee61eabba450aad0bd66b71a87c9fd61a6c5e53ad72b2cd3cdf9214e034945c922f6620b09ab1afde8d6ed8aabb3ccda97c85dd6c6a4c058e46ce7c3e3703764bb500986880189052de7835090895c8a2f25b6ff6bb2fc0d21662018aed36ffc202ce17c1264aef22f383084657a2de101674a75315019012932d9349627585d75e165121954262749247039391ea102a42135a383f5ec4403efed6063d250056f58522afe5d539e5d629dd2c6666c5f408e546714353a39bfa17ab52bb7499b4bd9689742114df10bc58bf113d64aa93bf011f2cfdb50dc17fe5192415bd2da4d82f2ad657b88293081564c3467b62d4fdc64d5bae4713bd4d3d2ac2b744f3a4eab65e326fca4f382b1fe7f0d68d0cfa136be947eaa10722815ec4c783698beaf69b2417c19626127118097357a1d02be0a8caa36b7bf4920619b0dd48624c2bd6480b09fde4b458b2a60022daeea3597ce3844a5ddb11cb30ec957b4431c768cc05154e1fee1e8a03ce1bfb6124b4e137afe8417ff1a35ceb892d726fb76ea76d61a6682b65e0682be784ea383c57813d40b6716071e984e6841eedfe2b978c41689b6d9ebb8e68122e168aa6f14092aa481c102eac35244c8b259e1d52d17406b46030a0bfead70760742448e9bd0c151fa7fb3e919f97e9318be96d78baa3b0b704c49298c762d74733cb4769c2286be713c5d964ae9740ef7593540b35ff5bcae51d54f54f1380ccf2ead201973eaaa70c0fa37561035de12cdb00ac45d68c63b95a9cbcaf95d1fdaf8cdd1045ab245eeb54f344b270aaca7fcbefa0b79ce39593ef3d71e836e21f557f76bac87465d06ad8a60e0cfecabdcb4c99dceb1b1ee6ced7382c744a7076849576a86ad19b3e4cb51381b102bae995a3f5ebd12086865d3e0459ece777bc8e847046d2e817e1b8e71ee22b2883634800526e5105488696bb35542a0cc67453439205838eb41039f46835242', '2023-02-13 15:54:38', '2023-03-31 22:00:04');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
