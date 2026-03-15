-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2026 at 06:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zara_clothing`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `size` varchar(10) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `size`, `added_at`) VALUES
(70, 20, 14, 1, 'L', '2026-03-09 13:11:00'),
(71, 23, 14, 1, 'L', '2026-03-09 16:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent_id`, `created_at`) VALUES
(1, 'Men', 'Clothing for men', NULL, '2025-12-16 04:38:56'),
(2, 'Women', 'Clothing for women', NULL, '2025-12-16 04:38:56'),
(3, 'Kid', 'Clothing for kids', 4, '2025-12-16 04:38:56'),
(4, 'Summer Collection', 'Lightweight summer clothes', NULL, '2025-12-16 04:38:56'),
(5, 'Winter Collection', 'Warm winter clothes', NULL, '2025-12-16 04:38:56'),
(6, 'Jacket', 'Stylish clothes', 1, '2026-01-26 05:59:10'),
(9, 'Hoodie', NULL, NULL, '2026-03-04 05:07:27'),
(10, 'Skirit', 'Dailywear outfit for women', 2, '2026-03-13 08:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('new','read','replied') DEFAULT 'new',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `user_id`, `name`, `email`, `subject`, `message`, `status`, `created_at`) VALUES
(9, 26, 'Feefee', 'fee23456@gmail.com', 'Order update', 'I want to order new item, contact if it is restocked', 'read', '2026-03-11 20:55:03'),
(11, 31, 'Bonnie', 'bonnie358@gmail.com', 'Product error', 'packaging is broken ', 'read', '2026-03-13 21:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `shipping_amount` decimal(10,2) DEFAULT 0.00,
  `shipping_address` text NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `delivery_staff_id` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `total_amount`, `tax_amount`, `shipping_amount`, `shipping_address`, `order_date`, `status`, `payment_status`, `payment_method`, `delivery_staff_id`, `delivery_date`, `full_name`, `email`, `phone`) VALUES
(61, 'ZARA-20260310-6436', 26, 97.19, 0.00, 0.00, 'yangon', '2026-03-10 15:45:09', 'cancelled', 'pending', 'cod', 5, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456'),
(62, 'ZARA-20260310-4939', 26, 97.19, 0.00, 0.00, 'yangon', '2026-03-10 15:48:20', 'cancelled', 'pending', 'card', 5, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456'),
(63, 'ZARA-20260311-0284', 26, 97.19, 0.00, 0.00, 'yangon', '2026-03-11 03:48:04', 'delivered', 'paid', 'cod', 19, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456'),
(64, 'ZARA-20260311-1155', 26, 199.78, 0.00, 0.00, 'yangon', '2026-03-11 15:16:00', 'pending', 'pending', 'card', 5, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456'),
(65, 'ZARA-20260311-4684', 26, 97.19, 0.00, 0.00, 'yangon', '2026-03-11 15:22:42', 'pending', 'pending', 'card', 5, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456'),
(66, 'ZARA-20260311-7549', 26, 97.19, 7.20, 0.00, 'yangon', '2026-03-11 15:39:30', 'pending', 'pending', 'cod', 5, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456'),
(67, 'ZARA-20260311-2063', 26, 97.19, 7.20, 0.00, 'yangon', '2026-03-11 16:13:59', 'delivered', 'paid', 'cod', 31, NULL, 'fee fee', 'fee23456@gmail.com', '09688703456');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `subtotal`) VALUES
(60, 61, 14, 1, 89.99, 89.99),
(61, 62, 14, 1, 89.99, 89.99),
(62, 63, 14, 1, 89.99, 89.99),
(63, 64, 14, 1, 89.99, 89.99),
(64, 64, 16, 1, 94.99, 94.99),
(65, 65, 14, 1, 89.99, 89.99),
(66, 66, 14, 1, 89.99, 89.99),
(67, 67, 14, 1, 89.99, 89.99);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('customer','delivery_staff','admin') NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `status` enum('success','failed','pending') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_date`, `amount`, `transaction_id`, `payment_method`, `status`) VALUES
(62, 61, '2026-03-10 15:45:09', 97.19, NULL, 'cod', 'pending'),
(63, 62, '2026-03-10 15:48:20', 97.19, NULL, 'card', ''),
(64, 63, '2026-03-11 03:48:04', 97.19, NULL, 'cod', 'pending'),
(65, 64, '2026-03-11 15:16:00', 199.78, NULL, 'card', ''),
(66, 65, '2026-03-11 15:22:42', 97.19, NULL, 'card', ''),
(67, 66, '2026-03-11 15:39:30', 97.19, NULL, 'cod', 'pending'),
(68, 67, '2026-03-11 16:13:59', 97.19, NULL, 'cod', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`id`, `order_id`, `payment_status`, `updated_by`, `updated_at`, `notes`) VALUES
(1, 59, 'paid', 19, '2026-03-06 11:14:15', NULL),
(2, 52, 'paid', 19, '2026-03-08 17:36:23', NULL),
(3, 57, 'paid', 19, '2026-03-08 17:37:00', NULL),
(4, 52, 'failed', 19, '2026-03-08 17:41:34', NULL),
(5, 57, 'failed', 19, '2026-03-08 17:41:53', NULL),
(6, 57, 'paid', 19, '2026-03-08 17:48:56', NULL),
(7, 57, 'failed', 19, '2026-03-08 17:49:17', NULL),
(8, 57, 'paid', 19, '2026-03-08 17:57:40', NULL),
(9, 57, 'pending', 19, '2026-03-08 17:58:39', NULL),
(10, 57, 'refunded', 19, '2026-03-08 17:58:58', NULL),
(11, 57, 'failed', 19, '2026-03-08 18:04:50', NULL),
(12, 63, 'paid', 19, '2026-03-11 10:21:19', NULL),
(13, 67, 'paid', 6, '2026-03-11 22:53:37', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `gender` enum('Men','Women','Kids','Unisex') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `stock_quantity`, `image_url`, `color`, `gender`, `created_at`, `is_available`) VALUES
(9, 'Vintage Toggle Crop Hoodie - Brown', 'Soft cropped hoodie with toggle clasp detail and a structured silhouette for casual streetwear looks.', 49.99, 9, 18, 'Admin/images/Hoodie/id-11134207-8224z-mgfg27hfqbk92f.jpg', 'Brown', 'Women', '2026-03-09 11:18:59', 1),
(10, 'Vintage Toggle Crop Hoodie - Black', 'Black cropped hoodie with toggle closure and ribbed cuffs. Easy to style for everyday wear.', 49.99, 9, 16, 'Admin/images/Hoodie/images.jpg', 'Black', 'Women', '2026-03-09 11:19:00', 1),
(11, 'Essential Zip Hoodie - White', 'Clean white zip-up hoodie with front pockets and a relaxed fit for lightweight layering.', 44.99, 9, 22, 'Admin/images/Hoodie/Screenshot 2026-03-04 164459.png', 'White', 'Women', '2026-03-09 11:19:00', 1),
(12, 'Urban Leather-Look Pullover Hoodie', 'Bold pullover hoodie with a leather-look texture and kangaroo pocket for standout styling.', 59.99, 9, 12, 'Admin/images/Hoodie/Screenshot 2026-03-04 182057.png', 'Black', 'Men', '2026-03-09 11:19:00', 1),
(13, 'Classic Zip Hoodie - Black', 'Everyday black zip hoodie with soft lining and comfortable drop-shoulder sleeves.', 42.99, 9, 24, 'Admin/images/Hoodie/unnamed.jpg', 'Black', 'Unisex', '2026-03-09 11:19:00', 1),
(14, 'Classic Jacket 01', 'Stylish outerwear piece built for layering, comfort, and daily wear.', 89.99, 6, 30, 'Admin/images/Jacket/01608702052-e1.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(15, 'Essential Jacket 02', 'Stylish outerwear piece built for layering, comfort, and daily wear.', 92.49, 6, 18, 'Admin/images/Jacket/06438081800-e1.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(16, 'Modern Jacket 03', 'Stylish outerwear piece built for layering, comfort, and daily wear.', 94.99, 6, 20, 'Admin/images/Jacket/FIREMANCLASPJACKETBLACK1_1080x.webp', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(17, 'Premium Jacket 04', 'Stylish outerwear piece built for layering, comfort, and daily wear.', 97.49, 6, 24, 'Admin/images/Jacket/Labourunionclothing_heritage_menswear_vintage_inspired_outerwear_Wool_bomber_jacket_fireman_clasp_11_800x.jpg', 'Red', 'Men', '2026-03-09 11:58:45', 1),
(18, 'Urban Jacket 05', 'Stylish outerwear piece built for layering, comfort, and daily wear.', 89.99, 6, 27, 'Admin/images/Jacket/SD_01_T49_3026_FS_X_EC_90_1500x.webp', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(19, 'Classic Kids Outfit 01', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 29.99, 3, 15, 'Admin/images/Kid/6c291b29220e018b.jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(20, 'Essential Kids Outfit 02', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 32.49, 3, 18, 'Admin/images/Kid/176a0746-715c-432d-b4ff-3198f6bf2bf2.5a0f4bc3bf8436112944ecaa64fa5df3.jpeg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(21, 'Modern Kids Outfit 03', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 34.99, 3, 21, 'Admin/images/Kid/afde978ba3d1707a73a8ab3850f9ed6c.jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(22, 'Premium Kids Outfit 04', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 37.49, 3, 24, 'Admin/images/Kid/images (1).jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(23, 'Urban Kids Outfit 05', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 29.99, 3, 27, 'Admin/images/Kid/images (2).jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(24, 'Signature Kids Outfit 06', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 32.49, 3, 30, 'Admin/images/Kid/images (3).jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(25, 'Comfort Kids Outfit 07', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 34.99, 3, 12, 'Admin/images/Kid/images (4).jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(26, 'Tailored Kids Outfit 08', 'Comfortable kidswear with breathable fabric and easy everyday fit.', 37.49, 3, 15, 'Admin/images/Kid/images.jpg', 'Blue', 'Kids', '2026-03-09 11:58:45', 1),
(27, 'Classic Mens Outfit 01', 'Modern menswear design with clean structure and versatile styling.', 44.99, 1, 15, 'Admin/images/Men/0a4ccd5b9c9abf5d29b5e6c449df2b52.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(28, 'Essential Mens Outfit 02', 'Modern menswear design with clean structure and versatile styling.', 47.49, 1, 18, 'Admin/images/Men/1a9b33534e33619fe2e2bd2d99985ce4.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(29, 'Modern Mens Outfit 03', 'Modern menswear design with clean structure and versatile styling.', 49.99, 1, 21, 'Admin/images/Men/7d37bc02cd80d413175e162943c927dc.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(30, 'Premium Mens Outfit 04', 'Modern menswear design with clean structure and versatile styling.', 52.49, 1, 24, 'Admin/images/Men/21f7c86b9c9c7bad0e90e2484cdbc391.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(31, 'Urban Mens Outfit 05', 'Modern menswear design with clean structure and versatile styling.', 44.99, 1, 27, 'Admin/images/Men/27ba6fad742171284f1de3bcccafed4c.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(32, 'Signature Mens Outfit 06', 'Modern menswear design with clean structure and versatile styling.', 47.49, 1, 30, 'Admin/images/Men/167f09b61047d422778a078b7f3823be.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(33, 'Comfort Mens Outfit 07', 'Modern menswear design with clean structure and versatile styling.', 49.99, 1, 12, 'Admin/images/Men/575f2bcb35212d408c923e069634c601.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(34, 'Tailored Mens Outfit 08', 'Modern menswear design with clean structure and versatile styling.', 52.49, 1, 15, 'Admin/images/Men/8154a4cab9347617e1c27697de7562f2.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(35, 'Relaxed Mens Outfit 09', 'Modern menswear design with clean structure and versatile styling.', 44.99, 1, 18, 'Admin/images/Men/67996fff5335570ca3c69159b9202893.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(36, 'Seasonal Mens Outfit 10', 'Modern menswear design with clean structure and versatile styling.', 47.49, 1, 21, 'Admin/images/Men/216905dbd74aaed4af8407b5fb8a4e9c.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(37, 'Classic Mens Outfit 11', 'Modern menswear design with clean structure and versatile styling.', 49.99, 1, 24, 'Admin/images/Men/74644389918d5d7eea1abbc140b5e830.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(38, 'Essential Mens Outfit 12', 'Modern menswear design with clean structure and versatile styling.', 52.49, 1, 27, 'Admin/images/Men/f0a5385381f7725987b843d06d533ba5.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(39, 'Modern Mens Outfit 13', 'Modern menswear design with clean structure and versatile styling.', 44.99, 1, 30, 'Admin/images/Men/f5b8b596528f5e40602cfc1218b72fb0.jpg', 'Black', 'Men', '2026-03-09 11:58:45', 1),
(40, 'Classic Summer Collection Look 01', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 34.99, 4, 15, 'Admin/images/Summer Collection/1b8f8668d5044ec8421d88c08acb9dba.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(41, 'Essential Summer Collection Look 02', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 37.49, 4, 18, 'Admin/images/Summer Collection/02bb822392b832fe1849b7c80b334b29.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(42, 'Modern Summer Collection Look 03', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 39.99, 4, 21, 'Admin/images/Summer Collection/6d68346b96b2e879d450d3314cf62285.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(43, 'Premium Summer Collection Look 04', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 42.49, 4, 24, 'Admin/images/Summer Collection/6e7b111fea08d7fd34defdf2d676177d.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(44, 'Urban Summer Collection Look 05', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 34.99, 4, 27, 'Admin/images/Summer Collection/87e8293c0a142ce2641f6b6c64543199.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(45, 'Signature Summer Collection Look 06', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 37.49, 4, 30, 'Admin/images/Summer Collection/295da31c3dc9d8be1915b5276d947ecd.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(46, 'Comfort Summer Collection Look 07', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 39.99, 4, 12, 'Admin/images/Summer Collection/03563d3b390731dca8689428774002e8.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(47, 'Tailored Summer Collection Look 08', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 42.49, 4, 15, 'Admin/images/Summer Collection/7492b06b53e957ed38519f5717796edf.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(48, 'Relaxed Summer Collection Look 09', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 34.99, 4, 18, 'Admin/images/Summer Collection/e2c999bcf84e4d91fedaa3fafe92aa33.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(49, 'Seasonal Summer Collection Look 10', 'Lightweight seasonal item designed for breathable comfort in warm weather.', 37.49, 4, 21, 'Admin/images/Summer Collection/f6aa98672db88cb5ca2b3d13405acb04.jpg', 'White', 'Unisex', '2026-03-09 11:58:45', 1),
(50, 'Classic Winter Collection Look 01', 'Warm winter-ready design focused on insulation and everyday comfort.', 54.99, 5, 15, 'Admin/images/Winter Collection/0fd0629c57a969b3ae0bc1b10a5ccfba.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(51, 'Essential Winter Collection Look 02', 'Warm winter-ready design focused on insulation and everyday comfort.', 57.49, 5, 18, 'Admin/images/Winter Collection/9e4a061750d8481c60e2d7e3e19cdd39.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(52, 'Modern Winter Collection Look 03', 'Warm winter-ready design focused on insulation and everyday comfort.', 59.99, 5, 21, 'Admin/images/Winter Collection/45d7f98345d864a6d9a16d08b012148e.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(53, 'Premium Winter Collection Look 04', 'Warm winter-ready design focused on insulation and everyday comfort.', 62.49, 5, 24, 'Admin/images/Winter Collection/51f8f6b0b20ad1bfaf935d5d712649e2.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(54, 'Urban Winter Collection Look 05', 'Warm winter-ready design focused on insulation and everyday comfort.', 54.99, 5, 27, 'Admin/images/Winter Collection/98e59ae66533b58081e7f876a6da0906.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(55, 'Signature Winter Collection Look 06', 'Warm winter-ready design focused on insulation and everyday comfort.', 57.49, 5, 30, 'Admin/images/Winter Collection/986a977f38f2b8fe3f8b6e6f30310e9f.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(56, 'Comfort Winter Collection Look 07', 'Warm winter-ready design focused on insulation and everyday comfort.', 59.99, 5, 12, 'Admin/images/Winter Collection/02267dddfe219aac3b6fbd678eca926d.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(57, 'Tailored Winter Collection Look 08', 'Warm winter-ready design focused on insulation and everyday comfort.', 62.49, 5, 15, 'Admin/images/Winter Collection/5264b55f5b7e23c90b58a95f357c7697.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(58, 'Relaxed Winter Collection Look 09', 'Warm winter-ready design focused on insulation and everyday comfort.', 54.99, 5, 18, 'Admin/images/Winter Collection/317669816f7cdd26fda959dbfdd8c9af.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(59, 'Seasonal Winter Collection Look 10', 'Warm winter-ready design focused on insulation and everyday comfort.', 57.49, 5, 21, 'Admin/images/Winter Collection/ade0da27e7be41eed219d1ece598c385.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(60, 'Classic Winter Collection Look 11', 'Warm winter-ready design focused on insulation and everyday comfort.', 59.99, 5, 24, 'Admin/images/Winter Collection/c90ed8f5d594bd2ebe5c619690624690.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(61, 'Essential Winter Collection Look 12', 'Warm winter-ready design focused on insulation and everyday comfort.', 62.49, 5, 27, 'Admin/images/Winter Collection/e7fb87d3ad20d39dee5ce32633807064.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(62, 'Modern Winter Collection Look 13', 'Warm winter-ready design focused on insulation and everyday comfort.', 54.99, 5, 30, 'Admin/images/Winter Collection/ea575b203623c903dc753b6a103d6259.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(63, 'Premium Winter Collection Look 14', 'Warm winter-ready design focused on insulation and everyday comfort.', 57.49, 5, 12, 'Admin/images/Winter Collection/ee05e047ad8c57ceafee07dbf756ee49.jpg', 'Black', 'Unisex', '2026-03-09 11:58:45', 1),
(64, 'Classic Womens Outfit 01', 'Elegant womenswear silhouette combining comfort and modern styling.', 49.99, 2, 15, 'Admin/images/Women/01a0896bf706e2892e7137da101a705a.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(65, 'Essential Womens Outfit 02', 'Elegant womenswear silhouette combining comfort and modern styling.', 52.49, 2, 18, 'Admin/images/Women/1ada3241f0aa8c618224d21954b6e3b9.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(66, 'Modern Womens Outfit 03', 'Elegant womenswear silhouette combining comfort and modern styling.', 54.99, 2, 21, 'Admin/images/Women/4cd5b8d98c29416e24e94c80a8749821.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(67, 'Premium Womens Outfit 04', 'Elegant womenswear silhouette combining comfort and modern styling.', 57.49, 2, 24, 'Admin/images/Women/27c8d61d4b4928d843eaf94069a7d7f3.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(68, 'Urban Womens Outfit 05', 'Elegant womenswear silhouette combining comfort and modern styling.', 49.99, 2, 27, 'Admin/images/Women/301ac9fdb7faea6b9960fba42b90412f.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(69, 'Signature Womens Outfit 06', 'Elegant womenswear silhouette combining comfort and modern styling.', 52.49, 2, 30, 'Admin/images/Women/571e8feefda44b76d0ef0e6297179999.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(70, 'Comfort Womens Outfit 07', 'Elegant womenswear silhouette combining comfort and modern styling.', 54.99, 2, 12, 'Admin/images/Women/8000bf5b78e9b291e60afc6185072b69.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(71, 'Tailored Womens Outfit 08', 'Elegant womenswear silhouette combining comfort and modern styling.', 57.49, 2, 15, 'Admin/images/Women/19804334dac9648323d38bff633676e9.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(72, 'Relaxed Womens Outfit 09', 'Elegant womenswear silhouette combining comfort and modern styling.', 49.99, 2, 18, 'Admin/images/Women/d49cd13973887c26e0196c62411f25b2.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(73, 'Seasonal Womens Outfit 10', 'Elegant womenswear silhouette combining comfort and modern styling.', 52.49, 2, 21, 'Admin/images/Women/ea7d7fc61a858fb7e2e50aa0aecce805.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(74, 'Classic Womens Outfit 11', 'Elegant womenswear silhouette combining comfort and modern styling.', 54.99, 2, 24, 'Admin/images/Women/ef1a3170b25bfc9b03447c39a8613d01.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(75, 'Essential Womens Outfit 12', 'Elegant womenswear silhouette combining comfort and modern styling.', 57.49, 2, 27, 'Admin/images/Women/fa8d289b7b4c5ca0508d7331fb32ff49.jpg', 'Black', 'Women', '2026-03-09 11:58:45', 1),
(76, 'Hoodie', 'Hoodie for winter', 50.00, 9, 20, 'uploads/products/product_1773319146_69b2b3eab9145.png', 'Black', 'Men', '2026-03-12 12:39:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size`) VALUES
(4, 9, 'S'),
(5, 9, 'M'),
(6, 9, 'L'),
(7, 10, 'S'),
(8, 10, 'M'),
(9, 10, 'L'),
(10, 11, 'XS'),
(11, 11, 'S'),
(12, 11, 'M'),
(13, 11, 'L'),
(14, 12, 'M'),
(15, 12, 'L'),
(16, 12, 'XL'),
(17, 13, 'S'),
(18, 13, 'M'),
(19, 13, 'L'),
(20, 13, 'XL'),
(24, 15, 'M'),
(25, 15, 'L'),
(26, 15, 'XL'),
(27, 16, 'M'),
(28, 16, 'L'),
(29, 16, 'XL'),
(30, 17, 'M'),
(31, 17, 'L'),
(32, 17, 'XL'),
(33, 18, 'M'),
(34, 18, 'L'),
(35, 18, 'XL'),
(36, 19, 'XS'),
(37, 19, 'S'),
(38, 19, 'M'),
(39, 20, 'XS'),
(40, 20, 'S'),
(41, 20, 'M'),
(42, 21, 'XS'),
(43, 21, 'S'),
(44, 21, 'M'),
(45, 22, 'XS'),
(46, 22, 'S'),
(47, 22, 'M'),
(48, 23, 'XS'),
(49, 23, 'S'),
(50, 23, 'M'),
(51, 24, 'XS'),
(52, 24, 'S'),
(53, 24, 'M'),
(54, 25, 'XS'),
(55, 25, 'S'),
(56, 25, 'M'),
(57, 26, 'XS'),
(58, 26, 'S'),
(59, 26, 'M'),
(60, 27, 'S'),
(61, 27, 'M'),
(62, 27, 'L'),
(63, 27, 'XL'),
(64, 28, 'S'),
(65, 28, 'M'),
(66, 28, 'L'),
(67, 28, 'XL'),
(68, 29, 'S'),
(69, 29, 'M'),
(70, 29, 'L'),
(71, 29, 'XL'),
(72, 30, 'S'),
(73, 30, 'M'),
(74, 30, 'L'),
(75, 30, 'XL'),
(76, 31, 'S'),
(77, 31, 'M'),
(78, 31, 'L'),
(79, 31, 'XL'),
(80, 32, 'S'),
(81, 32, 'M'),
(82, 32, 'L'),
(83, 32, 'XL'),
(84, 33, 'S'),
(85, 33, 'M'),
(86, 33, 'L'),
(87, 33, 'XL'),
(88, 34, 'S'),
(89, 34, 'M'),
(90, 34, 'L'),
(91, 34, 'XL'),
(92, 35, 'S'),
(93, 35, 'M'),
(94, 35, 'L'),
(95, 35, 'XL'),
(96, 36, 'S'),
(97, 36, 'M'),
(98, 36, 'L'),
(99, 36, 'XL'),
(100, 37, 'S'),
(101, 37, 'M'),
(102, 37, 'L'),
(103, 37, 'XL'),
(104, 38, 'S'),
(105, 38, 'M'),
(106, 38, 'L'),
(107, 38, 'XL'),
(108, 39, 'S'),
(109, 39, 'M'),
(110, 39, 'L'),
(111, 39, 'XL'),
(112, 40, 'S'),
(113, 40, 'M'),
(114, 40, 'L'),
(115, 41, 'S'),
(116, 41, 'M'),
(117, 41, 'L'),
(118, 42, 'S'),
(119, 42, 'M'),
(120, 42, 'L'),
(121, 43, 'S'),
(122, 43, 'M'),
(123, 43, 'L'),
(124, 44, 'S'),
(125, 44, 'M'),
(126, 44, 'L'),
(127, 45, 'S'),
(128, 45, 'M'),
(129, 45, 'L'),
(130, 46, 'S'),
(131, 46, 'M'),
(132, 46, 'L'),
(133, 47, 'S'),
(134, 47, 'M'),
(135, 47, 'L'),
(136, 48, 'S'),
(137, 48, 'M'),
(138, 48, 'L'),
(139, 49, 'S'),
(140, 49, 'M'),
(141, 49, 'L'),
(142, 50, 'M'),
(143, 50, 'L'),
(144, 50, 'XL'),
(145, 51, 'M'),
(146, 51, 'L'),
(147, 51, 'XL'),
(148, 52, 'M'),
(149, 52, 'L'),
(150, 52, 'XL'),
(151, 53, 'M'),
(152, 53, 'L'),
(153, 53, 'XL'),
(154, 54, 'M'),
(155, 54, 'L'),
(156, 54, 'XL'),
(157, 55, 'M'),
(158, 55, 'L'),
(159, 55, 'XL'),
(160, 56, 'M'),
(161, 56, 'L'),
(162, 56, 'XL'),
(163, 57, 'M'),
(164, 57, 'L'),
(165, 57, 'XL'),
(166, 58, 'M'),
(167, 58, 'L'),
(168, 58, 'XL'),
(169, 59, 'M'),
(170, 59, 'L'),
(171, 59, 'XL'),
(172, 60, 'M'),
(173, 60, 'L'),
(174, 60, 'XL'),
(175, 61, 'M'),
(176, 61, 'L'),
(177, 61, 'XL'),
(178, 62, 'M'),
(179, 62, 'L'),
(180, 62, 'XL'),
(181, 63, 'M'),
(182, 63, 'L'),
(183, 63, 'XL'),
(184, 64, 'XS'),
(185, 64, 'S'),
(186, 64, 'M'),
(187, 64, 'L'),
(188, 65, 'XS'),
(189, 65, 'S'),
(190, 65, 'M'),
(191, 65, 'L'),
(192, 66, 'XS'),
(193, 66, 'S'),
(194, 66, 'M'),
(195, 66, 'L'),
(196, 67, 'XS'),
(197, 67, 'S'),
(198, 67, 'M'),
(199, 67, 'L'),
(200, 68, 'XS'),
(201, 68, 'S'),
(202, 68, 'M'),
(203, 68, 'L'),
(204, 69, 'XS'),
(205, 69, 'S'),
(206, 69, 'M'),
(207, 69, 'L'),
(208, 70, 'XS'),
(209, 70, 'S'),
(210, 70, 'M'),
(211, 70, 'L'),
(212, 71, 'XS'),
(213, 71, 'S'),
(214, 71, 'M'),
(215, 71, 'L'),
(216, 72, 'XS'),
(217, 72, 'S'),
(218, 72, 'M'),
(219, 72, 'L'),
(220, 73, 'XS'),
(221, 73, 'S'),
(222, 73, 'M'),
(223, 73, 'L'),
(224, 74, 'XS'),
(225, 74, 'S'),
(226, 74, 'M'),
(227, 74, 'L'),
(228, 75, 'XS'),
(229, 75, 'S'),
(230, 75, 'M'),
(231, 75, 'L'),
(232, 14, 'M'),
(233, 14, 'L'),
(234, 14, 'XL'),
(235, 76, 'M'),
(236, 76, 'L'),
(237, 76, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_approved` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `review_date`, `is_approved`) VALUES
(4, 26, 14, 5, 'very good', '2026-03-11 14:09:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `status` enum('open','in_progress','resolved','closed') DEFAULT 'open',
  `admin_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `resolved_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `staff_id`, `order_id`, `subject`, `message`, `priority`, `status`, `admin_response`, `created_at`, `updated_at`, `resolved_at`) VALUES
(1, 18, NULL, 'cannot find location ', 'cannot find location ', 'medium', 'open', NULL, '2026-02-23 15:30:20', NULL, NULL),
(2, 31, NULL, 'wqdfevfbs', 'afgsbfd', 'medium', 'resolved', NULL, '2026-03-13 12:24:44', '2026-03-13 12:26:23', '2026-03-13 12:26:23'),
(3, 31, NULL, 'dfdwaefw', 'vsdfedfawvf', 'medium', 'open', NULL, '2026-03-13 12:26:45', NULL, NULL),
(4, 31, NULL, 'wdefdvd', 'dvf bfdvdvf', 'medium', 'open', NULL, '2026-03-13 12:31:17', NULL, NULL),
(5, 31, 67, 'Product error', 'packaging is broken ', 'high', 'open', NULL, '2026-03-13 15:09:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','customer','delivery_staff') NOT NULL DEFAULT 'customer',
  `full_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `user_type`, `full_name`, `phone`, `address`, `profile_image`, `created_at`, `is_active`) VALUES
(1, 'admin', 'admin@zara.com', '0192023a7bbd73250516f069df18b500', 'admin', 'System Admin', NULL, NULL, NULL, '2025-12-16 04:38:32', 1),
(2, 'john_doe', 'john@email.com', '6ad14ba9986e3615423dfca256d04e3f', 'customer', 'John Doe', NULL, NULL, NULL, '2025-12-16 04:38:32', 1),
(3, 'delivery1', 'delivery@zara.com', '6e5edd0c1a1acf48192850bf3ce85e33', 'admin', 'Delivery Staff 1', NULL, NULL, NULL, '2025-12-16 04:38:32', 1),
(4, 'hein113@gmail.com', 'rhysslick@gmail.com', '$2y$10$r8luJBquAzDf2CNpRJgz4egErAWfsrigNtw/av9WC96jk3oBInHvO', 'customer', 'ee', '09441041333', 'ee', NULL, '2025-12-16 05:32:20', 1),
(5, 'bryze358@gmail.com', 'bryze358@gmail.com', '$2y$10$dtv5YnAO1Ycx6jMR2hzHYelXXWLs/gsiJcoeffLpxI5asoelX/dHm', 'delivery_staff', 'Hphone', '09442041333', 'Mandalay', NULL, '2025-12-16 05:37:25', 1),
(6, 'admin358@gmail.com', 'admin358@gmail.com', '$2y$10$wa.eByObu0sN44nfp1DPee84UvJegZgN7i1Ne.qh5wofrfPONcHu6', 'admin', 'AdminHphone', '09881041333', 'Mandalay', NULL, '2025-12-16 05:39:41', 1),
(8, 'john358@gmail.com', 'john358@gmail.com', '$2y$10$260tLIVRIiVwKGyLaeWZZeER80Q7pOOThGqzU0wrKlgxEh/a7bKa2', 'admin', 'john', '09889041333', 'john358@gmail.com', NULL, '2026-01-04 04:54:48', 1),
(9, 'phoe987@gmail.com', 'phoe987@gmail.com', '$2y$10$4ceBr2n5zn8dVw8z4WO5MuHSTbsiwO4Oc0LgNOPqnsdHcwERZCP3S', 'customer', 'phoe', '09998041333', 'phoe987@gmail.com', NULL, '2026-01-04 04:55:48', 1),
(10, 'deli677@gmail.com', 'deli677@gmail.com', '$2y$10$oDk6aVBCXMx8ECrp9qhSxO2y34wAnCVFjsDzX7t7bMgX.KVjfauLu', 'admin', 'deli', '09998041222', 'deli677@gmail.com', NULL, '2026-01-04 05:44:10', 0),
(11, 'myo', 'myo123@gmail.com', '$2y$10$fCQotADV0OK8LJ5JwXIZHOtWUKjs6OkAFecn5/HarqoBaUsfNR2qm', 'admin', 'myo', '09441041333', 'myo123@gmail.com', NULL, '2026-01-21 03:44:36', 1),
(12, 'Hee', 'hee12345@gmail.com', '$2y$10$ZorTv1Tptb9FWoOHD4P/L.cAWeAoZkSYOn8uy.R8AG.GejfIib1vy', 'delivery_staff', 'Hee', '09441041322', 'Mandalay', NULL, '2026-01-26 10:25:14', 1),
(13, 'jj3445@gmail.com', 'jj3445@gmail.com', '$2y$10$fvWffsOInz3NX05BO09gVetHwhjTvBqQE4/hW.0Upe.D.nAmn0k/2', 'customer', 'jonh', '09998041333', 'jj3445@gmail.com', NULL, '2026-01-30 04:23:13', 1),
(14, 'tee12345@gmail.com', 'tee12345@gmail.com', '$2y$10$HwffCevkNaNEyZlQyNf9eeD2k4tOuOza0A34wCO3lNzd/GQ2c3T0C', 'delivery_staff', 'Hphone', '09441041320', NULL, NULL, '2026-02-09 12:28:17', 1),
(17, 'Rhys', 'rhys12345@gmail.com', '$2y$10$GpECeuMJvooJiuzwI1Mad.DLepc9/CmOjyyFtHXBGILKnsywNv9QS', 'customer', 'Rhys', '09688703540', 'yangon', NULL, '2026-02-23 13:12:17', 1),
(18, 'David', 'david358@gmail.com', '$2y$10$/7MnSQ3w7n00ww5fekX2tei9xnjeJ6WifINPOEwy55Mj6QTLlFnwu', 'delivery_staff', 'David', '09998041333', 'mandalay', NULL, '2026-02-23 13:16:16', 1),
(19, 'Honey', 'honey358@gmail.com', '$2y$10$6XKphXtqDAUrfREkBcMzFe1IrtPMGaMuaVYslsVWkfhqx/gY9s9/6', 'delivery_staff', 'Honey', '09441041356', 'yangon', NULL, '2026-02-25 03:09:17', 1),
(20, 'dodo358@gmail.com', 'dodo358@gmail.com', '$2y$10$pUlq1R83hpZC/cuoFRvCN.0nO1ERKJJcLmQsEODLMJl/Wjv9ss6nu', 'customer', 'dodo', '09688703548', 'yangon', NULL, '2026-03-05 11:22:27', 1),
(21, 'koko@gmail.com', 'mee12345@gmail.com', '$2y$10$DY7/LXNc7Pa5Dzp3532ddOg6E1ZClRegIdNvAtM1p1yPd/3RbbnE2', 'customer', 'mee', '09688703548', 'yangon', NULL, '2026-03-09 15:24:08', 1),
(22, 'coco@gmail.com', 'coco@gmail.com', '$2y$10$mCCTDBk7En9KvYsDe2LIGuUbK163w0NYt26G/TKlJyJyumha6UHGi', 'customer', 'coco', '', 'yangon', NULL, '2026-03-09 15:38:27', 1),
(23, 'Louis', 'myatbhonenaing619@gmail.com', '$2y$10$EB6aX3OUc9ung1GOwN1fGOsuZqcMxHrOdq3smfv1UnORi8vXTxGcS', 'customer', 'Louis', '09986687703', 'Maekinkone', NULL, '2026-03-09 16:13:57', 1),
(24, 'bobo358@gmail.com', 'bobo12345@gmail.com', '$2y$10$23lTlUl2UxKLtDs90Z7wkeFkj4N/GvNpQj/neJ7auLPKaqj0.3WWu', 'customer', 'bobo', '0968870350', 'yangon', NULL, '2026-03-10 12:17:27', 1),
(25, 'hoho358@gmail.com', 'hoho12345@gmail.com', '$2y$10$aKgB4.AxD9diUY.lOrWiweo1Etqkw/OPL6Ht3SohyBKOSuubH4z.e', 'delivery_staff', 'hoho', '09688703548', 'yangon', NULL, '2026-03-10 12:19:50', 1),
(26, 'fee', 'fee23456@gmail.com', '$2y$10$K8TgiZ.TH4rpExwCzIL30OmjLcvNzk8HQHNjyvikuSY2qEaAuhapK', 'customer', 'fee fee', '09688703456', 'yangon', NULL, '2026-03-10 13:21:07', 1),
(27, 'reh@gmail.com', 'reh12345@gmail.com', '$2y$10$ng5ijuAcM1x/XPEYQ9NUw.8aLiH57BZ90KGHmcmVBpcOBxeUEpLha', 'delivery_staff', 'Rhy', '09688703548', 'yangon', NULL, '2026-03-10 13:32:44', 1),
(28, 'gg345@gmail.com', 'gg345@gmail.com', '$2y$10$D.12/BKt6iMCQ8jYiOCUHO0134f/CjO0huiVb4anI8pGGtbCb06R.', 'customer', 'gg', '098765433456', 'mandalay', NULL, '2026-03-11 14:53:36', 1),
(29, 'bobby358@gmail.com', 'bobby358@gmail.com', '$2y$10$9OO6jjRcrCuekYlyQozDHeRE4MZI6biFzznmSB/hNy5ySsG448qfq', 'delivery_staff', 'Bobby', '098765433368', 'Amayapuya', NULL, '2026-03-12 11:24:04', 1),
(30, 'Cathrine358@gmail.com', 'cathrine358@gmail.com', '$2y$10$wCLjd0aaeiFBVXzT8WFL8OwrsTkWZIvdzOWinrIpsmXIBXPhW4jA.', 'delivery_staff', 'Cathrine', '09998041334', NULL, NULL, '2026-03-13 08:01:13', 1),
(31, 'Bonnie123', 'bonnie358@gmail.com', '$2y$10$oyh8n/QiefhEmrfP3javA.Q2ewEjtusGMTmhxUPLPgxCx01O8q37a', 'delivery_staff', 'Bonnie', '09441041350', '105,55 street Mandalay', NULL, '2026-03-13 11:44:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_at`) VALUES
(14, 20, 14, '2026-03-09 13:10:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `delivery_staff_id` (`delivery_staff_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_updated_by` (`updated_by`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_wishlist` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`delivery_staff_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
