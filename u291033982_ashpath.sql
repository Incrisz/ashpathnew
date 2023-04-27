-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 12, 2023 at 01:13 PM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u291033982_ashpath`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser_agent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `type`, `ip_address`, `browser_agent`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', '105.112.114.231', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-05 02:15:17', '2023-02-05 02:15:17'),
(2, 1, 'Admin', '105.112.225.65', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-07 12:19:57', '2023-02-07 12:19:57'),
(3, 1, 'User', '197.210.85.183', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-07 12:42:15', '2023-02-07 12:42:15'),
(5, 3, 'User', '105.112.232.155', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-07 13:26:24', '2023-02-07 13:26:24'),
(6, 1, 'Admin', '105.112.123.65', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-11 18:09:16', '2023-02-11 18:09:16'),
(7, 1, 'User', '105.112.123.65', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-11 18:17:04', '2023-02-11 18:17:04'),
(8, 1, 'User', '105.112.225.90', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-12 12:06:30', '2023-02-12 12:06:30'),
(9, 1, 'Admin', '105.112.225.90', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2023-02-12 12:10:53', '2023-02-12 12:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` int(11) NOT NULL DEFAULT 1,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT 'Active or Inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `first_name`, `last_name`, `phone`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `picture`) VALUES
(1, 1, 'Ashpath', 'Admin', NULL, 'cyfamodtech@gmail.com', '$2y$10$gEjZyv9odJuRJibE1tZlReDHpEKKjEOHsVaegBVMbuP5gQUI.GOa2', 'Active', NULL, '2023-02-05 02:14:48', '2023-02-07 14:07:20', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_store_credentials`
--

CREATE TABLE `app_store_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `has_app_credentials` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Yes or No',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Google or Apple',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_store_credentials`
--

INSERT INTO `app_store_credentials` (`id`, `has_app_credentials`, `link`, `logo`, `company`, `created_at`, `updated_at`) VALUES
(1, 'Yes', 'http://store.google.com/ashpath', '1676139132.png', 'Google', NULL, '2023-02-11 18:12:12'),
(2, 'Yes', 'https://itunes.apple.com/bd/app/ashpath', '1676139162.png', 'Apple', NULL, '2023-02-11 18:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `app_tokens`
--

CREATE TABLE `app_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_in` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_transactions_infos`
--

CREATE TABLE `app_transactions_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(20,8) NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grant_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_in` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'pending, success, cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No' COMMENT 'No, Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `user_id`, `admin_id`, `currency_id`, `country_id`, `file_id`, `bank_name`, `bank_branch_name`, `bank_branch_city`, `bank_branch_address`, `account_name`, `account_number`, `swift_code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 156, NULL, 'FIRST BANK', 'main', 'Abuja', 'Berger quarry mpape', 'increase Godwin', '0089757643', '3456789', 'Yes', '2023-02-07 12:43:57', '2023-02-11 18:33:34'),
(2, NULL, 1, 1, 226, NULL, 'coin', 'second', '56e7ty8u90878', 'Berger quarry mpape', 'test', '34567890yui', '3456789', 'No', '2023-02-11 18:30:29', '2023-02-11 18:30:29'),
(3, NULL, 1, 6, 156, NULL, 'FIRST BANK', 'main', 'Abuja', 'Berger quarry mpape', 'increase Godwin', '0089757643', '3456789', 'Yes', '2023-02-11 20:30:35', '2023-02-11 20:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `coinpayment_log_trxes`
--

CREATE TABLE `coinpayment_log_trxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_created_at` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `confirmation_at` datetime DEFAULT NULL,
  `amount` double(20,8) NOT NULL,
  `confirms_needed` int(11) NOT NULL,
  `qrcode_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `short_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `short_name`, `name`, `iso3`, `number_code`, `phone_code`, `is_default`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', '4', '93', 'no'),
(2, 'AL', 'Albania', 'ALB', '8', '355', 'no'),
(3, 'DZ', 'Algeria', 'DZA', '12', '213', 'no'),
(4, 'AS', 'American Samoa', 'ASM', '16', '1684', 'no'),
(5, 'AD', 'Andorra', 'AND', '20', '376', 'no'),
(6, 'AO', 'Angola', 'AGO', '24', '244', 'no'),
(7, 'AI', 'Anguilla', 'AIA', '660', '1264', 'no'),
(8, 'AQ', 'Antarctica', NULL, NULL, '0', 'no'),
(9, 'AG', 'Antigua and Barbuda', 'ATG', '28', '1268', 'no'),
(10, 'AR', 'Argentina', 'ARG', '32', '54', 'no'),
(11, 'AM', 'Armenia', 'ARM', '51', '374', 'no'),
(12, 'AW', 'Aruba', 'ABW', '533', '297', 'no'),
(13, 'AU', 'Australia', 'AUS', '36', '61', 'no'),
(14, 'AT', 'Austria', 'AUT', '40', '43', 'no'),
(15, 'AZ', 'Azerbaijan', 'AZE', '31', '994', 'no'),
(16, 'BS', 'Bahamas', 'BHS', '44', '1242', 'no'),
(17, 'BH', 'Bahrain', 'BHR', '48', '973', 'no'),
(18, 'BD', 'Bangladesh', 'BGD', '50', '880', 'no'),
(19, 'BB', 'Barbados', 'BRB', '52', '1246', 'no'),
(20, 'BY', 'Belarus', 'BLR', '112', '375', 'no'),
(21, 'BE', 'Belgium', 'BEL', '56', '32', 'no'),
(22, 'BZ', 'Belize', 'BLZ', '84', '501', 'no'),
(23, 'BJ', 'Benin', 'BEN', '204', '229', 'no'),
(24, 'BM', 'Bermuda', 'BMU', '60', '1441', 'no'),
(25, 'BT', 'Bhutan', 'BTN', '64', '975', 'no'),
(26, 'BO', 'Bolivia', 'BOL', '68', '591', 'no'),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', '70', '387', 'no'),
(28, 'BW', 'Botswana', 'BWA', '72', '267', 'no'),
(29, 'BV', 'Bouvet Island', NULL, NULL, '0', 'no'),
(30, 'BR', 'Brazil', 'BRA', '76', '55', 'no'),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL, '246', 'no'),
(32, 'BN', 'Brunei Darussalam', 'BRN', '96', '673', 'no'),
(33, 'BG', 'Bulgaria', 'BGR', '100', '359', 'no'),
(34, 'BF', 'Burkina Faso', 'BFA', '854', '226', 'no'),
(35, 'BI', 'Burundi', 'BDI', '108', '257', 'no'),
(36, 'KH', 'Cambodia', 'KHM', '116', '855', 'no'),
(37, 'CM', 'Cameroon', 'CMR', '120', '237', 'no'),
(38, 'CA', 'Canada', 'CAN', '124', '1', 'no'),
(39, 'CV', 'Cape Verde', 'CPV', '132', '238', 'no'),
(40, 'KY', 'Cayman Islands', 'CYM', '136', '1345', 'no'),
(41, 'CF', 'Central African Republic', 'CAF', '140', '236', 'no'),
(42, 'TD', 'Chad', 'TCD', '148', '235', 'no'),
(43, 'CL', 'Chile', 'CHL', '152', '56', 'no'),
(44, 'CN', 'China', 'CHN', '156', '86', 'no'),
(45, 'CX', 'Christmas Island', NULL, NULL, '61', 'no'),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL, '672', 'no'),
(47, 'CO', 'Colombia', 'COL', '170', '57', 'no'),
(48, 'KM', 'Comoros', 'COM', '174', '269', 'no'),
(49, 'CG', 'Congo', 'COG', '178', '242', 'no'),
(50, 'CD', 'Congo, the Democratic Republic of the', 'COD', '180', '242', 'no'),
(51, 'CK', 'Cook Islands', 'COK', '184', '682', 'no'),
(52, 'CR', 'Costa Rica', 'CRI', '188', '506', 'no'),
(53, 'CI', 'Cote D\'Ivoire', 'CIV', '384', '225', 'no'),
(54, 'HR', 'Croatia', 'HRV', '191', '385', 'no'),
(55, 'CU', 'Cuba', 'CUB', '192', '53', 'no'),
(56, 'CY', 'Cyprus', 'CYP', '196', '357', 'no'),
(57, 'CZ', 'Czech Republic', 'CZE', '203', '420', 'no'),
(58, 'DK', 'Denmark', 'DNK', '208', '45', 'no'),
(59, 'DJ', 'Djibouti', 'DJI', '262', '253', 'no'),
(60, 'DM', 'Dominica', 'DMA', '212', '1767', 'no'),
(61, 'DO', 'Dominican Republic', 'DOM', '214', '1809', 'no'),
(62, 'EC', 'Ecuador', 'ECU', '218', '593', 'no'),
(63, 'EG', 'Egypt', 'EGY', '818', '20', 'no'),
(64, 'SV', 'El Salvador', 'SLV', '222', '503', 'no'),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', '226', '240', 'no'),
(66, 'ER', 'Eritrea', 'ERI', '232', '291', 'no'),
(67, 'EE', 'Estonia', 'EST', '233', '372', 'no'),
(68, 'ET', 'Ethiopia', 'ETH', '231', '251', 'no'),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', '238', '500', 'no'),
(70, 'FO', 'Faroe Islands', 'FRO', '234', '298', 'no'),
(71, 'FJ', 'Fiji', 'FJI', '242', '679', 'no'),
(72, 'FI', 'Finland', 'FIN', '246', '358', 'no'),
(73, 'FR', 'France', 'FRA', '250', '33', 'no'),
(74, 'GF', 'French Guiana', 'GUF', '254', '594', 'no'),
(75, 'PF', 'French Polynesia', 'PYF', '258', '689', 'no'),
(76, 'TF', 'French Southern Territories', NULL, NULL, '0', 'no'),
(77, 'GA', 'Gabon', 'GAB', '266', '241', 'no'),
(78, 'GM', 'Gambia', 'GMB', '270', '220', 'no'),
(79, 'GE', 'Georgia', 'GEO', '268', '995', 'no'),
(80, 'DE', 'Germany', 'DEU', '276', '49', 'no'),
(81, 'GH', 'Ghana', 'GHA', '288', '233', 'no'),
(82, 'GI', 'Gibraltar', 'GIB', '292', '350', 'no'),
(83, 'GR', 'Greece', 'GRC', '300', '30', 'no'),
(84, 'GL', 'Greenland', 'GRL', '304', '299', 'no'),
(85, 'GD', 'Grenada', 'GRD', '308', '1473', 'no'),
(86, 'GP', 'Guadeloupe', 'GLP', '312', '590', 'no'),
(87, 'GU', 'Guam', 'GUM', '316', '1671', 'no'),
(88, 'GT', 'Guatemala', 'GTM', '320', '502', 'no'),
(89, 'GN', 'Guinea', 'GIN', '324', '224', 'no'),
(90, 'GW', 'Guinea-Bissau', 'GNB', '624', '245', 'no'),
(91, 'GY', 'Guyana', 'GUY', '328', '592', 'no'),
(92, 'HT', 'Haiti', 'HTI', '332', '509', 'no'),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL, '0', 'no'),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', '336', '39', 'no'),
(95, 'HN', 'Honduras', 'HND', '340', '504', 'no'),
(96, 'HK', 'Hong Kong', 'HKG', '344', '852', 'no'),
(97, 'HU', 'Hungary', 'HUN', '348', '36', 'no'),
(98, 'IS', 'Iceland', 'ISL', '352', '354', 'no'),
(99, 'IN', 'India', 'IND', '356', '91', 'no'),
(100, 'ID', 'Indonesia', 'IDN', '360', '62', 'no'),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', '364', '98', 'no'),
(102, 'IQ', 'Iraq', 'IRQ', '368', '964', 'no'),
(103, 'IE', 'Ireland', 'IRL', '372', '353', 'no'),
(104, 'IL', 'Israel', 'ISR', '376', '972', 'no'),
(105, 'IT', 'Italy', 'ITA', '380', '39', 'no'),
(106, 'JM', 'Jamaica', 'JAM', '388', '1876', 'no'),
(107, 'JP', 'Japan', 'JPN', '392', '81', 'no'),
(108, 'JO', 'Jordan', 'JOR', '400', '962', 'no'),
(109, 'KZ', 'Kazakhstan', 'KAZ', '398', '7', 'no'),
(110, 'KE', 'Kenya', 'KEN', '404', '254', 'no'),
(111, 'KI', 'Kiribati', 'KIR', '296', '686', 'no'),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', '408', '850', 'no'),
(113, 'KR', 'Korea, Republic of', 'KOR', '410', '82', 'no'),
(114, 'KW', 'Kuwait', 'KWT', '414', '965', 'no'),
(115, 'KG', 'Kyrgyzstan', 'KGZ', '417', '996', 'no'),
(116, 'LA', 'Lao People\'s Democratic Republic', 'LAO', '418', '856', 'no'),
(117, 'LV', 'Latvia', 'LVA', '428', '371', 'no'),
(118, 'LB', 'Lebanon', 'LBN', '422', '961', 'no'),
(119, 'LS', 'Lesotho', 'LSO', '426', '266', 'no'),
(120, 'LR', 'Liberia', 'LBR', '430', '231', 'no'),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', '434', '218', 'no'),
(122, 'LI', 'Liechtenstein', 'LIE', '438', '423', 'no'),
(123, 'LT', 'Lithuania', 'LTU', '440', '370', 'no'),
(124, 'LU', 'Luxembourg', 'LUX', '442', '352', 'no'),
(125, 'MO', 'Macao', 'MAC', '446', '853', 'no'),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', '807', '389', 'no'),
(127, 'MG', 'Madagascar', 'MDG', '450', '261', 'no'),
(128, 'MW', 'Malawi', 'MWI', '454', '265', 'no'),
(129, 'MY', 'Malaysia', 'MYS', '458', '60', 'no'),
(130, 'MV', 'Maldives', 'MDV', '462', '960', 'no'),
(131, 'ML', 'Mali', 'MLI', '466', '223', 'no'),
(132, 'MT', 'Malta', 'MLT', '470', '356', 'no'),
(133, 'MH', 'Marshall Islands', 'MHL', '584', '692', 'no'),
(134, 'MQ', 'Martinique', 'MTQ', '474', '596', 'no'),
(135, 'MR', 'Mauritania', 'MRT', '478', '222', 'no'),
(136, 'MU', 'Mauritius', 'MUS', '480', '230', 'no'),
(137, 'YT', 'Mayotte', NULL, NULL, '269', 'no'),
(138, 'MX', 'Mexico', 'MEX', '484', '52', 'no'),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', '583', '691', 'no'),
(140, 'MD', 'Moldova, Republic of', 'MDA', '498', '373', 'no'),
(141, 'MC', 'Monaco', 'MCO', '492', '377', 'no'),
(142, 'MN', 'Mongolia', 'MNG', '496', '976', 'no'),
(143, 'MS', 'Montserrat', 'MSR', '500', '1664', 'no'),
(144, 'MA', 'Morocco', 'MAR', '504', '212', 'no'),
(145, 'MZ', 'Mozambique', 'MOZ', '508', '258', 'no'),
(146, 'MM', 'Myanmar', 'MMR', '104', '95', 'no'),
(147, 'NA', 'Namibia', 'NAM', '516', '264', 'no'),
(148, 'NR', 'Nauru', 'NRU', '520', '674', 'no'),
(149, 'NP', 'Nepal', 'NPL', '524', '977', 'no'),
(150, 'NL', 'Netherlands', 'NLD', '528', '31', 'no'),
(151, 'AN', 'Netherlands Antilles', 'ANT', '530', '599', 'no'),
(152, 'NC', 'New Caledonia', 'NCL', '540', '687', 'no'),
(153, 'NZ', 'New Zealand', 'NZL', '554', '64', 'no'),
(154, 'NI', 'Nicaragua', 'NIC', '558', '505', 'no'),
(155, 'NE', 'Niger', 'NER', '562', '227', 'no'),
(156, 'NG', 'Nigeria', 'NGA', '566', '234', 'no'),
(157, 'NU', 'Niue', 'NIU', '570', '683', 'no'),
(158, 'NF', 'Norfolk Island', 'NFK', '574', '672', 'no'),
(159, 'MP', 'Northern Mariana Islands', 'MNP', '580', '1670', 'no'),
(160, 'NO', 'Norway', 'NOR', '578', '47', 'no'),
(161, 'OM', 'Oman', 'OMN', '512', '968', 'no'),
(162, 'PK', 'Pakistan', 'PAK', '586', '92', 'no'),
(163, 'PW', 'Palau', 'PLW', '585', '680', 'no'),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL, '970', 'no'),
(165, 'PA', 'Panama', 'PAN', '591', '507', 'no'),
(166, 'PG', 'Papua New Guinea', 'PNG', '598', '675', 'no'),
(167, 'PY', 'Paraguay', 'PRY', '600', '595', 'no'),
(168, 'PE', 'Peru', 'PER', '604', '51', 'no'),
(169, 'PH', 'Philippines', 'PHL', '608', '63', 'no'),
(170, 'PN', 'Pitcairn', 'PCN', '612', '0', 'no'),
(171, 'PL', 'Poland', 'POL', '616', '48', 'no'),
(172, 'PT', 'Portugal', 'PRT', '620', '351', 'no'),
(173, 'PR', 'Puerto Rico', 'PRI', '630', '1787', 'no'),
(174, 'QA', 'Qatar', 'QAT', '634', '974', 'no'),
(175, 'RE', 'Reunion', 'REU', '638', '262', 'no'),
(176, 'RO', 'Romania', 'ROM', '642', '40', 'no'),
(177, 'RU', 'Russian Federation', 'RUS', '643', '70', 'no'),
(178, 'RW', 'Rwanda', 'RWA', '646', '250', 'no'),
(179, 'SH', 'Saint Helena', 'SHN', '654', '290', 'no'),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', '659', '1869', 'no'),
(181, 'LC', 'Saint Lucia', 'LCA', '662', '1758', 'no'),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', '666', '508', 'no'),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', '670', '1784', 'no'),
(184, 'WS', 'Samoa', 'WSM', '882', '684', 'no'),
(185, 'SM', 'San Marino', 'SMR', '674', '378', 'no'),
(186, 'ST', 'Sao Tome and Principe', 'STP', '678', '239', 'no'),
(187, 'SA', 'Saudi Arabia', 'SAU', '682', '966', 'no'),
(188, 'SN', 'Senegal', 'SEN', '686', '221', 'no'),
(189, 'CS', 'Serbia and Montenegro', NULL, NULL, '381', 'no'),
(190, 'SC', 'Seychelles', 'SYC', '690', '248', 'no'),
(191, 'SL', 'Sierra Leone', 'SLE', '694', '232', 'no'),
(192, 'SG', 'Singapore', 'SGP', '702', '65', 'no'),
(193, 'SK', 'Slovakia', 'SVK', '703', '421', 'no'),
(194, 'SI', 'Slovenia', 'SVN', '705', '386', 'no'),
(195, 'SB', 'Solomon Islands', 'SLB', '90', '677', 'no'),
(196, 'SO', 'Somalia', 'SOM', '706', '252', 'no'),
(197, 'ZA', 'South Africa', 'ZAF', '710', '27', 'no'),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL, '0', 'no'),
(199, 'ES', 'Spain', 'ESP', '724', '34', 'no'),
(200, 'LK', 'Sri Lanka', 'LKA', '144', '94', 'no'),
(201, 'SD', 'Sudan', 'SDN', '736', '249', 'no'),
(202, 'SR', 'Suriname', 'SUR', '740', '597', 'no'),
(203, 'SJ', 'Svalbard and Jan Mayen', 'SJM', '744', '47', 'no'),
(204, 'SZ', 'Swaziland', 'SWZ', '748', '268', 'no'),
(205, 'SE', 'Sweden', 'SWE', '752', '46', 'no'),
(206, 'CH', 'Switzerland', 'CHE', '756', '41', 'no'),
(207, 'SY', 'Syrian Arab Republic', 'SYR', '760', '963', 'no'),
(208, 'TW', 'Taiwan, Province of China', 'TWN', '158', '886', 'no'),
(209, 'TJ', 'Tajikistan', 'TJK', '762', '992', 'no'),
(210, 'TZ', 'Tanzania, United Republic of', 'TZA', '834', '255', 'no'),
(211, 'TH', 'Thailand', 'THA', '764', '66', 'no'),
(212, 'TL', 'Timor-Leste', NULL, NULL, '670', 'no'),
(213, 'TG', 'Togo', 'TGO', '768', '228', 'no'),
(214, 'TK', 'Tokelau', 'TKL', '772', '690', 'no'),
(215, 'TO', 'Tonga', 'TON', '776', '676', 'no'),
(216, 'TT', 'Trinidad and Tobago', 'TTO', '780', '1868', 'no'),
(217, 'TN', 'Tunisia', 'TUN', '788', '216', 'no'),
(218, 'TR', 'Turkey', 'TUR', '792', '90', 'no'),
(219, 'TM', 'Turkmenistan', 'TKM', '795', '7370', 'no'),
(220, 'TC', 'Turks and Caicos Islands', 'TCA', '796', '1649', 'no'),
(221, 'TV', 'Tuvalu', 'TUV', '798', '688', 'no'),
(222, 'UG', 'Uganda', 'UGA', '800', '256', 'no'),
(223, 'UA', 'Ukraine', 'UKR', '804', '380', 'no'),
(224, 'AE', 'United Arab Emirates', 'ARE', '784', '971', 'no'),
(225, 'GB', 'United Kingdom', 'GBR', '826', '44', 'no'),
(226, 'US', 'United States', 'USA', '840', '1', 'yes'),
(227, 'UM', 'United States Minor Outlying Islands', NULL, NULL, '1', 'no'),
(228, 'UY', 'Uruguay', 'URY', '858', '598', 'no'),
(229, 'UZ', 'Uzbekistan', 'UZB', '860', '998', 'no'),
(230, 'VU', 'Vanuatu', 'VUT', '548', '678', 'no'),
(231, 'VE', 'Venezuela', 'VEN', '862', '58', 'no'),
(232, 'VN', 'Viet Nam', 'VNM', '704', '84', 'no'),
(233, 'VG', 'Virgin Islands, British', 'VGB', '92', '1284', 'no'),
(234, 'VI', 'Virgin Islands, U.s.', 'VIR', '850', '1340', 'no'),
(235, 'WF', 'Wallis and Futuna', 'WLF', '876', '681', 'no'),
(236, 'EH', 'Western Sahara', 'ESH', '732', '212', 'no'),
(237, 'YE', 'Yemen', 'YEM', '887', '967', 'no'),
(238, 'ZM', 'Zambia', 'ZMB', '894', '260', 'no'),
(239, 'ZW', 'Zimbabwe', 'ZWE', '716', '263', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_asset_api_logs`
--

CREATE TABLE `crypto_asset_api_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL COMMENT 'wallet_id or cryto_sent_id or crypto_received_id',
  `object_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `network` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Networks/Cryto Curencies - BTC,LTC,DOGE',
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Crypto Api''s Payloads (e.g - get_new_address(), get_balance(), withdraw(),etc.',
  `confirmations` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_asset_settings`
--

CREATE TABLE `crypto_asset_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `crypto_provider_id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `network` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Networks/Cryto Curencies - BTC,LTC,DT etc.',
  `network_credentials` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT 'Active/Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_providers`
--

CREATE TABLE `crypto_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_providers`
--

INSERT INTO `crypto_providers` (`id`, `name`, `alias`, `description`, `logo`, `subscription_details`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BlockIo', 'BlockIo', 'The world\'s easiest Bitcoin Wallet as a Service.', NULL, NULL, 'Active', '2023-02-05 02:14:24', '2023-02-05 02:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fiat' COMMENT 'fiat or crypto',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `exchange_from` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `allowed_wallet_creation` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `address` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `type`, `name`, `symbol`, `code`, `rate`, `logo`, `default`, `exchange_from`, `allowed_wallet_creation`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fiat', 'US Dollar', '$', 'USD', '1.00000000', 'icons8-us-dollar-64.png', '1', 'local', 'No', NULL, 'Active', NULL, NULL),
(2, 'fiat', 'Pound Sterling', '£', 'GBP', '0.75000000', 'icons8-british-pound-64.png', '0', 'local', 'No', NULL, 'Active', NULL, NULL),
(3, 'fiat', 'Euro', '€', 'EUR', '0.85000000', 'icons8-euro-64.png', '0', 'local', 'No', NULL, 'Active', NULL, NULL),
(4, 'crypto', 'Bitcoin', '฿', 'BTC', '0.00000000', 'icons8-bitcoin-64.png', '0', 'local', 'No', NULL, 'Inactive', NULL, NULL),
(5, 'crypto', 'Litecoin', 'Ł', 'LTC', '0.00000000', 'icons8-litecoin-48.png', '0', 'local', 'No', NULL, 'Inactive', NULL, NULL),
(6, 'fiat', 'Naira', '₦', 'NGN', '500.00000000', NULL, '0', 'local', 'Yes', '', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchanges`
--

CREATE TABLE `currency_exchanges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `from_wallet` int(10) UNSIGNED DEFAULT NULL,
  `to_wallet` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID (For Each Exchange)',
  `exchange_rate` decimal(20,8) DEFAULT 0.00000000,
  `amount` decimal(20,8) DEFAULT 0.00000000,
  `fee` decimal(20,8) DEFAULT 0.00000000,
  `type` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'In, Out',
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_exchanges`
--

INSERT INTO `currency_exchanges` (`id`, `user_id`, `from_wallet`, `to_wallet`, `currency_id`, `uuid`, `exchange_rate`, `amount`, `fee`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 7, 9, 3, 'BF550112EFF40', '0.85000000', '100.00000000', '0.00000000', 'Out', 'Success', '2023-02-07 13:35:28', '2023-02-07 13:35:28'),
(2, 1, 1, 11, 6, '83623B92E265F', '500.00000000', '500.00000000', '0.00000000', 'Out', 'Success', '2023-02-07 13:43:55', '2023-02-07 13:43:55'),
(3, 1, 11, 1, 1, '4507D5CE40F53', '0.00200000', '100000.00000000', '0.00000000', 'Out', 'Success', '2023-02-11 18:18:10', '2023-02-11 18:18:10'),
(4, 1, 11, 1, 1, 'C89FBE8D72594', '0.00200000', '50000.00000000', '0.00000000', 'Out', 'Success', '2023-02-11 21:05:54', '2023-02-11 21:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `currency_payment_methods`
--

CREATE TABLE `currency_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `activated_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'deposit, withdrawal single, both or none',
  `method_data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'input field''s title and value like client_id, client_secret etc',
  `processing_time` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'time in days',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_payment_methods`
--

INSERT INTO `currency_payment_methods` (`id`, `currency_id`, `method_id`, `activated_for`, `method_data`, `processing_time`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '{\"deposit\":\"\"}', '{\"bank_id\":1}', 0, '2023-02-07 12:43:57', '2023-02-07 12:43:57'),
(2, 1, 5, '{\"deposit\":\"\"}', '{\"bank_id\":2}', 0, '2023-02-11 18:30:29', '2023-02-11 18:30:53'),
(3, 6, 5, '{\"deposit\":\"\"}', '{\"bank_id\":3}', 0, '2023-02-11 20:30:35', '2023-02-11 20:30:35'),
(4, 3, 10, '{\"deposit\":\"\"}', '{\"client_id\":\"pk_test_456c5a4c0cf719b6dad3f7a28bbd6de31822d7ad\",\"client_secret\":null,\"mode\":\"live\"}', 1, '2023-02-11 20:42:16', '2023-02-12 12:20:00'),
(5, 6, 10, '{\"deposit\":\"\"}', '{\"client_id\":\"pk_test_456c5a4c0cf719b6dad3f7a28bbd6de31822d7ad\",\"client_secret\":null,\"mode\":\"live\"}', 1, '2023-02-11 20:46:53', '2023-02-12 12:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID (For Each Deposit)',
  `charge_percentage` decimal(20,8) DEFAULT 0.00000000,
  `charge_fixed` decimal(20,8) DEFAULT 0.00000000,
  `amount` decimal(20,8) DEFAULT 0.00000000,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `currency_id`, `payment_method_id`, `bank_id`, `file_id`, `uuid`, `charge_percentage`, `charge_fixed`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL, '32987C7C0CC71', '0.00000000', '0.00000000', '5000.00000000', 'Success', '2023-02-07 12:48:02', '2023-02-07 12:48:02'),
(2, 1, 6, 1, NULL, NULL, 'B26E2658F2883', '0.00000000', '0.00000000', '5000.00000000', 'Success', '2023-02-07 13:48:41', '2023-02-07 13:48:41');

-- --------------------------------------------------------

--
-- Table structure for table `device_logs`
--

CREATE TABLE `device_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `browser_fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_agent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` int(10) UNSIGNED NOT NULL,
  `claimant_id` int(10) UNSIGNED DEFAULT NULL,
  `defendant_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `reason_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Open' COMMENT 'Open, Closed, Solved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispute_discussions`
--

CREATE TABLE `dispute_discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `dispute_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Admin, User',
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_verifications`
--

CREATE TABLE `document_verifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `verification_type` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'address, identity',
  `identity_type` varchar(17) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'driving_license, passport, national_id',
  `identity_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'pending, approved, rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_verifications`
--

INSERT INTO `document_verifications` (`id`, `user_id`, `file_id`, `verification_type`, `identity_type`, `identity_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'identity', 'national_id', '23456789033', 'approved', '2023-02-12 13:00:44', '2023-02-12 13:01:26'),
(2, 1, 2, 'address', NULL, NULL, 'pending', '2023-02-12 13:00:55', '2023-02-12 13:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `email_configs`
--

CREATE TABLE `email_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_protocol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_configs`
--

INSERT INTO `email_configs` (`id`, `email_protocol`, `email_encryption`, `smtp_host`, `smtp_port`, `smtp_email`, `smtp_username`, `smtp_password`, `from_address`, `from_name`, `status`) VALUES
(1, 'sendmail', 'tls', '', '587', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `temp_id` tinyint(4) NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email or sms'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `language_id`, `temp_id`, `subject`, `body`, `lang`, `type`) VALUES
(1, 1, 1, 'Notice of Transfer!', 'Hi {sender_id},\r\n                                <br><br>The funds amount equal to {amount} was transferred from your account.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of your Transfer:</i></u></b>\r\n\r\n                                <br><br>Transfer # {uuid} was created at {created_at}.\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Receiver:</u></b> {receiver_id}\r\n\r\n                                <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(2, 2, 1, '', '', 'ar', 'email'),
(3, 3, 1, '', '', 'fr', 'email'),
(4, 4, 1, '', '', 'pt', 'email'),
(5, 5, 1, '', '', 'ru', 'email'),
(6, 6, 1, '', '', 'es', 'email'),
(7, 7, 1, '', '', 'tr', 'email'),
(8, 8, 1, '', '', 'ch', 'email'),
(9, 1, 3, 'Notice of Bank Transfer!', 'Hi {sender_id},\r\n                                <br><br>The funds amount equal to {amount} was transferred to the assigned bank.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of your Bank Transfer:</i></u></b>\r\n\r\n                                <br><br>Bank Transfer # {uuid} was created at {created_at}.\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n                                <br><br><b><u>Bank Name:</u></b> {bank_name}\r\n\r\n                                <br><br><b><u>Branch Name:</u></b> {branch_name}\r\n\r\n                                <br><br><b><u>Account Name:</u></b> {account_name}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(10, 2, 3, '', '', 'ar', 'email'),
(11, 3, 3, '', '', 'fr', 'email'),
(12, 4, 3, '', '', 'pt', 'email'),
(13, 5, 3, '', '', 'ru', 'email'),
(14, 6, 3, '', '', 'es', 'email'),
(15, 7, 3, '', '', 'tr', 'email'),
(16, 8, 3, '', '', 'ch', 'email'),
(17, 1, 2, 'Notice to Receive!', 'Hi {receiver_id},\r\n                                <br><br>The funds amount equal to {amount} was received on your account.\r\n\r\n                                <br><br>\r\n                                <b><u><i>Here’s a brief overview of your Received Payment:</i></u></b>\r\n\r\n                                <br><br>\r\n                                Transfer # {uuid} was received at {created_at}.\r\n\r\n                                <br><br>\r\n                                <b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br>\r\n                                <b><u>Sender:</u></b> {sender_id}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(18, 2, 2, '', '', 'ar', 'email'),
(19, 3, 2, '', '', 'fr', 'email'),
(20, 4, 2, '', '', 'pt', 'email'),
(21, 5, 2, '', '', 'ru', 'email'),
(22, 6, 2, '', '', 'es', 'email'),
(23, 7, 2, '', '', 'tr', 'email'),
(24, 8, 2, '', '', 'tr', 'email'),
(25, 1, 21, 'Notice of {Identity/Address} Verification!', 'Hi {user},\r\n                                <br><br>Your {Identity/Address} verification is <b>{approved/pending/rejected}</b>.\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(26, 2, 21, '', '', 'ar', 'email'),
(27, 3, 21, '', '', 'fr', 'email'),
(28, 4, 21, '', '', 'pt', 'email'),
(29, 5, 21, '', '', 'ru', 'email'),
(30, 6, 21, '', '', 'es', 'email'),
(31, 7, 21, '', '', 'tr', 'email'),
(32, 8, 21, '', '', 'tr', 'email'),
(33, 1, 4, 'Notice of Request Creation!', 'Hi {acceptor},\r\n\r\n                                <br><br>Amount {amount} has been requested by {creator}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Request:</i></u></b>\r\n\r\n                                <br><br>\r\n                                <b><u>Request #:</u></b> {uuid}\r\n\r\n                                <br><br>\r\n                                <b><u>Created At:</u></b> {created_at}\r\n\r\n                                <br><br>\r\n                                <b><u>Requested Amount:</u></b> {amount}\r\n\r\n                                <br><br>\r\n                                <b><u>Note: </u></b> {note}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(34, 2, 4, '', '', 'ar', 'email'),
(35, 3, 4, '', '', 'fr', 'email'),
(36, 4, 4, '', '', 'pt', 'email'),
(37, 5, 4, '', '', 'ru', 'email'),
(38, 6, 4, '', '', 'es', 'email'),
(39, 7, 4, '', '', 'tr', 'email'),
(40, 8, 4, '', '', 'ch', 'email'),
(41, 1, 5, 'Notice of Request Acceptance!', 'Hi {creator},\r\n                                <br><br>Your request of #{uuid} has been accepted by {acceptor}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Request:</i></u></b>\r\n\r\n                                <br><br>\r\n                                <b><u>Accepted Date:</u></b> {created_at}.\r\n\r\n                                <br><br>\r\n                                <b><u>Requested Amount:</u></b> {amount}\r\n\r\n                                <br><br>\r\n                                <b><u>Requested Accepted Amount:</u></b> {accept_amount}\r\n\r\n                                <br><br>\r\n                                <b><u>Currency:</u></b> {currency}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(42, 2, 5, '', '', 'ar', 'email'),
(43, 3, 5, '', '', 'fr', 'email'),
(44, 4, 5, '', '', 'pt', 'email'),
(45, 5, 5, '', '', 'ru', 'email'),
(46, 6, 5, '', '', 'es', 'email'),
(47, 7, 5, '', '', 'tr', 'email'),
(48, 8, 5, '', '', 'ch', 'email'),
(49, 1, 6, 'Status of Transaction #{uuid} has been updated!', 'Hi {sender_id/receiver_id},\r\n\r\n                                <br><br><b>\r\n                                Transaction of Transfer #{uuid} has been updated to {status} by system administrator!</b>\r\n\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(50, 2, 6, '', '', 'ar', 'email'),
(51, 3, 6, '', '', 'fr', 'email'),
(52, 4, 6, '', '', 'pt', 'email'),
(53, 5, 6, '', '', 'ru', 'email'),
(54, 6, 6, '', '', 'es', 'email'),
(55, 7, 6, '', '', 'tr', 'email'),
(56, 8, 6, '', '', 'ch', 'email'),
(57, 1, 7, 'Status of Transaction #{uuid} has been updated!', 'Hi {sender_id},\r\n                                <br><br><b>\r\n                                Transaction of Bank Transfer #{uuid} has been updated to {status} by system administrator!</b>\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(58, 2, 7, '', '', 'ar', 'email'),
(59, 3, 7, '', '', 'fr', 'email'),
(60, 4, 7, '', '', 'pt', 'email'),
(61, 5, 7, '', '', 'ru', 'email'),
(62, 6, 7, '', '', 'es', 'email'),
(63, 7, 7, '', '', 'tr', 'email'),
(64, 8, 7, '', '', 'ch', 'email'),
(65, 1, 8, 'Status of Transaction #{uuid} has been updated!', 'Hi {user_id/receiver_id},\r\n\r\n                                <br><br><b>\r\n                                Transaction of Request Payment #{uuid} has been updated to {status} by system administrator!</b>\r\n\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>', 'en', 'email'),
(66, 2, 8, '', '', 'ar', 'email'),
(67, 3, 8, '', '', 'fr', 'email'),
(68, 4, 8, '', '', 'pt', 'email'),
(69, 5, 8, '', '', 'ru', 'email'),
(70, 6, 8, '', '', 'es', 'email'),
(71, 7, 8, '', '', 'tr', 'email'),
(72, 8, 8, '', '', 'ch', 'email'),
(73, 1, 10, 'Status of Transaction #{uuid} has been updated!', 'Hi {user_id},\r\n\r\n                                <br><br><b>\r\n                                Transaction of Payout #{uuid} has been updated to {status} by system administrator!</b>\r\n\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>', 'en', 'email'),
(74, 2, 10, '', '', 'ar', 'email'),
(75, 3, 10, '', '', 'fr', 'email'),
(76, 4, 10, '', '', 'pt', 'email'),
(77, 5, 10, '', '', 'ru', 'email'),
(78, 6, 10, '', '', 'es', 'email'),
(79, 7, 10, '', '', 'tr', 'email'),
(80, 8, 10, '', '', 'ch', 'email'),
(81, 1, 11, 'Notice of Ticket!', 'Hi {assignee/user},\r\n\r\n                                <br><br>Ticket #{ticket_code} was {assigned/created} {to/for} you by the system administrator.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the ticket:</i></u></b>\r\n\r\n                                <br><br>Ticket #{ticket_code} was created at {created_at}.\r\n\r\n                                <br><br><b><u>{Assignee:}</u></b> {assignee}\r\n\r\n                                <br><br><b><u>{User:}</u></b> {user}\r\n\r\n                                <br><br><b><u>Ticket Subject:</u></b> {subject}\r\n\r\n                                <br><br><b><u>Ticket Message:</u></b> {message}\r\n\r\n                                <br><br><b><u>Ticket Status:</u></b> {status}\r\n\r\n                                <br><br><b><u>Ticket Priority Level:</u></b> {priority}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(82, 2, 11, '', '', 'ar', 'email'),
(83, 3, 11, '', '', 'fr', 'email'),
(84, 4, 11, '', '', 'pt', 'email'),
(85, 5, 11, '', '', 'ru', 'email'),
(86, 6, 11, '', '', 'es', 'email'),
(87, 7, 11, '', '', 'tr', 'email'),
(88, 8, 11, '', '', 'ch', 'email'),
(89, 1, 12, 'Notice of Ticket Reply!', 'Hi {user},\r\n\r\n                                <br><br>A ticket reply has been sent to you by system administrator.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the reply:</i></u></b>\r\n\r\n                                <br><br>This reply was initiated against ticket code #{ticket_code}.\r\n\r\n                                <br><br><b><u>Assignee:</u></b> {assignee}\r\n\r\n                                <br><br><b><u>Reply Message:</u></b> {message}\r\n\r\n                                <br><br><b><u>Reply Status:</u></b> {status}\r\n\r\n                                <br><br><b><u>Reply Priority Level:</u></b> {priority}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(90, 2, 12, '', '', 'ar', 'email'),
(91, 3, 12, '', '', 'fr', 'email'),
(92, 4, 12, '', '', 'pt', 'email'),
(93, 5, 12, '', '', 'ru', 'email'),
(94, 6, 12, '', '', 'es', 'email'),
(95, 7, 12, '', '', 'tr', 'email'),
(96, 8, 12, '', '', 'ch', 'email'),
(97, 1, 13, 'Notice of Dispute Reply!', 'Hi {user},\r\n\r\n                                <br><br>A dispute reply has been sent to you by system administrator.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the reply:</i></u></b>\r\n\r\n                                <br><br>This reply was initiated at {created_at}.\r\n\r\n                                <br><br><b><u>{Claimant/Defendant:}</u></b> {claimant/defendant}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {transaction_id}\r\n\r\n                                <br><br><b><u>Subject:</u></b> {subject}\r\n\r\n                                <br><br><b><u>Replied Message:</u></b> {message}\r\n\r\n                                <br><br><b><u>Status:</u></b> {status}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(98, 2, 13, '', '', 'ar', 'email'),
(99, 3, 13, '', '', 'fr', 'email'),
(100, 4, 13, '', '', 'pt', 'email'),
(101, 5, 13, '', '', 'ru', 'email'),
(102, 6, 13, '', '', 'es', 'email'),
(103, 7, 13, '', '', 'tr', 'email'),
(104, 8, 13, '', '', 'ch', 'email'),
(105, 1, 14, 'Status of Transaction #{uuid} has been updated!', 'Hi {paidByUser/merchantUser},\r\n\r\n                                <br><br><b>\r\n                                Transaction of Merchant Payment #{uuid} has been updated to {status} by system administrator!</b>\r\n\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>', 'en', 'email'),
(106, 2, 14, '', '', 'ar', 'email'),
(107, 3, 14, '', '', 'fr', 'email'),
(108, 4, 14, '', '', 'pt', 'email'),
(109, 5, 14, '', '', 'ru', 'email'),
(110, 6, 14, '', '', 'es', 'email'),
(111, 7, 14, '', '', 'tr', 'email'),
(112, 8, 14, '', '', 'ch', 'email'),
(113, 1, 16, 'Status of Transaction #{uuid} has been updated!', 'Hi {user_id/receiver_id},\r\n                                <br><br><b>\r\n                                Transaction of Request Payment #{uuid} has been updated to {status} by system administrator!</b>\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>', 'en', 'email'),
(114, 2, 16, '', '', 'ar', 'email'),
(115, 3, 16, '', '', 'fr', 'email'),
(116, 4, 16, '', '', 'pt', 'email'),
(117, 5, 16, '', '', 'ru', 'email'),
(118, 6, 16, '', '', 'es', 'email'),
(119, 7, 16, '', '', 'tr', 'email'),
(120, 8, 16, '', '', 'ch', 'email'),
(121, 1, 17, 'Notice for User Verification!', 'Hi {user},\r\n                                        <br><br>\r\n                                        Your registered email id: {email}. Please click on the below link to verify your account,<br><br>\r\n                                        {verification_url}\r\n\r\n                                        <br><br>If you have any questions, please feel free to reply to this email.\r\n                                        <br><br>Regards,\r\n                                        <br><b>{soft_name}</b>', 'en', 'email'),
(122, 2, 17, '', '', 'ar', 'email'),
(123, 3, 17, '', '', 'fr', 'email'),
(124, 4, 17, '', '', 'pt', 'email'),
(125, 5, 17, '', '', 'ru', 'email'),
(126, 6, 17, '', '', 'es', 'email'),
(127, 7, 17, '', '', 'tr', 'email'),
(128, 8, 17, '', '', 'ch', 'email'),
(129, 1, 19, 'Notice for 2-Factor Authentication!', 'Hi {user},\r\n                                        <br><br>\r\n                                        Your 2-Factor Authentication code is: {code}\r\n                                        <br><br>Regards,\r\n                                        <br><b>{soft_name}</b>', 'en', 'email'),
(130, 2, 19, '', '', 'ar', 'email'),
(131, 3, 19, '', '', 'fr', 'email'),
(132, 4, 19, '', '', 'pt', 'email'),
(133, 5, 19, '', '', 'ru', 'email'),
(134, 6, 19, '', '', 'es', 'email'),
(135, 7, 19, '', '', 'tr', 'email'),
(136, 8, 19, '', '', 'ch', 'email'),
(137, 1, 18, 'Notice for Password Reset!', 'Hi {user},\r\n                                        <br><br>\r\n                                        Your registered email id: {email}. Please click on the below link to reset your password,<br><br>\r\n                                        {password_reset_url}\r\n                                        <br><br>If you have any questions, please feel free to reply to this email.\r\n                                        <br><br>Regards,\r\n                                        <br><b>{soft_name}</b>', 'en', 'email'),
(138, 2, 18, '', '', 'ar', 'email'),
(139, 3, 18, '', '', 'fr', 'email'),
(140, 4, 18, '', '', 'pt', 'email'),
(141, 5, 18, '', '', 'ru', 'email'),
(142, 6, 18, '', '', 'es', 'email'),
(143, 7, 18, '', '', 'tr', 'email'),
(144, 8, 18, '', '', 'ch', 'email'),
(145, 1, 21, 'Notice of {Identity/Address} Verification!', 'Hi {user},\r\n                                <br><br>Your {Identity/Address} verification is <b>{approved/pending/rejected}</b>.\r\n                                ', 'en', 'sms'),
(146, 2, 21, '', '', 'ar', 'sms'),
(147, 3, 21, '', '', 'fr', 'sms'),
(148, 4, 21, '', '', 'pt', 'sms'),
(149, 5, 21, '', '', 'ru', 'sms'),
(150, 6, 21, '', '', 'es', 'sms'),
(151, 7, 21, '', '', 'tr', 'sms'),
(152, 8, 21, '', '', 'tr', 'sms'),
(153, 1, 1, 'Notice of Transfer!', 'Hi {sender_id},\r\n                    <br><br>You have transferred {amount} from your account.\r\n                    ', 'en', 'sms'),
(154, 2, 1, '', '', 'ar', 'sms'),
(155, 3, 1, '', '', 'fr', 'sms'),
(156, 4, 1, '', '', 'pt', 'sms'),
(157, 5, 1, '', '', 'ru', 'sms'),
(158, 6, 1, '', '', 'es', 'sms'),
(159, 7, 1, '', '', 'tr', 'sms'),
(160, 8, 1, '', '', 'ch', 'sms'),
(161, 1, 3, 'Notice of Bank Transfer!', 'Hi {sender_id},\r\n                    <br><br>You have transferred {amount} to the assigned bank.\r\n                    ', 'en', 'sms'),
(162, 2, 3, '', '', 'ar', 'sms'),
(163, 3, 3, '', '', 'fr', 'sms'),
(164, 4, 3, '', '', 'pt', 'sms'),
(165, 5, 3, '', '', 'ru', 'sms'),
(166, 6, 3, '', '', 'es', 'sms'),
(167, 7, 3, '', '', 'tr', 'sms'),
(168, 8, 3, '', '', 'ch', 'sms'),
(169, 1, 2, 'Notice to Receive!', 'Hi {receiver_id},\r\n                                <br><br>You have received {amount} from {sender_id}.\r\n                                ', 'en', 'sms'),
(170, 2, 2, '', '', 'ar', 'sms'),
(171, 3, 2, '', '', 'fr', 'sms'),
(172, 4, 2, '', '', 'pt', 'sms'),
(173, 5, 2, '', '', 'ru', 'sms'),
(174, 6, 2, '', '', 'es', 'sms'),
(175, 7, 2, '', '', 'tr', 'sms'),
(176, 8, 2, '', '', 'ch', 'sms'),
(177, 1, 4, 'Notice of Request Creation!', 'Hi {acceptor},\r\n                                <br><br>Amount {amount} has been requested by {creator}.\r\n                                ', 'en', 'sms'),
(178, 2, 4, '', '', 'ar', 'sms'),
(179, 3, 4, '', '', 'fr', 'sms'),
(180, 4, 4, '', '', 'pt', 'sms'),
(181, 5, 4, '', '', 'ru', 'sms'),
(182, 6, 4, '', '', 'es', 'sms'),
(183, 7, 4, '', '', 'tr', 'sms'),
(184, 8, 4, '', '', 'ch', 'sms'),
(185, 1, 5, 'Notice of Request Acceptance!', 'Hi {creator},\r\n                                    <br><br>Your request of #{uuid} of {amount} has been accepted by {acceptor}.\r\n                                ', 'en', 'sms'),
(186, 2, 5, '', '', 'ar', 'sms'),
(187, 3, 5, '', '', 'fr', 'sms'),
(188, 4, 5, '', '', 'pt', 'sms'),
(189, 5, 5, '', '', 'ru', 'sms'),
(190, 6, 5, '', '', 'es', 'sms'),
(191, 7, 5, '', '', 'tr', 'sms'),
(192, 8, 5, '', '', 'ch', 'sms'),
(193, 1, 6, 'Status of Transaction #{uuid} has been updated!', 'Hi {sender_id/receiver_id},\r\n                                    <br><br><b>\r\n                                    Transfer #{uuid} has been updated to {status} by system administrator!</b>\r\n                                    <br><br>\r\n                                    {amount} is {added/subtracted} {from/to} your account.\r\n                                ', 'en', 'sms'),
(194, 2, 6, '', '', 'ar', 'sms'),
(195, 3, 6, '', '', 'fr', 'sms'),
(196, 4, 6, '', '', 'pt', 'sms'),
(197, 5, 6, '', '', 'ru', 'sms'),
(198, 6, 6, '', '', 'es', 'sms'),
(199, 7, 6, '', '', 'tr', 'sms'),
(200, 8, 6, '', '', 'ch', 'sms'),
(201, 1, 7, 'Status of Transaction #{uuid} has been updated!', 'Hi {sender_id},\r\n                                    <br><br><b>\r\n                                    Bank Transfer #{uuid} has been updated to {status} by system administrator!</b>\r\n                                    <br><br>\r\n                                    {amount} is {added/subtracted} {from/to} your account.\r\n                                ', 'en', 'sms'),
(202, 2, 7, '', '', 'ar', 'sms'),
(203, 3, 7, '', '', 'fr', 'sms'),
(204, 4, 7, '', '', 'pt', 'sms'),
(205, 5, 7, '', '', 'ru', 'sms'),
(206, 6, 7, '', '', 'es', 'sms'),
(207, 7, 7, '', '', 'tr', 'sms'),
(208, 8, 7, '', '', 'ch', 'sms'),
(209, 1, 8, 'Status of Transaction #{uuid} has been updated!', 'Hi {user_id/receiver_id},\r\n                                <br><br><b>\r\n                                Transaction of Request Payment #{uuid} has been updated to {status} by system administrator!</b>\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n                                ', 'en', 'sms'),
(210, 2, 8, '', '', 'ar', 'sms'),
(211, 3, 8, '', '', 'fr', 'sms'),
(212, 4, 8, '', '', 'pt', 'sms'),
(213, 5, 8, '', '', 'ru', 'sms'),
(214, 6, 8, '', '', 'es', 'sms'),
(215, 7, 8, '', '', 'tr', 'sms'),
(216, 8, 8, '', '', 'ch', 'sms'),
(217, 1, 10, 'Status of Transaction #{uuid} has been updated!', 'Hi {user_id},\r\n                                <br><br><b>\r\n                                Transaction of Payout #{uuid} has been updated to {status} by system administrator!</b>\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n                                ', 'en', 'sms'),
(218, 2, 10, '', '', 'ar', 'sms'),
(219, 3, 10, '', '', 'fr', 'sms'),
(220, 4, 10, '', '', 'pt', 'sms'),
(221, 5, 10, '', '', 'ru', 'sms'),
(222, 6, 10, '', '', 'es', 'sms'),
(223, 7, 10, '', '', 'tr', 'sms'),
(224, 8, 10, '', '', 'ch', 'sms'),
(225, 1, 14, 'Status of Transaction #{uuid} has been updated!', 'Hi {paidByUser/merchantUser},\r\n                                <br><br><b>\r\n                                Transaction of Merchant Payment #{uuid} has been updated to {status} by system administrator!</b>\r\n                                <br><br>\r\n                                {amount} is {added/subtracted} {from/to} your account.\r\n                                ', 'en', 'sms'),
(226, 2, 14, '', '', 'ar', 'sms'),
(227, 3, 14, '', '', 'fr', 'sms'),
(228, 4, 14, '', '', 'pt', 'sms'),
(229, 5, 14, '', '', 'ru', 'sms'),
(230, 6, 14, '', '', 'es', 'sms'),
(231, 7, 14, '', '', 'tr', 'sms'),
(232, 8, 14, '', '', 'ch', 'sms'),
(233, 1, 16, 'Status of Transaction #{uuid} has been updated!', 'Hi {user_id/receiver_id},\r\n                                <br><br><b>\r\n                                Transaction of Request Payment #{uuid} has been updated to {status} by system administrator!</b>\r\n                                ', 'en', 'sms'),
(234, 2, 16, '', '', 'ar', 'sms'),
(235, 3, 16, '', '', 'fr', 'sms'),
(236, 4, 16, '', '', 'pt', 'sms'),
(237, 5, 16, '', '', 'ru', 'sms'),
(238, 6, 16, '', '', 'es', 'sms'),
(239, 7, 16, '', '', 'tr', 'sms'),
(240, 8, 16, '', '', 'ch', 'sms'),
(241, 1, 11, 'Notice of Ticket!', 'Hi {assignee/user},\r\n                                <br><br>Ticket #{ticket_code} was {assigned/created} {to/for} you by the system administrator.\r\n                                ', 'en', 'sms'),
(242, 2, 11, '', '', 'ar', 'sms'),
(243, 3, 11, '', '', 'fr', 'sms'),
(244, 4, 11, '', '', 'pt', 'sms'),
(245, 5, 11, '', '', 'ru', 'sms'),
(246, 6, 11, '', '', 'es', 'sms'),
(247, 7, 11, '', '', 'tr', 'sms'),
(248, 8, 11, '', '', 'ch', 'sms'),
(249, 1, 12, 'Notice of Ticket Reply!', 'Hi {user},\r\n                                <br><br>The system administrator has replied to your assigned ticket # {ticket_code).\r\n                                ', 'en', 'sms'),
(250, 2, 12, '', '', 'ar', 'sms'),
(251, 3, 12, '', '', 'fr', 'sms'),
(252, 4, 12, '', '', 'pt', 'sms'),
(253, 5, 12, '', '', 'ru', 'sms'),
(254, 6, 12, '', '', 'es', 'sms'),
(255, 7, 12, '', '', 'tr', 'sms'),
(256, 8, 12, '', '', 'ch', 'sms'),
(257, 1, 13, 'Notice of Dispute Reply!', 'Hi {user},\r\n                                <br><br>The system administrator has replied to your dispute for transaction # {transaction_id).\r\n                                ', 'en', 'sms'),
(258, 2, 13, '', '', 'ar', 'sms'),
(259, 3, 13, '', '', 'fr', 'sms'),
(260, 4, 13, '', '', 'pt', 'sms'),
(261, 5, 13, '', '', 'ru', 'sms'),
(262, 6, 13, '', '', 'es', 'sms'),
(263, 7, 13, '', '', 'tr', 'sms'),
(264, 8, 13, '', '', 'ch', 'sms'),
(265, 1, 23, 'Notice of Deposit Notification!', 'Hi,\r\n                                <br><br>Amount {amount} was deposited by {user}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Deposit:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Currency:</u></b> {code}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(266, 2, 23, '', '', 'ar', 'email'),
(267, 3, 23, '', '', 'fr', 'email'),
(268, 4, 23, '', '', 'pt', 'email'),
(269, 5, 23, '', '', 'ru', 'email'),
(270, 6, 23, '', '', 'es', 'email'),
(271, 7, 23, '', '', 'tr', 'email'),
(272, 8, 23, '', '', 'ch', 'email'),
(273, 1, 24, 'Notice of Payout Notification!', 'Hi,\r\n                                <br><br>Amount {amount} was payout by {user}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Payout:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Currency:</u></b> {code}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(274, 2, 24, '', '', 'ar', 'email'),
(275, 3, 24, '', '', 'fr', 'email'),
(276, 4, 24, '', '', 'pt', 'email'),
(277, 5, 24, '', '', 'ru', 'email'),
(278, 6, 24, '', '', 'es', 'email'),
(279, 7, 24, '', '', 'tr', 'email'),
(280, 8, 24, '', '', 'ch', 'email'),
(281, 1, 25, 'Notice of Exchange Notification!', 'Hi,\r\n                                <br><br>Amount {amount} was exchanged by {user}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Exchange:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>From wallet:</u></b> {from_wallet}\r\n\r\n                                <br><br><b><u>To wallet:</u></b> {to_wallet}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee (deducted from {from_wallet}):</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(282, 2, 25, '', '', 'ar', 'email'),
(283, 3, 25, '', '', 'fr', 'email'),
(284, 4, 25, '', '', 'pt', 'email'),
(285, 5, 25, '', '', 'ru', 'email'),
(286, 6, 25, '', '', 'es', 'email'),
(287, 7, 25, '', '', 'tr', 'email'),
(288, 8, 25, '', '', 'ch', 'email'),
(289, 1, 26, 'Notice of Transfer Notification!', 'Hi,\r\n                                <br><br>Amount {amount} was sent by {sender} to {receiver}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Transfer:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Sent By:</u></b> {sender}\r\n\r\n                                <br><br><b><u>Received By:</u></b> {receiver}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee (deducted from {sender}):</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(290, 2, 26, '', '', 'ar', 'email'),
(291, 3, 26, '', '', 'fr', 'email'),
(292, 4, 26, '', '', 'pt', 'email'),
(293, 5, 26, '', '', 'ru', 'email'),
(294, 6, 26, '', '', 'es', 'email'),
(295, 7, 26, '', '', 'tr', 'email'),
(296, 8, 26, '', '', 'ch', 'email'),
(297, 1, 27, 'Notice of Request Acceptance Notification!', 'Hi,\r\n                                <br><br>The request #{uuid} from {creator} was accepted by {acceptor}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Request Acceptance:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Currency:</u></b> {code}\r\n\r\n                                <br><br><b><u>Requested By:</u></b> {creator}\r\n\r\n                                <br><br><b><u>Accepted By:</u></b> {acceptor}\r\n\r\n                                <br><br><b><u>Requested Amount:</u></b> {request_amount}\r\n\r\n                                <br><br><b><u>Given Amount:</u></b> {given_amount}\r\n\r\n                                <br><br><b><u>Fee (deducted from {acceptor}):</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(298, 2, 27, '', '', 'ar', 'email'),
(299, 3, 27, '', '', 'fr', 'email'),
(300, 4, 27, '', '', 'pt', 'email'),
(301, 5, 27, '', '', 'ru', 'email'),
(302, 6, 27, '', '', 'es', 'email'),
(303, 7, 27, '', '', 'tr', 'email'),
(304, 8, 27, '', '', 'ch', 'email'),
(305, 1, 28, 'Notice of Payment Notification!', 'Hi,\r\n                                <br><br>Amount {amount} was paid by {user} to {merchant}.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Payment:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Currency:</u></b> {code}\r\n\r\n                                <br><br><b><u>Paid By:</u></b> {user}\r\n\r\n                                <br><br><b><u>Paid To:</u></b> {merchant}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee (deducted from {merchant}):</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(306, 2, 28, '', '', 'ar', 'email'),
(307, 3, 28, '', '', 'fr', 'email'),
(308, 4, 28, '', '', 'pt', 'email'),
(309, 5, 28, '', '', 'ru', 'email'),
(310, 6, 28, '', '', 'es', 'email'),
(311, 7, 28, '', '', 'tr', 'email'),
(312, 8, 28, '', '', 'ch', 'email'),
(313, 1, 29, 'Notice of Status Change!', 'Hi {user},\r\n                                    <br><br>Your status has been changed to <b>{status}</b> by the System Administrator\r\n                                    <br><br>If you have any questions, please feel free to reply to this email.\r\n                                    <br><br>Regards,\r\n                                    <br><b>{soft_name}</b>.', 'en', 'email'),
(314, 2, 29, '', '', 'ar', 'email'),
(315, 3, 29, '', '', 'fr', 'email'),
(316, 4, 29, '', '', 'pt', 'email'),
(317, 5, 29, '', '', 'ru', 'email'),
(318, 6, 29, '', '', 'es', 'email'),
(319, 7, 29, '', '', 'tr', 'email'),
(320, 8, 29, '', '', 'ch', 'email'),
(321, 1, 30, 'Notice of Deposit via System Administrator!', 'Hi,\r\n                                <br><br>Amount {amount} was deposited by System Administrator.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the Deposit:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Currency:</u></b> {code}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(322, 2, 30, '', '', 'ar', 'email'),
(323, 3, 30, '', '', 'fr', 'email'),
(324, 4, 30, '', '', 'pt', 'email'),
(325, 5, 30, '', '', 'ru', 'email'),
(326, 6, 30, '', '', 'es', 'email'),
(327, 7, 30, '', '', 'tr', 'email'),
(328, 8, 30, '', '', 'ch', 'email'),
(329, 1, 31, 'Notice of Payout via System Administrator!', 'Hi,\r\n                                <br><br>Amount {amount} was withdrawn by System Administrator.\r\n\r\n                                <br><br><b><u><i>Here’s a brief overview of the withdrawal:</i></u></b>\r\n\r\n                                <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n                                <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n                                <br><br><b><u>Currency:</u></b> {code}\r\n\r\n                                <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n                                <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n                                <br><br>If you have any questions, please feel free to reply to this email.\r\n                                <br><br>Regards,\r\n                                <br><b>{soft_name}</b>\r\n                                ', 'en', 'email'),
(330, 2, 31, '', '', 'ar', 'email'),
(331, 3, 31, '', '', 'fr', 'email'),
(332, 4, 31, '', '', 'pt', 'email'),
(333, 5, 31, '', '', 'ru', 'email'),
(334, 6, 31, '', '', 'es', 'email'),
(335, 7, 31, '', '', 'tr', 'email'),
(336, 8, 31, '', '', 'ch', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `fees_limits`
--

CREATE TABLE `fees_limits` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_type_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `charge_percentage` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `charge_fixed` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `min_limit` decimal(20,8) NOT NULL DEFAULT 1.00000000,
  `max_limit` decimal(20,8) DEFAULT NULL,
  `processing_time` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'time in days',
  `has_transaction` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Yes or No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_limits`
--

INSERT INTO `fees_limits` (`id`, `currency_id`, `transaction_type_id`, `payment_method_id`, `charge_percentage`, `charge_fixed`, `min_limit`, `max_limit`, `processing_time`, `has_transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(2, 1, 1, 2, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(3, 1, 1, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(4, 1, 1, 4, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(5, 1, 1, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(6, 1, 1, 6, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(7, 1, 1, 7, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(8, 1, 2, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(9, 1, 2, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(10, 1, 2, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(11, 1, 2, 8, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(12, 1, 3, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(13, 1, 5, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(14, 1, 8, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(15, 2, 1, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(16, 2, 1, 2, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(17, 2, 1, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(18, 2, 1, 4, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(19, 2, 1, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(20, 2, 1, 6, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(21, 2, 1, 7, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(22, 2, 2, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(23, 2, 2, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(24, 2, 2, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(25, 2, 2, 8, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(26, 2, 3, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(27, 2, 5, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(28, 2, 8, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(29, 3, 1, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(30, 3, 1, 2, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(31, 3, 1, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(32, 3, 1, 4, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(33, 3, 1, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(34, 3, 1, 6, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(35, 3, 1, 7, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, '2023-02-11 20:32:14'),
(36, 3, 2, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(37, 3, 2, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(38, 3, 2, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(39, 3, 2, 8, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(40, 3, 3, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(41, 3, 5, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(42, 3, 8, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', NULL, NULL),
(43, 1, 1, 8, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(44, 1, 1, 9, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(45, 1, 2, 2, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(46, 1, 2, 4, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(47, 1, 2, 6, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(48, 1, 2, 7, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(49, 1, 2, 9, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 12:20:30', '2023-02-07 12:20:30'),
(50, 6, 1, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(51, 6, 1, 2, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(52, 6, 1, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(53, 6, 1, 4, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(54, 6, 1, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(55, 6, 1, 6, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(56, 6, 1, 7, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:16', '2023-02-11 20:30:00'),
(57, 6, 2, 1, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 13:42:27', '2023-02-07 13:42:27'),
(58, 6, 2, 3, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:27', '2023-02-07 13:42:27'),
(59, 6, 2, 5, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'No', '2023-02-07 13:42:27', '2023-02-07 13:42:27'),
(60, 6, 3, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 13:42:33', '2023-02-07 13:42:33'),
(61, 6, 8, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 13:42:42', '2023-02-07 13:42:42'),
(62, 6, 5, NULL, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-07 13:42:51', '2023-02-07 13:42:51'),
(63, 6, 1, 10, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-11 20:25:08', '2023-02-11 20:30:00'),
(64, 3, 1, 10, '0.00000000', '0.00000000', '1.00000000', NULL, '0', 'Yes', '2023-02-11 20:32:14', '2023-02-11 20:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_reply_id` int(10) UNSIGNED DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originalname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `admin_id`, `user_id`, `ticket_id`, `ticket_reply_id`, `filename`, `originalname`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, NULL, NULL, '1676206844.jpg', 'KEKE-MARWA.jpg', 'jpg', '2023-02-12 13:00:44', '2023-02-12 13:00:44'),
(2, NULL, 1, NULL, NULL, '1676206855.png', '2.png', 'png', '2023-02-12 13:00:55', '2023-02-12 13:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 or 0',
  `deletable` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes' COMMENT 'Yes or No',
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT 'Active or Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `default`, `deletable`, `status`) VALUES
(1, 'English', 'en', '1530358989.png', '1', 'No', 'Active'),
(2, 'عربى', 'ar', '1530359409.png', '0', 'No', 'Active'),
(3, 'Français', 'fr', '1530359431.png', '0', 'No', 'Active'),
(4, 'Português', 'pt', '1530359450.png', '0', 'No', 'Active'),
(5, 'Русский', 'ru', '1530359474.png', '0', 'No', 'Active'),
(6, 'Español', 'es', '1530360151.png', '0', 'No', 'Active'),
(7, 'Türkçe', 'tr', '1530696845.png', '0', 'No', 'Active'),
(8, '中文 (繁體)', 'ch', '1531227913.png', '0', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `merchant_group_id` int(10) UNSIGNED DEFAULT NULL,
  `merchant_uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID for each Merchant',
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'standard or express',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(20,8) DEFAULT 0.00000000,
  `status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Moderation' COMMENT 'Moderation, Disapproved, Approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_apps`
--

CREATE TABLE `merchant_apps` (
  `id` int(10) UNSIGNED NOT NULL,
  `merchant_id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_groups`
--

CREATE TABLE `merchant_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(20,8) DEFAULT 0.00000000,
  `is_default` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No' COMMENT 'No or Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_groups`
--

INSERT INTO `merchant_groups` (`id`, `name`, `description`, `fee`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Premium', 'This is the premium merchant group', '0.51234567', 'No', NULL, NULL),
(2, 'Gold', 'This is the gold merchant group', '1.99933344', 'No', NULL, NULL),
(3, 'Silver', 'This is the silver merchant group', '1.50000044', 'Yes', NULL, NULL),
(4, 'Bronze', 'This is the bronze merchant group', '2.77711194', 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `merchant_payments`
--

CREATE TABLE `merchant_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `merchant_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `gateway_reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_percentage` decimal(20,8) DEFAULT 0.00000000,
  `charge_fixed` decimal(20,8) DEFAULT 0.00000000,
  `amount` decimal(20,8) DEFAULT 0.00000000,
  `total` decimal(20,8) DEFAULT 0.00000000,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Success' COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `url`, `title`, `description`, `keywords`) VALUES
(1, 'help', 'Help', 'Help', ''),
(2, 'about-us', 'About Us', 'About Us', ''),
(3, 'contact-us', 'Contact Us', 'Contact Us', ''),
(4, 'header', 'Header', 'Header', ''),
(5, 'login', 'Login', 'Login', ''),
(6, 'register', 'Register', 'Register', ''),
(7, '/', 'Home', 'Home', ''),
(8, 'dashboard', 'Dashboard', 'Dashboard', ''),
(9, 'moneytransfer', 'Money Transfer', 'Money Transfer', ''),
(10, 'transactions', 'Transactions', 'Transactions', ''),
(11, 'exchanges', 'Money Exchange', 'Money Exchange', ''),
(12, 'exchange', 'Money Exchange', 'Money Exchange', ''),
(13, 'merchants', 'Merchant', 'Merchant', ''),
(14, 'merchant/add', 'Add Merchant', 'Add Merchant', ''),
(15, 'request_payments', 'Request Payments', 'Request Payments', ''),
(16, 'request_payment/add', 'Request Payment', 'Request Payment', ''),
(17, 'request_payment/edit/{id}', 'Request Payment', 'Request Payment', ''),
(18, 'request_payment/detail/{id}', 'Request Payment', 'Request Payment', ''),
(19, 'request_payment/completes', 'Request Payment', 'Request Payment', ''),
(20, 'exchange/view/{id}', 'Money Exchange', 'Money Exchange', ''),
(21, 'merchant/edit/{id}', 'Edit Merchant', 'Edit Merchant', ''),
(22, 'merchant/payments', 'Merchant payments', 'Merchant payments', ''),
(23, 'deposit', 'Deposit', 'Deposit', ''),
(24, 'deposit/method/{id}', 'Deposit Amount', 'Deposit Amount', ''),
(25, 'deposit/stripe_payment', 'Deposit With Stripe', 'Deposit With Stripe', ''),
(26, 'payout', 'Payout', 'Payout', ''),
(27, 'withdrawal/method/{id}', 'Payout', 'Payout', ''),
(28, 'payouts', 'Payouts', 'Payouts', ''),
(29, 'transactions/{id}', 'Transactions', 'Transactions', ''),
(30, 'request_payment/accept/{id}', 'Request Payment', 'Request Payment', ''),
(31, 'request_payment/accept/{id}', 'Request Payment', 'Request Payment', ''),
(32, 'disputes', 'Disputes', 'Disputes', ''),
(33, 'merchant/detail/{id}', 'View Merchant', 'View Merchant', ''),
(34, 'dispute/discussion/{id}', 'Dispute Details', 'Dispute Details', ''),
(35, 'dispute/add/{id}', 'Dispute Add', 'Dispute Add', ''),
(36, 'send-money', 'Send Money', 'Send Money', ''),
(37, 'request-money', 'Request Money', 'Request Money', ''),
(38, 'news', 'News', 'News', ''),
(39, 'profile', 'User Profile', 'User Profile', ''),
(40, 'tickets', 'Tickets', 'Tickets', ''),
(41, 'ticket/add', 'Add Ticket', 'Add Ticket', ''),
(42, 'ticket/reply/{id}', 'Ticket Reply', 'Ticket Reply', ''),
(43, 'exchange_of_base_currency', 'Money Exchange', 'Money Exchange', ''),
(44, 'exchange/exchange-of-base-currency-confirm', 'Money Exchange', 'Money Exchange', ''),
(45, 'deposit/stripe_payment_store', 'Deposit With Stripe', 'Deposit With Stripe', ''),
(46, 'payout/setting', 'Payout', 'Payout', ''),
(47, 'send-money-confirm', 'Money Transfer', 'Money Transfer', ''),
(48, 'exchange_to_base_currency', 'Money Exchange', 'Money Exchange', ''),
(49, 'exchange/exchange-to-base-currency-confirm', 'Money Exchange', 'Money Exchange', ''),
(50, 'portfolio', 'Portfolio', 'Portfolio', ''),
(51, 'request_payment/store', 'Request Payment', 'Request Payment', ''),
(52, 'forget-password', 'Forgot Password', 'Forgot Password', ''),
(53, 'password/resets/{token}', 'Reset Password', 'Reset Password', ''),
(54, 'request-money-confirm', 'Request Money', 'Request Money', ''),
(55, 'request_payment/accepted', 'Request Payment', 'Request Payment', ''),
(56, 'request_payment/accept-money-confirm', 'Request Payment', 'Request Payment', ''),
(57, 'deposit/stripe_payment_store', 'Deposit With Stripe', 'Deposit With Stripe', ''),
(58, 'policies', 'Policies', 'Policies', ''),
(59, 'transfer', 'Money Transfer', 'Money Transfer', ''),
(60, 'withdrawal/confirm-transaction', 'Payout', 'Payout', ''),
(61, 'request', 'Request Payment', 'Request Payment', ''),
(62, 'deposit/payumoney_success', 'Deposit With PayUMoney', 'Deposit With PayUMoney', ''),
(63, 'deposit/payment_success', 'Deposit Success', 'Deposit With PayMoney Success', ''),
(64, 'developer', 'Developer', 'Developer Page', ''),
(65, 'phone-verification', 'Verfy Phone', 'Verfy Phone', ''),
(66, 'authenticate', '2-Factor Authentication', '2-Factor Authentication', ''),
(67, 'profile/2fa', '2-FA', '2-FA', ''),
(68, '2fa', '2-Factor Authentication', '2-Factor Authentication', ''),
(69, 'deposit/bank-payment', 'Deposit', 'Deposit', ''),
(70, 'bank-transfer', 'Bank Transfer', 'Bank Transfer', ''),
(71, 'bank-transfer/confirm', 'Bank Transfer', 'Bank Transfer', ''),
(72, 'bank-transfer/success', 'Bank Transfer', 'Bank Transfer', ''),
(73, 'google2fa', 'Google 2FA', 'Google 2FA', ''),
(74, 'profile/personal-id', 'Identity Verification', 'Identity Verification', ''),
(75, 'profile/personal-address', 'Address Verification', 'Address Verification', ''),
(76, 'exchange-of-money', 'Money Exchange', 'Money Exchange', ''),
(77, 'exchange-of-money-success', 'Money Exchange', 'Money Exchange', ''),
(78, 'deposit/bank-payment', 'Deposit', 'Deposit', ''),
(79, 'deposit/payeer/payment/success', 'Deposit With Payeer', 'Deposit With Payeer', ''),
(80, 'deposit/checkout/payment/success', 'Deposit with 2checkout', 'Deposit with 2checkout', ''),
(81, 'merchant/payment', 'Merchant Payment', 'Merchant Payment', ''),
(82, 'check-user-status', 'Suspended!', 'Suspended', ''),
(83, 'check-request-creator-suspended-status', 'Suspended', 'Suspended', ''),
(84, 'check-request-creator-inactive-status', 'Inactive', 'Inactive', ''),
(85, 'deposit/stripe-payment/success', 'Deposit With Stripe', 'Deposit With Stripe', ''),
(86, 'deposit/paypal-payment/success', 'Deposit With PayPal', 'Deposit With PayPal', ''),
(87, 'deposit/bank-payment/success', 'Deposit With Bank', 'Deposit With Bank', ''),
(88, 'wallet-list', 'Wallet List', 'Wallet List', ''),
(89, 'deposit/store', 'Deposit Fund', 'Deposit', ''),
(90, 'deposit/coinpayment-transaction-info', 'Coinpayment Summery', 'Coinpayment Summery', ''),
(91, 'deposit/paypal-payment/success/{amount}', 'Deposit With PayPal', 'Deposit With PayPal', ''),
(92, 'crypto/send/blockio/{walletCurrencyCode}/{walletId}', 'Crypto Send', 'Crypto Send', ''),
(93, 'crypto/send/blockio/confirm', 'Send Crypto Confirm', 'Send Crypto Confirm', ''),
(94, 'crypto/send/blockio/success', 'Send Crypto Success', 'Send Crypto Success', ''),
(95, 'crypto/receive/blockio/{walletCurrencyCode}/{walletId}', 'Crypto Receive', 'Crypto Receive', '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2019_09_01_0000000002_create_email_configs_table', 1),
(7, '2019_09_01_000000001_entrust_setup_tables', 1),
(8, '2019_09_01_0000001_create_activity_logs_table', 1),
(9, '2019_09_01_0000002_create_backups_table', 1),
(10, '2019_09_01_0000003_create_countries_table', 1),
(11, '2019_09_01_0000004_create_metas_table', 1),
(12, '2019_09_01_0000005_create_settings_table', 1),
(13, '2019_09_01_0000006_create_admins_table', 1),
(14, '2019_09_01_0000007_add_picture_to_admins_table', 1),
(15, '2019_09_01_0000010_create_payment_methods_table', 1),
(16, '2019_09_01_0000011_create_merchant_groups_table', 1),
(17, '2019_09_01_0000013_create_preferences_table', 1),
(18, '2019_09_01_0000014_create_reasons_table', 1),
(19, '2019_09_01_0000015_create_time_zones_table', 1),
(20, '2019_09_01_0000016_create_transaction_types_table', 1),
(21, '2019_09_01_0000017_create_socials_table', 1),
(22, '2019_09_01_0000018_create_ticket_statuses_table', 1),
(23, '2019_09_01_0000019_create_currencies_table', 1),
(24, '2019_09_01_0000020_create_currency_payment_methods_table', 1),
(25, '2019_09_01_0000021__create_users_table', 1),
(26, '2019_09_01_0000021_add_picture_to_users_table', 1),
(27, '2019_09_01_0000022_create_user_details_table', 1),
(28, '2019_09_01_0000023_create_fees_limits_table', 1),
(29, '2019_09_01_0000024_create_tickets_table', 1),
(30, '2019_09_01_0000025_create_ticket_replies_table', 1),
(31, '2019_09_01_0000026_create_files_table', 1),
(32, '2019_09_01_0000027_create_merchants_table', 1),
(33, '2019_09_01_0000028_create_merchant_apps_table', 1),
(34, '2019_09_01_0000029__create_banks_table', 1),
(35, '2019_09_01_0000029_create_merchant_payments_table', 1),
(36, '2019_09_01_0000030_create_deposits_table', 1),
(37, '2019_09_01_0000031_create_payout_settings_table', 1),
(38, '2019_09_01_0000032_create_withdrawals_table', 1),
(39, '2019_09_01_0000033_create_withdrawal_details_table', 1),
(40, '2019_09_01_0000034_create_transfers_table', 1),
(41, '2019_09_01_0000035_create_wallets_table', 1),
(42, '2019_09_01_0000036_create_currency_exchanges_table', 1),
(43, '2019_09_01_0000037_create_request_payments_table', 1),
(44, '2019_09_01_0000038_create_transactions_table', 1),
(45, '2019_09_01_0000039_create_disputes_table', 1),
(46, '2019_09_01_0000040_create_dispute_discussions_table', 1),
(47, '2019_09_01_0000043_create_app_tokens_table', 1),
(48, '2019_09_01_0000044_create_app_transactions_infos_table', 1),
(49, '2019_09_01_0000045_create_verify_users_table', 1),
(50, '2019_09_01_0000046_create_device_logs_table', 1),
(51, '2019_09_01_0000047_create_qr_codes_table', 1),
(52, '2019_09_01_0000048_create_password_resets_table', 1),
(53, '2019_09_01_0000049_create_document_verifications_table', 1),
(54, '2019_09_01_000004_create_app_store_credentials_table', 1),
(55, '2019_09_01_000005_create_languages_table', 1),
(56, '2019_09_01_000007_create_email_templates_table', 1),
(57, '2019_09_01_000009_create_pages_table', 1),
(58, '2019_10_22_054304_create_notification_types_table', 1),
(59, '2019_10_22_054339_create_notification_settings_table', 1),
(60, '2020_01_27_101740_create_sms_configs_table', 1),
(61, '2021_07_12_071706_create_addons_table', 1),
(62, '2021_08_15_075359_create_coinpayment_log_trxes_table', 1),
(63, '2022_07_26_065815_create_crypto_providers_table', 1),
(64, '2022_07_26_070412_create_crypto_asset_settings_table', 1),
(65, '2022_07_26_080438_create_crypto_asset_api_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_type_id` int(10) UNSIGNED NOT NULL,
  `recipient_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `notification_type_id`, `recipient_type`, `recipient`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'email', NULL, 'No', NULL, NULL),
(2, 2, 'email', NULL, 'No', NULL, NULL),
(3, 3, 'email', NULL, 'No', NULL, NULL),
(4, 4, 'email', NULL, 'No', NULL, NULL),
(5, 5, 'email', NULL, 'No', NULL, NULL),
(6, 6, 'email', NULL, 'No', NULL, NULL),
(7, 1, 'sms', NULL, 'No', NULL, NULL),
(8, 2, 'sms', NULL, 'No', NULL, NULL),
(9, 3, 'sms', NULL, 'No', NULL, NULL),
(10, 4, 'sms', NULL, 'No', NULL, NULL),
(11, 5, 'sms', NULL, 'No', NULL, NULL),
(12, 6, 'sms', NULL, 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE `notification_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_types`
--

INSERT INTO `notification_types` (`id`, `name`, `alias`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Deposit', 'deposit', 'Active', NULL, NULL),
(2, 'Payout', 'payout', 'Active', NULL, NULL),
(3, 'Send', 'send', 'Active', NULL, NULL),
(4, 'Request', 'request', 'Active', NULL, NULL),
(5, 'Exchange', 'exchange', 'Active', NULL, NULL),
(6, 'Payment', 'payment', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'agkL4ISxlzHE5z2zS2vwqZqqoF7ker3HMXo7De3v', 'http://localhost', 1, 0, 0, NULL, NULL),
(2, NULL, 'Laravel Password Grant Client', 'TwF6YvwSCLuVejXhUQCAqMaPAqhHZ29sEhhFfsM9', 'http://localhost', 0, 1, 0, NULL, NULL),
(3, NULL, 'Laravel Personal Access Client', 'YWG63Yjp0bcf7iL45MgK75Yc5Tq18KS9rcv8ltBM', 'http://localhost', 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL);

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
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT 'active or inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT 'Active or Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `status`) VALUES
(1, 'Mts', 'Active'),
(2, 'Stripe', 'Active'),
(3, 'Paypal', 'Active'),
(4, 'PayUmoney', 'Active'),
(5, 'Bank', 'Active'),
(6, 'Coinpayments', 'Active'),
(7, 'Payeer', 'Active'),
(8, 'Crypto', 'Active'),
(9, 'BlockIo', 'Active'),
(10, 'Paystack', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payout_settings`
--

CREATE TABLE `payout_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `crypto_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(10) UNSIGNED DEFAULT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_payout` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=not default, 1=default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `group`, `name`, `display_name`, `description`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'User', 'view_user', 'View User', 'View User', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(2, 'User', 'add_user', 'Add User', 'Add User', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(3, 'User', 'edit_user', 'Edit User', 'Edit User', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(4, 'User', 'delete_user', 'Delete User', 'Delete User', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(5, 'Transaction', 'view_transaction', 'View Transaction', 'View Transaction', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(6, 'Transaction', 'add_transaction', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(7, 'Transaction', 'edit_transaction', 'Edit Transaction', 'Edit Transaction', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(8, 'Transaction', 'delete_transaction', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(9, 'Deposit', 'view_deposit', 'View Deposit', 'View Deposit', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(10, 'Deposit', 'add_deposit', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(11, 'Deposit', 'edit_deposit', 'Edit Deposit', 'Edit Deposit', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(12, 'Deposit', 'delete_deposit', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(13, 'Withdrawal', 'view_withdrawal', 'View Withdrawal', 'View Withdrawal', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(14, 'Withdrawal', 'add_withdrawal', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(15, 'Withdrawal', 'edit_withdrawal', 'Edit Withdrawal', 'Edit Withdrawal', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(16, 'Withdrawal', 'delete_withdrawal', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(17, 'Transfer', 'view_transfer', 'View Transfer', 'View Transfer', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(18, 'Transfer', 'add_transfer', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(19, 'Transfer', 'edit_transfer', 'Edit Transfer', 'Edit Transfer', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(20, 'Transfer', 'delete_transfer', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(21, 'Exchange', 'view_exchange', 'View Exchange', 'View Exchange', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(22, 'Exchange', 'add_exchange', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(23, 'Exchange', 'edit_exchange', 'Edit Exchange', 'Edit Exchange', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(24, 'Exchange', 'delete_exchange', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(29, 'Request Payment', 'view_request_payment', 'View Request Payment', 'View Request Payment', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(30, 'Request Payment', 'add_request_payment', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(31, 'Request Payment', 'edit_request_payment', 'Edit Request Payment', 'Edit Request Payment', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(32, 'Request Payment', 'delete_request_payment', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(33, 'Revenue', 'view_revenue', 'View Revenue', 'View Revenue', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(34, 'Revenue', 'add_revenue', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(35, 'Revenue', 'edit_revenue', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(36, 'Revenue', 'delete_revenue', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(37, 'Email Template', 'view_email_template', 'View Email Template', 'View Email Template', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(38, 'Email Template', 'add_email_template', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(39, 'Email Template', 'edit_email_template', 'Edit Email Template', 'Edit Email Template', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(40, 'Email Template', 'delete_email_template', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(41, 'Activity Log', 'view_activity_log', 'View Activity Log', 'View Activity Log', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(42, 'Activity Log', 'add_activity_log', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(43, 'Activity Log', 'edit_activity_log', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(44, 'Activity Log', 'delete_activity_log', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(45, 'General Setting', 'view_general_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(46, 'General Setting', 'add_general_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(47, 'General Setting', 'edit_general_setting', 'Edit General Setting', 'Edit General Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(48, 'General Setting', 'delete_general_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(49, 'Social Links', 'view_social_links', 'View Social Links', 'View Social Links', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(50, 'Social Links', 'add_social_links', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(51, 'Social Links', 'edit_social_links', 'Edit Social Links', 'Edit Social Links', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(52, 'Social Links', 'delete_social_links', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(53, 'API Credentials', 'view_api_credentials', 'View API Credentials', 'View API Credentials', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(54, 'API Credentials', 'add_api_credentials', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(55, 'API Credentials', 'edit_api_credentials', 'Edit API Credentials', 'Edit API Credentials', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(56, 'API Credentials', 'delete_api_credentials', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(57, 'Payment Methods', 'view_payment_methods', 'View Payment Methods', 'View Payment Methods', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(58, 'Payment Methods', 'add_payment_methods', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(59, 'Payment Methods', 'edit_payment_methods', 'Edit Payment Methods', 'Edit Payment Methods', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(60, 'Payment Methods', 'delete_payment_methods', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(61, 'Email Setting', 'view_email_setting', 'View Email Setting', 'View Email Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(62, 'Email Setting', 'add_email_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(63, 'Email Setting', 'edit_email_setting', 'Edit Email Setting', 'Edit Email Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(64, 'Email Setting', 'delete_email_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(65, 'Currency', 'view_currency', 'View Currency', 'View Currency', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(66, 'Currency', 'add_currency', 'Add Currency', 'Add Currency', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(67, 'Currency', 'edit_currency', 'Edit Currency', 'Edit Currency', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(68, 'Currency', 'delete_currency', 'Delete Currency', 'Delete Currency', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(69, 'Country', 'view_country', 'View Country', 'View Country', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(70, 'Country', 'add_country', 'Add Country', 'Add Country', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(71, 'Country', 'edit_country', 'Edit Country', 'Edit Country', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(72, 'Country', 'delete_country', 'Delete Country', 'Delete Country', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(73, 'Language', 'view_language', 'View Language', 'View Language', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(74, 'Language', 'add_language', 'Add Language', 'Add Language', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(75, 'Language', 'edit_language', 'Edit Language', 'Edit Language', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(76, 'Language', 'delete_language', 'Delete Language', 'Delete Language', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(77, 'Role', 'view_role', 'View Role', 'View Role', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(78, 'Role', 'add_role', 'Add Role', 'Add Role', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(79, 'Role', 'edit_role', 'Edit Role', 'Edit Role', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(80, 'Role', 'delete_role', 'Delete Role', 'Delete Role', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(85, 'Database Backup', 'view_database_backup', 'View Database Backup', 'View Database Backup', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(86, 'Database Backup', 'add_database_backup', 'Add Database Backup', 'Add Database Backup', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(87, 'Database Backup', 'edit_database_backup', 'Edit Database Backup', 'Edit Database Backup', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(88, 'Database Backup', 'delete_database_backup', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(89, 'Meta', 'view_meta', 'View Meta', 'View Meta', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(90, 'Meta', 'add_meta', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(91, 'Meta', 'edit_meta', 'Edit Meta', 'Edit Meta', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(92, 'Meta', 'delete_meta', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(93, 'Page', 'view_page', 'View Page', 'View Page', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(94, 'Page', 'add_page', 'Add Page', 'Add Page', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(95, 'Page', 'edit_page', 'Edit Page', 'Edit Page', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(96, 'Page', 'delete_page', 'Delete Page', 'Delete Page', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(97, 'Preference', 'view_preference', 'View Preference', 'View Preference', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(98, 'Preference', 'add_preference', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(99, 'Preference', 'edit_preference', 'Edit Preference', 'Edit Preference', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(100, 'Preference', 'delete_preference', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(101, 'Merchant', 'view_merchant', 'View Merchant', 'View Merchant', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(102, 'Merchant', 'add_merchant', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(103, 'Merchant', 'edit_merchant', 'Edit Merchant', 'Edit Merchant', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(104, 'Merchant', 'delete_merchant', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(105, 'Merchant Payment', 'view_merchant_payment', 'View Merchant Payment', 'View Merchant Payment', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(106, 'Merchant Payment', 'add_merchant_payment', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(107, 'Merchant Payment', 'edit_merchant_payment', 'Edit Merchant Payment', 'Edit Merchant Payment', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(108, 'Merchant Payment', 'delete_merchant_payment', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(109, 'Transaction', 'manage_transaction', 'Manage Transaction', 'Manage Transaction', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(110, 'Deposit', 'manage_deposit', 'Manage Deposit', 'Manage Deposit', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(111, 'Withdrawal', 'manage_withdrawal', 'Manage Withdrawal', 'Manage Withdrawal', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(112, 'Transfer', 'manage_transfer', 'Manage Transfer', 'Manage Transfer', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(113, 'Exchange', 'manage_exchange', 'Manage Exchange', 'Manage Exchange', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(115, 'Request Payment', 'manage_request_payment', 'Manage Request Payment', 'Manage Request Payment', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(116, 'Merchant', 'manage_merchant', 'Manage Merchant', 'Manage Merchant', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(117, 'Merchant Payment', 'manage_merchant_payment', 'Manage Merchant Payment', 'Manage Merchant Payment', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(118, 'User Group', 'view_group', 'View User Group', 'View User Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(119, 'User Group', 'add_group', 'Add User Group', 'Add User Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(120, 'User Group', 'edit_group', 'Edit User Group', 'Edit User Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(121, 'User Group', 'delete_group', 'Delete User Group', 'Delete User Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(122, 'Admins', 'view_admins', 'View Admins', 'View Admins', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(123, 'Admins', 'add_admin', 'Add Admin', 'Add Admin', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(124, 'Admins', 'edit_admin', 'Edit Admin', 'Edit Admin', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(125, 'Admins', 'delete_admin', 'Delete Admin', 'Delete Admin', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(126, 'Disputes', 'view_disputes', 'View Disputes', 'View Disputes', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(127, 'Disputes', 'add_dispute', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(128, 'Disputes', 'edit_dispute', 'Edit Dispute', 'Edit Dispute', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(129, 'Disputes', 'delete_dispute', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(130, 'Tickets', 'view_tickets', 'View Tickets', 'View Tickets', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(131, 'Tickets', 'add_ticket', 'Add Ticket', 'Add Ticket', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(132, 'Tickets', 'edit_ticket', 'Edit Ticket', 'Edit Ticket', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(133, 'Tickets', 'delete_ticket', 'Delete Ticket', 'Delete Ticket', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(134, 'Dispute', 'manage_dispute', 'Manage Dispute', 'Manage Dispute', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(135, 'Ticket', 'manage_ticket', 'Manage Ticket', 'Manage Ticket', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(136, 'Settings', 'manage_setting', 'Manage Settings', 'Manage Settings', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(137, 'AppStore Credentials', 'view_appstore_credentials', 'View AppStore Credentials', 'View AppStore Credentials', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(138, 'AppStore Credentials', 'add_appstore_credentials', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(139, 'AppStore Credentials', 'edit_appstore_credentials', 'Edit AppStore Credentials', 'Edit AppStore Credentials', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(140, 'AppStore Credentials', 'delete_appstore_credentials', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(145, 'Merchant Groups', 'view_merchant_group', 'View Merchant Group', 'View Merchant Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(146, 'Merchant Groups', 'add_merchant_group', 'Add Merchant Group', 'Add Merchant Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(147, 'Merchant Groups', 'edit_merchant_group', 'Edit Merchant Group', 'Edit Merchant Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(148, 'Merchant Groups', 'delete_merchant_group', 'Delete Merchant Group', 'Delete Merchant Group', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(149, 'SMS Setting', 'view_sms_setting', 'View SMS Setting', 'View SMS Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(150, 'SMS Setting', 'add_sms_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(151, 'SMS Setting', 'edit_sms_setting', 'Edit SMS Setting', 'Edit SMS Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(152, 'SMS Setting', 'delete_sms_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(153, 'Sms Template', 'view_sms_template', 'View Sms Template', 'View Sms Template', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(154, 'Sms Template', 'add_sms_template', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(155, 'Sms Template', 'edit_sms_template', 'Edit Sms Template', 'Edit Sms Template', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(156, 'Sms Template', 'delete_sms_template', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(157, 'Identity Verificattion', 'view_identity_verfication', 'View Identity Verificattion', 'View Identity Verificattion', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(158, 'Identity Verificattion', 'add_identity_verfication', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(159, 'Identity Verificattion', 'edit_identity_verfication', 'Edit Identity Verificattion', 'Edit Identity Verificattion', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(160, 'Identity Verificattion', 'delete_identity_verfication', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(161, 'Address Verificattion', 'view_address_verfication', 'View Address Verificattion', 'View Address Verificattion', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(162, 'Address Verificattion', 'add_address_verfication', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(163, 'Address Verificattion', 'edit_address_verfication', 'Edit Address Verificattion', 'Edit Address Verificattion', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(164, 'Address Verificattion', 'delete_address_verfication', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(165, 'Admin Security', 'view_admin_security', 'View Admin Security', 'View Admin Security', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(166, 'Admin Security', 'add_admin_security', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(167, 'Admin Security', 'edit_admin_security', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(168, 'Admin Security', 'delete_admin_security', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(169, 'Notification Type', 'view_notification_type', 'View Notification Type', 'View Notification Type', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(170, 'Notification Type', 'add_notification_type', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(171, 'Notification Type', 'edit_notification_type', 'Edit Notification Type', 'Edit Notification Type', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(172, 'Notification Type', 'delete_notification_type', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(173, 'Notification Setting', 'view_notification_setting', 'View Notification Setting', 'View Notification Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(174, 'Notification Setting', 'add_notification_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(175, 'Notification Setting', 'edit_notification_setting', 'Edit Notification Setting', 'Edit Notification Setting', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(176, 'Notification Setting', 'delete_notification_setting', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(177, 'Conversion Rate Api', 'view_conversion_rate_api', 'View Conversion Rate Api', 'View Conversion Rate Api', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(178, 'Conversion Rate Api', 'add_conversion_rate_api', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(179, 'Conversion Rate Api', 'edit_conversion_rate_api', 'Edit Conversion Rate Api', 'Edit Conversion Rate Api', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(180, 'Conversion Rate Api', 'delete_conversion_rate_api', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(181, 'Addon Manager', 'view_addon_manager', 'View Addon Manager', 'View Addon Manager', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(182, 'Addon Manager', 'add_addon_manager', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(183, 'Addon Manager', 'edit_addon_manager', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(184, 'Addon Manager', 'delete_addon_manager', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(185, 'Crypto Provider', 'view_crypto_provider', 'View Crypto Provider', 'View Addon Manager', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(186, 'Crypto Provider', 'add_crypto_provider', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(187, 'Crypto Provider', 'edit_crypto_provider', 'Edit Crypto Provider', NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(188, 'Crypto Provider', 'delete_crypto_provider', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(189, 'Crypto Asset', 'view_crypto_asset', 'View Crypto Asset', 'View Crypto Asset', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(190, 'Crypto Asset', 'add_crypto_asset', 'Add Crypto Asset', 'Add Crypto Asset', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(191, 'Crypto Asset', 'edit_crypto_asset', 'Edit Crypto Asset', 'Edit Crypto Asset', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(192, 'Crypto Asset', 'delete_crypto_asset', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(193, 'Crypto Transactions', 'view_crypto_transactions', 'View Crypto Transactions', 'View Crypto Transactions', 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(194, 'Crypto Transactions', 'add_crypto_transactions', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(195, 'Crypto Transactions', 'edit_crypto_transactions', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(196, 'Crypto Transactions', 'delete_crypto_transactions', NULL, NULL, 'Admin', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(197, 'Crypto Send/Receive', 'manage_crypto_send_receive', 'Manage Crypto Send/Receive', 'Manage Crypto Send/Receive', 'User', '2023-02-05 02:14:24', '2023-02-05 02:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(2, 109),
(3, 109),
(2, 110),
(3, 110),
(2, 111),
(3, 111),
(2, 112),
(3, 112),
(2, 113),
(3, 113),
(2, 115),
(3, 115),
(3, 116),
(3, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(2, 134),
(3, 134),
(2, 135),
(3, 135),
(2, 136),
(3, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 150),
(1, 151),
(1, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 170),
(1, 171),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(1, 185),
(1, 186),
(1, 187),
(1, 188),
(1, 189),
(1, 190),
(1, 191),
(1, 192),
(1, 193),
(1, 194),
(1, 195),
(1, 196),
(3, 197);

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`id`, `category`, `field`, `value`) VALUES
(1, 'preference', 'row_per_page', '25'),
(2, 'preference', 'date_format', '1'),
(3, 'preference', 'date_sepa', '-'),
(4, 'company', 'site_short_name', 'PM'),
(5, 'preference', 'percentage', '2'),
(6, 'preference', 'quantity', '0'),
(7, 'preference', 'date_format_type', 'dd-mm-yyyy'),
(8, 'company', 'company_name', 'Pay Money'),
(9, 'company', 'company_email', 'admin@techvill.net'),
(10, 'company', 'dflt_lang', 'en'),
(11, 'preference', 'default_money_format', '&nbsp;&#36;'),
(12, 'preference', 'money_format', 'before'),
(13, 'preference', 'decimal_format_amount', '2'),
(14, 'preference', 'thousand_separator', ','),
(15, 'preference', 'dflt_timezone', 'Asia/Dhaka'),
(16, 'preference', 'verification_mail', 'Disabled'),
(17, 'preference', 'phone_verification', 'Disabled'),
(18, 'preference', 'two_step_verification', 'disabled'),
(19, 'preference', 'processed_by', 'email'),
(20, 'preference', 'decimal_format_amount_crypto', '8'),
(21, 'preference', 'admin_url_prefix', 'admin'),
(22, 'preference', 'file_size', '2');

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `object_id`, `object_type`, `secret`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'user', 'YUhhYnI0WEp2UVlTSXpLMFIwbzArZXp6K09UZ24ramF3OGlxVnZweTdUVUZvRTF1bzVIRlZObHg4bkVrTWpyNw==', 'Inactive', '2023-02-07 12:36:20', '2023-02-11 18:38:07'),
(2, 2, 'user', 'ZVFHMkxnb3FUL0VCZ0p1VHBqMmg1b3N1UUc3RllORnhQVVBmYlJHRDJKeitINWxGVE5VMURMVWRUenF4U0JWZFBuZHhYeHNlRFdudlFRc3ltUHhhYlE9PQ==', 'Active', '2023-02-07 13:10:41', '2023-02-07 13:10:41'),
(3, 3, 'user', 'ZVFHMkxnb3FUL0VCZ0p1VHBqMmg1b3N1UUc3RllORnhQVVBmYlJHRDJKem5GaW95cGtsNXhvWENQRm8zVk9yTjlSYzFxL2o4amtKbjhLZ1JLMDdlb3c9PQ==', 'Active', '2023-02-07 13:26:13', '2023-02-07 13:26:13'),
(4, 1, 'user', 'YUhhYnI0WEp2UVlTSXpLMFIwbzArVVRDbFJicWZVdlRDcyt6Z3psTHdxSm9qNTdRRWRXaFFoVDZwdnNhN2FQcA==', 'Active', '2023-02-11 18:38:07', '2023-02-11 18:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `title`) VALUES
(1, 'I have not received the goods'),
(2, 'Description does not match with product');

-- --------------------------------------------------------

--
-- Table structure for table `request_payments`
--

CREATE TABLE `request_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `receiver_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID (For Each Payment Request)',
  `amount` decimal(20,8) DEFAULT 0.00000000,
  `accept_amount` decimal(20,8) DEFAULT 0.00000000,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_payments`
--

INSERT INTO `request_payments` (`id`, `user_id`, `receiver_id`, `currency_id`, `uuid`, `amount`, `accept_amount`, `email`, `phone`, `purpose`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 'CE51CBFCAAC91', '50.00000000', '50.00000000', 'incrisz4luv@gmail.com', NULL, NULL, 'sweet', 'Success', '2023-02-07 13:31:21', '2023-02-07 13:33:20'),
(2, 1, 3, 1, 'D1F3901A4C148', '3000.00000000', '0.00000000', 'increasegodwin1@gmail.com', NULL, NULL, 'give', 'Blocked', '2023-02-07 13:33:49', '2023-02-07 13:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `user_type`, `customer_type`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'Admin', 'Admin', 'user', 'No', NULL, NULL),
(2, 'Default User', 'Default User', 'Default User', 'User', 'user', 'Yes', NULL, NULL),
(3, 'Merchant Regular', 'Merchant Regular', 'Merchant Regular', 'User', 'merchant', 'No', NULL, '2023-02-12 12:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'Admin'),
(1, 2, 'User'),
(3, 2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `type`) VALUES
(1, 'name', 'Ashpath', 'general'),
(2, 'logo', '1675773165_logo.png', 'general'),
(3, 'favicon', NULL, 'general'),
(4, 'head_code', '', 'general'),
(5, 'default_currency', '1', 'general'),
(6, 'allowed_wallets', '2,3,6', 'general'),
(7, 'default_language', '1', 'general'),
(8, 'site_key', '', 'recaptcha'),
(9, 'secret_key', '', 'recaptcha'),
(10, 'default_timezone', 'Asia/Dhaka', 'general'),
(11, 'has_captcha', 'Disabled', 'general'),
(12, 'login_via', 'email_only', 'general'),
(13, 'admin_access_ip_setting', 'Disabled', 'admin_security'),
(14, 'admin_access_ips', '::1', 'admin_security'),
(15, 'exchange_enabled_api', 'Disabled', 'currency_exchange_rate'),
(16, 'currency_converter_api_key', NULL, 'currency_exchange_rate'),
(17, 'exchange_rate_api_key', NULL, 'currency_exchange_rate');

-- --------------------------------------------------------

--
-- Table structure for table `sms_configs`
--

CREATE TABLE `sms_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_configs`
--

INSERT INTO `sms_configs` (`id`, `type`, `credentials`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twilio', '', 'Inactive', '2023-02-05 02:14:24', '2023-02-05 02:14:24'),
(2, 'nexmo', '', 'Inactive', '2023-02-05 02:14:24', '2023-02-05 02:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `icon` text NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `name`, `icon`, `url`) VALUES
(1, 'facebook', '<div class=\"facebook\" id=\"facebook\">\r\n                                <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <rect width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n                                    <g clip-path=\"url(#clip0_2297_2968)\">\r\n                                        <path d=\"M24.5094 32.4052V23.6116H27.5441L27.9985 20.1846H24.5094V17.9966C24.5094 17.0044 24.7927 16.3282 26.2557 16.3282L28.1215 16.3274V13.2623C27.7986 13.2207 26.6911 13.1274 25.4027 13.1274C22.7126 13.1274 20.8709 14.7244 20.8709 17.6574V20.1847H17.8284V23.6117H20.8708V32.4053L24.5094 32.4052Z\" fill=\"white\"></path>\r\n                                    </g>\r\n                                    <defs>\r\n                                        <clipPath id=\"clip0_2297_2968\">\r\n                                            <rect width=\"10.2931\" height=\"19.2823\" fill=\"white\" transform=\"translate(17.8284 13.125)\"></rect>\r\n                                        </clipPath>\r\n                                    </defs>\r\n                                </svg>\r\n                            </div>', '#'),
(2, 'google_plus', '<div class=\"whtsapp ml-11\" id=\"whtsapp\">\r\n                                <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <rect x=\"0.0400391\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"/>\r\n                                    <path d=\"M18.3128 21.091V23.9273H23.0047C22.8156 25.1446 21.5865 27.4964 18.3128 27.4964C15.4883 27.4964 13.1837 25.1564 13.1837 22.2728C13.1837 19.3891 15.4883 17.0491 18.3128 17.0491C19.9201 17.0491 20.9956 17.7346 21.6101 18.3255L23.8556 16.1627C22.4137 14.8155 20.5465 14 18.3128 14C13.7392 14 10.04 17.6991 10.04 22.2728C10.04 26.8464 13.7392 30.5456 18.3128 30.5456C23.0874 30.5456 26.2547 27.1892 26.2547 22.4619C26.2547 21.9182 26.1956 21.5046 26.1247 21.091H18.3128Z\" fill=\"white\"/>\r\n                                    <path d=\"M36.0397 21.0907H33.676V18.7271H31.3124V21.0907H28.9487V23.4544H31.3124V25.818H33.676V23.4544H36.0397\" fill=\"white\"/>\r\n                                </svg>\r\n                            </div>', '#'),
(3, 'twitter', '<div class=\"twitter ml-11\" id=\"twitter\">\r\n                            <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                <rect x=\"0.0402832\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n                                <path d=\"M32.4132 16.0164C31.6927 16.325 30.8693 16.5306 30.0458 16.6335C30.8693 16.1193 31.5898 15.2966 31.8986 14.371C31.0751 14.8852 30.2517 15.1937 29.2224 15.3994C28.5019 14.5767 27.3696 14.0625 26.2374 14.0625C23.9729 14.0625 22.1201 15.9136 22.1201 18.1761C22.1201 18.4846 22.1201 18.7931 22.2231 19.1016C18.8263 18.8959 15.7384 17.2505 13.6798 14.7824C13.371 15.3994 13.1651 16.1193 13.1651 16.8392C13.1651 18.2789 13.8857 19.513 15.0179 20.2328C14.2974 20.2328 13.6798 20.0272 13.1651 19.7186C13.1651 21.6726 14.6062 23.4208 16.4589 23.7294C16.1501 23.8322 15.7384 23.8322 15.3267 23.8322C15.0179 23.8322 14.812 23.8322 14.5032 23.7294C15.0179 25.3748 16.5619 26.6089 18.4146 26.6089C16.9736 27.7401 15.2238 28.3571 13.2681 28.3571C12.9593 28.3571 12.6505 28.3571 12.2388 28.2543C14.0915 29.3855 16.2531 30.1054 18.6205 30.1054C26.2374 30.1054 30.3546 23.8322 30.3546 18.3817V17.8675C31.178 17.559 31.8986 16.8391 32.4132 16.0164Z\" fill=\"white\"></path>\r\n                            </svg>\r\n                        </div>', '#'),
(4, 'linkedin', '<div class=\"linkdin ml-11\" id=\"linkdin\">\r\n                                <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <rect x=\"0.201416\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n                                    <path d=\"M17.5146 31.9712V19.8375H13.4417V31.9712H17.5146ZM15.4787 18.1799C16.8989 18.1799 17.783 17.2481 17.783 16.0838C17.7565 14.8932 16.899 13.9873 15.5056 13.9873C14.1125 13.9873 13.2014 14.8932 13.2014 16.0838C13.2014 17.2482 14.0853 18.1799 15.4521 18.1799H15.4785H15.4787ZM19.7689 31.9712H23.8417V25.1952C23.8417 24.8325 23.8682 24.4703 23.9757 24.211C24.2702 23.4865 24.9403 22.736 26.0654 22.736C27.5392 22.736 28.1288 23.8487 28.1288 25.4799V31.9711H32.2014V25.0138C32.2014 21.2868 30.1921 19.5526 27.5124 19.5526C25.3153 19.5526 24.3506 20.7688 23.8146 21.597H23.8418V19.8373H19.769C19.8224 20.9758 19.769 31.971 19.769 31.971L19.7689 31.9712Z\" fill=\"white\"></path>\r\n                                </svg>\r\n                            </div>', '#'),
(5, 'pinterest', '<div class=\"pinterest ml-11\" id=\"pinterest\">\r\n                                <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <rect x=\"0.161133\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n                                    <path d=\"M28.5611 15.0943C27.247 13.7814 25.3582 13.125 23.305 13.125C20.1842 13.125 18.2953 14.4378 17.2277 15.5045C15.9137 16.8174 15.1746 18.5405 15.1746 20.3456C15.1746 22.561 16.0779 24.2021 17.6383 24.8585C17.7205 24.9406 17.8847 24.9406 17.9668 24.9406C18.2953 24.9406 18.5417 24.6944 18.6239 24.3662C18.706 24.2021 18.7881 23.7098 18.8702 23.4636C18.9523 23.0534 18.8702 22.8892 18.6239 22.561C18.2132 22.0687 17.9668 21.4123 17.9668 20.5918C17.9668 18.2123 19.7736 15.6686 23.0586 15.6686C25.6867 15.6686 27.3292 17.1456 27.3292 19.5251C27.3292 21.002 27.0007 22.3969 26.4258 23.4636C26.0152 24.2021 25.276 25.0226 24.2084 25.0226C23.7156 25.0226 23.305 24.8585 23.0586 24.4482C22.8123 24.12 22.7301 23.7098 22.8122 23.2995C22.8944 22.8072 23.0586 22.3149 23.2229 21.8226C23.4693 20.92 23.7978 20.0174 23.7978 19.361C23.7978 18.2123 23.0586 17.3917 21.991 17.3917C20.5949 17.3917 19.5272 18.7866 19.5272 20.5097C19.5272 21.4123 19.7736 21.9867 19.8557 22.2328C19.6915 22.9713 18.6238 27.3201 18.4596 28.0585C18.3775 28.5509 17.6383 32.3253 18.7881 32.5714C20.02 32.8996 21.1697 29.2073 21.2519 28.797C21.334 28.4688 21.6625 27.156 21.8268 26.4175C22.4016 26.9919 23.3871 27.4021 24.3727 27.4021C26.1794 27.4021 27.7398 26.5816 28.8896 25.1047C29.9572 23.7098 30.6142 21.7405 30.6142 19.5251C30.5321 18.0482 29.8751 16.3251 28.5611 15.0943Z\" fill=\"white\"></path>\r\n                                </svg>\r\n                            </div>', '#'),
(6, 'youtube', '<div class=\"whtsapp ml-11\" id=\"whtsapp\">\r\n                                <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <rect x=\"0.0400391\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"/>\r\n                                    <path d=\"M28.9291 14.0528C30.2064 14.1845 31.8674 14.0528 32.7619 15.0988C33.7842 16.144 33.913 17.841 33.913 19.1476C34.04 20.7148 34.04 22.9367 34.04 24.3714C33.913 25.8096 34.04 27.5058 33.3996 28.8142C32.7628 30.2489 31.6116 30.7737 30.2064 30.9026C28.6715 31.0325 19.2171 31.0325 16.1518 30.9026C14.7458 30.7728 13.0848 30.7728 12.0624 29.5969C11.1679 28.5509 11.1679 26.9846 11.04 25.6789C11.04 24.1108 11.04 21.8898 11.04 20.3235C11.04 18.8861 11.04 17.1891 11.6787 15.8825C12.3182 14.5767 13.5955 14.3152 15.0007 14.1854C16.5338 14.0537 25.8603 13.9239 28.9282 14.0537L28.9291 14.0528ZM19.9846 18.4939V26.3299L27.0123 22.4119L19.9846 18.4939Z\" fill=\"white\"/>\r\n                                </svg>\r\n                            </div>', '#'),
(7, 'instagram', '<div class=\"instagram ml-11\" id=\"instagram\">\r\n                                <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <rect x=\"0.0805664\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n                                    <path d=\"M28.8545 14.0625H16.5944C15.2101 14.0625 14.1555 15.1162 14.1555 16.4992V28.7483C14.1555 30.1313 15.2101 31.185 16.5944 31.185H28.8545C30.2387 31.185 31.2933 30.1313 31.2933 28.7483V16.4992C31.2933 15.1162 30.2387 14.0625 28.8545 14.0625ZM22.7244 27.7605C25.5587 27.7605 27.8657 25.5214 27.8657 22.8213C27.8657 22.3603 27.7998 21.8335 27.668 21.4383H29.1181V28.419C29.1181 28.7483 28.8545 29.0776 28.459 29.0776H16.9898C16.6603 29.0776 16.3307 28.8142 16.3307 28.419V21.3725H17.8467C17.7149 21.8335 17.649 22.2945 17.649 22.7554C17.5831 25.5214 19.8901 27.7605 22.7244 27.7605ZM22.7244 25.7848C20.8788 25.7848 19.4287 24.336 19.4287 22.5579C19.4287 20.7798 20.8788 19.331 22.7244 19.331C24.57 19.331 26.0201 20.7798 26.0201 22.5579C26.0201 24.4018 24.57 25.7848 22.7244 25.7848ZM29.0522 18.7383C29.0522 19.1334 28.7226 19.4627 28.3271 19.4627H26.4815C26.086 19.4627 25.7565 19.1334 25.7565 18.7383V16.9601C25.7565 16.565 26.086 16.2357 26.4815 16.2357H28.3271C28.7226 16.2357 29.0522 16.565 29.0522 16.9601V18.7383Z\" fill=\"white\"></path>\r\n                                </svg>\r\n                            </div>', '#');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_status_id` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Low' COMMENT 'Low, Normal, High',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `admin_id`, `user_id`, `ticket_status_id`, `subject`, `message`, `code`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 'ggg', 'okay', 'TIC-L2EVEL', 'Normal', NULL, '2023-02-07 13:36:19', '2023-02-07 13:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'admin or user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE `ticket_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_statuses`
--

INSERT INTO `ticket_statuses` (`id`, `name`, `color`, `is_default`) VALUES
(1, 'Open', '00a65a', 0),
(2, 'In Progress', '3c8dbc', 1),
(3, 'Hold', 'f39c12', 0),
(4, 'Closed', 'dd4b39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `zone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `zone`, `gmt`, `created_at`, `updated_at`) VALUES
(1, 'Africa/Abidjan', 'UTC/GMT +00:00', NULL, NULL),
(2, 'Africa/Accra', 'UTC/GMT +00:00', NULL, NULL),
(3, 'Africa/Addis_Ababa', 'UTC/GMT +03:00', NULL, NULL),
(4, 'Africa/Algiers', 'UTC/GMT +01:00', NULL, NULL),
(5, 'Africa/Asmara', 'UTC/GMT +03:00', NULL, NULL),
(6, 'Africa/Bamako', 'UTC/GMT +00:00', NULL, NULL),
(7, 'Africa/Bangui', 'UTC/GMT +01:00', NULL, NULL),
(8, 'Africa/Banjul', 'UTC/GMT +00:00', NULL, NULL),
(9, 'Africa/Bissau', 'UTC/GMT +00:00', NULL, NULL),
(10, 'Africa/Blantyre', 'UTC/GMT +02:00', NULL, NULL),
(11, 'Africa/Brazzaville', 'UTC/GMT +01:00', NULL, NULL),
(12, 'Africa/Bujumbura', 'UTC/GMT +02:00', NULL, NULL),
(13, 'Africa/Cairo', 'UTC/GMT +02:00', NULL, NULL),
(14, 'Africa/Casablanca', 'UTC/GMT +01:00', NULL, NULL),
(15, 'Africa/Ceuta', 'UTC/GMT +01:00', NULL, NULL),
(16, 'Africa/Conakry', 'UTC/GMT +00:00', NULL, NULL),
(17, 'Africa/Dakar', 'UTC/GMT +00:00', NULL, NULL),
(18, 'Africa/Dar_es_Salaam', 'UTC/GMT +03:00', NULL, NULL),
(19, 'Africa/Djibouti', 'UTC/GMT +03:00', NULL, NULL),
(20, 'Africa/Douala', 'UTC/GMT +01:00', NULL, NULL),
(21, 'Africa/El_Aaiun', 'UTC/GMT +01:00', NULL, NULL),
(22, 'Africa/Freetown', 'UTC/GMT +00:00', NULL, NULL),
(23, 'Africa/Gaborone', 'UTC/GMT +02:00', NULL, NULL),
(24, 'Africa/Harare', 'UTC/GMT +02:00', NULL, NULL),
(25, 'Africa/Johannesburg', 'UTC/GMT +02:00', NULL, NULL),
(26, 'Africa/Juba', 'UTC/GMT +02:00', NULL, NULL),
(27, 'Africa/Kampala', 'UTC/GMT +03:00', NULL, NULL),
(28, 'Africa/Khartoum', 'UTC/GMT +02:00', NULL, NULL),
(29, 'Africa/Kigali', 'UTC/GMT +02:00', NULL, NULL),
(30, 'Africa/Kinshasa', 'UTC/GMT +01:00', NULL, NULL),
(31, 'Africa/Lagos', 'UTC/GMT +01:00', NULL, NULL),
(32, 'Africa/Libreville', 'UTC/GMT +01:00', NULL, NULL),
(33, 'Africa/Lome', 'UTC/GMT +00:00', NULL, NULL),
(34, 'Africa/Luanda', 'UTC/GMT +01:00', NULL, NULL),
(35, 'Africa/Lubumbashi', 'UTC/GMT +02:00', NULL, NULL),
(36, 'Africa/Lusaka', 'UTC/GMT +02:00', NULL, NULL),
(37, 'Africa/Malabo', 'UTC/GMT +01:00', NULL, NULL),
(38, 'Africa/Maputo', 'UTC/GMT +02:00', NULL, NULL),
(39, 'Africa/Maseru', 'UTC/GMT +02:00', NULL, NULL),
(40, 'Africa/Mbabane', 'UTC/GMT +02:00', NULL, NULL),
(41, 'Africa/Mogadishu', 'UTC/GMT +03:00', NULL, NULL),
(42, 'Africa/Monrovia', 'UTC/GMT +00:00', NULL, NULL),
(43, 'Africa/Nairobi', 'UTC/GMT +03:00', NULL, NULL),
(44, 'Africa/Ndjamena', 'UTC/GMT +01:00', NULL, NULL),
(45, 'Africa/Niamey', 'UTC/GMT +01:00', NULL, NULL),
(46, 'Africa/Nouakchott', 'UTC/GMT +00:00', NULL, NULL),
(47, 'Africa/Ouagadougou', 'UTC/GMT +00:00', NULL, NULL),
(48, 'Africa/Porto-Novo', 'UTC/GMT +01:00', NULL, NULL),
(49, 'Africa/Sao_Tome', 'UTC/GMT +00:00', NULL, NULL),
(50, 'Africa/Tripoli', 'UTC/GMT +02:00', NULL, NULL),
(51, 'Africa/Tunis', 'UTC/GMT +01:00', NULL, NULL),
(52, 'Africa/Windhoek', 'UTC/GMT +02:00', NULL, NULL),
(53, 'America/Adak', 'UTC/GMT -10:00', NULL, NULL),
(54, 'America/Anchorage', 'UTC/GMT -09:00', NULL, NULL),
(55, 'America/Anguilla', 'UTC/GMT -04:00', NULL, NULL),
(56, 'America/Antigua', 'UTC/GMT -04:00', NULL, NULL),
(57, 'America/Araguaina', 'UTC/GMT -03:00', NULL, NULL),
(58, 'America/Argentina/Buenos_Aires', 'UTC/GMT -03:00', NULL, NULL),
(59, 'America/Argentina/Catamarca', 'UTC/GMT -03:00', NULL, NULL),
(60, 'America/Argentina/Cordoba', 'UTC/GMT -03:00', NULL, NULL),
(61, 'America/Argentina/Jujuy', 'UTC/GMT -03:00', NULL, NULL),
(62, 'America/Argentina/La_Rioja', 'UTC/GMT -03:00', NULL, NULL),
(63, 'America/Argentina/Mendoza', 'UTC/GMT -03:00', NULL, NULL),
(64, 'America/Argentina/Rio_Gallegos', 'UTC/GMT -03:00', NULL, NULL),
(65, 'America/Argentina/Salta', 'UTC/GMT -03:00', NULL, NULL),
(66, 'America/Argentina/San_Juan', 'UTC/GMT -03:00', NULL, NULL),
(67, 'America/Argentina/San_Luis', 'UTC/GMT -03:00', NULL, NULL),
(68, 'America/Argentina/Tucuman', 'UTC/GMT -03:00', NULL, NULL),
(69, 'America/Argentina/Ushuaia', 'UTC/GMT -03:00', NULL, NULL),
(70, 'America/Aruba', 'UTC/GMT -04:00', NULL, NULL),
(71, 'America/Asuncion', 'UTC/GMT -03:00', NULL, NULL),
(72, 'America/Atikokan', 'UTC/GMT -05:00', NULL, NULL),
(73, 'America/Bahia', 'UTC/GMT -03:00', NULL, NULL),
(74, 'America/Bahia_Banderas', 'UTC/GMT -06:00', NULL, NULL),
(75, 'America/Barbados', 'UTC/GMT -04:00', NULL, NULL),
(76, 'America/Belem', 'UTC/GMT -03:00', NULL, NULL),
(77, 'America/Belize', 'UTC/GMT -06:00', NULL, NULL),
(78, 'America/Blanc-Sablon', 'UTC/GMT -04:00', NULL, NULL),
(79, 'America/Boa_Vista', 'UTC/GMT -04:00', NULL, NULL),
(80, 'America/Bogota', 'UTC/GMT -05:00', NULL, NULL),
(81, 'America/Boise', 'UTC/GMT -07:00', NULL, NULL),
(82, 'America/Cambridge_Bay', 'UTC/GMT -07:00', NULL, NULL),
(83, 'America/Campo_Grande', 'UTC/GMT -04:00', NULL, NULL),
(84, 'America/Cancun', 'UTC/GMT -05:00', NULL, NULL),
(85, 'America/Caracas', 'UTC/GMT -04:00', NULL, NULL),
(86, 'America/Cayenne', 'UTC/GMT -03:00', NULL, NULL),
(87, 'America/Cayman', 'UTC/GMT -05:00', NULL, NULL),
(88, 'America/Chicago', 'UTC/GMT -06:00', NULL, NULL),
(89, 'America/Chihuahua', 'UTC/GMT -07:00', NULL, NULL),
(90, 'America/Costa_Rica', 'UTC/GMT -06:00', NULL, NULL),
(91, 'America/Creston', 'UTC/GMT -07:00', NULL, NULL),
(92, 'America/Cuiaba', 'UTC/GMT -04:00', NULL, NULL),
(93, 'America/Curacao', 'UTC/GMT -04:00', NULL, NULL),
(94, 'America/Danmarkshavn', 'UTC/GMT +00:00', NULL, NULL),
(95, 'America/Dawson', 'UTC/GMT -07:00', NULL, NULL),
(96, 'America/Dawson_Creek', 'UTC/GMT -07:00', NULL, NULL),
(97, 'America/Denver', 'UTC/GMT -07:00', NULL, NULL),
(98, 'America/Detroit', 'UTC/GMT -05:00', NULL, NULL),
(99, 'America/Dominica', 'UTC/GMT -04:00', NULL, NULL),
(100, 'America/Edmonton', 'UTC/GMT -07:00', NULL, NULL),
(101, 'America/Eirunepe', 'UTC/GMT -05:00', NULL, NULL),
(102, 'America/El_Salvador', 'UTC/GMT -06:00', NULL, NULL),
(103, 'America/Fort_Nelson', 'UTC/GMT -07:00', NULL, NULL),
(104, 'America/Fortaleza', 'UTC/GMT -03:00', NULL, NULL),
(105, 'America/Glace_Bay', 'UTC/GMT -04:00', NULL, NULL),
(106, 'America/Goose_Bay', 'UTC/GMT -04:00', NULL, NULL),
(107, 'America/Grand_Turk', 'UTC/GMT -05:00', NULL, NULL),
(108, 'America/Grenada', 'UTC/GMT -04:00', NULL, NULL),
(109, 'America/Guadeloupe', 'UTC/GMT -04:00', NULL, NULL),
(110, 'America/Guatemala', 'UTC/GMT -06:00', NULL, NULL),
(111, 'America/Guayaquil', 'UTC/GMT -05:00', NULL, NULL),
(112, 'America/Guyana', 'UTC/GMT -04:00', NULL, NULL),
(113, 'America/Halifax', 'UTC/GMT -04:00', NULL, NULL),
(114, 'America/Havana', 'UTC/GMT -05:00', NULL, NULL),
(115, 'America/Hermosillo', 'UTC/GMT -07:00', NULL, NULL),
(116, 'America/Indiana/Indianapolis', 'UTC/GMT -05:00', NULL, NULL),
(117, 'America/Indiana/Knox', 'UTC/GMT -06:00', NULL, NULL),
(118, 'America/Indiana/Marengo', 'UTC/GMT -05:00', NULL, NULL),
(119, 'America/Indiana/Petersburg', 'UTC/GMT -05:00', NULL, NULL),
(120, 'America/Indiana/Tell_City', 'UTC/GMT -06:00', NULL, NULL),
(121, 'America/Indiana/Vevay', 'UTC/GMT -05:00', NULL, NULL),
(122, 'America/Indiana/Vincennes', 'UTC/GMT -05:00', NULL, NULL),
(123, 'America/Indiana/Winamac', 'UTC/GMT -05:00', NULL, NULL),
(124, 'America/Inuvik', 'UTC/GMT -07:00', NULL, NULL),
(125, 'America/Iqaluit', 'UTC/GMT -05:00', NULL, NULL),
(126, 'America/Jamaica', 'UTC/GMT -05:00', NULL, NULL),
(127, 'America/Juneau', 'UTC/GMT -09:00', NULL, NULL),
(128, 'America/Kentucky/Louisville', 'UTC/GMT -05:00', NULL, NULL),
(129, 'America/Kentucky/Monticello', 'UTC/GMT -05:00', NULL, NULL),
(130, 'America/Kralendijk', 'UTC/GMT -04:00', NULL, NULL),
(131, 'America/La_Paz', 'UTC/GMT -04:00', NULL, NULL),
(132, 'America/Lima', 'UTC/GMT -05:00', NULL, NULL),
(133, 'America/Los_Angeles', 'UTC/GMT -08:00', NULL, NULL),
(134, 'America/Lower_Princes', 'UTC/GMT -04:00', NULL, NULL),
(135, 'America/Maceio', 'UTC/GMT -03:00', NULL, NULL),
(136, 'America/Managua', 'UTC/GMT -06:00', NULL, NULL),
(137, 'America/Manaus', 'UTC/GMT -04:00', NULL, NULL),
(138, 'America/Marigot', 'UTC/GMT -04:00', NULL, NULL),
(139, 'America/Martinique', 'UTC/GMT -04:00', NULL, NULL),
(140, 'America/Matamoros', 'UTC/GMT -06:00', NULL, NULL),
(141, 'America/Mazatlan', 'UTC/GMT -07:00', NULL, NULL),
(142, 'America/Menominee', 'UTC/GMT -06:00', NULL, NULL),
(143, 'America/Merida', 'UTC/GMT -06:00', NULL, NULL),
(144, 'America/Metlakatla', 'UTC/GMT -09:00', NULL, NULL),
(145, 'America/Mexico_City', 'UTC/GMT -06:00', NULL, NULL),
(146, 'America/Miquelon', 'UTC/GMT -03:00', NULL, NULL),
(147, 'America/Moncton', 'UTC/GMT -04:00', NULL, NULL),
(148, 'America/Monterrey', 'UTC/GMT -06:00', NULL, NULL),
(149, 'America/Montevideo', 'UTC/GMT -03:00', NULL, NULL),
(150, 'America/Montserrat', 'UTC/GMT -04:00', NULL, NULL),
(151, 'America/Nassau', 'UTC/GMT -05:00', NULL, NULL),
(152, 'America/New_York', 'UTC/GMT -05:00', NULL, NULL),
(153, 'America/Nipigon', 'UTC/GMT -05:00', NULL, NULL),
(154, 'America/Nome', 'UTC/GMT -09:00', NULL, NULL),
(155, 'America/Noronha', 'UTC/GMT -02:00', NULL, NULL),
(156, 'America/North_Dakota/Beulah', 'UTC/GMT -06:00', NULL, NULL),
(157, 'America/North_Dakota/Center', 'UTC/GMT -06:00', NULL, NULL),
(158, 'America/North_Dakota/New_Salem', 'UTC/GMT -06:00', NULL, NULL),
(159, 'America/Nuuk', 'UTC/GMT -03:00', NULL, NULL),
(160, 'America/Ojinaga', 'UTC/GMT -07:00', NULL, NULL),
(161, 'America/Panama', 'UTC/GMT -05:00', NULL, NULL),
(162, 'America/Pangnirtung', 'UTC/GMT -05:00', NULL, NULL),
(163, 'America/Paramaribo', 'UTC/GMT -03:00', NULL, NULL),
(164, 'America/Phoenix', 'UTC/GMT -07:00', NULL, NULL),
(165, 'America/Port-au-Prince', 'UTC/GMT -05:00', NULL, NULL),
(166, 'America/Port_of_Spain', 'UTC/GMT -04:00', NULL, NULL),
(167, 'America/Porto_Velho', 'UTC/GMT -04:00', NULL, NULL),
(168, 'America/Puerto_Rico', 'UTC/GMT -04:00', NULL, NULL),
(169, 'America/Punta_Arenas', 'UTC/GMT -03:00', NULL, NULL),
(170, 'America/Rainy_River', 'UTC/GMT -06:00', NULL, NULL),
(171, 'America/Rankin_Inlet', 'UTC/GMT -06:00', NULL, NULL),
(172, 'America/Recife', 'UTC/GMT -03:00', NULL, NULL),
(173, 'America/Regina', 'UTC/GMT -06:00', NULL, NULL),
(174, 'America/Resolute', 'UTC/GMT -06:00', NULL, NULL),
(175, 'America/Rio_Branco', 'UTC/GMT -05:00', NULL, NULL),
(176, 'America/Santarem', 'UTC/GMT -03:00', NULL, NULL),
(177, 'America/Santiago', 'UTC/GMT -03:00', NULL, NULL),
(178, 'America/Santo_Domingo', 'UTC/GMT -04:00', NULL, NULL),
(179, 'America/Sao_Paulo', 'UTC/GMT -03:00', NULL, NULL),
(180, 'America/Scoresbysund', 'UTC/GMT -01:00', NULL, NULL),
(181, 'America/Sitka', 'UTC/GMT -09:00', NULL, NULL),
(182, 'America/St_Barthelemy', 'UTC/GMT -04:00', NULL, NULL),
(183, 'America/St_Johns', 'UTC/GMT -03:30', NULL, NULL),
(184, 'America/St_Kitts', 'UTC/GMT -04:00', NULL, NULL),
(185, 'America/St_Lucia', 'UTC/GMT -04:00', NULL, NULL),
(186, 'America/St_Thomas', 'UTC/GMT -04:00', NULL, NULL),
(187, 'America/St_Vincent', 'UTC/GMT -04:00', NULL, NULL),
(188, 'America/Swift_Current', 'UTC/GMT -06:00', NULL, NULL),
(189, 'America/Tegucigalpa', 'UTC/GMT -06:00', NULL, NULL),
(190, 'America/Thule', 'UTC/GMT -04:00', NULL, NULL),
(191, 'America/Thunder_Bay', 'UTC/GMT -05:00', NULL, NULL),
(192, 'America/Tijuana', 'UTC/GMT -08:00', NULL, NULL),
(193, 'America/Toronto', 'UTC/GMT -05:00', NULL, NULL),
(194, 'America/Tortola', 'UTC/GMT -04:00', NULL, NULL),
(195, 'America/Vancouver', 'UTC/GMT -08:00', NULL, NULL),
(196, 'America/Whitehorse', 'UTC/GMT -07:00', NULL, NULL),
(197, 'America/Winnipeg', 'UTC/GMT -06:00', NULL, NULL),
(198, 'America/Yakutat', 'UTC/GMT -09:00', NULL, NULL),
(199, 'America/Yellowknife', 'UTC/GMT -07:00', NULL, NULL),
(200, 'Antarctica/Casey', 'UTC/GMT +11:00', NULL, NULL),
(201, 'Antarctica/Davis', 'UTC/GMT +07:00', NULL, NULL),
(202, 'Antarctica/DumontDUrville', 'UTC/GMT +10:00', NULL, NULL),
(203, 'Antarctica/Macquarie', 'UTC/GMT +11:00', NULL, NULL),
(204, 'Antarctica/Mawson', 'UTC/GMT +05:00', NULL, NULL),
(205, 'Antarctica/McMurdo', 'UTC/GMT +13:00', NULL, NULL),
(206, 'Antarctica/Palmer', 'UTC/GMT -03:00', NULL, NULL),
(207, 'Antarctica/Rothera', 'UTC/GMT -03:00', NULL, NULL),
(208, 'Antarctica/Syowa', 'UTC/GMT +03:00', NULL, NULL),
(209, 'Antarctica/Troll', 'UTC/GMT +00:00', NULL, NULL),
(210, 'Antarctica/Vostok', 'UTC/GMT +06:00', NULL, NULL),
(211, 'Arctic/Longyearbyen', 'UTC/GMT +01:00', NULL, NULL),
(212, 'Asia/Aden', 'UTC/GMT +03:00', NULL, NULL),
(213, 'Asia/Almaty', 'UTC/GMT +06:00', NULL, NULL),
(214, 'Asia/Amman', 'UTC/GMT +02:00', NULL, NULL),
(215, 'Asia/Anadyr', 'UTC/GMT +12:00', NULL, NULL),
(216, 'Asia/Aqtau', 'UTC/GMT +05:00', NULL, NULL),
(217, 'Asia/Aqtobe', 'UTC/GMT +05:00', NULL, NULL),
(218, 'Asia/Ashgabat', 'UTC/GMT +05:00', NULL, NULL),
(219, 'Asia/Atyrau', 'UTC/GMT +05:00', NULL, NULL),
(220, 'Asia/Baghdad', 'UTC/GMT +03:00', NULL, NULL),
(221, 'Asia/Bahrain', 'UTC/GMT +03:00', NULL, NULL),
(222, 'Asia/Baku', 'UTC/GMT +04:00', NULL, NULL),
(223, 'Asia/Bangkok', 'UTC/GMT +07:00', NULL, NULL),
(224, 'Asia/Barnaul', 'UTC/GMT +07:00', NULL, NULL),
(225, 'Asia/Beirut', 'UTC/GMT +02:00', NULL, NULL),
(226, 'Asia/Bishkek', 'UTC/GMT +06:00', NULL, NULL),
(227, 'Asia/Brunei', 'UTC/GMT +08:00', NULL, NULL),
(228, 'Asia/Chita', 'UTC/GMT +09:00', NULL, NULL),
(229, 'Asia/Choibalsan', 'UTC/GMT +08:00', NULL, NULL),
(230, 'Asia/Colombo', 'UTC/GMT +05:30', NULL, NULL),
(231, 'Asia/Damascus', 'UTC/GMT +02:00', NULL, NULL),
(232, 'Asia/Dhaka', 'UTC/GMT +06:00', NULL, NULL),
(233, 'Asia/Dili', 'UTC/GMT +09:00', NULL, NULL),
(234, 'Asia/Dubai', 'UTC/GMT +04:00', NULL, NULL),
(235, 'Asia/Dushanbe', 'UTC/GMT +05:00', NULL, NULL),
(236, 'Asia/Famagusta', 'UTC/GMT +02:00', NULL, NULL),
(237, 'Asia/Gaza', 'UTC/GMT +02:00', NULL, NULL),
(238, 'Asia/Hebron', 'UTC/GMT +02:00', NULL, NULL),
(239, 'Asia/Ho_Chi_Minh', 'UTC/GMT +07:00', NULL, NULL),
(240, 'Asia/Hong_Kong', 'UTC/GMT +08:00', NULL, NULL),
(241, 'Asia/Hovd', 'UTC/GMT +07:00', NULL, NULL),
(242, 'Asia/Irkutsk', 'UTC/GMT +08:00', NULL, NULL),
(243, 'Asia/Jakarta', 'UTC/GMT +07:00', NULL, NULL),
(244, 'Asia/Jayapura', 'UTC/GMT +09:00', NULL, NULL),
(245, 'Asia/Jerusalem', 'UTC/GMT +02:00', NULL, NULL),
(246, 'Asia/Kabul', 'UTC/GMT +04:30', NULL, NULL),
(247, 'Asia/Kamchatka', 'UTC/GMT +12:00', NULL, NULL),
(248, 'Asia/Karachi', 'UTC/GMT +05:00', NULL, NULL),
(249, 'Asia/Kathmandu', 'UTC/GMT +05:45', NULL, NULL),
(250, 'Asia/Khandyga', 'UTC/GMT +09:00', NULL, NULL),
(251, 'Asia/Kolkata', 'UTC/GMT +05:30', NULL, NULL),
(252, 'Asia/Krasnoyarsk', 'UTC/GMT +07:00', NULL, NULL),
(253, 'Asia/Kuala_Lumpur', 'UTC/GMT +08:00', NULL, NULL),
(254, 'Asia/Kuching', 'UTC/GMT +08:00', NULL, NULL),
(255, 'Asia/Kuwait', 'UTC/GMT +03:00', NULL, NULL),
(256, 'Asia/Macau', 'UTC/GMT +08:00', NULL, NULL),
(257, 'Asia/Magadan', 'UTC/GMT +11:00', NULL, NULL),
(258, 'Asia/Makassar', 'UTC/GMT +08:00', NULL, NULL),
(259, 'Asia/Manila', 'UTC/GMT +08:00', NULL, NULL),
(260, 'Asia/Muscat', 'UTC/GMT +04:00', NULL, NULL),
(261, 'Asia/Nicosia', 'UTC/GMT +02:00', NULL, NULL),
(262, 'Asia/Novokuznetsk', 'UTC/GMT +07:00', NULL, NULL),
(263, 'Asia/Novosibirsk', 'UTC/GMT +07:00', NULL, NULL),
(264, 'Asia/Omsk', 'UTC/GMT +06:00', NULL, NULL),
(265, 'Asia/Oral', 'UTC/GMT +05:00', NULL, NULL),
(266, 'Asia/Phnom_Penh', 'UTC/GMT +07:00', NULL, NULL),
(267, 'Asia/Pontianak', 'UTC/GMT +07:00', NULL, NULL),
(268, 'Asia/Pyongyang', 'UTC/GMT +09:00', NULL, NULL),
(269, 'Asia/Qatar', 'UTC/GMT +03:00', NULL, NULL),
(270, 'Asia/Qostanay', 'UTC/GMT +06:00', NULL, NULL),
(271, 'Asia/Qyzylorda', 'UTC/GMT +05:00', NULL, NULL),
(272, 'Asia/Riyadh', 'UTC/GMT +03:00', NULL, NULL),
(273, 'Asia/Sakhalin', 'UTC/GMT +11:00', NULL, NULL),
(274, 'Asia/Samarkand', 'UTC/GMT +05:00', NULL, NULL),
(275, 'Asia/Seoul', 'UTC/GMT +09:00', NULL, NULL),
(276, 'Asia/Shanghai', 'UTC/GMT +08:00', NULL, NULL),
(277, 'Asia/Singapore', 'UTC/GMT +08:00', NULL, NULL),
(278, 'Asia/Srednekolymsk', 'UTC/GMT +11:00', NULL, NULL),
(279, 'Asia/Taipei', 'UTC/GMT +08:00', NULL, NULL),
(280, 'Asia/Tashkent', 'UTC/GMT +05:00', NULL, NULL),
(281, 'Asia/Tbilisi', 'UTC/GMT +04:00', NULL, NULL),
(282, 'Asia/Tehran', 'UTC/GMT +03:30', NULL, NULL),
(283, 'Asia/Thimphu', 'UTC/GMT +06:00', NULL, NULL),
(284, 'Asia/Tokyo', 'UTC/GMT +09:00', NULL, NULL),
(285, 'Asia/Tomsk', 'UTC/GMT +07:00', NULL, NULL),
(286, 'Asia/Ulaanbaatar', 'UTC/GMT +08:00', NULL, NULL),
(287, 'Asia/Urumqi', 'UTC/GMT +06:00', NULL, NULL),
(288, 'Asia/Ust-Nera', 'UTC/GMT +10:00', NULL, NULL),
(289, 'Asia/Vientiane', 'UTC/GMT +07:00', NULL, NULL),
(290, 'Asia/Vladivostok', 'UTC/GMT +10:00', NULL, NULL),
(291, 'Asia/Yakutsk', 'UTC/GMT +09:00', NULL, NULL),
(292, 'Asia/Yangon', 'UTC/GMT +06:30', NULL, NULL),
(293, 'Asia/Yekaterinburg', 'UTC/GMT +05:00', NULL, NULL),
(294, 'Asia/Yerevan', 'UTC/GMT +04:00', NULL, NULL),
(295, 'Atlantic/Azores', 'UTC/GMT -01:00', NULL, NULL),
(296, 'Atlantic/Bermuda', 'UTC/GMT -04:00', NULL, NULL),
(297, 'Atlantic/Canary', 'UTC/GMT +00:00', NULL, NULL),
(298, 'Atlantic/Cape_Verde', 'UTC/GMT -01:00', NULL, NULL),
(299, 'Atlantic/Faroe', 'UTC/GMT +00:00', NULL, NULL),
(300, 'Atlantic/Madeira', 'UTC/GMT +00:00', NULL, NULL),
(301, 'Atlantic/Reykjavik', 'UTC/GMT +00:00', NULL, NULL),
(302, 'Atlantic/South_Georgia', 'UTC/GMT -02:00', NULL, NULL),
(303, 'Atlantic/St_Helena', 'UTC/GMT +00:00', NULL, NULL),
(304, 'Atlantic/Stanley', 'UTC/GMT -03:00', NULL, NULL),
(305, 'Australia/Adelaide', 'UTC/GMT +10:30', NULL, NULL),
(306, 'Australia/Brisbane', 'UTC/GMT +10:00', NULL, NULL),
(307, 'Australia/Broken_Hill', 'UTC/GMT +10:30', NULL, NULL),
(308, 'Australia/Darwin', 'UTC/GMT +09:30', NULL, NULL),
(309, 'Australia/Eucla', 'UTC/GMT +08:45', NULL, NULL),
(310, 'Australia/Hobart', 'UTC/GMT +11:00', NULL, NULL),
(311, 'Australia/Lindeman', 'UTC/GMT +10:00', NULL, NULL),
(312, 'Australia/Lord_Howe', 'UTC/GMT +11:00', NULL, NULL),
(313, 'Australia/Melbourne', 'UTC/GMT +11:00', NULL, NULL),
(314, 'Australia/Perth', 'UTC/GMT +08:00', NULL, NULL),
(315, 'Australia/Sydney', 'UTC/GMT +11:00', NULL, NULL),
(316, 'Europe/Amsterdam', 'UTC/GMT +01:00', NULL, NULL),
(317, 'Europe/Andorra', 'UTC/GMT +01:00', NULL, NULL),
(318, 'Europe/Astrakhan', 'UTC/GMT +04:00', NULL, NULL),
(319, 'Europe/Athens', 'UTC/GMT +02:00', NULL, NULL),
(320, 'Europe/Belgrade', 'UTC/GMT +01:00', NULL, NULL),
(321, 'Europe/Berlin', 'UTC/GMT +01:00', NULL, NULL),
(322, 'Europe/Bratislava', 'UTC/GMT +01:00', NULL, NULL),
(323, 'Europe/Brussels', 'UTC/GMT +01:00', NULL, NULL),
(324, 'Europe/Bucharest', 'UTC/GMT +02:00', NULL, NULL),
(325, 'Europe/Budapest', 'UTC/GMT +01:00', NULL, NULL),
(326, 'Europe/Busingen', 'UTC/GMT +01:00', NULL, NULL),
(327, 'Europe/Chisinau', 'UTC/GMT +02:00', NULL, NULL),
(328, 'Europe/Copenhagen', 'UTC/GMT +01:00', NULL, NULL),
(329, 'Europe/Dublin', 'UTC/GMT +00:00', NULL, NULL),
(330, 'Europe/Gibraltar', 'UTC/GMT +01:00', NULL, NULL),
(331, 'Europe/Guernsey', 'UTC/GMT +00:00', NULL, NULL),
(332, 'Europe/Helsinki', 'UTC/GMT +02:00', NULL, NULL),
(333, 'Europe/Isle_of_Man', 'UTC/GMT +00:00', NULL, NULL),
(334, 'Europe/Istanbul', 'UTC/GMT +03:00', NULL, NULL),
(335, 'Europe/Jersey', 'UTC/GMT +00:00', NULL, NULL),
(336, 'Europe/Kaliningrad', 'UTC/GMT +02:00', NULL, NULL),
(337, 'Europe/Kiev', 'UTC/GMT +02:00', NULL, NULL),
(338, 'Europe/Kirov', 'UTC/GMT +03:00', NULL, NULL),
(339, 'Europe/Lisbon', 'UTC/GMT +00:00', NULL, NULL),
(340, 'Europe/Ljubljana', 'UTC/GMT +01:00', NULL, NULL),
(341, 'Europe/London', 'UTC/GMT +00:00', NULL, NULL),
(342, 'Europe/Luxembourg', 'UTC/GMT +01:00', NULL, NULL),
(343, 'Europe/Madrid', 'UTC/GMT +01:00', NULL, NULL),
(344, 'Europe/Malta', 'UTC/GMT +01:00', NULL, NULL),
(345, 'Europe/Mariehamn', 'UTC/GMT +02:00', NULL, NULL),
(346, 'Europe/Minsk', 'UTC/GMT +03:00', NULL, NULL),
(347, 'Europe/Monaco', 'UTC/GMT +01:00', NULL, NULL),
(348, 'Europe/Moscow', 'UTC/GMT +03:00', NULL, NULL),
(349, 'Europe/Oslo', 'UTC/GMT +01:00', NULL, NULL),
(350, 'Europe/Paris', 'UTC/GMT +01:00', NULL, NULL),
(351, 'Europe/Podgorica', 'UTC/GMT +01:00', NULL, NULL),
(352, 'Europe/Prague', 'UTC/GMT +01:00', NULL, NULL),
(353, 'Europe/Riga', 'UTC/GMT +02:00', NULL, NULL),
(354, 'Europe/Rome', 'UTC/GMT +01:00', NULL, NULL),
(355, 'Europe/Samara', 'UTC/GMT +04:00', NULL, NULL),
(356, 'Europe/San_Marino', 'UTC/GMT +01:00', NULL, NULL),
(357, 'Europe/Sarajevo', 'UTC/GMT +01:00', NULL, NULL),
(358, 'Europe/Saratov', 'UTC/GMT +04:00', NULL, NULL),
(359, 'Europe/Simferopol', 'UTC/GMT +03:00', NULL, NULL),
(360, 'Europe/Skopje', 'UTC/GMT +01:00', NULL, NULL),
(361, 'Europe/Sofia', 'UTC/GMT +02:00', NULL, NULL),
(362, 'Europe/Stockholm', 'UTC/GMT +01:00', NULL, NULL),
(363, 'Europe/Tallinn', 'UTC/GMT +02:00', NULL, NULL),
(364, 'Europe/Tirane', 'UTC/GMT +01:00', NULL, NULL),
(365, 'Europe/Ulyanovsk', 'UTC/GMT +04:00', NULL, NULL),
(366, 'Europe/Uzhgorod', 'UTC/GMT +02:00', NULL, NULL),
(367, 'Europe/Vaduz', 'UTC/GMT +01:00', NULL, NULL),
(368, 'Europe/Vatican', 'UTC/GMT +01:00', NULL, NULL),
(369, 'Europe/Vienna', 'UTC/GMT +01:00', NULL, NULL),
(370, 'Europe/Vilnius', 'UTC/GMT +02:00', NULL, NULL),
(371, 'Europe/Volgograd', 'UTC/GMT +03:00', NULL, NULL),
(372, 'Europe/Warsaw', 'UTC/GMT +01:00', NULL, NULL),
(373, 'Europe/Zagreb', 'UTC/GMT +01:00', NULL, NULL),
(374, 'Europe/Zaporozhye', 'UTC/GMT +02:00', NULL, NULL),
(375, 'Europe/Zurich', 'UTC/GMT +01:00', NULL, NULL),
(376, 'Indian/Antananarivo', 'UTC/GMT +03:00', NULL, NULL),
(377, 'Indian/Chagos', 'UTC/GMT +06:00', NULL, NULL),
(378, 'Indian/Christmas', 'UTC/GMT +07:00', NULL, NULL),
(379, 'Indian/Cocos', 'UTC/GMT +06:30', NULL, NULL),
(380, 'Indian/Comoro', 'UTC/GMT +03:00', NULL, NULL),
(381, 'Indian/Kerguelen', 'UTC/GMT +05:00', NULL, NULL),
(382, 'Indian/Mahe', 'UTC/GMT +04:00', NULL, NULL),
(383, 'Indian/Maldives', 'UTC/GMT +05:00', NULL, NULL),
(384, 'Indian/Mauritius', 'UTC/GMT +04:00', NULL, NULL),
(385, 'Indian/Mayotte', 'UTC/GMT +03:00', NULL, NULL),
(386, 'Indian/Reunion', 'UTC/GMT +04:00', NULL, NULL),
(387, 'Pacific/Apia', 'UTC/GMT +13:00', NULL, NULL),
(388, 'Pacific/Auckland', 'UTC/GMT +13:00', NULL, NULL),
(389, 'Pacific/Bougainville', 'UTC/GMT +11:00', NULL, NULL),
(390, 'Pacific/Chatham', 'UTC/GMT +13:45', NULL, NULL),
(391, 'Pacific/Chuuk', 'UTC/GMT +10:00', NULL, NULL),
(392, 'Pacific/Easter', 'UTC/GMT -05:00', NULL, NULL),
(393, 'Pacific/Efate', 'UTC/GMT +11:00', NULL, NULL),
(394, 'Pacific/Fakaofo', 'UTC/GMT +13:00', NULL, NULL),
(395, 'Pacific/Fiji', 'UTC/GMT +12:00', NULL, NULL),
(396, 'Pacific/Funafuti', 'UTC/GMT +12:00', NULL, NULL),
(397, 'Pacific/Galapagos', 'UTC/GMT -06:00', NULL, NULL),
(398, 'Pacific/Gambier', 'UTC/GMT -09:00', NULL, NULL),
(399, 'Pacific/Guadalcanal', 'UTC/GMT +11:00', NULL, NULL),
(400, 'Pacific/Guam', 'UTC/GMT +10:00', NULL, NULL),
(401, 'Pacific/Honolulu', 'UTC/GMT -10:00', NULL, NULL),
(402, 'Pacific/Kanton', 'UTC/GMT +13:00', NULL, NULL),
(403, 'Pacific/Kiritimati', 'UTC/GMT +14:00', NULL, NULL),
(404, 'Pacific/Kosrae', 'UTC/GMT +11:00', NULL, NULL),
(405, 'Pacific/Kwajalein', 'UTC/GMT +12:00', NULL, NULL),
(406, 'Pacific/Majuro', 'UTC/GMT +12:00', NULL, NULL),
(407, 'Pacific/Marquesas', 'UTC/GMT -09:30', NULL, NULL),
(408, 'Pacific/Midway', 'UTC/GMT -11:00', NULL, NULL),
(409, 'Pacific/Nauru', 'UTC/GMT +12:00', NULL, NULL),
(410, 'Pacific/Niue', 'UTC/GMT -11:00', NULL, NULL),
(411, 'Pacific/Norfolk', 'UTC/GMT +12:00', NULL, NULL),
(412, 'Pacific/Noumea', 'UTC/GMT +11:00', NULL, NULL),
(413, 'Pacific/Pago_Pago', 'UTC/GMT -11:00', NULL, NULL),
(414, 'Pacific/Palau', 'UTC/GMT +09:00', NULL, NULL),
(415, 'Pacific/Pitcairn', 'UTC/GMT -08:00', NULL, NULL),
(416, 'Pacific/Pohnpei', 'UTC/GMT +11:00', NULL, NULL),
(417, 'Pacific/Port_Moresby', 'UTC/GMT +10:00', NULL, NULL),
(418, 'Pacific/Rarotonga', 'UTC/GMT -10:00', NULL, NULL),
(419, 'Pacific/Saipan', 'UTC/GMT +10:00', NULL, NULL),
(420, 'Pacific/Tahiti', 'UTC/GMT -10:00', NULL, NULL),
(421, 'Pacific/Tarawa', 'UTC/GMT +12:00', NULL, NULL),
(422, 'Pacific/Tongatapu', 'UTC/GMT +13:00', NULL, NULL),
(423, 'Pacific/Wake', 'UTC/GMT +12:00', NULL, NULL),
(424, 'Pacific/Wallis', 'UTC/GMT +12:00', NULL, NULL),
(425, 'UTC', 'UTC/GMT +00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `end_user_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `merchant_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID',
  `refund_reference` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Refund Reference',
  `transaction_reference_id` int(11) NOT NULL DEFAULT 0,
  `transaction_type_id` int(10) UNSIGNED DEFAULT NULL,
  `user_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'registered' COMMENT 'registered, unregistered',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` decimal(20,8) DEFAULT 0.00000000,
  `percentage` decimal(20,8) DEFAULT 0.00000000,
  `charge_percentage` decimal(20,8) DEFAULT 0.00000000,
  `charge_fixed` decimal(20,8) DEFAULT 0.00000000,
  `total` decimal(20,8) DEFAULT 0.00000000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `end_user_id`, `currency_id`, `payment_method_id`, `merchant_id`, `bank_id`, `file_id`, `uuid`, `refund_reference`, `transaction_reference_id`, `transaction_type_id`, `user_type`, `email`, `phone`, `subtotal`, `percentage`, `charge_percentage`, `charge_fixed`, `total`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, NULL, NULL, NULL, '32987C7C0CC71', NULL, 1, 1, 'registered', NULL, NULL, '5000.00000000', '0.00000000', '0.00000000', '0.00000000', '5000.00000000', NULL, 'Success', '2023-02-07 12:48:02', '2023-02-07 12:48:02'),
(2, 1, 3, 1, NULL, NULL, NULL, NULL, '8DFE57FB5DFEA', NULL, 1, 3, 'registered', 'increasegodwin1@gmail.com', NULL, '3000.00000000', '0.00000000', '0.00000000', '0.00000000', '-3000.00000000', 'test', 'Success', '2023-02-07 13:27:48', '2023-02-07 13:27:48'),
(3, 3, 1, 1, NULL, NULL, NULL, NULL, '8DFE57FB5DFEA', NULL, 1, 4, 'registered', 'increasegodwin1@gmail.com', NULL, '3000.00000000', '0.00000000', '0.00000000', '0.00000000', '3000.00000000', 'test', 'Success', '2023-02-07 13:27:48', '2023-02-07 13:27:48'),
(4, 3, 1, 1, NULL, NULL, NULL, NULL, 'CE51CBFCAAC91', NULL, 1, 7, 'registered', 'incrisz4luv@gmail.com', NULL, '50.00000000', '0.00000000', '0.00000000', '0.00000000', '50.00000000', 'sweet', 'Success', '2023-02-07 13:31:21', '2023-02-07 13:33:20'),
(5, 1, 3, 1, NULL, NULL, NULL, NULL, 'CE51CBFCAAC91', NULL, 1, 8, 'registered', 'incrisz4luv@gmail.com', NULL, '50.00000000', '0.00000000', '0.00000000', '0.00000000', '-50.00000000', 'sweet', 'Success', '2023-02-07 13:31:21', '2023-02-07 13:33:20'),
(6, 1, 3, 1, NULL, NULL, NULL, NULL, 'D1F3901A4C148', NULL, 2, 7, 'registered', 'increasegodwin1@gmail.com', NULL, '3000.00000000', '0.00000000', '0.00000000', '0.00000000', '3000.00000000', 'give', 'Blocked', '2023-02-07 13:33:49', '2023-02-07 13:33:57'),
(7, 3, 1, 1, NULL, NULL, NULL, NULL, 'D1F3901A4C148', NULL, 2, 8, 'registered', 'increasegodwin1@gmail.com', NULL, '3000.00000000', '0.00000000', '0.00000000', '0.00000000', '-3000.00000000', 'give', 'Blocked', '2023-02-07 13:33:49', '2023-02-07 13:33:57'),
(8, 3, NULL, 1, NULL, NULL, NULL, NULL, 'BF550112EFF40', NULL, 1, 5, 'registered', NULL, NULL, '100.00000000', '0.00000000', '0.00000000', '0.00000000', '-100.00000000', NULL, 'Success', '2023-02-07 13:35:28', '2023-02-07 13:35:28'),
(9, 3, NULL, 3, NULL, NULL, NULL, NULL, 'BF550112EFF40', NULL, 1, 6, 'registered', NULL, NULL, '85.00000000', '0.00000000', '0.00000000', '0.00000000', '85.00000000', NULL, 'Success', '2023-02-07 13:35:28', '2023-02-07 13:35:28'),
(10, 1, NULL, 1, NULL, NULL, NULL, NULL, '83623B92E265F', NULL, 2, 5, 'registered', NULL, NULL, '500.00000000', '0.00000000', '0.00000000', '0.00000000', '-500.00000000', NULL, 'Success', '2023-02-07 13:43:55', '2023-02-07 13:43:55'),
(11, 1, NULL, 6, NULL, NULL, NULL, NULL, '83623B92E265F', NULL, 2, 6, 'registered', NULL, NULL, '250000.00000000', '0.00000000', '0.00000000', '0.00000000', '250000.00000000', NULL, 'Success', '2023-02-07 13:43:55', '2023-02-07 13:43:55'),
(12, 1, NULL, 6, 1, NULL, NULL, NULL, 'B26E2658F2883', NULL, 2, 1, 'registered', NULL, NULL, '5000.00000000', '0.00000000', '0.00000000', '0.00000000', '5000.00000000', NULL, 'Success', '2023-02-07 13:48:41', '2023-02-07 13:48:41'),
(13, 1, 3, 6, NULL, NULL, NULL, NULL, '70F04F030951C', NULL, 2, 3, 'registered', 'increasegodwin1@gmail.com', NULL, '100000.00000000', '0.00000000', '0.00000000', '0.00000000', '-100000.00000000', 'enjoy', 'Success', '2023-02-07 13:56:39', '2023-02-07 13:56:39'),
(14, 3, 1, 6, NULL, NULL, NULL, NULL, '70F04F030951C', NULL, 2, 4, 'registered', 'increasegodwin1@gmail.com', NULL, '100000.00000000', '0.00000000', '0.00000000', '0.00000000', '100000.00000000', 'enjoy', 'Success', '2023-02-07 13:56:39', '2023-02-07 13:56:39'),
(15, 3, NULL, 6, 1, NULL, NULL, NULL, '9DF129628EE97', NULL, 1, 2, 'registered', NULL, NULL, '5000.00000000', '0.00000000', '0.00000000', '0.00000000', '-5000.00000000', NULL, 'Success', '2023-02-07 14:07:40', '2023-02-07 14:07:40'),
(16, 1, NULL, 6, NULL, NULL, NULL, NULL, '4507D5CE40F53', NULL, 3, 5, 'registered', NULL, NULL, '100000.00000000', '0.00000000', '0.00000000', '0.00000000', '-100000.00000000', NULL, 'Success', '2023-02-11 18:18:10', '2023-02-11 18:18:10'),
(17, 1, NULL, 1, NULL, NULL, NULL, NULL, '4507D5CE40F53', NULL, 3, 6, 'registered', NULL, NULL, '200.00000000', '0.00000000', '0.00000000', '0.00000000', '200.00000000', NULL, 'Success', '2023-02-11 18:18:10', '2023-02-11 18:18:10'),
(18, 1, NULL, 6, NULL, NULL, NULL, NULL, 'C89FBE8D72594', NULL, 4, 5, 'registered', NULL, NULL, '50000.00000000', '0.00000000', '0.00000000', '0.00000000', '-50000.00000000', NULL, 'Success', '2023-02-11 21:05:54', '2023-02-11 21:05:54'),
(19, 1, NULL, 1, NULL, NULL, NULL, NULL, 'C89FBE8D72594', NULL, 4, 6, 'registered', NULL, NULL, '100.00000000', '0.00000000', '0.00000000', '0.00000000', '100.00000000', NULL, 'Success', '2023-02-11 21:05:54', '2023-02-11 21:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`id`, `name`) VALUES
(1, 'Deposit'),
(2, 'Withdrawal'),
(3, 'Transferred'),
(4, 'Received'),
(5, 'Exchange_From'),
(6, 'Exchange_To'),
(7, 'Request_From'),
(8, 'Request_To'),
(9, 'Payment_Sent'),
(10, 'Payment_Received'),
(11, 'Crypto_Sent'),
(12, 'Crypto_Received');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED DEFAULT NULL,
  `receiver_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID (For Each Transfer)',
  `fee` decimal(20,8) DEFAULT 0.00000000,
  `amount` decimal(20,8) DEFAULT 0.00000000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `sender_id`, `receiver_id`, `currency_id`, `bank_id`, `file_id`, `uuid`, `fee`, `amount`, `note`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, NULL, NULL, '8DFE57FB5DFEA', '0.00000000', '3000.00000000', 'test', 'increasegodwin1@gmail.com', NULL, 'Success', '2023-02-07 13:27:48', '2023-02-07 13:27:48'),
(2, 1, 3, 6, NULL, NULL, '70F04F030951C', '0.00000000', '100000.00000000', 'enjoy', 'increasegodwin1@gmail.com', NULL, 'Success', '2023-02-07 13:56:39', '2023-02-07 13:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT 'user or merchant',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `formattedPhone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google2fa_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultCountry` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrierCode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_verified` tinyint(1) NOT NULL DEFAULT 0,
  `identity_verified` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT 'Active, Inactive, Suspended',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `type`, `first_name`, `last_name`, `formattedPhone`, `phone`, `google2fa_secret`, `defaultCountry`, `carrierCode`, `email`, `password`, `phrase`, `address_verified`, `identity_verified`, `status`, `remember_token`, `created_at`, `updated_at`, `picture`) VALUES
(1, 2, 'user', 'Test', 'test', NULL, NULL, NULL, NULL, NULL, 'incrisz4luv@gmail.com', '$2y$10$OYdewPhOED25sBvP.26ke.9P6L7mVPKa0rYVjlgzZarntiCZckIxK', NULL, 0, 1, 'Active', NULL, '2023-02-07 12:36:19', '2023-02-12 13:01:26', ''),
(3, 2, 'user', 'auto', 'fixer', '+18066298572', '8066298572', NULL, 'us', '1', 'increasegodwin1@gmail.com', '$2y$10$WQVfv.KRC76qDQ2E/8/lguBJqqIZEXcnj7ty/xLi.gvMKUkZQRDyS', NULL, 0, 0, 'Active', NULL, '2023-02-07 13:26:13', '2023-02-07 13:26:13', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `phone_verification_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_step_verification_type` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disabled' COMMENT 'disabled, email, phone, google_authenticator',
  `two_step_verification_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_step_verification` tinyint(1) NOT NULL DEFAULT 0,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `country_id`, `email_verification`, `phone_verification_code`, `two_step_verification_type`, `two_step_verification_code`, `two_step_verification`, `last_login_at`, `last_login_ip`, `city`, `state`, `address_1`, `address_2`, `default_currency`, `timezone`) VALUES
(1, 1, 226, 0, NULL, 'disabled', NULL, 0, '2023-02-12 12:06:30', '105.112.225.90', NULL, NULL, NULL, NULL, NULL, 'Asia/Dhaka'),
(3, 3, 226, 0, NULL, 'disabled', NULL, 0, '2023-02-07 13:26:24', '105.112.232.155', NULL, NULL, NULL, NULL, NULL, 'Asia/Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `balance` decimal(20,8) DEFAULT 0.00000000,
  `is_default` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No' COMMENT 'Yes, No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency_id`, `balance`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1750.00000000', 'Yes', '2023-02-07 12:36:19', '2023-02-11 21:05:54'),
(2, 1, 2, '0.00000000', 'No', '2023-02-07 12:36:19', '2023-02-07 12:36:19'),
(3, 1, 3, '0.00000000', 'No', '2023-02-07 12:36:19', '2023-02-07 12:36:19'),
(7, 3, 1, '2950.00000000', 'Yes', '2023-02-07 13:26:13', '2023-02-07 13:35:28'),
(8, 3, 2, '0.00000000', 'No', '2023-02-07 13:26:13', '2023-02-07 13:26:13'),
(9, 3, 3, '85.00000000', 'No', '2023-02-07 13:26:13', '2023-02-07 13:35:28'),
(10, 3, 6, '95000.00000000', 'No', '2023-02-07 13:26:13', '2023-02-07 14:07:40'),
(11, 1, 6, '5000.00000000', 'No', '2023-02-07 13:39:59', '2023-02-11 21:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique ID (For Each Withdrawal)',
  `charge_percentage` decimal(20,8) DEFAULT 0.00000000,
  `charge_fixed` decimal(20,8) DEFAULT 0.00000000,
  `subtotal` decimal(20,8) DEFAULT 0.00000000,
  `amount` decimal(20,8) DEFAULT 0.00000000,
  `payment_method_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pending, Success, Refund, Blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `currency_id`, `payment_method_id`, `uuid`, `charge_percentage`, `charge_fixed`, `subtotal`, `amount`, `payment_method_info`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 6, 1, '9DF129628EE97', '0.00000000', '0.00000000', '5000.00000000', '5000.00000000', '', 'Success', '2023-02-07 14:07:40', '2023-02-07 14:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_details`
--

CREATE TABLE `withdrawal_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `withdrawal_id` int(10) UNSIGNED DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '2=Paypal, 5=Bank, 8=Crypto',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(10) UNSIGNED DEFAULT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_index` (`user_id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `addons_unique_identifier_unique` (`unique_identifier`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`),
  ADD KEY `admins_role_id_index` (`role_id`);

--
-- Indexes for table `app_store_credentials`
--
ALTER TABLE `app_store_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_tokens`
--
ALTER TABLE `app_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_tokens_app_id_index` (`app_id`);

--
-- Indexes for table `app_transactions_infos`
--
ALTER TABLE `app_transactions_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_transactions_infos_app_id_index` (`app_id`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banks_user_id_index` (`user_id`),
  ADD KEY `banks_admin_id_index` (`admin_id`),
  ADD KEY `banks_currency_id_index` (`currency_id`),
  ADD KEY `banks_country_id_index` (`country_id`),
  ADD KEY `banks_file_id_index` (`file_id`);

--
-- Indexes for table `coinpayment_log_trxes`
--
ALTER TABLE `coinpayment_log_trxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_short_name_unique` (`short_name`);

--
-- Indexes for table `crypto_asset_api_logs`
--
ALTER TABLE `crypto_asset_api_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crypto_asset_api_logs_payment_method_id_index` (`payment_method_id`),
  ADD KEY `crypto_asset_api_logs_object_id_idx` (`object_id`),
  ADD KEY `crypto_asset_api_logs_object_type_idx` (`object_type`),
  ADD KEY `crypto_asset_api_logs_network_idx` (`network`),
  ADD KEY `crypto_asset_api_logs_confirmations_idx` (`confirmations`);

--
-- Indexes for table `crypto_asset_settings`
--
ALTER TABLE `crypto_asset_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crypto_asset_settings_currency_id_unique` (`currency_id`),
  ADD UNIQUE KEY `crypto_asset_settings_network_unique` (`network`),
  ADD KEY `crypto_asset_settings_crypto_provider_id_idx` (`crypto_provider_id`),
  ADD KEY `crypto_asset_settings_payment_method_id_idx` (`payment_method_id`);

--
-- Indexes for table `crypto_providers`
--
ALTER TABLE `crypto_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crypto_providers_alias_unique` (`alias`),
  ADD KEY `crypto_providers_name_idx` (`name`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_type_unique` (`code`,`type`),
  ADD KEY `currencies_code_index` (`code`);

--
-- Indexes for table `currency_exchanges`
--
ALTER TABLE `currency_exchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_exchanges_user_id_index` (`user_id`),
  ADD KEY `currency_exchanges_from_wallet_index` (`from_wallet`),
  ADD KEY `currency_exchanges_to_wallet_index` (`to_wallet`),
  ADD KEY `currency_exchanges_currency_id_index` (`currency_id`);

--
-- Indexes for table `currency_payment_methods`
--
ALTER TABLE `currency_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_payment_methods_currency_id_index` (`currency_id`),
  ADD KEY `currency_payment_methods_method_id_index` (`method_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_index` (`user_id`),
  ADD KEY `deposits_currency_id_index` (`currency_id`),
  ADD KEY `deposits_payment_method_id_index` (`payment_method_id`),
  ADD KEY `deposits_bank_id_index` (`bank_id`),
  ADD KEY `deposits_file_id_index` (`file_id`);

--
-- Indexes for table `device_logs`
--
ALTER TABLE `device_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_logs_user_id_index` (`user_id`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disputes_claimant_id_index` (`claimant_id`),
  ADD KEY `disputes_defendant_id_index` (`defendant_id`),
  ADD KEY `disputes_transaction_id_index` (`transaction_id`),
  ADD KEY `disputes_reason_id_index` (`reason_id`);

--
-- Indexes for table `dispute_discussions`
--
ALTER TABLE `dispute_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispute_discussions_dispute_id_index` (`dispute_id`),
  ADD KEY `dispute_discussions_user_id_index` (`user_id`);

--
-- Indexes for table `document_verifications`
--
ALTER TABLE `document_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_verifications_user_id_index` (`user_id`),
  ADD KEY `document_verifications_file_id_index` (`file_id`);

--
-- Indexes for table `email_configs`
--
ALTER TABLE `email_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_language_id_index` (`language_id`);

--
-- Indexes for table `fees_limits`
--
ALTER TABLE `fees_limits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_limits_transaction_type_id_foreign` (`transaction_type_id`),
  ADD KEY `fees_limits_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `fees_limits_currency_id_index` (`currency_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_admin_id_index` (`admin_id`),
  ADD KEY `files_user_id_index` (`user_id`),
  ADD KEY `files_ticket_id_index` (`ticket_id`),
  ADD KEY `files_ticket_reply_id_index` (`ticket_reply_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchants_user_id_index` (`user_id`),
  ADD KEY `merchants_currency_id_index` (`currency_id`),
  ADD KEY `merchants_merchant_group_id_index` (`merchant_group_id`);

--
-- Indexes for table `merchant_apps`
--
ALTER TABLE `merchant_apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merchant_apps_client_id_unique` (`client_id`),
  ADD KEY `merchant_apps_merchant_id_index` (`merchant_id`);

--
-- Indexes for table `merchant_groups`
--
ALTER TABLE `merchant_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merchant_groups_name_unique` (`name`);

--
-- Indexes for table `merchant_payments`
--
ALTER TABLE `merchant_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_payments_merchant_id_index` (`merchant_id`),
  ADD KEY `merchant_payments_currency_id_index` (`currency_id`),
  ADD KEY `merchant_payments_payment_method_id_index` (`payment_method_id`),
  ADD KEY `merchant_payments_user_id_index` (`user_id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_settings_notification_type_id_index` (`notification_type_id`),
  ADD KEY `notification_settings_recipient_index` (`recipient`),
  ADD KEY `notification_settings_status_index` (`status`);

--
-- Indexes for table `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notification_types_name_unique` (`name`),
  ADD UNIQUE KEY `notification_types_alias_unique` (`alias`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_url_unique` (`url`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_settings`
--
ALTER TABLE `payout_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preferences_field_unique` (`field`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qr_codes_object_id_index` (`object_id`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_payments`
--
ALTER TABLE `request_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_payments_user_id_index` (`user_id`),
  ADD KEY `request_payments_receiver_id_index` (`receiver_id`),
  ADD KEY `request_payments_currency_id_index` (`currency_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_configs`
--
ALTER TABLE `sms_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_configs_type_index` (`type`),
  ADD KEY `sms_configs_status_index` (`status`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_admin_id_index` (`admin_id`),
  ADD KEY `tickets_user_id_index` (`user_id`),
  ADD KEY `tickets_ticket_status_id_index` (`ticket_status_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_admin_id_index` (`admin_id`),
  ADD KEY `ticket_replies_user_id_index` (`user_id`),
  ADD KEY `ticket_replies_ticket_id_index` (`ticket_id`);

--
-- Indexes for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_transaction_type_id_foreign` (`transaction_type_id`),
  ADD KEY `transactions_user_id_index` (`user_id`),
  ADD KEY `transactions_end_user_id_index` (`end_user_id`),
  ADD KEY `transactions_currency_id_index` (`currency_id`),
  ADD KEY `transactions_payment_method_id_index` (`payment_method_id`),
  ADD KEY `transactions_merchant_id_index` (`merchant_id`),
  ADD KEY `transactions_bank_id_index` (`bank_id`),
  ADD KEY `transactions_file_id_index` (`file_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_sender_id_index` (`sender_id`),
  ADD KEY `transfers_receiver_id_index` (`receiver_id`),
  ADD KEY `transfers_currency_id_index` (`currency_id`),
  ADD KEY `transfers_bank_id_index` (`bank_id`),
  ADD KEY `transfers_file_id_index` (`file_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_index` (`user_id`),
  ADD KEY `user_details_country_id_index` (`country_id`);

--
-- Indexes for table `verify_users`
--
ALTER TABLE `verify_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_users_user_id_index` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_index` (`user_id`),
  ADD KEY `wallets_currency_id_index` (`currency_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_user_id_index` (`user_id`),
  ADD KEY `withdrawals_currency_id_index` (`currency_id`),
  ADD KEY `withdrawals_payment_method_id_index` (`payment_method_id`);

--
-- Indexes for table `withdrawal_details`
--
ALTER TABLE `withdrawal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_details_withdrawal_id_index` (`withdrawal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_store_credentials`
--
ALTER TABLE `app_store_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_tokens`
--
ALTER TABLE `app_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_transactions_infos`
--
ALTER TABLE `app_transactions_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coinpayment_log_trxes`
--
ALTER TABLE `coinpayment_log_trxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `crypto_asset_api_logs`
--
ALTER TABLE `crypto_asset_api_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_asset_settings`
--
ALTER TABLE `crypto_asset_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_providers`
--
ALTER TABLE `crypto_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currency_exchanges`
--
ALTER TABLE `currency_exchanges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currency_payment_methods`
--
ALTER TABLE `currency_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `device_logs`
--
ALTER TABLE `device_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispute_discussions`
--
ALTER TABLE `dispute_discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_verifications`
--
ALTER TABLE `document_verifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_configs`
--
ALTER TABLE `email_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `fees_limits`
--
ALTER TABLE `fees_limits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant_apps`
--
ALTER TABLE `merchant_apps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant_groups`
--
ALTER TABLE `merchant_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `merchant_payments`
--
ALTER TABLE `merchant_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payout_settings`
--
ALTER TABLE `payout_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request_payments`
--
ALTER TABLE `request_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sms_configs`
--
ALTER TABLE `sms_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `verify_users`
--
ALTER TABLE `verify_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawal_details`
--
ALTER TABLE `withdrawal_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_tokens`
--
ALTER TABLE `app_tokens`
  ADD CONSTRAINT `app_tokens_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `merchant_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_transactions_infos`
--
ALTER TABLE `app_transactions_infos`
  ADD CONSTRAINT `app_transactions_infos_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `merchant_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banks`
--
ALTER TABLE `banks`
  ADD CONSTRAINT `banks_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banks_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banks_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banks_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `crypto_asset_api_logs`
--
ALTER TABLE `crypto_asset_api_logs`
  ADD CONSTRAINT `crypto_asset_api_logs_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `crypto_asset_settings`
--
ALTER TABLE `crypto_asset_settings`
  ADD CONSTRAINT `crypto_asset_settings_crypto_provider_id_foreign` FOREIGN KEY (`crypto_provider_id`) REFERENCES `crypto_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crypto_asset_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crypto_asset_settings_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currency_exchanges`
--
ALTER TABLE `currency_exchanges`
  ADD CONSTRAINT `currency_exchanges_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `currency_exchanges_from_wallet_foreign` FOREIGN KEY (`from_wallet`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `currency_exchanges_to_wallet_foreign` FOREIGN KEY (`to_wallet`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `currency_exchanges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currency_payment_methods`
--
ALTER TABLE `currency_payment_methods`
  ADD CONSTRAINT `currency_payment_methods_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `currency_payment_methods_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deposits_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deposits_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_logs`
--
ALTER TABLE `device_logs`
  ADD CONSTRAINT `device_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_claimant_id_foreign` FOREIGN KEY (`claimant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disputes_defendant_id_foreign` FOREIGN KEY (`defendant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disputes_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disputes_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dispute_discussions`
--
ALTER TABLE `dispute_discussions`
  ADD CONSTRAINT `dispute_discussions_dispute_id_foreign` FOREIGN KEY (`dispute_id`) REFERENCES `disputes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `document_verifications`
--
ALTER TABLE `document_verifications`
  ADD CONSTRAINT `document_verifications_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `document_verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fees_limits`
--
ALTER TABLE `fees_limits`
  ADD CONSTRAINT `fees_limits_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fees_limits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fees_limits_transaction_type_id_foreign` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ticket_reply_id_foreign` FOREIGN KEY (`ticket_reply_id`) REFERENCES `ticket_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `merchants`
--
ALTER TABLE `merchants`
  ADD CONSTRAINT `merchants_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `merchants_merchant_group_id_foreign` FOREIGN KEY (`merchant_group_id`) REFERENCES `merchant_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `merchants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `merchant_apps`
--
ALTER TABLE `merchant_apps`
  ADD CONSTRAINT `merchant_apps_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `merchant_payments`
--
ALTER TABLE `merchant_payments`
  ADD CONSTRAINT `merchant_payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `merchant_payments_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `merchant_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `merchant_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD CONSTRAINT `notification_settings_notification_type_id_foreign` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_payments`
--
ALTER TABLE `request_payments`
  ADD CONSTRAINT `request_payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_payments_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ticket_status_id_foreign` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_end_user_id_foreign` FOREIGN KEY (`end_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_transaction_type_id_foreign` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verify_users`
--
ALTER TABLE `verify_users`
  ADD CONSTRAINT `verify_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `withdrawals_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawal_details`
--
ALTER TABLE `withdrawal_details`
  ADD CONSTRAINT `withdrawal_details_withdrawal_id_foreign` FOREIGN KEY (`withdrawal_id`) REFERENCES `withdrawals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
