-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2024 at 10:47 PM
-- Server version: 10.4.11-MariaDB-log
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vo`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `label`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'Manager', 'Department for Manager', 1, '2024-06-29 05:41:29', '2024-06-29 05:41:29'),
(2, 'Admin', 'Department for Admin', 1, '2024-06-29 05:41:54', '2024-06-29 05:41:54'),
(3, 'HR', 'Department for HR', 1, '2024-06-29 05:42:23', '2024-06-29 05:42:23'),
(4, 'Finance', 'Department for Finance', 1, '2024-06-29 05:42:42', '2024-06-29 05:42:42'),
(5, 'Project department', 'Project department', 1, '2024-06-29 13:41:31', '2024-06-29 13:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `department_staff`
--

CREATE TABLE `department_staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_staff`
--

INSERT INTO `department_staff` (`id`, `staff_id`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 2, 3, NULL, NULL),
(5, 3, 4, NULL, NULL),
(13, 4, 4, NULL, NULL),
(14, 5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2024_05_23_011351_create_customers_table', 1),
(11, '2024_06_15_191225_create_files_table', 1),
(12, '2024_06_16_162048_create_categories_table', 1),
(13, '2024_06_16_192837_create_brands_table', 1),
(14, '2024_06_18_170808_create_products_table', 1),
(15, '2024_06_18_171923_create_product_variants_table', 1),
(16, '2024_06_18_173515_create_tags_table', 1),
(17, '2024_06_18_174938_create_product_tags_table', 1),
(18, '2024_06_19_191828_create_product_media_table', 1),
(19, '2024_06_25_191251_create_product_collections_table', 1),
(20, '2024_06_25_191618_create_collections_table', 1),
(21, '2024_06_29_060955_create_roles_table', 1),
(22, '2024_06_29_062549_create_permissions_table', 1),
(23, '2024_06_29_062650_create_staff_table', 1),
(24, '2024_06_29_063138_create_departments_table', 1),
(26, '2024_06_29_145401_create_role_permissions_table', 3),
(27, '2024_06_29_150600_create_permission_role_table', 4),
(28, '2024_06_29_153255_create_role_user_table', 5),
(29, '2024_06_29_163815_create_department_staff_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0107f09eb05d172bde44cb642b64ec487ec5b1b4d45660c53ceeee6f7fe56ed976b2a1d422a29a8c', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:09:33', '2024-06-29 06:09:33', '2025-06-29 12:39:33'),
('076e28b64c1214cc0ec467c9ed28632c6dae681ecec1e5cc255f3663a5f573fed34169b42b69d0bc', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:29:41', '2024-06-29 11:29:41', '2025-06-29 17:59:41'),
('0e9457bd2163ded3b6b86205344d266a0346568a88dc92cc263637002f136420c36e2bb91eff780c', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:08:23', '2024-06-29 06:08:23', '2025-06-29 12:38:23'),
('1a6f9e8bd264135b60bcdc7dbc0e4f6e1bf18eda0b80159e4eac11603426891ca84384faf052a53d', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:08:14', '2024-06-29 11:08:14', '2025-06-29 17:38:14'),
('25cb7270424ada447a3a05d142cba52abfd062f52ef69fb0fae29fa3b6980d1ee0e066a872a0a470', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:06:33', '2024-06-29 11:06:33', '2025-06-29 17:36:33'),
('3056e3ac01de5bf3b27b693f2a617c6698e325a24dd9ed8c49def5d6d1859dd7eb5ad72c778bee89', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 12:28:27', '2024-06-29 12:28:27', '2025-06-29 18:58:27'),
('30a05c5b34630d08133e75b76a4452ee86b733840c52b1b3959fe7de088ec85ddc72adcbabd7696c', 2, 1, 'user_api_token', '[]', 0, '2024-06-29 11:31:35', '2024-06-29 11:31:35', '2025-06-29 18:01:35'),
('3b307b4c5bd26708878c45b67177d304eb7d9696b5f475202374bcf315ee2062d3ae03d16cc0c526', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:04:56', '2024-06-29 11:04:56', '2025-06-29 17:34:56'),
('3bc8fddf4d525344aa627a2c87c130c289e7679dbefdec329952e66740185dce430ada3ed79a474f', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:08:02', '2024-06-29 11:08:02', '2025-06-29 17:38:02'),
('41f7d7181b4e87513b9631c56afc6827bf317545cab111b07113cbfcc9c646bf6bf9ee78139f0b1f', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:02:31', '2024-06-29 11:02:31', '2025-06-29 17:32:31'),
('42bbf6a0b168e3f1552a85c28153f64b4786323c250e0ad7e2b7c4aa3c1239d7bf1624cc4b6222ff', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:06:19', '2024-06-29 06:06:19', '2025-06-29 12:36:19'),
('44e88a48613915c857ca5b91471dd8b1d8b235f62f281a9bc8ae2bb0dc24f486272f3868d1431e50', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 14:03:41', '2024-06-29 14:03:41', '2025-06-29 20:33:41'),
('45461392597dcdc1af1407fb480dfcb093b3cd84048928f33be3af66f5f9eb12803b8d9ada906983', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 11:47:44', '2024-06-29 11:47:44', '2025-06-29 18:17:44'),
('47d36857d8e627cbd2e6924858fb594cc78eb6b7cc15ecf873a36349c65c514f9102a079e4249835', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:12:50', '2024-06-29 06:12:50', '2025-06-29 12:42:50'),
('4899253a7378878e2fff91e147efa686b17f0c9f4eb8e15f93833551d7d509455d569edaa2895ec2', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:03:39', '2024-06-29 11:03:39', '2025-06-29 17:33:39'),
('48a9744ddef2b560acc53e24d086aefb7ff86936a2df3c62126b6409b1de87607c419e0003fd7e25', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 10:50:52', '2024-06-29 10:50:52', '2025-06-29 17:20:52'),
('568bc3597171e100136a21a365cfc58e25c3c0129989a7bb3b8f022207e33c22aaa5045284777a44', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 11:49:23', '2024-06-29 11:49:23', '2025-06-29 18:19:23'),
('5ab2905a34e1f77aa141dd1d9baaf8bd4a71168e909f9b17ff166ff9b47b157ae1f8ef4a0357bb10', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:04:21', '2024-06-29 11:04:21', '2025-06-29 17:34:21'),
('5b356d29df1013bd4088b9bad192a60ea3248f0df8ed91d3fb0db5794ba826362ca020920e73160b', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:14:36', '2024-06-29 06:14:36', '2025-06-29 12:44:36'),
('72e89ca23aafaf82cb8b4a2cd5013dee32839aa30fef8c2f627047fa0171fabcd8159130be03b08a', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 12:29:50', '2024-06-29 12:29:50', '2025-06-29 18:59:50'),
('7335dc6e1796586482ed93b769ca64dd333b902a409e9aad07e141f62f30ea42bb7ab45a267ddd83', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:01:33', '2024-06-29 06:01:33', '2025-06-29 12:31:33'),
('78ad7cc388af490a143d42fd50f064ab938f36a6b7f393227c1ae7567b30e44fedf81a2d608621b5', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:11:53', '2024-06-29 06:11:53', '2025-06-29 12:41:53'),
('7d8e28a95d63c204a7f7e572a56dde86ed53e4b976785f68832a46d1caf2eed890cf08c7c51ee3e1', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:02:38', '2024-06-29 11:02:38', '2025-06-29 17:32:38'),
('87ee700f7df3d53f1605e50cc62b1cba9f0e2c7910cf2fe934aa0f0a846775d3df9993fce98c596b', 4, 1, 'user_api_token', '[]', 0, '2024-06-29 13:19:34', '2024-06-29 13:19:34', '2025-06-29 19:49:34'),
('899490e1f81f3c930635b319dc97d9b897d05f11f2d57114be79d1dc2712dc18f0adeb8b4eaaa47c', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:04:03', '2024-06-29 11:04:03', '2025-06-29 17:34:03'),
('8e9010ffd03865494b325978b2ac762632efe52d3dcace6ca16719d2067292adc93cd885af029e0a', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:01:15', '2024-06-29 11:01:15', '2025-06-29 17:31:15'),
('933e604bb87fe2c14d6ac6d66b5e8c22cc6b026e45c9a8f436a7dec4be5fdea6e5d70ce5386a4e58', 2, 1, 'user_api_token', '[]', 0, '2024-06-29 11:22:19', '2024-06-29 11:22:19', '2025-06-29 17:52:19'),
('9b17e567860bebc49e4146ea5cca268343ca7d0f03ffef2b0e93b6c1e527b6b0db73171dec20a1d1', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 11:49:48', '2024-06-29 11:49:48', '2025-06-29 18:19:48'),
('9f46c75fc04240bacd55ad31c0599f712c26e3df4225914bae050065bb00c281969e1d5c7c031f0e', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:16:02', '2024-06-29 06:16:02', '2025-06-29 12:46:02'),
('a362f16830ec48a2a0eac15b7d50b2e9d7b6bb2146eb384d90eb401384fcd7844c37c978b027e442', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 14:00:18', '2024-06-29 14:00:18', '2025-06-29 20:30:18'),
('a59a5d3207413be782324335e255aec36b7b743a57d019334530287f6643731adfcdab282f4d6f85', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 13:09:47', '2024-06-29 13:09:47', '2025-06-29 19:39:47'),
('ab4ddf24c88dc1a2e2f61cc889bf3949651be41e6d7d044c9163c9c78dcdce0d00a261c915d3635b', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:17:51', '2024-06-29 06:17:51', '2025-06-29 12:47:51'),
('ada82ee6f0e2dab38da36428c9ec36143193052203af53e3b86e4cbd004ea6b79bcbcfe4b87e49e6', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:15:17', '2024-06-29 06:15:17', '2025-06-29 12:45:17'),
('af24916a1c1ff7e76a1e7bdafea118b3aad5892096b55dd8b6e8f870c0c9c2cdc6191de6edb58977', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:08:37', '2024-06-29 11:08:37', '2025-06-29 17:38:37'),
('b65bbb082c99282673d01ca728189b0a9ccd4c9665266c8a8ddbf27037e998725f81b52c09fd359e', 5, 1, 'user_api_token', '[]', 0, '2024-06-29 13:57:03', '2024-06-29 13:57:03', '2025-06-29 20:27:03'),
('b854058f7ed0b2f67509165d733909dc4dec872bcdfdbf913cb6671324bf0b06a33ecea523d2d84b', 2, 1, 'user_api_token', '[]', 0, '2024-06-29 11:32:35', '2024-06-29 11:32:35', '2025-06-29 18:02:35'),
('c1879388f30c08c5e9624cedf64fb6d1e5e34c46dcba761a15be46dde5ca31a08588637fcf9b9e54', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 12:10:58', '2024-06-29 12:10:58', '2025-06-29 18:40:58'),
('c1efd22aadb803292d82a86f8ade838698b0841faa02c7fae55574aeb848cee3e43ad84327bc27e4', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 12:49:43', '2024-06-29 12:49:43', '2025-06-29 19:19:43'),
('c594e73284628cf9c2851e6e1bc071c0cd12ea939d1b817c69f979b968eb332b47d6343edf97dab1', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:12:58', '2024-06-29 11:12:58', '2025-06-29 17:42:58'),
('cad2e90f088d90c8a1eb092847f68dd575e540f10bcca9cb361f590fca0ef767a8022fb0a15fb978', 2, 1, 'user_api_token', '[]', 0, '2024-06-29 11:48:43', '2024-06-29 11:48:43', '2025-06-29 18:18:43'),
('d1cd66e7e9c8fd72a53521a05652705acc44337c9fb1f93cda48dc2e35390c9ebe34e06693591293', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 10:47:10', '2024-06-29 10:47:10', '2025-06-29 17:17:10'),
('d7841f89bce4ecbf7129eb53e1d686f46d74e6459fc5a3c63b293328afdb45a5faa17aa4073c8c2d', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:15:26', '2024-06-29 06:15:26', '2025-06-29 12:45:26'),
('d88f2c93ff8ee67334159e43de7f5a676cfb9ba72311c0499d880b08a53c68b3a1ec34f21e4a515f', 3, 1, 'user_api_token', '[]', 0, '2024-06-29 12:10:05', '2024-06-29 12:10:05', '2025-06-29 18:40:05'),
('e4353658bae5a50fbd3cc918a4503140552d8a8fb448fc1fbbfeafd92865a05f194eca7fdc781f2d', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:05:42', '2024-06-29 11:05:42', '2025-06-29 17:35:42'),
('ea77f75f3b994a877d9139daac6c85a9d4cf100747dbb88534d3c18c8f3ee224550fb55f63ef3cc3', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 06:12:06', '2024-06-29 06:12:06', '2025-06-29 12:42:06'),
('ef2709199bb276d7d93e9327f338291a4155659a2ed8e62e2af3ad6f332cb7e18baa1335c95c0955', 1, 1, 'user_api_token', '[]', 0, '2024-06-29 11:02:21', '2024-06-29 11:02:21', '2025-06-29 17:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'esB30FxhD9FeS4Irpb51kVViFSOHG1Snh7cvg9nY', NULL, 'http://localhost', 1, 0, 0, '2024-06-29 06:00:17', '2024-06-29 06:00:17'),
(2, NULL, 'Laravel Password Grant Client', 'bghLFuxK2uq7arZtMGcYfc4xvcfSNqNWIjMgkzmC', 'users', 'http://localhost', 0, 1, 0, '2024-06-29 06:00:17', '2024-06-29 06:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-06-29 06:00:17', '2024-06-29 06:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `label`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'staff_create', 'staff_create', 1, '2024-06-29 08:30:00', '2024-06-29 08:30:00'),
(2, 'staff_list', 'staff_list', 1, '2024-06-29 08:30:09', '2024-06-29 08:30:09'),
(3, 'staff_edit', 'staff_edit', 1, '2024-06-29 08:30:16', '2024-06-29 08:30:16'),
(4, 'staff_delete', 'staff_delete', 1, '2024-06-29 08:30:23', '2024-06-29 08:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 2, 1, NULL, NULL),
(6, 2, 2, NULL, NULL),
(7, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'Manager User Role', 'Manager Role', 1, '2024-06-29 08:27:20', '2024-06-29 08:27:20'),
(2, 'Super Admin Role', 'Super Admin Role', 1, '2024-06-29 08:27:29', '2024-06-29 08:27:29'),
(3, 'Standard User Role', 'Standard Role', 1, '2024-06-29 08:29:00', '2024-06-29 08:29:00'),
(4, 'Test Role', 'Test Role', 1, '2024-06-29 12:47:01', '2024-06-29 12:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 3, 3, NULL, NULL),
(5, 2, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined_date` date NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `code`, `name`, `email`, `mobile`, `joined_date`, `position`, `age`, `gender`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'STF001', 'Jack', 'jack@example.com', '+1234567892', '2024-06-29', 'Manager', 30, 'male', 'active', 'Jack', NULL, '2024-06-29 10:30:17', '2024-06-29 10:30:17'),
(2, 'STF002', 'William', 'william@example.com', '+12349872', '2024-06-29', 'Super Admin', 34, 'male', 'active', 'William', NULL, '2024-06-29 11:19:24', '2024-06-29 11:19:24'),
(3, 'STF003', 'peter parker', 'peterparker@example.com', '+123627323', '2024-06-29', 'Junior Staff', 34, 'male', 'active', 'peter parker', NULL, '2024-06-29 11:45:08', '2024-06-29 11:45:08'),
(4, 'STF004', 'Aung Aung Update', 'aungaung@example.com', '+1236237323', '2024-06-29', 'Junior Staff', 34, 'male', 'active', 'Aung Aung', NULL, '2024-06-29 13:18:52', '2024-06-29 13:39:26'),
(5, '5', 'Maung Maung', 'maungmaung@example.com', '+123647323', '2024-06-29', 'Account', 34, 'male', 'active', 'Maung Maung', NULL, '2024-06-29 13:56:02', '2024-06-29 13:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `staff_id`, `name`, `email`, `password`, `created_by`, `updated_by`, `flag`, `created_at`, `updated_at`) VALUES
(1, '1', 'User Jack(Manager)', 'user1@gmail.com', '$2y$10$t/g0tM23FEwVjN8YCJm34OL8rztooWo65psjVuSSGvq9Zr6BeS8ai', NULL, NULL, 1, '2024-06-29 10:47:10', '2024-06-29 10:47:10'),
(2, '2', 'William(Super Admin User)', 'william@gmail.com', '$2y$10$byMKSg0J2nvJIH2jKoV0buGC5/WJNgyQAnVtGJndN7wZhOLFoO9OC', NULL, NULL, 1, '2024-06-29 11:22:18', '2024-06-29 11:22:18'),
(3, '3', 'peter parker(Standard user)', 'peterparker@gmail.com', '$2y$10$Su7uoVrVGim/Jatp71l/Q.xQuh7cNr4Whk9LJIrkJVbFQ5jlnZehu', NULL, NULL, 1, '2024-06-29 11:47:44', '2024-06-29 11:47:44'),
(4, '4', 'aung aung(Standard user)', 'aungaung@gmail.com', '$2y$10$Vj.jaaTv/VnUoP8B5Oy2LuRL5/oATpSCWvVguj4mNLNFvs2AyrXdK', NULL, NULL, 1, '2024-06-29 13:19:34', '2024-06-29 13:19:34'),
(5, '5', 'maung maung(Super Admin User)', 'maungmaung@gmail.com', '$2y$10$TIZWQNyZP0iiAKlCxlvw5eTWMvkFZzwzDbkBoLexvDlKLmYEj7f2W', NULL, NULL, 1, '2024-06-29 13:57:02', '2024-06-29 13:57:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_staff`
--
ALTER TABLE `department_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_staff_staff_id_foreign` (`staff_id`),
  ADD KEY `department_staff_department_id_foreign` (`department_id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department_staff`
--
ALTER TABLE `department_staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department_staff`
--
ALTER TABLE `department_staff`
  ADD CONSTRAINT `department_staff_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_staff_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
