-- BlockIo

--
-- Crypto Providers
--
CREATE TABLE IF NOT EXISTS `crypto_providers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_details` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crypto_providers_name_idx` (`name`),
  KEY `crypto_providers_alias_idx` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Crypto Asset Setting
--
CREATE TABLE IF NOT EXISTS `crypto_asset_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `crypto_provider_id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `network` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Networks/Cryto Curencies - BTC,LTC,DT etc.',
  `network_credentials` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT 'Active/Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crypto_asset_settings_network_unique` (`network`),
  KEY `crypto_asset_settings_currency_id_index` (`currency_id`),
  KEY `crypto_asset_settings_crypto_provider_id_idx` (`crypto_provider_id`),
  KEY `crypto_asset_settings_payment_method_id_idx` (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `crypto_asset_settings`
  ADD CONSTRAINT `crypto_asset_settings_crypto_provider_id_foreign` FOREIGN KEY (`crypto_provider_id`) REFERENCES `crypto_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crypto_asset_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crypto_asset_settings_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Crypto Asset Api Log
--

CREATE TABLE IF NOT EXISTS `crypto_asset_api_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL COMMENT 'wallet_id or cryto_sent_id or crypto_received_id',
  `object_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `network` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Networks/Cryto Curencies - BTC,LTC,DOGE',
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Crypto Api''s Payloads (e.g - get_new_address(), get_balance(), withdraw(),etc.',
  `confirmations` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crypto_asset_api_logs_payment_method_id_index` (`payment_method_id`),
  KEY `crypto_asset_api_logs_object_id_idx` (`object_id`),
  KEY `crypto_asset_api_logs_object_type_idx` (`object_type`),
  KEY `crypto_asset_api_logs_network_idx` (`network`),
  KEY `crypto_asset_api_logs_confirmations_idx` (`confirmations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `crypto_asset_api_logs`
  ADD CONSTRAINT `crypto_asset_api_logs_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Payment method
--
INSERT INTO `payment_methods` (`name`, `status`) VALUES ('BlockIo', 'Active');

--
-- currencie type length change for crypto_asset (fiat, crypto, crypto_asset)
--

ALTER TABLE `currencies` CHANGE `type` `type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fiat' COMMENT 'fiat, crypto, crypto_assets';

--
-- Unique remove from the column currency->code, currencies table
--
ALTER TABLE `currencies` DROP INDEX `currencies_code_unique`;

--
-- Transaction Types
--
INSERT INTO `transaction_types` (`name`) VALUES ('Crypto_Sent'), ('Crypto_Received');

--
-- metas
--
INSERT INTO `metas` (`url`, `title`, `description`, `keywords`) VALUES ('crypto/send/blockio/{walletCurrencyCode}/{walletId}', 'Crypto Send', 'Crypto Send', '');
INSERT INTO `metas` (`url`, `title`, `description`, `keywords`) VALUES ('crypto/send/blockio/confirm', 'Send Crypto Confirm', 'Send Crypto Confirm', '');
INSERT INTO `metas` (`url`, `title`, `description`, `keywords`) VALUES ('crypto/send/blockio/success', 'Send Crypto Success', 'Send Crypto Confirm', '');
INSERT INTO `metas` (`url`, `title`, `description`, `keywords`) VALUES ('crypto/receive/blockio/{walletCurrencyCode}/{walletId}', 'Crypto Receive', 'Crypto Receive', '');

--
-- Currency code unique based on type
--
ALTER TABLE `currencies` ADD UNIQUE( `type`, `code`);
ALTER TABLE `currencies` DROP INDEX `type`, ADD UNIQUE `currencies_code_type_unique` (`type`, `code`);


--
-- Permissions
--

INSERT INTO `permissions` (`id`, `group`, `name`, `display_name`, `description`, `user_type`, `created_at`, `updated_at`) VALUES
(185, 'Crypto Provider', 'view_crypto_provider', 'View Crypto Provider', 'View Addon Manager', 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(186, 'Crypto Provider', 'add_crypto_provider', NULL, NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(187, 'Crypto Provider', 'edit_crypto_provider', 'Edit Crypto Provider', NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(188, 'Crypto Provider', 'delete_crypto_provider', NULL, NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(189, 'Crypto Asset', 'view_crypto_asset', 'View Crypto Asset', 'View Crypto Asset', 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(190, 'Crypto Asset', 'add_crypto_asset', 'Add Crypto Asset', 'Add Crypto Asset', 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(191, 'Crypto Asset', 'edit_crypto_asset', 'Edit Crypto Asset', 'Edit Crypto Asset', 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(192, 'Crypto Asset', 'delete_crypto_asset', NULL, NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(193, 'Crypto Transactions', 'view_crypto_transactions', 'View Crypto Transactions', 'View Crypto Transactions', 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(194, 'Crypto Transactions', 'add_crypto_transactions', NULL, NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(195, 'Crypto Transactions', 'edit_crypto_transactions', NULL, NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(196, 'Crypto Transactions', 'delete_crypto_transactions', NULL, NULL, 'Admin', '2022-08-17 07:19:46', '2022-08-17 07:19:46'),
(197, 'Crypto Send/Receive', 'manage_crypto_send_receive', 'Manage Crypto Send/Receive', 'Manage Crypto Send/Receive', 'User', '2022-08-17 07:19:46', '2022-08-17 07:19:46');

-- 
-- Permission Roles
--
INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
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
(2, 197),
(3, 197);

--
-- preferences
--

DELETE FROM `preferences` WHERE `preferences`.`field` = 'soft_name';
INSERT INTO `preferences` (`category`, `field`, `value`) VALUES ('preference', 'file_size', '2');

--
--  withdrawal email template by system administrator
-- 
UPDATE `email_templates` SET `body` = 'Hi,\r\n <br><br>Amount {amount} was withdrawn by System Administrator.\r\n\r\n <br><br><b><u><i>Here’s a brief overview of the Withdrawal:</i></u></b>\r\n\r\n <br><br><b><u>Created at:</u></b> {created_at}\r\n\r\n <br><br><b><u>Transaction ID:</u></b> {uuid}\r\n\r\n <br><br><b><u>Currency:</u></b> {code}\r\n\r\n <br><br><b><u>Amount:</u></b> {amount}\r\n\r\n <br><br><b><u>Fee:</u></b> {fee}\r\n\r\n <br><br>If you have any questions, please feel free to reply to this email.\r\n <br><br>Regards,\r\n <br><b>{soft_name}</b>\r\n ' WHERE `email_templates`.`temp_id` = 31 and `email_templates`.`language_id` = 1;

--
-- Social Icons
--
ALTER TABLE `socials` CHANGE `icon` `icon` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

UPDATE `socials` SET `icon` = '<div class=\"facebook\" id=\"facebook\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n <g clip-path=\"url(#clip0_2297_2968)\">\r\n <path d=\"M24.5094 32.4052V23.6116H27.5441L27.9985 20.1846H24.5094V17.9966C24.5094 17.0044 24.7927 16.3282 26.2557 16.3282L28.1215 16.3274V13.2623C27.7986 13.2207 26.6911 13.1274 25.4027 13.1274C22.7126 13.1274 20.8709 14.7244 20.8709 17.6574V20.1847H17.8284V23.6117H20.8708V32.4053L24.5094 32.4052Z\" fill=\"white\"></path>\r\n </g>\r\n <defs>\r\n <clipPath id=\"clip0_2297_2968\">\r\n <rect width=\"10.2931\" height=\"19.2823\" fill=\"white\" transform=\"translate(17.8284 13.125)\"></rect>\r\n </clipPath>\r\n </defs>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'facebook';

UPDATE `socials` SET `icon` = '<div class=\"whtsapp ml-11\" id=\"whtsapp\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect x=\"0.0400391\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"/>\r\n <path d=\"M18.3128 21.091V23.9273H23.0047C22.8156 25.1446 21.5865 27.4964 18.3128 27.4964C15.4883 27.4964 13.1837 25.1564 13.1837 22.2728C13.1837 19.3891 15.4883 17.0491 18.3128 17.0491C19.9201 17.0491 20.9956 17.7346 21.6101 18.3255L23.8556 16.1627C22.4137 14.8155 20.5465 14 18.3128 14C13.7392 14 10.04 17.6991 10.04 22.2728C10.04 26.8464 13.7392 30.5456 18.3128 30.5456C23.0874 30.5456 26.2547 27.1892 26.2547 22.4619C26.2547 21.9182 26.1956 21.5046 26.1247 21.091H18.3128Z\" fill=\"white\"/>\r\n <path d=\"M36.0397 21.0907H33.676V18.7271H31.3124V21.0907H28.9487V23.4544H31.3124V25.818H33.676V23.4544H36.0397\" fill=\"white\"/>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'google_plus';

UPDATE `socials` SET `icon` = '<div class=\"twitter ml-11\" id=\"twitter\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect x=\"0.0402832\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n <path d=\"M32.4132 16.0164C31.6927 16.325 30.8693 16.5306 30.0458 16.6335C30.8693 16.1193 31.5898 15.2966 31.8986 14.371C31.0751 14.8852 30.2517 15.1937 29.2224 15.3994C28.5019 14.5767 27.3696 14.0625 26.2374 14.0625C23.9729 14.0625 22.1201 15.9136 22.1201 18.1761C22.1201 18.4846 22.1201 18.7931 22.2231 19.1016C18.8263 18.8959 15.7384 17.2505 13.6798 14.7824C13.371 15.3994 13.1651 16.1193 13.1651 16.8392C13.1651 18.2789 13.8857 19.513 15.0179 20.2328C14.2974 20.2328 13.6798 20.0272 13.1651 19.7186C13.1651 21.6726 14.6062 23.4208 16.4589 23.7294C16.1501 23.8322 15.7384 23.8322 15.3267 23.8322C15.0179 23.8322 14.812 23.8322 14.5032 23.7294C15.0179 25.3748 16.5619 26.6089 18.4146 26.6089C16.9736 27.7401 15.2238 28.3571 13.2681 28.3571C12.9593 28.3571 12.6505 28.3571 12.2388 28.2543C14.0915 29.3855 16.2531 30.1054 18.6205 30.1054C26.2374 30.1054 30.3546 23.8322 30.3546 18.3817V17.8675C31.178 17.559 31.8986 16.8391 32.4132 16.0164Z\" fill=\"white\"></path>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'twitter';


UPDATE `socials` SET `icon` = '<div class=\"linkdin ml-11\" id=\"linkdin\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect x=\"0.201416\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n <path d=\"M17.5146 31.9712V19.8375H13.4417V31.9712H17.5146ZM15.4787 18.1799C16.8989 18.1799 17.783 17.2481 17.783 16.0838C17.7565 14.8932 16.899 13.9873 15.5056 13.9873C14.1125 13.9873 13.2014 14.8932 13.2014 16.0838C13.2014 17.2482 14.0853 18.1799 15.4521 18.1799H15.4785H15.4787ZM19.7689 31.9712H23.8417V25.1952C23.8417 24.8325 23.8682 24.4703 23.9757 24.211C24.2702 23.4865 24.9403 22.736 26.0654 22.736C27.5392 22.736 28.1288 23.8487 28.1288 25.4799V31.9711H32.2014V25.0138C32.2014 21.2868 30.1921 19.5526 27.5124 19.5526C25.3153 19.5526 24.3506 20.7688 23.8146 21.597H23.8418V19.8373H19.769C19.8224 20.9758 19.769 31.971 19.769 31.971L19.7689 31.9712Z\" fill=\"white\"></path>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'linkedin';

UPDATE `socials` SET `icon` = '<div class=\"pinterest ml-11\" id=\"pinterest\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect x=\"0.161133\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n <path d=\"M28.5611 15.0943C27.247 13.7814 25.3582 13.125 23.305 13.125C20.1842 13.125 18.2953 14.4378 17.2277 15.5045C15.9137 16.8174 15.1746 18.5405 15.1746 20.3456C15.1746 22.561 16.0779 24.2021 17.6383 24.8585C17.7205 24.9406 17.8847 24.9406 17.9668 24.9406C18.2953 24.9406 18.5417 24.6944 18.6239 24.3662C18.706 24.2021 18.7881 23.7098 18.8702 23.4636C18.9523 23.0534 18.8702 22.8892 18.6239 22.561C18.2132 22.0687 17.9668 21.4123 17.9668 20.5918C17.9668 18.2123 19.7736 15.6686 23.0586 15.6686C25.6867 15.6686 27.3292 17.1456 27.3292 19.5251C27.3292 21.002 27.0007 22.3969 26.4258 23.4636C26.0152 24.2021 25.276 25.0226 24.2084 25.0226C23.7156 25.0226 23.305 24.8585 23.0586 24.4482C22.8123 24.12 22.7301 23.7098 22.8122 23.2995C22.8944 22.8072 23.0586 22.3149 23.2229 21.8226C23.4693 20.92 23.7978 20.0174 23.7978 19.361C23.7978 18.2123 23.0586 17.3917 21.991 17.3917C20.5949 17.3917 19.5272 18.7866 19.5272 20.5097C19.5272 21.4123 19.7736 21.9867 19.8557 22.2328C19.6915 22.9713 18.6238 27.3201 18.4596 28.0585C18.3775 28.5509 17.6383 32.3253 18.7881 32.5714C20.02 32.8996 21.1697 29.2073 21.2519 28.797C21.334 28.4688 21.6625 27.156 21.8268 26.4175C22.4016 26.9919 23.3871 27.4021 24.3727 27.4021C26.1794 27.4021 27.7398 26.5816 28.8896 25.1047C29.9572 23.7098 30.6142 21.7405 30.6142 19.5251C30.5321 18.0482 29.8751 16.3251 28.5611 15.0943Z\" fill=\"white\"></path>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'pinterest';

UPDATE `socials` SET `icon` = '<div class=\"whtsapp ml-11\" id=\"whtsapp\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect x=\"0.0400391\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"/>\r\n <path d=\"M28.9291 14.0528C30.2064 14.1845 31.8674 14.0528 32.7619 15.0988C33.7842 16.144 33.913 17.841 33.913 19.1476C34.04 20.7148 34.04 22.9367 34.04 24.3714C33.913 25.8096 34.04 27.5058 33.3996 28.8142C32.7628 30.2489 31.6116 30.7737 30.2064 30.9026C28.6715 31.0325 19.2171 31.0325 16.1518 30.9026C14.7458 30.7728 13.0848 30.7728 12.0624 29.5969C11.1679 28.5509 11.1679 26.9846 11.04 25.6789C11.04 24.1108 11.04 21.8898 11.04 20.3235C11.04 18.8861 11.04 17.1891 11.6787 15.8825C12.3182 14.5767 13.5955 14.3152 15.0007 14.1854C16.5338 14.0537 25.8603 13.9239 28.9282 14.0537L28.9291 14.0528ZM19.9846 18.4939V26.3299L27.0123 22.4119L19.9846 18.4939Z\" fill=\"white\"/>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'youtube';

UPDATE `socials` SET `icon` = '<div class=\"instagram ml-11\" id=\"instagram\">\r\n <svg width=\"46\" height=\"45\" viewBox=\"0 0 46 45\" fill=\"#402875\" xmlns=\"http://www.w3.org/2000/svg\">\r\n <rect x=\"0.0805664\" width=\"45.0402\" height=\"45\" rx=\"4\" fill=\"\"></rect>\r\n <path d=\"M28.8545 14.0625H16.5944C15.2101 14.0625 14.1555 15.1162 14.1555 16.4992V28.7483C14.1555 30.1313 15.2101 31.185 16.5944 31.185H28.8545C30.2387 31.185 31.2933 30.1313 31.2933 28.7483V16.4992C31.2933 15.1162 30.2387 14.0625 28.8545 14.0625ZM22.7244 27.7605C25.5587 27.7605 27.8657 25.5214 27.8657 22.8213C27.8657 22.3603 27.7998 21.8335 27.668 21.4383H29.1181V28.419C29.1181 28.7483 28.8545 29.0776 28.459 29.0776H16.9898C16.6603 29.0776 16.3307 28.8142 16.3307 28.419V21.3725H17.8467C17.7149 21.8335 17.649 22.2945 17.649 22.7554C17.5831 25.5214 19.8901 27.7605 22.7244 27.7605ZM22.7244 25.7848C20.8788 25.7848 19.4287 24.336 19.4287 22.5579C19.4287 20.7798 20.8788 19.331 22.7244 19.331C24.57 19.331 26.0201 20.7798 26.0201 22.5579C26.0201 24.4018 24.57 25.7848 22.7244 25.7848ZM29.0522 18.7383C29.0522 19.1334 28.7226 19.4627 28.3271 19.4627H26.4815C26.086 19.4627 25.7565 19.1334 25.7565 18.7383V16.9601C25.7565 16.565 26.086 16.2357 26.4815 16.2357H28.3271C28.7226 16.2357 29.0522 16.565 29.0522 16.9601V18.7383Z\" fill=\"white\"></path>\r\n </svg>\r\n </div>' WHERE `socials`.`name` = 'instagram';


--
-- Dispute
--
UPDATE `disputes` SET `status`='Closed' WHERE `status`='Close' OR `status`='Closed';

--
-- Provider Table Seeder
--

INSERT INTO `crypto_providers` (`name`, `alias`, `description`, `logo`, `subscription_details`, `status`, `created_at`, `updated_at`) VALUES
('BlockIo', 'BlockIo', 'The world\'s easiest Bitcoin Wallet as a Service.', NULL, NULL, 'Active', DATE_SUB(NOW(), INTERVAL 0 DAY), DATE_SUB(NOW(), INTERVAL 0 DAY)
);