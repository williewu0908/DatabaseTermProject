-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 140.127.74.226
-- 產生時間： 2023-06-16 14:34:06
-- 伺服器版本： 10.11.3-MariaDB
-- PHP 版本： 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `411077024`
--

-- --------------------------------------------------------

--
-- 資料表結構 `bill`
--

CREATE TABLE `bill` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `account` varchar(255) NOT NULL,
  `money` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `commodity`
--

CREATE TABLE `commodity` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `name_of_commodity` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `creditcard`
--

CREATE TABLE `creditcard` (
  `credit_card` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `expDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `account` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `is_frequent` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `customer_information`
--

CREATE TABLE `customer_information` (
  `account` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `adress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `debit_card`
--

CREATE TABLE `debit_card` (
  `card_number` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `expDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `offline_order`
--

CREATE TABLE `offline_order` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `account` varchar(255) NOT NULL,
  `sale_commodity_ID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `pay_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `online_order`
--

CREATE TABLE `online_order` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `delivery_company` varchar(255) NOT NULL,
  `trace_num` bigint(20) NOT NULL,
  `account` varchar(255) NOT NULL,
  `sale_commodity_ID` bigint(20) UNSIGNED NOT NULL,
  `shipping_time` datetime NOT NULL,
  `estimated_time` date NOT NULL,
  `delivery_time` date DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `pay_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `package`
--

CREATE TABLE `package` (
  `product_ID` bigint(20) UNSIGNED NOT NULL,
  `commodity_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `manufactory` varchar(255) NOT NULL,
  `name_of_product` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `sale_commodity`
--

CREATE TABLE `sale_commodity` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `commodity_ID` bigint(20) UNSIGNED NOT NULL,
  `store_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `county` varchar(255) NOT NULL,
  `name_of_store` varchar(255) NOT NULL,
  `is_online` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `store_inventory`
--

CREATE TABLE `store_inventory` (
  `ID` bigint(20) NOT NULL,
  `product_ID` bigint(20) UNSIGNED NOT NULL,
  `store_ID` bigint(20) UNSIGNED NOT NULL,
  `inventory` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `warehouse_inventory`
--

CREATE TABLE `warehouse_inventory` (
  `product_ID` bigint(20) UNSIGNED NOT NULL,
  `inventory` bigint(20) NOT NULL,
  `replenish_state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `bill_account_foreign` (`account`);

--
-- 資料表索引 `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`credit_card`),
  ADD KEY `creditCard_account_foreign` (`account`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`account`);

--
-- 資料表索引 `customer_information`
--
ALTER TABLE `customer_information`
  ADD PRIMARY KEY (`account`);

--
-- 資料表索引 `debit_card`
--
ALTER TABLE `debit_card`
  ADD PRIMARY KEY (`card_number`),
  ADD KEY `簽帳金融卡_顧客帳號_foreign` (`account`);

--
-- 資料表索引 `offline_order`
--
ALTER TABLE `offline_order`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `線下訂單_銷售商品id_foreign` (`sale_commodity_ID`),
  ADD KEY `線下訂單_顧客帳號_foreign` (`account`);

--
-- 資料表索引 `online_order`
--
ALTER TABLE `online_order`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `trace_num` (`trace_num`),
  ADD KEY `online_order_sale_commodity_ID_foreign` (`sale_commodity_ID`),
  ADD KEY `online_order_account_foreign` (`account`);

--
-- 資料表索引 `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`product_ID`,`commodity_ID`),
  ADD KEY `package_product_id_foreign` (`commodity_ID`),
  ADD KEY `package_commodity_ID_foreign` (`product_ID`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `sale_commodity`
--
ALTER TABLE `sale_commodity`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD UNIQUE KEY `commodity _ID` (`commodity_ID`,`store_ID`),
  ADD KEY `sale_commodity_store_ID_foreign` (`store_ID`),
  ADD KEY `sale_commodity_commodity _ID_foreign` (`commodity_ID`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `store_inventory`
--
ALTER TABLE `store_inventory`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `product_ID` (`product_ID`,`store_ID`),
  ADD KEY `store_inventory_store_id_foreign` (`store_ID`),
  ADD KEY `store_inventory_product_id_foreign` (`product_ID`);

--
-- 資料表索引 `warehouse_inventory`
--
ALTER TABLE `warehouse_inventory`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `warehouse_inventory_product_id_foreign` (`product_ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `bill`
--
ALTER TABLE `bill`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `commodity`
--
ALTER TABLE `commodity`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `offline_order`
--
ALTER TABLE `offline_order`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `online_order`
--
ALTER TABLE `online_order`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sale_commodity`
--
ALTER TABLE `sale_commodity`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `store`
--
ALTER TABLE `store`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `store_inventory`
--
ALTER TABLE `store_inventory`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `帳單_顧客帳號_foreign` FOREIGN KEY (`account`) REFERENCES `customer` (`account`);

--
-- 資料表的限制式 `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `信用卡_顧客帳號_foreign` FOREIGN KEY (`account`) REFERENCES `customer` (`account`);

--
-- 資料表的限制式 `customer_information`
--
ALTER TABLE `customer_information`
  ADD CONSTRAINT `顧客資訊_顧客帳號_foreign` FOREIGN KEY (`account`) REFERENCES `customer` (`account`);

--
-- 資料表的限制式 `debit_card`
--
ALTER TABLE `debit_card`
  ADD CONSTRAINT `簽帳金融卡_顧客帳號_foreign` FOREIGN KEY (`account`) REFERENCES `customer` (`account`);

--
-- 資料表的限制式 `offline_order`
--
ALTER TABLE `offline_order`
  ADD CONSTRAINT `線下訂單_銷售商品id_foreign` FOREIGN KEY (`sale_commodity_ID`) REFERENCES `sale_commodity` (`ID`),
  ADD CONSTRAINT `線下訂單_顧客帳號_foreign` FOREIGN KEY (`account`) REFERENCES `customer` (`account`);

--
-- 資料表的限制式 `online_order`
--
ALTER TABLE `online_order`
  ADD CONSTRAINT `線上訂單_銷售商品id_foreign` FOREIGN KEY (`sale_commodity_ID`) REFERENCES `sale_commodity` (`ID`),
  ADD CONSTRAINT `線上訂單_顧客帳號_foreign` FOREIGN KEY (`account`) REFERENCES `customer` (`account`);

--
-- 資料表的限制式 `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `套裝_商品id_foreign` FOREIGN KEY (`commodity_ID`) REFERENCES `commodity` (`ID`),
  ADD CONSTRAINT `套裝_產品id_foreign` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);

--
-- 資料表的限制式 `sale_commodity`
--
ALTER TABLE `sale_commodity`
  ADD CONSTRAINT `銷售商品_商品id_foreign` FOREIGN KEY (`commodity_ID`) REFERENCES `commodity` (`ID`),
  ADD CONSTRAINT `銷售商品_商店id_foreign` FOREIGN KEY (`store_ID`) REFERENCES `store` (`ID`);

--
-- 資料表的限制式 `store_inventory`
--
ALTER TABLE `store_inventory`
  ADD CONSTRAINT `商店庫存_商店id_foreign` FOREIGN KEY (`store_ID`) REFERENCES `store` (`ID`),
  ADD CONSTRAINT `商店庫存_產品id_foreign` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);

--
-- 資料表的限制式 `warehouse_inventory`
--
ALTER TABLE `warehouse_inventory`
  ADD CONSTRAINT `倉庫庫存_產品id_foreign` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
