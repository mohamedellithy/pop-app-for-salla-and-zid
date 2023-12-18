-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 18 مارس 2023 الساعة 10:16
-- إصدار الخادم: 5.7.23-23
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saleeoup_test`
--

-- --------------------------------------------------------

--
-- بنية الجدول `attachments`
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
-- إرجاع أو استيراد بيانات الجدول `attachments`
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
(21, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'الترميزات', '619517', '2023-02-13 01:22:40', '2023-02-13 01:22:40'),
(22, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'المنتجات', '619518', '2023-02-13 01:22:41', '2023-02-13 01:22:41'),
(23, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'جديد', '621399', '2023-02-13 01:22:43', '2023-02-13 01:22:43'),
(24, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'Test', '621495', '2023-02-17 07:35:07', '2023-02-17 07:35:07'),
(25, '2e24a91d-075f-48e0-8e2d-c59f6eb58007', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:08', '2023-02-17 07:35:08'),
(26, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'Test', '621495', '2023-02-17 07:35:11', '2023-02-17 07:35:11'),
(27, '1b86301f-d3c2-418f-82a1-10c21d59338d', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:12', '2023-02-17 07:35:12'),
(28, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'Test', '621495', '2023-02-17 07:35:15', '2023-02-17 07:35:15'),
(29, 'd87232c8-30f9-4671-8040-f92f4feb22eb', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:17', '2023-02-17 07:35:17'),
(30, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'Test', '621495', '2023-02-17 07:35:20', '2023-02-17 07:35:20'),
(31, 'a2c7d5bf-f84c-44d5-92b8-5f0c0ce2a805', 'الخاصة الخاصة', '624052', '2023-02-17 07:35:21', '2023-02-17 07:35:21');

-- --------------------------------------------------------

--
-- بنية الجدول `campaigns`
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
-- إرجاع أو استيراد بيانات الجدول `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `name`, `description`, `type_set`, `action`, `status`, `progress`, `deleted_at`, `created_at`, `updated_at`) VALUES
(16, 8, 'test delete product', NULL, 0, '1', 1, 0, NULL, '2023-02-12 17:51:00', '2023-02-12 17:51:00'),
(17, 8, 'test', NULL, 0, '0', 0, 0, '2023-02-12 18:35:16', '2023-02-12 17:52:39', '2023-02-12 18:35:16'),
(18, 8, 'test 1234', NULL, 0, '0', 0, 0, '2023-02-12 18:35:19', '2023-02-12 17:53:36', '2023-02-12 18:35:19'),
(19, 6, 'tester2', NULL, 0, '4', 1, 0, NULL, '2023-02-12 17:59:50', '2023-02-13 05:11:20'),
(20, 8, 'test publish product', NULL, 0, '0', 1, 0, NULL, '2023-02-12 18:35:08', '2023-02-12 18:35:08'),
(21, 8, 'Test Product Add Tags', NULL, 0, '4', 1, 0, '2023-02-13 16:44:56', '2023-02-12 18:54:59', '2023-02-13 16:44:56'),
(22, 5, 'test3455', NULL, 0, '0', 1, 0, NULL, '2023-02-12 19:39:47', '2023-02-12 19:39:47'),
(23, 6, 'bnb', NULL, 1, '2', 1, 0, NULL, '2023-02-13 07:40:54', '2023-02-13 07:41:10'),
(24, 8, 'Test Change product Price', NULL, 0, '3', 1, 0, NULL, '2023-02-13 16:44:45', '2023-02-13 16:44:45'),
(25, 8, 'Test Discount cancel', NULL, 0, '6', 1, 0, NULL, '2023-02-13 19:01:37', '2023-02-13 19:01:37'),
(26, 8, 'Test price discount', NULL, 0, '2', 1, 0, NULL, '2023-02-13 20:14:05', '2023-02-13 20:14:05'),
(27, 6, 'انشاء حملة جدولة جديدة لنشر المنتجات', NULL, 0, '0', 1, 0, NULL, '2023-02-16 17:52:41', '2023-02-16 17:52:41'),
(28, 6, 'اختبار التخفيضات بالنسبة', NULL, 0, '2', 1, 0, NULL, '2023-02-17 01:57:32', '2023-02-17 01:57:32');

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
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
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
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
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `personal_access_tokens`
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
-- إرجاع أو استيراد بيانات الجدول `personal_access_tokens`
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
(86, 'App\\Models\\User', 8, 'authToken', '481fee853d1f03f3896d6d5e9aba3e81261359ee058734777a94b72090b2d6af', '[\"*\"]', NULL, '2023-03-16 04:02:59', '2023-03-16 04:02:59');

-- --------------------------------------------------------

--
-- بنية الجدول `products`
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
-- إرجاع أو استيراد بيانات الجدول `products`
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
(1769, 28, '1b86301f-d3c2-418f-82a1-10c21d59338d', 0, '20', 'percentage', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `schedules`
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
-- إرجاع أو استيراد بيانات الجدول `schedules`
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
(28, 28, 'daily', NULL, '0', '', '22:26', 0, '2023-02-16 06:00:00', '2023-02-17 01:57:32', '2023-02-17 02:25:19');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
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
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `time_zone`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'tester account', 'test@test.com', NULL, '$2y$10$YOmJG5H7YqAicgnYlQdUfuPYri428Q66.Z0VX4M7LToUiJayOYjyq', '201026051966', 'Africa/Cairo', NULL, '2023-02-12 03:47:30', '2023-02-16 17:37:53'),
(6, 'tester account', 'mo@gmail.com', NULL, '$2y$10$tcnw4ONi32n46JPhbMwPY.v7IpwraGRD777ki15JdlGCq23yrpix6', '201026051966', 'Africa/Cairo', NULL, '2023-02-12 17:37:54', '2023-02-13 01:11:28'),
(7, 'Andrew', 'hiandrew@andrewazmi.com', NULL, '$2y$10$6RbK7J/rt00ao4Dzuyy/6eADmE2e5AODq.u6UtQ1CLBUiR0lpVX0.', '0971553476132', 'Asia/Makassar', NULL, '2023-02-12 17:39:51', '2023-03-15 00:28:49'),
(8, 'tester account', 'andrewazmigendi@gmail.com', NULL, '$2y$10$pVxbd5fGtR8ANSCUzCos5eldBLxhh0VK2wmA/cZU3IO6uGzn2Q3tG', '097553476132', 'Asia/Makassar', NULL, '2023-02-12 17:45:27', '2023-02-14 05:41:05'),
(9, 'mohamed22', 'devo@gmail.com', NULL, '$2y$10$Dg0GADSQAY1DxHACdWbCk./zmWMolwlWIn3E82zE5Rth2MFCqL/Lm', '201026051966', 'Africa/Cairo', NULL, '2023-02-12 23:08:12', '2023-02-12 23:08:12');

-- --------------------------------------------------------

--
-- بنية الجدول `zid_authorizes`
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
-- إرجاع أو استيراد بيانات الجدول `zid_authorizes`
--

INSERT INTO `zid_authorizes` (`id`, `user_id`, `access_token`, `token_type`, `expires_in`, `authorization`, `refresh_token`, `created_at`, `updated_at`) VALUES
(10, 8, 'eyJpdiI6Inp6MUJLR2wxb1MyNkI5OHN0TXpKbnc9PSIsInZhbHVlIjoieUdlK3RjTkRQL3BwNE5FY1BxZENQZGVNRFRVay94UHNCNUdyVDJHbjJKU3gwaHdmd095WlFLODhpdWoxKzBrYTdLZ2ZtNmU3azlQeGxHMFE5QXpZcHpVMUNFU205NTkrbWJxSFJFZUlDaGh4WG9rOUtxdDMvVmJjajJ0eUFIT3VCdHp5L3VFS3ZxSjBHS3h3R3Bjdk5BTGdFVk80TGpONDFXcnM2by9qTWpQZU54NTVvOGErLzB5dks5QnVaY1haT3Q5UEx6YnkxMGZ2MXF2ZnljQ1cycFMyS3FYcVNqaThTSkFTdiszK2d0ND0iLCJtYWMiOiJkMWYwZTZhYWM5ZmU1ODBlZjYxNTk5NGQ3NzM2ZjI0NjNlMzY3OTMxNDdhNmQzYzZiNTdkZmU5ODhiNzcwZmMyIiwidGFnIjoiIn0=', 'Bearer', '31536000', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiZjZjNjZjNTIyZDkyYWVlZjE2ZjRmZGZjMTI4NmVmNzMxOTE2MTRmMzFmZWQyY2RkMjQ0MDYxZTAzZTFmYWNhYmY1YTQzNDc3NWI0NTBlYmQiLCJpYXQiOjE2NzYyODIwNzguMDUwMjkzLCJuYmYiOjE2NzYyODIwNzguMDUwMjk2LCJleHAiOjE3MDc4MTgwNzguMDA0OTgyLCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.aMpM3XYJBWYZoFQ54nMqqPIhu6BHdQcaP_elR7eEi6ATYEapyjN6fUsvJQ-sLL5KRj6FkD3iAbuoxs9-JEyjVOVGIlqIWIYYEUPkqTg57qHN6vfoV1xkQM6S7Hwrh_5Pr8__ICFQ78585hLkkD1JDxGsLoKdwB_dwVhgkN8fNOD0OxRBOfrFijIbtOiEJsPndjgzJIdIHKQf7T6ywNTwUCPLFeaq_siPu7cidOSuDMZOMSa1qNTa2xzagFN_agRzVAd9yvlTWRVeLI-FdAVsz6VpxB0sD402z6YdsEpPzVPjGDELyNTV-JGGqgMaZ-L0i7_g5XSrBO0_GQ2WkNhfnEFXJpIDNTbSfGk1M2eFnbFD0us_6AKsgqLvbiDMMN9mdiE-PWo-oIXWuJBLcZ4HQEIUqwN60wybA-KJP60ZkeMtGZzwAXp948FUGFt0vh43ddtJWESDxB1PVxjipsKpgj-sZkjRgA38iViceE6ffcz38TFEdnjTBx8J5Q4zQwfOLIKCbJHW4zQgwn0UN8ApKrfwHstQzZotMouW_UnadXIrkh2yXp5G7fVLcsf2FIR9KC3UNxkDz7rItYcMfgIwcE_9u_VQfvZfk5OhTIcMpEDeUFePl-473GT1MuDRXARPifIP2DH46SPNzYUrwsJIDhpfEZ9ofKGOPbNbm0guM5w', 'def502001ef7bf467e81f77eb9c3c255fc9838b33d5eabb1840655fc1d388a669fae69ed038ceccaa6038925d6e3ae772dceb5763895dc0d2dfb0d018ea01bdec4c1cbbdf53173c472febd554737e2b4a98a69a3abe6ef1a51d5ea803befb2be7d8313a8986b89e4d01fc2b8afabcea7bec4d203d0d5db779fee8dac5186587633fbb7c077c2a18138846e74bf40eab52432b4cdb19afbe1a8fd579ecac5921e6cd8792c57f3007f62321c5722702952b29f3ec2596d15c3bd89f654009608211ed8115d305392fef3c4811499c7f6fab20f100f113073ae4a85aa517163709d02f3a57e682f234f3380d915eaba0915856c33babd1439a16c798630b2b2a7dab833ab82812a222da79bc1b52abfc0d4c60775da5db74264d743fa63711935cac6ad04fed43949935cf6c670d6b9b12dfcc4fdf6dd4bea3836ce4d586fa564373a25f77468b0c9a5c7b7a95fd9c983e0a31e3f1230d9a5386db3718487fa7e5840e94245f39807eea55b54cb300b6a717a9bd76895fdee27da5a25c7c1ce7c24016bbf05d5544d3f35a108706e955f6de7fc98223f8ac0c501f726c56b888a2870d692e87138fed25725088f1d80dae36b5124bf5780af6e7b6385c515be758d6d0a7c34f6c22d1bfecc99973ac2163639621b9c9dc0c276c96e37cecd58b5806314c85bc3206f8efe39e97ffdaf0e5ff4c6819fd82cf1fe2d0f84b63320512c2ddd230c8f837def455c95fbe2ab62c502cbd59d63f96b302557f5b217fe098732f2bff00e17173202361e131c34c3d20aaa4b807cf3cebdd174172a42f714a45f37a97d18c85843536de8508c3e6378d60d0fc16191be50e3b3c0accd3f9925bef28121ec5fec0ba9ea0fceef8e1a1433de3c504d3ee10f369d200360e415abe3f19e1780e1b528f493864c074805507fb4624fab36372e88c063f848c35e5363d74a719b482d076457d5e626e924af1dbc3d212ff1dc0052b09929489ad2f226cd58258e1d0863337685ca7c3e24af70755741fa969c4549be5c555e7becd801f9e5dad95aeea002d3db453fd080628835e95654c82014c8c136fb574b1f8d19526c302586252617088c8d1ef044da463c8fe727dedade5090375770bf83e2d2137934dcc1bf3b718d3c3a4bbf2ba6958496390dc6ab3d9cff71b92bf291d222b2fe70a253a3bf1c19a928b327a45d12d9f10e730706ace04a5f8195450a21a66d817196f7df73a788247bc544e701a92734ef4fc8352c91168649f3e0d4f77d2af83a791e34eb84b8', '2023-02-13 15:54:38', '2023-02-13 15:54:38'),
(11, 6, 'eyJpdiI6Inp6MUJLR2wxb1MyNkI5OHN0TXpKbnc9PSIsInZhbHVlIjoieUdlK3RjTkRQL3BwNE5FY1BxZENQZGVNRFRVay94UHNCNUdyVDJHbjJKU3gwaHdmd095WlFLODhpdWoxKzBrYTdLZ2ZtNmU3azlQeGxHMFE5QXpZcHpVMUNFU205NTkrbWJxSFJFZUlDaGh4WG9rOUtxdDMvVmJjajJ0eUFIT3VCdHp5L3VFS3ZxSjBHS3h3R3Bjdk5BTGdFVk80TGpONDFXcnM2by9qTWpQZU54NTVvOGErLzB5dks5QnVaY1haT3Q5UEx6YnkxMGZ2MXF2ZnljQ1cycFMyS3FYcVNqaThTSkFTdiszK2d0ND0iLCJtYWMiOiJkMWYwZTZhYWM5ZmU1ODBlZjYxNTk5NGQ3NzM2ZjI0NjNlMzY3OTMxNDdhNmQzYzZiNTdkZmU5ODhiNzcwZmMyIiwidGFnIjoiIn0=', 'Bearer', '31536000', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiZjZjNjZjNTIyZDkyYWVlZjE2ZjRmZGZjMTI4NmVmNzMxOTE2MTRmMzFmZWQyY2RkMjQ0MDYxZTAzZTFmYWNhYmY1YTQzNDc3NWI0NTBlYmQiLCJpYXQiOjE2NzYyODIwNzguMDUwMjkzLCJuYmYiOjE2NzYyODIwNzguMDUwMjk2LCJleHAiOjE3MDc4MTgwNzguMDA0OTgyLCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.aMpM3XYJBWYZoFQ54nMqqPIhu6BHdQcaP_elR7eEi6ATYEapyjN6fUsvJQ-sLL5KRj6FkD3iAbuoxs9-JEyjVOVGIlqIWIYYEUPkqTg57qHN6vfoV1xkQM6S7Hwrh_5Pr8__ICFQ78585hLkkD1JDxGsLoKdwB_dwVhgkN8fNOD0OxRBOfrFijIbtOiEJsPndjgzJIdIHKQf7T6ywNTwUCPLFeaq_siPu7cidOSuDMZOMSa1qNTa2xzagFN_agRzVAd9yvlTWRVeLI-FdAVsz6VpxB0sD402z6YdsEpPzVPjGDELyNTV-JGGqgMaZ-L0i7_g5XSrBO0_GQ2WkNhfnEFXJpIDNTbSfGk1M2eFnbFD0us_6AKsgqLvbiDMMN9mdiE-PWo-oIXWuJBLcZ4HQEIUqwN60wybA-KJP60ZkeMtGZzwAXp948FUGFt0vh43ddtJWESDxB1PVxjipsKpgj-sZkjRgA38iViceE6ffcz38TFEdnjTBx8J5Q4zQwfOLIKCbJHW4zQgwn0UN8ApKrfwHstQzZotMouW_UnadXIrkh2yXp5G7fVLcsf2FIR9KC3UNxkDz7rItYcMfgIwcE_9u_VQfvZfk5OhTIcMpEDeUFePl-473GT1MuDRXARPifIP2DH46SPNzYUrwsJIDhpfEZ9ofKGOPbNbm0guM5w', 'def502001ef7bf467e81f77eb9c3c255fc9838b33d5eabb1840655fc1d388a669fae69ed038ceccaa6038925d6e3ae772dceb5763895dc0d2dfb0d018ea01bdec4c1cbbdf53173c472febd554737e2b4a98a69a3abe6ef1a51d5ea803befb2be7d8313a8986b89e4d01fc2b8afabcea7bec4d203d0d5db779fee8dac5186587633fbb7c077c2a18138846e74bf40eab52432b4cdb19afbe1a8fd579ecac5921e6cd8792c57f3007f62321c5722702952b29f3ec2596d15c3bd89f654009608211ed8115d305392fef3c4811499c7f6fab20f100f113073ae4a85aa517163709d02f3a57e682f234f3380d915eaba0915856c33babd1439a16c798630b2b2a7dab833ab82812a222da79bc1b52abfc0d4c60775da5db74264d743fa63711935cac6ad04fed43949935cf6c670d6b9b12dfcc4fdf6dd4bea3836ce4d586fa564373a25f77468b0c9a5c7b7a95fd9c983e0a31e3f1230d9a5386db3718487fa7e5840e94245f39807eea55b54cb300b6a717a9bd76895fdee27da5a25c7c1ce7c24016bbf05d5544d3f35a108706e955f6de7fc98223f8ac0c501f726c56b888a2870d692e87138fed25725088f1d80dae36b5124bf5780af6e7b6385c515be758d6d0a7c34f6c22d1bfecc99973ac2163639621b9c9dc0c276c96e37cecd58b5806314c85bc3206f8efe39e97ffdaf0e5ff4c6819fd82cf1fe2d0f84b63320512c2ddd230c8f837def455c95fbe2ab62c502cbd59d63f96b302557f5b217fe098732f2bff00e17173202361e131c34c3d20aaa4b807cf3cebdd174172a42f714a45f37a97d18c85843536de8508c3e6378d60d0fc16191be50e3b3c0accd3f9925bef28121ec5fec0ba9ea0fceef8e1a1433de3c504d3ee10f369d200360e415abe3f19e1780e1b528f493864c074805507fb4624fab36372e88c063f848c35e5363d74a719b482d076457d5e626e924af1dbc3d212ff1dc0052b09929489ad2f226cd58258e1d0863337685ca7c3e24af70755741fa969c4549be5c555e7becd801f9e5dad95aeea002d3db453fd080628835e95654c82014c8c136fb574b1f8d19526c302586252617088c8d1ef044da463c8fe727dedade5090375770bf83e2d2137934dcc1bf3b718d3c3a4bbf2ba6958496390dc6ab3d9cff71b92bf291d222b2fe70a253a3bf1c19a928b327a45d12d9f10e730706ace04a5f8195450a21a66d817196f7df73a788247bc544e701a92734ef4fc8352c91168649f3e0d4f77d2af83a791e34eb84b8', '2023-02-13 15:54:38', '2023-02-13 15:54:38'),
(12, 5, 'eyJpdiI6IlFEd1BLS2twTEJzdFIzRVNGb2xtdHc9PSIsInZhbHVlIjoia0ZGbWdoRW51cXFoMm8wQVBqaWJkdnJCY3pmQ3U2QWNxak9mOUJJekZXWWZTWWJ2UisrcHhSdTNsaGIwZDF4RXkvbFNzM2RKK3VDazRBZUtaRzVtVEhHdW1TSkRST3Z5eDVlaXF2N3VrQURpbCt4UWd4ZHV4ek9YcHRyVStxTFJFeGg4UURnWXFmLzNwSHRHcTN6K2lCY3BiTXBZQXBOLzh0ejZROXV0c24wb1czaTBEODNQZDBBUVFzbVdyYmZ1V1RRaEkxdURsNEluZzRWQ1kzMHJlcHdDQTJaTU9JUzNaSWZUS0FXRXBJQT0iLCJtYWMiOiIyNjg4MWJlMGVjMTBiMTQxMzRjMTIyZjFiOTQ2ZDY4NjM0NWRjOWFhNjgwODgyMWE4M2FmOTk1YzBhOWJkZmRmIiwidGFnIjoiIn0=', 'Bearer', '31622400', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMzQ5IiwianRpIjoiYWYzYzU0ZDc1ZjU0ZmI2M2I5YjU2Yjg0YjQzNmVjYmQ4ODg0NTU5Y2M5MDA2MjVjNTA1NGNlMjcyYTg3Y2Q2YTlhOGFmZjdkNjY4MGY1ZTgiLCJpYXQiOjE2Nzc2Mjg4MjAuNDQ3MTIxLCJuYmYiOjE2Nzc2Mjg4MjAuNDQ3MTI0LCJleHAiOjE3MDkyNTEyMjAuNDI3NDkyLCJzdWIiOiIyNzY5OTgiLCJzY29wZXMiOlsidGhpcmRfYWNjb3VudF9yZWFkIiwidGhpcmRfdmF0X3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3JlYWQiLCJ0aGlyZF9jYXRlZ29yaWVzX3dyaXRlIiwidGhpcmRfY3VzdG9tZXJzX3JlYWQiLCJ0aGlyZF9jdXN0b21lcnNfd3JpdGUiLCJ0aGlyZF9vcmRlcl9yZWFkIiwidGhpcmRfb3JkZXJfd3JpdGUiLCJ0aGlyZF9jb3Vwb25zX3dyaXRlIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc19yZWFkIiwidGhpcmRfZGVsaXZlcnlfb3B0aW9uc193cml0ZSIsInRoaXJkX2FiYW5kb25lZF9jYXJ0c19yZWFkIiwidGhpcmRfcGF5bWVudF9yZWFkIiwidGhpcmRfd2ViaG9va19yZWFkIiwidGhpcmRfd2ViaG9va193cml0ZSIsInRoaXJkX3Byb2R1Y3RfcmVhZCIsInRoaXJkX3Byb2R1Y3Rfd3JpdGUiLCJ0aGlyZF9jb3VudHJpZXNfcmVhZCIsInRoaXJkX2NhdGFsb2dfd3JpdGUiLCJ0aGlyZF9zdWJzY3JpcHRpb25fcmVhZCIsInRoaXJkX2FjY291bnRfd3JpdGUiLCJ0aGlyZF9pbnZlbnRvcnlfcmVhZCIsInRoaXJkX2pzX3dyaXRlIiwidGhpcmRfY3JlYXRlX29yZGVyIl19.Jzs4TdALdK1R22-kk-UIhGJk59DsgnAKZSE6QvvxKYGjGUAtRvw94pPogEBE7kd9P56lyQmvJJKKUTDrzZps0N3boQJmyOmmLiE2TwOyL9SLIyOC0pVpJPKpmD2YXo3fUht-Z3qGrOYb9KqJlsBN1fTFWXdugJgYFhRFLkJk1qeLslk8dLrwf9Q-eVzRDSvRW2jj3LsWH8WUVuJZbtkARBtc9mbD3cbQMaoTyQ0AAv_SNa2ocUAW8hZqHYWh3_mulH2atNojF76X1w1GeiwZQBo35D3l3mQbd_FSfZ8xKzgL7hLmISehxnFloAw9myS0hVotslBPHKlJnH8Zov-gItZuBynnXatymyfHn3XLbrPl9HrFgF3evuxlSGUxh6ivlrL5F373PfGup5ZKrMoOL0aOoH-D5vvgoykPEnIF-To56sHVsux7fn21AaXChq9C74TDON9iKpn0B4XYkP5XMQHJPOT2iR_Cua3i26iAl0NZc363ZraDbff1-suB5uYubehoS-2qT05KLjRVuYuhK5a6KPd-YaDfF7HrLOg1Vz_WYO8rML_EKYTB17801l-ottR0bci09RjX2eeHPJ0zJ8yfesEfvcDao8HuhEkIAyP29Hm-p35yLmFdOPa5BXPBM7cWSQgOYlL2PXGfXhRRE4VPPfPeQVNu2R5nfLqtvPQ', 'def50200b2952eb3279272dc48a382d00e2c355cbee97950d1478c7ea39d09ae93179c12a4fcc0a762437a4fb4ece242b2491bd424088c8e81af1152a87581d8faa11fe546a16a0453bc8925d3b2996ef5dcd878000c6755f94ffa2b11e98280700def8fe37723597c4c97ffa7132547730ce7a1f1497d24f940ded7a1ad2ac34b4db2fc8569ed6a53684260a29cc8afbd9af5838ee68489df60398f4bfec9d5a9d001cd0f0b63e33f472e990462f6289deef2691540686a652093ecef9c92759787022112fcd594ec9d1d5abd3819c19d6f2877472dcd2ffa4ea38bf95dcbd3a75422bade787b70735e2c72d803a8a5f64e88faf1dc77fdf038d7a836e98adc419b857f3c65b969cd6c576da1f340a28d5c6b713ca949e0c527481106f0a732b75c2e8e9d0cf268ce298d11e9c0dc886bb08a523fc871ad7b6eb0bbcce10f7d0b1586e845dff68097b44455a59910a642d1f9e0f7c9bdae354cd82cf08fcf4ce3deca086be652a5a5a0ebd25eb18186d8deefe6ef09ce89cf922e675cc1af1f84df9c22d8bdb94e3f06f32616753e83490dc0ff87f8e6cbfedc42d9e08479319e09b520afff5a43b22c705f302d02b977bf7780208d9333935cf29287995707353fa511720b8a13da3c4efed994cee706c48c930050742e687c22be73145fdc8c5b6021c19c5c03c3af5ff10a0a9d5eb13297e205815ec926f87fbd7197a82a0b27f9db1b2fc0f3e12d68fa529390bb340ae03581eea739ef0cc270618757513dce5f92fb03464ca3ceca3bb4ad9bcc10e7ef56f554014e7a2516b578260a122deadc3c9664f0682bb93335305e3a7210323b2964c9fbfff0a3ea949116508efdbdc164537b5a4b95e9e9e77864cade18f038e9327b05d0b66a33cee53de85da2b1970f3bedc983a87266cf806484f99a3028b255d69ec2ce9e96abe6bd882101258745d9cb6080670e96d63860bb8d0fc17f8eb544a2f5e54b46edfc11a839ec2a8f1c1996227a680c3a4a96765fa5b30a0ae62094c42f237eabe60e5f27ba9c8fccbf7748f18b3f409c242f7d9b6fb6d247be75344ae77bc194b1fc24b422fc16e688782521696199c22f98c31d2e8d2dcd53304c16b4f022790d0e21111f0147f9c2a0d322d9594af735b5bf0f10d366e9f8fafc348f3dbafe53032614989fc3adfea8c91599168dfc2fb09d122e0e3a2d6c8996c1b6cfc44c7b558af0960f30591e936a1ec7c3982f6f9f891e4ac26206e34c179ee3d46712e774d04abab8a19c076ec719017c27', '2023-02-13 15:54:38', '2023-03-01 06:00:21');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1770;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zid_authorizes`
--
ALTER TABLE `zid_authorizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
