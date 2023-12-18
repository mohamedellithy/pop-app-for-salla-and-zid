-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2023 at 08:49 PM
-- Server version: 5.6.50-log
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `product_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(16, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'المنتجات', '619518', '2023-02-13 01:22:33', '2023-02-13 01:22:33'),
(15, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'الترميزات', '619517', '2023-02-13 01:22:31', '2023-02-13 01:22:31'),
(14, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'جديد', '621399', '2023-02-13 01:22:30', '2023-02-13 01:22:30'),
(13, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'المنتجات', '619518', '2023-02-13 01:22:28', '2023-02-13 01:22:28'),
(12, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'الترميزات', '619517', '2023-02-13 01:22:27', '2023-02-13 01:22:27'),
(17, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'جديد', '621399', '2023-02-13 01:22:34', '2023-02-13 01:22:34'),
(18, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'الترميزات', '619517', '2023-02-13 01:22:35', '2023-02-13 01:22:35'),
(19, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'المنتجات', '619518', '2023-02-13 01:22:37', '2023-02-13 01:22:37'),
(20, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'جديد', '621399', '2023-02-13 01:22:38', '2023-02-13 01:22:38'),
(40, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', '2023po', '660854', '2023-04-05 20:26:03', '2023-04-05 20:26:03'),
(39, '1b50e485-2665-4bac-9998-b910e09c6915', 'test 999', '660837', '2023-04-05 20:04:03', '2023-04-05 20:04:03'),
(24, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'Test', '621495', '2023-02-17 07:35:07', '2023-02-17 07:35:07'),
(25, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:08', '2023-02-17 07:35:08'),
(26, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'Test', '621495', '2023-02-17 07:35:11', '2023-02-17 07:35:11'),
(27, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:12', '2023-02-17 07:35:12'),
(28, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'Test', '621495', '2023-02-17 07:35:15', '2023-02-17 07:35:15'),
(29, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:17', '2023-02-17 07:35:17'),
(38, '1b50e485-2665-4bac-9998-b910e09c6915', 'test 1223', '660836', '2023-04-05 20:04:02', '2023-04-05 20:04:02'),
(37, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'الخاصة الخاصة', '624052', '2023-03-28 23:35:12', '2023-03-28 23:35:12'),
(36, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'Test', '621495', '2023-03-28 23:35:11', '2023-03-28 23:35:11'),
(35, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'الترميزات', '619517', '2023-03-28 23:35:10', '2023-03-28 23:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type_set` int(11) DEFAULT '0',
  `action` enum('0','1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '                0 =>  نشر المنتجات,\r\n                1 =>  الغاء نشر المنتجات,\r\n                2 =>  تخفيضات على المنتجات,\r\n                3 =>  تغير فى السعر المنتجات,\r\n                4 =>  اضافة الترميزات الخاصة للمنتجات,\r\n                5 =>  حذف الترميزات الخاصة للمنتجات\r\n            ',
  `status` int(11) NOT NULL DEFAULT '0',
  `progress` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `name`, `description`, `type_set`, `action`, `status`, `progress`, `deleted_at`, `created_at`, `updated_at`) VALUES
(16, 8, 'test delete product', NULL, 0, '1', 1, 0, '2023-03-28 15:13:51', '2023-02-12 17:51:00', '2023-03-28 15:13:51'),
(17, 8, 'test', NULL, 0, '0', 0, 0, '2023-02-12 18:35:16', '2023-02-12 17:52:39', '2023-02-12 18:35:16'),
(18, 8, 'test 1234', NULL, 0, '0', 0, 0, '2023-02-12 18:35:19', '2023-02-12 17:53:36', '2023-02-12 18:35:19'),
(19, 6, 'tester2', NULL, 0, '4', 1, 0, NULL, '2023-02-12 17:59:50', '2023-02-13 05:11:20'),
(20, 8, 'test publish product', NULL, 0, '0', 1, 0, '2023-03-28 15:14:05', '2023-02-12 18:35:08', '2023-03-28 15:14:05'),
(21, 8, 'Test Product Add Tags', NULL, 0, '4', 1, 0, '2023-02-13 16:44:56', '2023-02-12 18:54:59', '2023-02-13 16:44:56'),
(22, 5, 'test3455', NULL, 0, '0', 1, 0, NULL, '2023-02-12 19:39:47', '2023-02-12 19:39:47'),
(23, 6, 'bnb', NULL, 1, '2', 1, 0, NULL, '2023-02-13 07:40:54', '2023-02-13 07:41:10'),
(24, 8, 'Test Change product Price', NULL, 0, '3', 1, 0, '2023-03-28 15:14:06', '2023-02-13 16:44:45', '2023-03-28 15:14:06'),
(25, 8, 'Test Discount cancel', NULL, 0, '6', 1, 0, '2023-03-28 15:14:07', '2023-02-13 19:01:37', '2023-03-28 15:14:07'),
(26, 8, 'Test price discount', NULL, 0, '2', 1, 0, '2023-03-28 15:14:17', '2023-02-13 20:14:05', '2023-03-28 15:14:17'),
(27, 6, 'انشاء حملة جدولة جديدة لنشر المنتجات', NULL, 0, '0', 1, 0, NULL, '2023-02-16 17:52:41', '2023-02-16 17:52:41'),
(28, 6, 'اختبار التخفيضات بالنسبة', NULL, 0, '2', 1, 0, NULL, '2023-02-17 01:57:32', '2023-02-17 01:57:32'),
(29, 8, 'test unpublish 2', 'wdfesfdsfdsfdsf', 0, '1', 1, 0, '2023-03-28 15:14:18', '2023-03-27 11:24:49', '2023-03-28 15:14:18'),
(30, 8, 'test unpublish 3', 'trst', 0, '1', 1, 0, '2023-03-28 15:14:19', '2023-03-27 11:33:36', '2023-03-28 15:14:19'),
(31, 8, 'test unpublish 5', 'sdfdsfdsfs', 1, '5', 1, 0, '2023-03-28 15:14:20', '2023-03-27 11:37:56', '2023-03-28 15:14:20'),
(33, 8, 'test unpublish', 'test unpublish', 0, '1', 1, 0, '2023-04-05 14:22:56', '2023-03-28 15:16:24', '2023-04-05 14:22:56'),
(34, 8, 'Test Price Change | Smart Camera Canyon 9', 'تعديل سعر منتج', 0, '3', 1, 0, '2023-04-05 14:23:08', '2023-04-05 13:48:21', '2023-04-05 14:23:08'),
(35, 8, 'Publish Product | نسخة من Smart Camera Canyon 9', 'test publish product', 0, '0', 1, 0, '2023-04-05 14:23:02', '2023-04-05 14:00:18', '2023-04-05 14:23:02'),
(36, 8, 'الغاء تخفيض منتج | نسخة من Test 2 | 7:10 PM', 'الغاء تخفيض منتج | نسخة من Test 2 | 7:10 PM', 0, '6', 1, 0, '2023-04-05 14:23:12', '2023-04-05 14:07:36', '2023-04-05 14:23:12'),
(37, 8, 'Publish | Smart Camera Canyon 12 | 7:18PM KSA', NULL, 0, '0', 1, 0, '2023-04-05 18:55:50', '2023-04-05 14:14:50', '2023-04-05 18:55:50'),
(38, 8, 'Unpublish product | Smart Camera Canyon 9 | 7:19 PM KSA', NULL, 0, '1', 1, 0, '2023-04-05 18:55:59', '2023-04-05 14:16:33', '2023-04-05 18:55:59'),
(39, 8, 'تغيير سعر منتج | Smart Camera Canyon 10', '7:36 PM KSA', 0, '3', 1, 0, '2023-04-05 18:56:01', '2023-04-05 14:33:45', '2023-04-05 18:56:01'),
(40, 8, 'Publish | نسخة من Smart Camera Canyon 9', 'نسخة من Smart Camera Canyon 9', 0, '0', 1, 0, NULL, '2023-04-05 18:53:16', '2023-04-05 18:53:16'),
(41, 8, 'Unpublish | نسخة من Smart Camera Canyon 9', 'نسخة من Smart Camera Canyon 9', 0, '1', 1, 0, NULL, '2023-04-05 18:57:06', '2023-04-05 18:57:06'),
(42, 8, 'Price Change | نسخة من Smart Camera Canyon 9', 'نسخة من Smart Camera Canyon 9 \n\nPrice = 20', 0, '3', 1, 0, NULL, '2023-04-05 18:59:16', '2023-04-05 18:59:16'),
(43, 8, 'Promotion Remove | نسخة من Test 2', 'نسخة من Test 2', 0, '6', 1, 0, NULL, '2023-04-05 19:03:03', '2023-04-05 19:03:03'),
(44, 8, 'Discount |', 'Z.253589.16798570040031338', 0, '2', 1, 0, NULL, '2023-04-05 19:06:08', '2023-04-05 19:06:08'),
(45, 8, 'Product Discount | Smart Camera Canyon 6', 'Smart Camera Canyon 6', 0, '2', 1, 0, NULL, '2023-04-05 19:11:15', '2023-04-05 19:11:15'),
(46, 8, 'Discount | Smart Camera Canyon 6', 'Smart Camera Canyon 6', 1, '2', 1, 0, NULL, '2023-04-05 19:17:03', '2023-04-05 19:26:17'),
(47, 8, 'Discount Percentage | Smart Camera Canyon 10', 'Smart Camera Canyon 10', 0, '2', 1, 0, NULL, '2023-04-05 19:51:09', '2023-04-05 19:51:09'),
(48, 8, 'Discount Fixed Price | Smart Camera Canyon 10', NULL, 0, '2', 1, 0, NULL, '2023-04-05 19:54:55', '2023-04-05 19:54:55'),
(49, 8, 'Change Price | Smart Camera Canyon 7', 'Change price Smart Camera Canyon 7', 0, '3', 1, 0, NULL, '2023-04-05 19:59:08', '2023-04-05 19:59:08'),
(50, 8, 'Add Tag | نسخة من Smart Camera Canyon 9', 'نسخة من Smart Camera Canyon 9', 0, '4', 0, 0, NULL, '2023-04-05 20:03:50', '2023-04-05 20:04:43'),
(51, 8, 'add tags to Test 2', 'add tags to Test 2', 0, '4', 1, 0, NULL, '2023-04-05 20:18:20', '2023-04-05 20:26:28'),
(52, 8, 'Add tag | Smart Camera Canyon 9', 'Smart Camera Canyon 9', 0, '4', 1, 0, NULL, '2023-04-05 20:34:21', '2023-04-05 20:34:21'),
(53, 8, 'Add Tag |. Test 2', 'Add Tag Test 2', 0, '4', 1, 0, NULL, '2023-04-05 20:37:31', '2023-04-05 20:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18, '2023_02_09_094338_create_attachments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(111, 'App\\Models\\User', 8, 'authToken', '4c9783c01df8726ebf0a1e859809465dd6dabea94737ff2cef08d23a3316618d', '[\"*\"]', NULL, '2023-03-29 10:58:34', '2023-03-29 10:58:34'),
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
(124, 'App\\Models\\User', 8, 'authToken', '475666e18c83c4d297ed9fdd093e91cc6ea72183532929200cd6877fd48a4c5f', '[\"*\"]', '2023-04-05 21:58:50', '2023-04-04 22:53:16', '2023-04-05 21:58:50'),
(125, 'App\\Models\\User', 8, 'authToken', '3f4ec3319311130bf109930bcd220ac083f420684fd1fe52c3c175ed3e28c955', '[\"*\"]', '2023-04-05 17:36:43', '2023-04-04 22:54:32', '2023-04-05 17:36:43'),
(126, 'App\\Models\\User', 8, 'authToken', 'cf5629d0eed9903903b5b9ab5c7656f3e285b07eeaa2cef3770529b4cfeea351', '[\"*\"]', '2023-04-05 21:21:09', '2023-04-05 13:44:59', '2023-04-05 21:21:09'),
(128, 'App\\Models\\User', 8, 'authToken', '98833c2cfbd983137f35be199dc84f6ee2937be61bbae1fd0104f04751cf8fde', '[\"*\"]', '2023-04-06 07:07:10', '2023-04-05 21:21:10', '2023-04-06 07:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `values` text COLLATE utf8mb4_unicode_ci,
  `notes` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `campaign_id`, `product_id`, `status`, `values`, `notes`, `created_at`, `updated_at`) VALUES
(1751, 27, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1744, 26, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, '10', '-1', NULL, NULL),
(1742, 24, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, '10', '-1', NULL, NULL),
(1743, 25, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1740, 23, '1b86301f-d3c2-418f-82a1-10c21d59338d', 0, '15', '-1', NULL, NULL),
(1737, 23, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 0, '15', '-1', NULL, NULL),
(1739, 23, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, '15', '-1', NULL, NULL),
(1738, 23, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 0, '15', '-1', NULL, NULL),
(1732, 19, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 0, 'الترميزات-Test-الخاصة الخاصة', '-1', NULL, NULL),
(1731, 19, '1b86301f-d3c2-418f-82a1-10c21d59338d', 0, 'الترميزات-Test-الخاصة الخاصة', '-1', NULL, NULL),
(1730, 19, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 0, 'الترميزات-Test-الخاصة الخاصة', '-1', NULL, NULL),
(1729, 19, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, 'الترميزات-Test-الخاصة الخاصة', '-1', NULL, NULL),
(1536, 21, '1b86301f-d3c2-418f-82a1-10c21d59338d', 0, NULL, '-1', NULL, NULL),
(1747, 20, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1745, 16, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 0, NULL, '-1', NULL, NULL),
(1768, 28, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, '20', 'percentage', NULL, NULL),
(1769, 28, '1b86301f-d3c2-418f-82a1-10c21d59338d', 0, '20', 'percentage', NULL, NULL),
(1770, 30, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1771, 30, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1772, 32, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1773, 32, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1813, 31, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1815, 33, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1814, 31, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1816, 34, '1b50e485-2665-4bac-9998-b910e09c6915', 0, '80', '-1', NULL, NULL),
(1818, 35, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1819, 36, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1820, 37, '8d94f8a9-6cea-4cdf-9726-6fd01a7ec129', 0, NULL, '-1', NULL, NULL),
(1821, 38, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1824, 39, '61a96e8a-5d4d-474f-b706-26c7fbc9d5b4', 0, '10', '-1', NULL, NULL),
(1825, 40, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1826, 41, '1b50e485-2665-4bac-9998-b910e09c6915', 0, NULL, '-1', NULL, NULL),
(1827, 42, '1b50e485-2665-4bac-9998-b910e09c6915', 0, '290', '-1', NULL, NULL),
(1828, 43, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, NULL, '-1', NULL, NULL),
(1829, 44, '1b50e485-2665-4bac-9998-b910e09c6915', 0, '15', 'percentage', NULL, NULL),
(1830, 45, '3cd09608-ce4b-43ce-b95b-777f3a8729b0', 0, '20', '-1', NULL, NULL),
(1844, 46, '3cd09608-ce4b-43ce-b95b-777f3a8729b0', 0, '20', '-1', NULL, NULL),
(1845, 47, '61a96e8a-5d4d-474f-b706-26c7fbc9d5b4', 0, '10', 'percentage', NULL, NULL),
(1846, 48, '61a96e8a-5d4d-474f-b706-26c7fbc9d5b4', 0, '3', '-1', NULL, NULL),
(1847, 49, '8b7592b1-4c3b-4347-8cb3-2a02fcc6a3e0', 0, '100', '-1', NULL, NULL),
(1849, 50, '1b50e485-2665-4bac-9998-b910e09c6915', 0, 'test 1223-test 999', '-1', NULL, NULL),
(1852, 51, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, '2023po', '-1', NULL, NULL),
(1853, 52, '1b50e485-2665-4bac-9998-b910e09c6915', 0, 'test', '-1', NULL, NULL),
(1854, 53, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 0, 'test', '-1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `repeate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count_repeate` int(11) DEFAULT NULL,
  `unit_repeate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeate_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeate_at_time` text COLLATE utf8mb4_unicode_ci,
  `end_type_cal` int(11) NOT NULL COMMENT '0 => never , 1 => at , 2 => after',
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `campaign_id`, `repeate`, `count_repeate`, `unit_repeate`, `repeate_on`, `repeate_at_time`, `end_type_cal`, `end_at`, `created_at`, `updated_at`) VALUES
(26, 26, 'daily', NULL, '0', '', '22:16', 0, NULL, '2023-02-13 20:14:05', '2023-02-13 20:14:05'),
(25, 25, 'daily', NULL, '0', '', '21:04', 0, NULL, '2023-02-13 19:01:37', '2023-02-13 19:01:37'),
(24, 24, 'daily', NULL, '0', '', '18:46', 0, NULL, '2023-02-13 16:44:45', '2023-02-13 17:33:55'),
(23, 23, 'daily', NULL, '0', '', '05:40', 0, NULL, '2023-02-13 07:40:54', '2023-02-13 07:41:10'),
(22, 22, '0', NULL, '0', '', NULL, 0, NULL, '2023-02-12 19:39:47', '2023-02-12 19:39:47'),
(21, 21, 'daily', NULL, '0', '', '20:54', 0, NULL, '2023-02-12 18:54:59', '2023-02-12 18:54:59'),
(20, 20, 'daily', NULL, '0', '', '01:31', 0, NULL, '2023-02-12 18:35:08', '2023-02-16 17:29:11'),
(19, 19, 'daily', NULL, '0', '', '03:35', 0, NULL, '2023-02-12 17:59:50', '2023-02-13 07:33:23'),
(18, 18, '0', NULL, '0', '', NULL, 0, NULL, '2023-02-12 17:53:36', '2023-02-12 17:53:36'),
(17, 17, '0', NULL, '0', '', NULL, 0, NULL, '2023-02-12 17:52:39', '2023-02-12 17:52:39'),
(16, 16, 'custom', 0, '0', '', '19:50', 0, NULL, '2023-02-12 17:51:00', '2023-02-14 05:51:08'),
(27, 27, '0', 0, '0', '', '14:02', 1, '2023-02-16 06:00:00', '2023-02-16 17:52:41', '2023-02-16 18:02:03'),
(28, 28, 'daily', NULL, '0', '', '22:26', 0, '2023-02-16 06:00:00', '2023-02-17 01:57:32', '2023-02-17 02:25:19'),
(29, 29, '0', 1, '0', '', '17:34', 1, '2023-03-26 22:00:00', '2023-03-27 11:24:49', '2023-03-27 11:32:56'),
(30, 30, '0', 1, '0', '', '17:38', 1, '2023-03-26 22:00:00', '2023-03-27 11:33:36', '2023-03-27 11:46:04'),
(31, 31, '0', 0, '0', '', '20:52', 1, '2023-03-27 22:00:00', '2023-03-27 11:37:56', '2023-03-28 10:52:05'),
(32, 32, '0', 1, '0', '', '15:46', 1, '2023-03-26 22:00:00', '2023-03-27 11:46:42', '2023-03-27 11:46:42'),
(33, 33, '0', 1, '0', '', '21:15', 1, '2023-03-27 22:00:00', '2023-03-28 15:16:24', '2023-03-28 15:16:24'),
(34, 34, '0', 1, '0', '', '18:50', 1, '2023-04-04 22:00:00', '2023-04-05 13:48:21', '2023-04-05 13:48:21'),
(35, 35, '0', 1, '0', '', '19:05', 1, '2023-04-04 22:00:00', '2023-04-05 14:00:18', '2023-04-05 14:03:19'),
(36, 36, '0', 1, '0', '', '19:10', 1, '2023-04-04 22:00:00', '2023-04-05 14:07:36', '2023-04-05 14:07:36'),
(37, 37, '0', 1, '0', '', '19:18', 1, '2023-04-04 22:00:00', '2023-04-05 14:14:50', '2023-04-05 14:14:50'),
(38, 38, '0', 1, '0', '', '19:19', 1, '2023-04-04 22:00:00', '2023-04-05 14:16:33', '2023-04-05 14:16:33'),
(39, 39, '0', 0, '0', '', '23:25', 1, '2023-04-04 22:00:00', '2023-04-05 14:33:45', '2023-04-05 18:25:02'),
(40, 40, '0', 0, '0', '', '23:55', 1, '2023-04-04 22:00:00', '2023-04-05 18:53:16', '2023-04-05 18:55:02'),
(41, 41, '0', 0, '0', '', '23:58', 1, '2023-04-04 22:00:00', '2023-04-05 18:57:06', '2023-04-05 18:58:03'),
(42, 42, '0', 0, '0', '', '12:00', 1, '2023-04-05 22:00:00', '2023-04-05 18:59:16', '2023-04-05 19:00:03'),
(43, 43, '0', 0, '0', '', '00:04', 1, '2023-04-05 22:00:00', '2023-04-05 19:03:03', '2023-04-05 19:04:03'),
(44, 44, '0', 0, '0', '', '00:06', 1, '2023-04-05 22:00:00', '2023-04-05 19:06:08', '2023-04-05 19:07:03'),
(45, 45, '0', 0, '0', '', '00:12', 1, '2023-04-05 22:00:00', '2023-04-05 19:11:15', '2023-04-05 19:12:02'),
(46, 46, '0', 0, '0', '', '00:48', 1, '2023-04-05 22:00:00', '2023-04-05 19:17:03', '2023-04-05 19:48:03'),
(47, 47, '0', 0, '0', '', '00:52', 1, '2023-04-05 22:00:00', '2023-04-05 19:51:09', '2023-04-05 19:52:03'),
(48, 48, '0', 0, '0', '', '00:55', 1, '2023-04-05 22:00:00', '2023-04-05 19:54:55', '2023-04-05 19:55:03'),
(49, 49, '0', 0, '0', '', '01:00', 1, '2023-04-05 22:00:00', '2023-04-05 19:59:08', '2023-04-05 20:00:03'),
(50, 50, '0', 1, '0', '', '01:05', 1, '2023-04-05 22:00:00', '2023-04-05 20:03:50', '2023-04-05 20:04:43'),
(51, 51, '0', 0, '0', '', '01:28', 1, '2023-04-05 22:00:00', '2023-04-05 20:18:20', '2023-04-05 20:27:02'),
(52, 52, '0', 0, '0', '', '01:35', 1, '2023-04-05 22:00:00', '2023-04-05 20:34:21', '2023-04-05 20:35:02'),
(53, 53, '0', 0, '0', '', '01:38', 1, '2023-04-05 22:00:00', '2023-04-05 20:37:31', '2023-04-05 20:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `time_zone`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'tester account', 'test@test.com', NULL, '$2y$10$YOmJG5H7YqAicgnYlQdUfuPYri428Q66.Z0VX4M7LToUiJayOYjyq', '201026051966', 'Africa/Cairo', NULL, '2023-02-12 03:47:30', '2023-02-16 17:37:53'),
(6, 'tester account', 'mo@gmail.com', NULL, '$2y$10$tcnw4ONi32n46JPhbMwPY.v7IpwraGRD777ki15JdlGCq23yrpix6', '201026051966', 'Africa/Cairo', NULL, '2023-02-12 17:37:54', '2023-02-13 01:11:28'),
(7, 'Andrew', 'hiandrew@andrewazmi.com', NULL, '$2y$10$6RbK7J/rt00ao4Dzuyy/6eADmE2e5AODq.u6UtQ1CLBUiR0lpVX0.', '0971553476132', 'Asia/Dubai', NULL, '2023-02-12 17:39:51', '2023-03-15 00:28:49'),
(8, 'tester account', 'andrewazmigendi@gmail.com', NULL, '$2y$10$Fmn.Vk.oQZ7nBETULAMoMO0EpObgkZPEre7NBIfVIrOaB5Wa46MB6', '097553476132', 'Asia/Riyadh', NULL, '2023-02-12 17:45:27', '2023-04-05 18:18:32'),
(9, 'mohamed22', 'devo@gmail.com', NULL, '$2y$10$Dg0GADSQAY1DxHACdWbCk./zmWMolwlWIn3E82zE5Rth2MFCqL/Lm', '201026051966', 'Africa/Cairo', NULL, '2023-02-12 23:08:12', '2023-02-12 23:08:12'),
(10, 'Andrew Azmi', 'iandrewazmi@gmail.com', NULL, '$2y$10$O.nz2.g7XG0Wdebcelu.lumgPj4rM1KBsRzmBg7UxlyQcvIRXZllC', '0977553476132', 'Asia/Dubai', NULL, '2023-03-26 13:28:39', '2023-03-26 13:28:39'),
(11, 'moh', 'dev.mohrad@gmail.com', NULL, '$2y$10$OAgvsUAG3XgXoh4jGEuL1.8YjMGfR8b/qTzA2MTD2PRDQbgC2lPAi', '01006751551', 'Europe/Paris', NULL, '2023-03-28 00:20:47', '2023-03-28 00:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `zid_authorizes`
--

CREATE TABLE `zid_authorizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci,
  `token_type` text COLLATE utf8mb4_unicode_ci,
  `expires_in` text COLLATE utf8mb4_unicode_ci,
  `authorization` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zid_authorizes`
--

INSERT INTO `zid_authorizes` (`id`, `user_id`, `access_token`, `token_type`, `expires_in`, `authorization`, `refresh_token`, `created_at`, `updated_at`) VALUES
(10, 8, 'eyJpdiI6IjRZYk1TdG9Jd2xNdElaeXJYOTFJNVE9PSIsInZhbHVlIjoiM3FyaWY3TUduL3I0b09VdEpKNWZBVDJGZXlOdDY3czhoanBoamFUb2tvWDZsZ3pSL2FxdVFJcmJ0eTdQMFg1V210YWVrT3BBY2d6UFZLQWNjWnFiZWxIa2krWGZLdEdSeVdXSHVEQlRkbHBseEhiY3UxRENheXFsQ0dGMWR0blljazZzNGlXbWljMTFPQ2NRMHFSSTl6a1dNMVhsT3VTZmRNb1lnZG1KZG0vU29GY3orWUxad3dkQnNFV1IraVlpcE9CMlV6MEV0QnlpQXB2T0NvQ1JIMU9GeGdqZjMzU0xzMzdGenpGd0Y1ND0iLCJtYWMiOiI4NjMwMWY1YjBlYzliNWZhZWY2ZTg1NzM4NWMyY2JiZjMxYzBlZmYzMjRhNTI0NTkyMjZlYTdiY2Q5MjIwMTg4IiwidGFnIjoiIn0=', 'Bearer', '31622400', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiYTVkYjNiNDU5ZTc4YThjODdhM2QxYWNiYmRkZTZiN2U1YjNkODgzYWEyMTYxMjAyYzFkNmExMDYxOGI3MTNkN2E5OTI0OGJjZDc1YjUyNmMiLCJpYXQiOjE2ODAzMDcyMDYuMDM3NjkzLCJuYmYiOjE2ODAzMDcyMDYuMDM3Njk2LCJleHAiOjE3MTE5Mjk2MDYuMDI0NTY4LCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.mGkC3b_yrd8kWkTPcBF4WF65vjWQcRXNmKsdz34hLi721L8YkECgrQSjrtN4jYkcsgbz30TyqUXh-X0WtBvR__V1Pn592mRtCOSXBpacN-K9fV3bxoSAcD7I1ke-i8AClNOQHlCex2AnFgEKggpC71gmg0jAiATSwVj2o8RSdXyGQkuM5cF5adno0X3I1vLY-B34UuJKtvW-sal194IOYOwrT6kZyiJKc93078Wayp-vHZhhckFvyYO6LLdOlsYRvx4PEfqvCe5JkNHmm3LADJEmLoXBNEdFFWjQoXfLQ0QFWrQq3iOVV0TqmZPwAymYSABNMR4kP1WaDIRQ0zZDGh2OqW9ZmFa37Nk1EqZNK_9456tU7gga6e4389PXiL5vxxZm2YHfjnK2ka81IGnecNW5QM0J_Wbw3x7SCp6FogU5C9vsoaB30OTE3HF_9LQc7hC6WkVS_-0yC9hkezXilEUu6zjxnCWXVhhckSvYl4sN4fkrwKsB_khxCBJCf1r_L7aayLTnfmQ2Vjj0A4JkEzmd16PaFDRK5FRxG7ZfvifRxMlcStwFLSeMX9J6kdxbvr-iMrAcNCVLxsQ2LDQmxDGV0YywvK8nJjCehAgQaMCu13mqfftrD3tItPZfqj8t30cU7qxQFS2rkTmh5JREa6AR4SHSlAd4qBhIukeQemY', 'def502003af773d7706ca6634de0509ecb4f70b1148bd3ab2d4e8f0b679d2e8f88e6be22c393c190c523c315ea732e24c078466bc047de11e6463e65c25514aec4e439ff2a48bfb8620f8d0087dd5ca7c8773a23fda23a8f932c9536779ef87cf86802df8d146b972639f78f9abeb1f876c55a92f3c4d78aad75256f4667ba6d4a667dae44805266071aed56ee65291d756304904386fcb78447ce175f06ebb92fc653e6c16263465b8c5d1a531a9f7b84a6166cdef332c513ce3a5b31250b51d524a68ac0ea35aa9fc9133cfa95c492cdc299f7c198f625b1f5ff6a7ddc4bddc0e98f5573e6a3e6f41e11a356c97eee1b59d82ce643ab20f0dea1764306d29311658968237f9771745f6a0c7acd33b921007acdce827efad056859b042b293fb4a700c53229c2f983b7da578003fdc86d51ab104ccdf337572c7abf140215620b6260f9167e60bb84b9488ae5efa37835dac3b4d09bc106f3de6c0a8579e8343fc51f1ffec64b9f9a04b586b6ba2defb6de894a66018cf24aa868881fd6345b5fd746a10d5c09397594c0c929bd55ae53a53624f50e1afc90e4ec665e65b12317a7c77e561341d1550b72372e5a73f8f4213e357cbf0df37b2d5b98eb80b6fcf30aaf5f440e083b130bf2b502b97ebd12de742c2b01c56ee6cf22fff3873444701a3480133f5a4796922f53ce41efe8e73de5f8010dd27e55c4580dd4068df0e0bbed8dd3e3c2ccee00d6356252f01bd6c9af6dc31ab0e7e5e3a7433a2d3ea10c57d10e10189d1908d9fac6bc5c382216957d5ac20e7a1b9123c54cb69b1822aceb50e6933b9f3978298418a98763818960a32678f1fcf4afc7d9853fe40737babcb5f0ac96a72df5efd21db32e4be11c2df56ea95dd5fccc250042ee3cd5d3de64241b53419f451f31a5de7322557378813e6055d2ef94c59ed07a5a58bf99d0f76cc05dc453f5f0352dfe72b0af0ea995b229a8b4131a620c08c11b89d781bd31a686103ffc0e44c7b4c880c2faa37d6c8e27fdd5999a1b6a0ccc5a7c54ae778a5213cb906929960276c5234ec741e2a0ffe430b7090efbd91c0645f58a93cecd0c5aa76e00fc67322f52c32551278ff43d45c4f1f6f470685138fecea7da7e12640097496a11486b5780a2eed722f7aca01ff1dd871dc01ec91c81f5d0836650fbf01a80fe360b74452cd29cffc2ed0bf2c2120333bf4fe31dc91ea9c2106d2be1900bad09c0b1eebbb2440629246bad9fc738a8d3dbda5e489d1fa0618effcc2d37560c713ae850', '2023-02-13 15:54:38', '2023-03-31 22:00:06'),
(11, 6, 'eyJpdiI6Inp6MUJLR2wxb1MyNkI5OHN0TXpKbnc9PSIsInZhbHVlIjoieUdlK3RjTkRQL3BwNE5FY1BxZENQZGVNRFRVay94UHNCNUdyVDJHbjJKU3gwaHdmd095WlFLODhpdWoxKzBrYTdLZ2ZtNmU3azlQeGxHMFE5QXpZcHpVMUNFU205NTkrbWJxSFJFZUlDaGh4WG9rOUtxdDMvVmJjajJ0eUFIT3VCdHp5L3VFS3ZxSjBHS3h3R3Bjdk5BTGdFVk80TGpONDFXcnM2by9qTWpQZU54NTVvOGErLzB5dks5QnVaY1haT3Q5UEx6YnkxMGZ2MXF2ZnljQ1cycFMyS3FYcVNqaThTSkFTdiszK2d0ND0iLCJtYWMiOiJkMWYwZTZhYWM5ZmU1ODBlZjYxNTk5NGQ3NzM2ZjI0NjNlMzY3OTMxNDdhNmQzYzZiNTdkZmU5ODhiNzcwZmMyIiwidGFnIjoiIn0=', 'Bearer', '31536000', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiZjZjNjZjNTIyZDkyYWVlZjE2ZjRmZGZjMTI4NmVmNzMxOTE2MTRmMzFmZWQyY2RkMjQ0MDYxZTAzZTFmYWNhYmY1YTQzNDc3NWI0NTBlYmQiLCJpYXQiOjE2NzYyODIwNzguMDUwMjkzLCJuYmYiOjE2NzYyODIwNzguMDUwMjk2LCJleHAiOjE3MDc4MTgwNzguMDA0OTgyLCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.aMpM3XYJBWYZoFQ54nMqqPIhu6BHdQcaP_elR7eEi6ATYEapyjN6fUsvJQ-sLL5KRj6FkD3iAbuoxs9-JEyjVOVGIlqIWIYYEUPkqTg57qHN6vfoV1xkQM6S7Hwrh_5Pr8__ICFQ78585hLkkD1JDxGsLoKdwB_dwVhgkN8fNOD0OxRBOfrFijIbtOiEJsPndjgzJIdIHKQf7T6ywNTwUCPLFeaq_siPu7cidOSuDMZOMSa1qNTa2xzagFN_agRzVAd9yvlTWRVeLI-FdAVsz6VpxB0sD402z6YdsEpPzVPjGDELyNTV-JGGqgMaZ-L0i7_g5XSrBO0_GQ2WkNhfnEFXJpIDNTbSfGk1M2eFnbFD0us_6AKsgqLvbiDMMN9mdiE-PWo-oIXWuJBLcZ4HQEIUqwN60wybA-KJP60ZkeMtGZzwAXp948FUGFt0vh43ddtJWESDxB1PVxjipsKpgj-sZkjRgA38iViceE6ffcz38TFEdnjTBx8J5Q4zQwfOLIKCbJHW4zQgwn0UN8ApKrfwHstQzZotMouW_UnadXIrkh2yXp5G7fVLcsf2FIR9KC3UNxkDz7rItYcMfgIwcE_9u_VQfvZfk5OhTIcMpEDeUFePl-473GT1MuDRXARPifIP2DH46SPNzYUrwsJIDhpfEZ9ofKGOPbNbm0guM5w', 'def502001ef7bf467e81f77eb9c3c255fc9838b33d5eabb1840655fc1d388a669fae69ed038ceccaa6038925d6e3ae772dceb5763895dc0d2dfb0d018ea01bdec4c1cbbdf53173c472febd554737e2b4a98a69a3abe6ef1a51d5ea803befb2be7d8313a8986b89e4d01fc2b8afabcea7bec4d203d0d5db779fee8dac5186587633fbb7c077c2a18138846e74bf40eab52432b4cdb19afbe1a8fd579ecac5921e6cd8792c57f3007f62321c5722702952b29f3ec2596d15c3bd89f654009608211ed8115d305392fef3c4811499c7f6fab20f100f113073ae4a85aa517163709d02f3a57e682f234f3380d915eaba0915856c33babd1439a16c798630b2b2a7dab833ab82812a222da79bc1b52abfc0d4c60775da5db74264d743fa63711935cac6ad04fed43949935cf6c670d6b9b12dfcc4fdf6dd4bea3836ce4d586fa564373a25f77468b0c9a5c7b7a95fd9c983e0a31e3f1230d9a5386db3718487fa7e5840e94245f39807eea55b54cb300b6a717a9bd76895fdee27da5a25c7c1ce7c24016bbf05d5544d3f35a108706e955f6de7fc98223f8ac0c501f726c56b888a2870d692e87138fed25725088f1d80dae36b5124bf5780af6e7b6385c515be758d6d0a7c34f6c22d1bfecc99973ac2163639621b9c9dc0c276c96e37cecd58b5806314c85bc3206f8efe39e97ffdaf0e5ff4c6819fd82cf1fe2d0f84b63320512c2ddd230c8f837def455c95fbe2ab62c502cbd59d63f96b302557f5b217fe098732f2bff00e17173202361e131c34c3d20aaa4b807cf3cebdd174172a42f714a45f37a97d18c85843536de8508c3e6378d60d0fc16191be50e3b3c0accd3f9925bef28121ec5fec0ba9ea0fceef8e1a1433de3c504d3ee10f369d200360e415abe3f19e1780e1b528f493864c074805507fb4624fab36372e88c063f848c35e5363d74a719b482d076457d5e626e924af1dbc3d212ff1dc0052b09929489ad2f226cd58258e1d0863337685ca7c3e24af70755741fa969c4549be5c555e7becd801f9e5dad95aeea002d3db453fd080628835e95654c82014c8c136fb574b1f8d19526c302586252617088c8d1ef044da463c8fe727dedade5090375770bf83e2d2137934dcc1bf3b718d3c3a4bbf2ba6958496390dc6ab3d9cff71b92bf291d222b2fe70a253a3bf1c19a928b327a45d12d9f10e730706ace04a5f8195450a21a66d817196f7df73a788247bc544e701a92734ef4fc8352c91168649f3e0d4f77d2af83a791e34eb84b8', '2023-02-13 15:54:38', '2023-02-13 15:54:38'),
(12, 5, 'eyJpdiI6IkRKTTNzcDdqR3hVOXFyK0wzQUFMMkE9PSIsInZhbHVlIjoiTjhHZG02M2YzZEFRaUVlVkRqVWRSSmlBbUV6STVybGV6ekdFeTQ0aHFWdWpiQjRTTi9YZVErSXVta3lacGg4R0ZVVFlLYU53WHhWM0NHSVhLSnBObTMxemdCamgrb1BNQktWUG1NM0ZyR1pabkh2VURMZDI4ajJRS2tlc2VycFo5OXp0eVFnaEhxRkhjdG04S1BaNUZGMVp3ZXl3VE9JMGpIOEttYjk1ZjVVVHF4VVpCNEtleVpCTDhqNU05eU9SZmZSRWUyeE5lQk1rK3JOa1A5SlV3ZjhhaWxESXZPMUZWQ0M3UWl0aG5maz0iLCJtYWMiOiJjYmIzODlmYjhiYzUxZTJkY2RmNDc0ZDFlNjQ5NGE3MTQ2Zjg4MzNlNmNkNGI5NGM0MDJhYjYyYjY0OTA4ZDI5IiwidGFnIjoiIn0=', 'Bearer', '31622400', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiNTk4ZWJmY2EyOWFjZGMzZjY5YWNkZGYzOTNiM2UwYmFiYWQwZmMzMDYzZTRmZTVjNzJkNzEzNTRlNjdmZTcxMmQ3NWNjZmZkNTU3YjU4NTQiLCJpYXQiOjE2ODAzMDcyMDMuOTc2MzcyLCJuYmYiOjE2ODAzMDcyMDMuOTc2Mzc1LCJleHAiOjE3MTE5Mjk2MDMuOTUzMDA2LCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.f2NRB4rJ_q83-d9Qa7asEQHvQ5Q40UnUbhxYevaUqWL-UDpLx_cmmiE7TnAje6dxuQfENvABbIdTjOvcR-ON5z-3ZpQCMSwhf0eVnwvEv56f2VRjQ_PvvSXahtKKGhqD4EhEovXjV4UuiAGSrPrRi75LiPXQBdbwSSG66pagKOdjvoLBV07ot8y61OGT95rpDrAAfQJ8dDa8Q7IRL3SG4AJ-YS7l366ZOPal5nMsl02ZPxnOTxK6L7LBGeP0mH_9vU7_hrghK4NyPpRE4l9FOlAr8qrOfAsocNC9HT-clNrCvbkHo47lsiu8olb-KRrbOGSqnGLOTGlSFdMKdLAlyzI-N_ag6gpyWb7QbNaOz9_6W058xWvCz7IoYEyEPA3WVxKpN6PojohvxAdoZ4FOhDk2VdpPICbEq7bfO_xCM2UEy_X6oXD6Uhn43kkyZIXwLAT5cAC5o25TYcFUzPoLWlqJzN733nwpZZeRsLExaKYD2_mgCfHxltUxnBR7Jcm6VU3Xyey8adraw0ibDdHb5GErxVcSmPH0SIE25CN0Qi3wZEY82JGtCU7PL5jSzSAGUxJSJzKPAvNf8-QfHEo07YJl56Cue99Sg5i4ptyt8zSIYS6TWCgXQTsrgduFp5Iq6Id2Yc-Odkm1WczK20iDz1SUrEavaywNbUelKo9QcGc', 'def50200ddcf12219494179b357a1bbbe5ca3a8b3659de6eeb3a3366553963fd4b11eca7131865769e0185eaa4d9da9937bdb59815ae25d0be5b740aa544e9eb7981c025f99eeabe840166302e8f39ab9c6403e563dca22627a6cb61f306d9713c5aa641be57e665d6b7f126a5a8dd3e891b2b48e3d5d14582245edce3cd7ef57a7e2eb3820d543a627952b7fec79f038cb7180674a3999b968a3bcada9b9af30759c180e310e97c75d02040af87a0acb3efef9d826c1070299a07635984d97db184a659c015ecbceec5fc729d3a001583baee61eabba450aad0bd66b71a87c9fd61a6c5e53ad72b2cd3cdf9214e034945c922f6620b09ab1afde8d6ed8aabb3ccda97c85dd6c6a4c058e46ce7c3e3703764bb500986880189052de7835090895c8a2f25b6ff6bb2fc0d21662018aed36ffc202ce17c1264aef22f383084657a2de101674a75315019012932d9349627585d75e165121954262749247039391ea102a42135a383f5ec4403efed6063d250056f58522afe5d539e5d629dd2c6666c5f408e546714353a39bfa17ab52bb7499b4bd9689742114df10bc58bf113d64aa93bf011f2cfdb50dc17fe5192415bd2da4d82f2ad657b88293081564c3467b62d4fdc64d5bae4713bd4d3d2ac2b744f3a4eab65e326fca4f382b1fe7f0d68d0cfa136be947eaa10722815ec4c783698beaf69b2417c19626127118097357a1d02be0a8caa36b7bf4920619b0dd48624c2bd6480b09fde4b458b2a60022daeea3597ce3844a5ddb11cb30ec957b4431c768cc05154e1fee1e8a03ce1bfb6124b4e137afe8417ff1a35ceb892d726fb76ea76d61a6682b65e0682be784ea383c57813d40b6716071e984e6841eedfe2b978c41689b6d9ebb8e68122e168aa6f14092aa481c102eac35244c8b259e1d52d17406b46030a0bfead70760742448e9bd0c151fa7fb3e919f97e9318be96d78baa3b0b704c49298c762d74733cb4769c2286be713c5d964ae9740ef7593540b35ff5bcae51d54f54f1380ccf2ead201973eaaa70c0fa37561035de12cdb00ac45d68c63b95a9cbcaf95d1fdaf8cdd1045ab245eeb54f344b270aaca7fcbefa0b79ce39593ef3d71e836e21f557f76bac87465d06ad8a60e0cfecabdcb4c99dceb1b1ee6ced7382c744a7076849576a86ad19b3e4cb51381b102bae995a3f5ebd12086865d3e0459ece777bc8e847046d2e817e1b8e71ee22b2883634800526e5105488696bb35542a0cc67453439205838eb41039f46835242', '2023-02-13 15:54:38', '2023-03-31 22:00:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_user_id_foreign` (`user_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `zid_authorizes`
--
ALTER TABLE `zid_authorizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid_authorizes_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1855;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zid_authorizes`
--
ALTER TABLE `zid_authorizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
