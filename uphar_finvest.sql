-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 20, 2019 at 12:01 AM
-- Server version: 5.6.43-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uphar_finvest`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` text COLLATE utf8mb4_unicode_ci,
  `field_boy` char(251) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `date_of_birth` text COLLATE utf8mb4_unicode_ci,
  `father_or_husband_name` text COLLATE utf8mb4_unicode_ci,
  `residential_address` text COLLATE utf8mb4_unicode_ci,
  `state` varchar(251) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(251) COLLATE utf8mb4_unicode_ci NOT NULL,
  `land_mark` text COLLATE utf8mb4_unicode_ci,
  `police_station` text COLLATE utf8mb4_unicode_ci,
  `phone_number` char(121) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_of_res_address` text COLLATE utf8mb4_unicode_ci,
  `residance_type` text COLLATE utf8mb4_unicode_ci,
  `office_address` text COLLATE utf8mb4_unicode_ci,
  `ofc_phone_number` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adhar_card_number` text COLLATE utf8mb4_unicode_ci,
  `adhar_card_image` text COLLATE utf8mb4_unicode_ci,
  `pan_card_number` text COLLATE utf8mb4_unicode_ci,
  `pan_card_image` text COLLATE utf8mb4_unicode_ci,
  `years_of_ofc_address` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(151) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `marital_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_dependants` text COLLATE utf8mb4_unicode_ci,
  `loan_amount` text COLLATE utf8mb4_unicode_ci,
  `EMI` text COLLATE utf8mb4_unicode_ci,
  `Period` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL COMMENT '0=pending,1=notified, 2=approved_by_FB, 3= decline_by_FB, 5=approved_by_admin, 6=decline_by_admin',
  `Created_At` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `agent_id`, `customer_id`, `field_boy`, `name`, `date_of_birth`, `father_or_husband_name`, `residential_address`, `state`, `city`, `land_mark`, `police_station`, `phone_number`, `years_of_res_address`, `residance_type`, `office_address`, `ofc_phone_number`, `adhar_card_number`, `adhar_card_image`, `pan_card_number`, `pan_card_image`, `years_of_ofc_address`, `email`, `profile`, `marital_status`, `no_of_dependants`, `loan_amount`, `EMI`, `Period`, `status`, `Created_At`, `updated_at`) VALUES
(1, '4', 'DEL/NEW /1119', 'Rahul Yadav', 'VIKRAM KUMAR', NULL, 'Mr. bhim prasad saha', 'hno.303-a, ashoka bindusar camp, sriniwaspuri nd-65', 'DELHI', 'NEW DELHI', 'Owned', 'sriniwaspuri', '9015403852', '10', 'Owned', 'zomatto- 2nd floor, primimum plaza,  madangir nd-62', 'Not Provided', '560543450139', 'public/documents/_adhar1551598354.png', 'huck1315k', 'public/documents/_pan1551598355.png', '02', 'abs@gmail.com', 'Salaried', 'Single', '0', '50500', '3283', '20', 5, '2019-03-03 07:00:00', NULL),
(2, '4', 'DEL/NEW /1087', 'Rahul Yadav', 'GAURAV KUMAR', NULL, 'Mr. surender ram bharti', 'b-375, sanjay colony, okhla ph-2, nd-20', 'DELHI', 'NEW DELHI', 'Owned', 'harkesh ngr', '8527280360', '06', 'Owned', 'C-260 Noida Sector 63', '8700853187', '982987642725', 'public/documents/_adhar1551612556.png', 'dgnpk2342m', 'public/documents/_pan1551612556.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '83900', '5674', '19', 5, '2019-03-03 07:00:00', NULL),
(3, '20', 'DEL/DELH/1536', 'KRISHAN LAL', 'SHAMSHAD ALI', NULL, 'sakir ali', 'f-187 Vijay vihar phase -1 rohini north west Delhi -110085', 'DELHI', 'DELHI', 'Owned', 'Vijay vihar', '9718981494', '15', 'Owned', 'f-187 Vijay vihar', '9718981494', '102400003345', 'public/documents/_adhar1551679011.png', 'DPIZM00346', 'public/documents/_pan1551679011.png', '15', 'shamshadali8877@gmail.com', 'Self Employed', 'Married', '0', '47000', '3316', '18', 5, '2019-03-04 07:00:00', NULL),
(4, '4', 'DEL/NEW /1278', 'Rahul Yadav', 'PARTIK NARWAL', NULL, 'Mr yogendra narwal', 'd-47, d-245 a, saurabh vihar jaitpur nd-44', 'DELHI', 'NEW DELHI', 'Rented', 'jaitpur', '9599624993', '06', 'Rented', 'sharthi stationary -same add', '9210848448', '839606414303', 'public/documents/_adhar1551787185.png', 'bqopn9061k', 'public/documents/_pan1551787185.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '55000', '3575', '20', 5, '2019-03-05 07:00:00', NULL),
(5, '4', 'DEL/NEW /1437', 'Rahul Yadav', 'RANVIR PANDEY', NULL, 'Mr.MUNIL PANDAY', 'hno.416, gali no.7/05, shakti vihar, mithapur extn, badarpur, nd-44', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana jaitpur', '8510859678', '06', 'Owned', 'TIKONA INFINET P LTD - B-1/19A, BLOCK-E, BASMENT MOHAN CO-OPRATIVE ND-44', '8510859678', '637198264004', 'public/documents/_adhar1551787758.png', 'dsopp9973c', 'public/documents/_pan1551787758.png', '03', 'abs@gmail.com', 'Salaried', 'Single', '0', '57000', '3705', '20', 5, '2019-03-05 07:00:00', NULL),
(6, '4', 'DEL/NEW /1706', 'Rahul Yadav', 'VIJAY KUMAR', NULL, 'Mr. raj kumar', 'hno.8, balmukund khand giri ngr kalka ji nd-19', 'DELHI', 'NEW DELHI', 'Rented', 'kalka ji', '8130960421', '06', 'Rented', 'ngo- d-156, sarita vihar, 1st floor, nd-76', '8920442554', '686036500442', 'public/documents/_adhar1551944572.png', 'cetpk4851g', 'public/documents/_pan1551944572.png', '02', 'abs@gmail.com', 'Salaried', 'Single', '0', '33500', '2172', '20', 5, '2019-03-07 07:00:00', NULL),
(7, '4', 'DEL/NEW /1279', 'Rahul Yadav', 'VIJAY KUMAR', NULL, 'Mr. raj kumar', 'hno.8, balmukhund khand giri ngr kalka ji nd-19', 'DELHI', 'NEW DELHI', 'Rented', 'sangam vihar', '8130960421', '10', 'Rented', 'ngo -d-156, sarita vihar, 1st floor, ne-76', '8920442554', '686036500442', 'public/documents/_adhar1552291320.png', 'cetpk4851g', 'public/documents/_pan1552291320.png', '02', 'abs@gmail.com', 'Salaried', 'Single', '0', '33500', '2177', '20', 5, '2019-03-11 07:00:00', NULL),
(8, '5', 'NEW/NEW /1369', 'Rahul Yadav', 'Vikash', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony new delhi', 'NEW DELHI', 'NEW DELHI', 'Rented', 'Thaana Sangam vihar', '9873396412', '06', 'Rented', 'C-260 sangam vihar', '8700853187', '102400003345', 'public/documents/_adhar1552370260.png', 'DPIZM00346', 'public/documents/_pan1552370260.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 3, '2019-03-12 07:00:00', NULL),
(9, '21', 'DEL/DELH/1385', 'KRISHAN LAL', 'RAJ MOHAN SHAH', NULL, 'BHIKHARI SHAH', 'D-86 SATAY ENCLAVE PREM NAGAR 3 KIRARI SULEMAN NAGAR', 'DELHI', 'DELHI', 'Owned', 'KIRARI', '8744995675', '5', 'Owned', 'RICKSHAW DRIWER', '9999999999', '870074653484', 'public/documents/_adhar1552712612.png', 'gfcps6345B', 'public/documents/_pan1552712612.png', '5', 'kundrasameer96@gmail.com', 'Salaried', 'Married', '3', '60000', '6000', '12', 5, '2019-03-16 07:00:00', NULL),
(10, '4', 'DEL/NEW /1910', 'Rahul Yadav', 'NIRANJAN KUMAR JHA', NULL, 'Mr. chandra jha', 'hno.150, churriya mohalla, okhla, ph-1, nd-20', 'DELHI', 'NEW DELHI', 'Rented', 'okhla ph-1,', '9810816127', '06', 'Rented', 'zometto premiume plaza ,2nd floor, madangir nd-62', '8743908237', '693208963550', 'public/documents/_adhar1552726245.png', 'aiapj8796n', 'public/documents/_pan1552726245.png', '02', 'abs@gmail.com', 'Salaried', 'Single', '0', '38500', '2182', '24', 5, '2019-03-16 07:00:00', NULL),
(11, '4', 'DEL/NEW /1205', 'Rahul Yadav', 'LOVELESH', NULL, 'Mr ravi gupta', 'hno.706/7, govind luri, kalka ji , new delhi-19', 'DELHI', 'NEW DELHI', 'Owned', 'govind puri', '9818858885', '06', 'Owned', 'maa kalka associates- shop.no. 8,60-krishna market, kalka ji nd-19', '9650210021', '829161248886', 'public/documents/_adhar1552734672.png', 'Not Provided', 'public/documents/_pan1552734673.png', '02', 'abs@gmail.com', 'Self Employed', 'Married', '3', '44000', '3248', '17', 5, '2019-03-16 07:00:00', NULL),
(12, '5', 'NEW/NEW /1803', 'Rahul Yadav', 'VICKY', NULL, 'Mr. S.k. amchanda', 'C-178, Dabua colony new delhi', 'NEW DELHI', 'NEW DELHI', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552885937.png', 'DPIZM00346', 'public/documents/_pan1552885937.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 5, '2019-03-18 07:00:00', NULL),
(13, '5', 'NEW/NEW /1867', 'Rahul Yadav', 'VICKY', NULL, 'Mr. S.k. amchanda', 'C-178, Dabua colony new delhi', 'NEW DELHI', 'NEW DELHI', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552887126.png', 'DPIZM00346', 'public/documents/_pan1552887126.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 5, '2019-03-18 07:00:00', NULL),
(14, '21', 'DEL/DELH/1881', 'KRISHAN LAL', 'TARUN', NULL, 'VED PRAKASH', '10814 GALI NO 5 VALMIKI COLONY KAROL BAGH', 'DELHI', 'DELHI', 'Owned', 'NA', '9873737545', '5', 'Owned', 'RICKSHAW DRIVER', '99999999', '696965425664', 'public/documents/_adhar1552971688.png', 'Not Provided', 'public/documents/_pan1552971688.png', '5', 'NA', 'Salaried', 'Married', '3', '70000', '7000', '12', 5, '2019-03-19 07:00:00', NULL),
(15, '5', 'HAR/FARI/1078', NULL, 'VINAY', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony saket', 'HARYANA', 'FARIDABAD', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552977821.png', 'DPIZM00346', 'public/documents/_pan1552977821.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 0, '2019-03-19 07:00:00', NULL),
(16, '5', 'HAR/FARI/1189', NULL, 'VINAY', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony saket', 'HARYANA', 'FARIDABAD', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552977999.png', 'DPIZM00346', 'public/documents/_pan1552977999.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 0, '2019-03-19 07:00:00', NULL),
(17, '5', 'HAR/FARI/1714', NULL, 'VINAY', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony saket', 'HARYANA', 'FARIDABAD', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978006.png', 'DPIZM00346', 'public/documents/_pan1552978006.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 0, '2019-03-19 07:00:00', NULL),
(18, '5', 'HAR/FARI/1876', NULL, 'VINAY', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony saket', 'HARYANA', 'FARIDABAD', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978010.png', 'DPIZM00346', 'public/documents/_pan1552978010.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 0, '2019-03-19 07:00:00', NULL),
(19, '5', 'HAR/FARI/1392', NULL, 'VINAY', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony saket', 'HARYANA', 'FARIDABAD', 'Rented', 'Thaana Saaran', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978012.png', 'DPIZM00346', 'public/documents/_pan1552978012.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 0, '2019-03-19 07:00:00', NULL),
(20, '5', 'HAR/FARI/1866', NULL, 'RAJU', NULL, 'Mr. S.k. Jha', 'C-178, Dabua colony badarpur', 'HARYANA', 'FARIDABAD', 'Owned', 'badarpur', '9873396412', '06', 'Owned', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978183.png', 'DPIZM00346', 'public/documents/_pan1552978183.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 0, '2019-03-19 07:00:00', NULL),
(21, '5', 'NEW/NEW /1100', 'Rahul Yadav', 'RAMAN', NULL, 'Mr. Shyam sahu', 'C-178, Dabua colony saket', 'NEW DELHI', 'NEW DELHI', 'Owned', 'saket', '9873396412', '06', 'Owned', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978447.png', 'DPIZM00346', 'public/documents/_pan1552978447.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 5, '2019-03-19 07:00:00', NULL),
(22, '5', 'NEW/NEW /1579', 'Rahul Yadav', 'RAMAN', NULL, 'Mr. Shyam sahu', 'C-178, Dabua colony saket', 'NEW DELHI', 'NEW DELHI', 'Owned', 'saket', '9873396412', '06', 'Owned', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978858.png', 'DPIZM00346', 'public/documents/_pan1552978858.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 1, '2019-03-19 07:00:00', NULL),
(23, '5', 'DEL/DELH/1449', 'KRISHAN LAL', 'VISHAL', NULL, 'Mr. Shambhu', 'C-178, Dabua colony burari', 'DELHI', 'DELHI', 'Rented', 'burari', '9873396412', '06', 'Rented', 'C-260 Noida Sector 63', '8700853187', '102400003345', 'public/documents/_adhar1552978971.png', 'DPIZM00346', 'public/documents/_pan1552978971.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '1000000', '10000', '20', 6, '2019-03-19 07:00:00', NULL),
(24, '21', 'DEL/DELH/1998', 'KRISHAN LAL', 'RAJ MOHAN SHAH', NULL, 'BHIKHARI SHAH', 'D-86 SATAY ENCLAVE PREM NAGAR 3 KIRARI SULEMAN NAGAR DELHI-110086', 'DELHI', 'DELHI', 'Owned', 'NA', '8744995675', '5', 'Owned', 'RICKSHAW DRIVER', '9999999999', '870074653484', 'public/documents/_adhar1553241711.png', 'GFCPS6345B', 'public/documents/_pan1553241712.png', '5', 'NA', 'Salaried', 'Married', '3', '60000', '6000', '12', 5, '2019-03-22 07:00:00', NULL),
(25, '24', 'HAR/FARI/1331', NULL, 'SHYAM BIR', NULL, 'dayaram', 'house no.  971 peer colony koli mohalla village pali', 'HARYANA', 'FARIDABAD', 'Owned', 'Ballabgarh', '8750429226', '50', 'Owned', 'pali faridabad', '8750429226', '562116538032', 'public/documents/_adhar1553318517.png', 'Not Provided', 'public/documents/_pan1553318517.png', '50', 'Not Provided', 'Self Employed', 'Married', '7', '170000', '7915', '29', 0, '2019-03-23 07:00:00', NULL),
(26, '24', 'HAR/FARI/1781', NULL, 'NARENDER KUMAR', NULL, 'Balkishan', 'bata rode nit ram nagar faridabad', 'HARYANA', 'FARIDABAD', 'Owned', 'nit', '9053772908', '20', 'Owned', 'near railway fatak bhulwana hodal', '9518047891', '390819736581', 'public/documents/_adhar1553319144.png', 'fohpk3232n', 'public/documents/_pan1553319144.png', '50', 'Not Provided', 'Self Employed', 'Married', '5', '170000', '7915', '29', 0, '2019-03-23 07:00:00', NULL),
(27, '4', 'DEL/NEW /1466', 'Rahul Yadav', 'SHYAM BABOO', NULL, 'Mr. ram naresh', 'hno.629, hari nagar gaon, nd-44', 'DELHI', 'NEW DELHI', 'Rented', 'jaitpur', '8178232825', '06', 'Rented', 'shyam enterprises-  shop no.21, hnom36a, mithapur vill nd-44', 'Not Provided', '206493004332', 'public/documents/_adhar1553493029.png', 'bwhpb4941d', 'public/documents/_pan1553493029.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '500000', '3250', '20', 5, '2019-03-25 07:00:00', NULL),
(28, '4', 'DEL/NEW /1861', NULL, 'MD ISLAM', NULL, 'Mr. mohd ibrahim', 'Rz-48f, gali no.7, tughlkbad extn. nd-19', 'DELHI', 'NEW DELHU', 'Rented', 'Thaana govind puri', '9971873094', '06', 'Rented', 'Tile in trade pvt ltd -1d1, bharat ngr, new friends cly, nd-25', 'Not Provided', '523491178264', 'public/documents/_adhar1553493772.png', 'DPIZM00346', 'public/documents/_pan1553493772.png', '02', 'abs@gmail.com', 'Salaried', 'Married', '0', '25425', '2500', '12', 5, '2019-03-25 07:00:00', NULL),
(29, '24', 'HAR/FARI/1634', NULL, 'AMAR SINGH', NULL, 'mahender singh', 'house no.  170 samayapur road rajeev colony faridabad', 'HARYANA', 'FARIDABAD', 'Owned', 'Ballabgarh', '7292008123', '50', 'Owned', 'rajeev colony faridabad', '9540501262', '361307265788', 'public/documents/_adhar1553501761.png', 'Not Provided', 'public/documents/_pan1553501761.png', '50', 'Not Provided', 'Self Employed', 'Married', '5', '170', '7915', '29', 0, '2019-03-25 07:00:00', NULL),
(30, '24', 'HAR/FARI/1895', NULL, 'AMAR SINGH', NULL, 'mahender singh', 'house no.  170 samayapur road rajeev colony faridabad', 'HARYANA', 'FARIDABAD', 'Owned', 'Ballabgarh', '7292008123', '50', 'Owned', 'rajeev colony faridabad', '9540501262', '361307265788', 'public/documents/_adhar1553507427.png', 'Not Provided', 'public/documents/_pan1553507427.png', '50', 'Not Provided', 'Self Employed', 'Married', '5', '170', '7915', '29', 0, '2019-03-25 07:00:00', NULL),
(31, '24', 'HAR/FARI/1972', NULL, 'SHESH KUMAR TIWARI', NULL, 'yadu nath', 'house no. ne 1235 nangla enclave faridabad haryana 121005', 'HARYANA', 'FARIDABAD', 'Owned', 'Ballabgarh', '7982375708', '30', 'Owned', 'nangla enclave faridabad haryana', '7982375708', '393692375206', 'public/documents/_adhar1553507682.png', 'Not Provided', 'public/documents/_pan1553507682.png', '30', 'Not Provided', 'Self Employed', 'Married', '3', '170000', '7915', '29', 0, '2019-03-25 07:00:00', NULL),
(32, '24', 'HAR/FARI/1103', NULL, 'SABU', NULL, 'yaseen', 'neelam bata mor nit faridabad haryana 121001', 'HARYANA', 'FARIDABAD', 'Owned', 'nit', '9760191742', '30', 'Owned', 'h no.8092 nai basti islamabad palwal haryana 121102', '9582907156', '863543203636', 'public/documents/_adhar1553515069.png', 'hycps1527r', 'public/documents/_pan1553515069.png', '50', 'Not Provided', 'Self Employed', 'Married', '2', '170000', '7915', '29', 0, '2019-03-25 07:00:00', NULL),
(33, '24', 'HAR/FARI/1895', NULL, 'SANDEEP', NULL, 'kawar lal', 'konga mohalla pali faridabad haryana 121004', 'HARYANA', 'FARIDABAD', 'Owned', 'Ballabgarh', '9718864716', '50', 'Owned', 'Not Provided', '9718864716', '886869584054', 'public/documents/_adhar1553681728.png', 'enlps0221r', 'public/documents/_pan1553681728.png', '50', 'Not Provided', 'Self Employed', 'Married', '5', '170', '9460', '23', 0, '2019-03-27 07:00:00', NULL),
(34, '4', 'DEL/NEW /1629', 'Rahul Yadav', 'MD ISLAM', NULL, 'Mr. mohd ibrahim', 'rz-48f, gali no.7, tughlkbad extn kalka ji nd-19', 'DELHI', 'NEW DELHI', 'Rented', 'Thaana kalka ji', '9971873094', '06', 'Rented', 'Tile in trade pvt ltd- 1d1,bharat ngr, nfc nd-25', '9717945834', '523491178264', 'public/documents/_adhar1553757511.png', 'accpi4261k', 'public/documents/_pan1553757512.png', '02', 'abs@gmail.com', 'Salaried', 'Single', '0', '25425', '2500', '12', 5, '2019-03-28 07:00:00', NULL),
(35, '4', 'DEL/NEW /1689', 'Rahul Yadav', 'NASRUDDIN', NULL, 'Mr peeru', 'rz- 53/2, gali no.6, tughlkbad extn. nd-19', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana govind puri', '8750411772', '06', 'Owned', 'malik scrap matel- 1/18, dda flats, kalka ji nd-19', '9313626270', '327263761826', 'public/documents/_adhar1553758066.png', 'DPIZM00346', 'public/documents/_pan1553758066.png', '02', 'abs@gmail.com', 'Self Employed', 'Married', '3', '80000', '5200', '20', 5, '2019-03-28 07:00:00', NULL),
(36, '4', 'DEL/NEW /1260', 'Rahul Yadav', 'POONAM', NULL, 'sandeep', '143, aali village, sarita vihar nd-76,', 'DELHI', 'NEW DELHI', 'Rented', 'aali', '9319063645', '06', 'Rented', 'iccs pvt ltd- 1/06, mohan estate, badarpur nd-44', '9315173116', '690938622570', 'public/documents/_adhar1553759162.png', 'eujpp8904h', 'public/documents/_pan1553759162.png', '02', 'abs@gmail.com', 'Salaried', 'Married', '0', '52000', '3380', '20', 5, '2019-03-28 07:00:00', NULL),
(37, '4', 'DEL/NEW /1805', 'Rahul Yadav', 'HEENA', NULL, 'Mr. sharukh khan', 'hno. A-328/3, sangam vihar, nd-62', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana sangam vihar', '9213437625', '06', 'Owned', 'Not Provided', '8700853187', '899386885543', 'public/documents/_adhar1554098398.png', 'DPIZM00346', 'public/documents/_pan1554098398.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '49000', '3185', '20', 5, '2019-04-01 07:00:00', NULL),
(38, '4', 'DEL/NEW /1692', 'Rahul Yadav', 'RAMJEEVAN', NULL, 'Mr. kanhiya lal', 'hno. 34/2, old no. 176,  gali no.2, meethapur ext, badarpur,nd-44', 'DELHI', 'NEW DELHI', 'Co. Provided', 'Thaana  meethpur', '7290971735', '06', 'Co. Provided', 'sol infotech pvt ltd - The peach tree complex 3rd floor, sec-43, haryana ,fbd, hr -121001', '9582911017', '288551999610', 'public/documents/_adhar1554099321.png', 'dhlpr3224q', 'public/documents/_pan1554099321.png', '01', 'abs@gmail.com', 'Salaried', 'Single', '0', '54500', '3084', '24', 5, '2019-04-01 07:00:00', NULL),
(39, '4', 'DEL/NEW /1009', 'Rahul Yadav', 'ARUN KUMAR', NULL, 'Mr. rajender singh', 'hno.962, gali no.21, block -i, hari nager extn badarpur, nd-44', 'DELHI', 'NEW DELHI', 'Rented', 'Thaan badarpur', '9910874226', '06', 'Rented', 'pracheen sai pest control- t-41, sarai kale khan , nr .mcd hazarat nizamuddin nd-13', '9555403778', '817026779055', 'public/documents/_adhar1554099893.png', 'bhxpk6352g', 'public/documents/_pan1554099893.png', '03', 'abs@gmail.com', 'Self Employed', 'Married', '0', '42800', '2763', '20', 5, '2019-04-01 07:00:00', NULL),
(40, '4', 'DEL/NEW /1360', 'Rahul Yadav', 'ARUN KUMAR', NULL, 'Mr. rajbir singh', 'N-35/1, amar market saurabh vihar, badarpur, jaotpur, nd-44', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana jaitpur', '9990907487', '06', 'Owned', 'divine export pvt ltd - b-40, sec -63, noida up-201301', '7827667400', '285506307480', 'public/documents/_adhar1554100284.png', 'Not Provided', 'public/documents/_pan1554100284.png', '02', 'abs@gmail.com', 'Salaried', 'Married', '0', '46500', '3023', '20', 6, '2019-04-01 07:00:00', NULL),
(41, '4', 'DEL/NEW /1071', 'Rahul Yadav', 'ARUN KUMAR', NULL, 'Mr. rajbir singh', 'N-35/1, amar market saurabh vihar, badarpur, jaotpur, nd-44', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana jaitpur', '9990907487', '06', 'Owned', 'divine export pvt ltd - b-40, sec -63, noida up-201301', '7827667400', '285506307480', 'public/documents/_adhar1554100301.png', 'Not Provided', 'public/documents/_pan1554100301.png', '02', 'abs@gmail.com', 'Salaried', 'Married', '0', '46500', '3023', '20', 6, '2019-04-01 07:00:00', NULL),
(42, '4', 'HAR/FARI/1142', NULL, 'SADDAM', NULL, 'Mr mohd udus alam', 'hno.5, gali no.4, basantpur fbd haryana-121003', 'HARYANA', 'FARIDABAD', 'Owned', 'Thaana basantpur', '7022262370', '06', 'Owned', 'C-260 Noida Sector 63', '8700853187', '534992542374', 'public/documents/_adhar1554100903.png', 'frjps0450p', 'public/documents/_pan1554100903.png', '02', 'abs@gmail.com', 'Self Employed', 'Single', '0', '40680', '4000', '12', 0, '2019-04-01 07:00:00', NULL),
(43, '4', 'DEL/NEW /1045', 'Rahul Yadav', 'JAY PRAKASH THAKUR', NULL, 'Mr. dukhi ram', 'm-19, top floor, private colony, sriniwaspuri new delhi-110065', 'DELHI', 'NEW DELHI', 'Rented', 'Thaana  sriniwaspuri', '95999651270', '06', 'Rented', 'safe shop online markting pvt ltd- a-3/24, janak puri new delhi-110058', '9717914086', '795085865760', 'public/documents/_adhar1554365700.png', 'Not Provided', 'public/documents/_pan1554365700.png', '02', 'abs@gmail.com', 'Self Employed', 'Married', '0', '59500', '3099', '24', 5, '2019-04-04 07:00:00', NULL),
(44, '4', 'DEL/NEW /1401', 'Rahul Yadav', 'MANJAY KUMAR', NULL, 'Mr maithuri lal', 'j-72, prem nagar, lal kuan, new delhi', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana lal kuan', '7835932524', '06', 'Owned', 'manjay tampo services- old post ofs okhla ph-1, new delhi-20', '9510731226', '555553418197', 'public/documents/_adhar1554370014.png', 'bdkpk1579g', 'public/documents/_pan1554370014.png', '02', 'abs@gmail.com', 'Self Employed', 'Married', '0', '47000', '3838', '12', 1, '2019-04-04 07:00:00', NULL),
(45, '21', 'DEL/DELH/1402', 'KRISHAN LAL', 'SANJAY KUMAR ISHWAR', NULL, 'GYANDEV ISHWAR', 'WZ-542 1ST FLOOR SRI NAGAR GALI NO 1 SHAKURBASTI DELHI 110034', 'DELHI', 'DELHI', 'Rented', 'NA', '9873973765', '3', 'Rented', 'RICKSHAW DRIVER', '99999999', '322617723238', 'public/documents/_adhar1554727666.png', 'Not Provided', 'public/documents/_pan1554727666.png', '3', 'NA', 'Self Employed', 'Married', '4', '70000', '7000', '12', 5, '2019-04-08 07:00:00', NULL),
(46, '4', 'DEL/NEW /1703', 'Rahul Yadav', 'RAJ KUMAR', NULL, 'Mr. Rishi pal', 'c-347, nehru camp, govind puri kalka ji nd-19', 'DELHI', 'NEW DELHI', 'Owned', 'Thaana govind puri', '9958535842', '06', 'Owned', 'Alama enterprises- B-204, okhla ph-1, nd-20', 'Not Provided', '783805573192', 'public/documents/_adhar1554969050.png', 'fhhpk6427a', 'public/documents/_pan1554969050.png', '02', 'abs@gmail.com', 'Salaried', 'Married', '0', '42700', '2282', '26', 1, '2019-04-11 07:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `financial_buddy_logins`
--

CREATE TABLE `financial_buddy_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac_id` varchar(151) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_buddy_logins`
--

INSERT INTO `financial_buddy_logins` (`id`, `value`, `mac_id`, `created_at`, `updated_at`) VALUES
(7, NULL, '6e310991503053cf', NULL, NULL),
(14, NULL, '128e1f3b6232f449', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guarantors_and_coborrower`
--

CREATE TABLE `guarantors_and_coborrower` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` text COLLATE utf8mb4_unicode_ci,
  `father_or_husband_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_address` text COLLATE utf8mb4_unicode_ci,
  `land_mark` text COLLATE utf8mb4_unicode_ci,
  `police_station` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` bigint(11) DEFAULT NULL,
  `years_of_res_address` mediumint(9) DEFAULT NULL,
  `residance_type` text COLLATE utf8mb4_unicode_ci,
  `office_address` text COLLATE utf8mb4_unicode_ci,
  `ofc_phone_number` bigint(11) DEFAULT NULL,
  `years_of_ofc_address` mediumint(9) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_dependants` mediumint(9) DEFAULT NULL,
  `loan_amount` int(11) DEFAULT NULL,
  `EMI` int(11) DEFAULT NULL,
  `Period` mediumint(9) DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_phone_number` bigint(11) DEFAULT NULL,
  `reference_address` text COLLATE utf8mb4_unicode_ci,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=coborrower,2=guarantors',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guarantors_and_coborrower`
--

INSERT INTO `guarantors_and_coborrower` (`id`, `agent_id`, `customer_id`, `name`, `date_of_birth`, `father_or_husband_name`, `residential_address`, `land_mark`, `police_station`, `phone_number`, `years_of_res_address`, `residance_type`, `office_address`, `ofc_phone_number`, `years_of_ofc_address`, `email`, `profile`, `marital_status`, `no_of_dependants`, `loan_amount`, `EMI`, `Period`, `reference`, `reference_phone_number`, `reference_address`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'BHIM SINGH', '1975-1-1', 'Mr. kailash prasad saha', '303-a, ashoka bindusar camp , sriniwaspur nr ram mandir', 'Near ram mandir', 'sriniwaspuri', NULL, 10, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 4, 50500, 3283, 20, NULL, NULL, NULL, '1', '2019-03-03 07:00:00', NULL),
(2, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-03 07:00:00', NULL),
(3, 4, 2, 'SURENDER RAM BHARTI', '1958-1-1', 'Mdukh raj', 'b-375, sanjay colony, okhla ph-2nd-20', 'Near Shukl', 'ravidas mandir', NULL, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 4, 83900, 5674, 19, NULL, NULL, NULL, '1', '2019-03-03 07:00:00', NULL),
(4, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-03 07:00:00', NULL),
(5, 20, 3, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-04 07:00:00', NULL),
(6, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-04 07:00:00', NULL),
(7, 4, 4, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-05 07:00:00', NULL),
(8, 4, 4, 'JITENDER NARWAL', '1964-11-27', 'madan lal', 'd-245, a, saurabh vihar, badarpur new delhi-44', 'Near Shiv mandir', 'Thana jaitpur', 9354436614, 6, 'Not Provided', 'jitender garments-d-241, saurabh vihar, jaitpur nd-44', 9354436614, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 4, 55000, 3575, 20, NULL, NULL, NULL, '2', '2019-03-05 07:00:00', NULL),
(9, 4, 5, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-05 07:00:00', NULL),
(10, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-05 07:00:00', NULL),
(11, 4, 6, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-07 07:00:00', NULL),
(12, 4, 6, 'JOHIT SINGH', '1996-2-8', 'manjeet singh', '1434/g/13, govind puri kalka ji nd-19', 'Near Shukla aata chakki', 'kalka ji', NULL, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 33500, 2177, 20, NULL, NULL, NULL, '2', '2019-03-07 07:00:00', NULL),
(13, 4, 7, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-11 07:00:00', NULL),
(14, 4, 7, 'JOHIT SINGH', '1996-2-8', 'manjeet singh', '1434, gali no.13, govind puri kalka ji nd-19', 'Near Shukla aata chakki', 'govind luri', NULL, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Salaried', 'Single', 2, 33500, 2177, 20, NULL, NULL, NULL, '2', '2019-03-11 07:00:00', NULL),
(15, 5, 8, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-12 07:00:00', NULL),
(16, 5, 8, 'Vikash PANDIT', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, sangam vihar', 'Near Shukla aata chakki', 'Thana Sangam vihar', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-12 07:00:00', NULL),
(17, 21, 9, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-16 07:00:00', NULL),
(18, 21, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-16 07:00:00', NULL),
(19, 4, 10, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-16 07:00:00', NULL),
(20, 4, 10, 'RAM SAGAR SUKHLA', '1959-11-5', 'Mr. ram samuja shukla', 'hno.150, churriya mohalla, tehkhand nd-20', 'Near durga mata mandir', 'okhla', 8130340167, 10, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 38500, 2182, 24, NULL, NULL, NULL, '2', '2019-03-16 07:00:00', NULL),
(21, 4, 11, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-16 07:00:00', NULL),
(22, 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-16 07:00:00', NULL),
(23, 5, 12, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-18 07:00:00', NULL),
(24, 5, 12, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-18 07:00:00', NULL),
(25, 5, 13, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-18 07:00:00', NULL),
(26, 5, 13, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-18 07:00:00', NULL),
(27, 21, 14, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Not Provided', NULL, NULL, NULL, NULL, 'Self Employed', 'Single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(28, 21, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(29, 5, 15, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(30, 5, 15, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(31, 5, 16, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(32, 5, 16, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(33, 5, 17, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(34, 5, 17, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(35, 5, 18, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(36, 5, 18, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(37, 5, 19, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(38, 5, 19, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(39, 5, 20, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(40, 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(41, 5, 21, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(42, 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(43, 5, 22, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(44, 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(45, 5, 23, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-19 07:00:00', NULL),
(46, 5, 23, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-19 07:00:00', NULL),
(47, 21, 24, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-22 07:00:00', NULL),
(48, 21, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-22 07:00:00', NULL),
(49, 24, 25, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-23 07:00:00', NULL),
(50, 24, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-23 07:00:00', NULL),
(51, 24, 26, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-23 07:00:00', NULL),
(52, 24, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-23 07:00:00', NULL),
(53, 4, 27, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-25 07:00:00', NULL),
(54, 4, 27, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-25 07:00:00', NULL),
(55, 4, 28, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-25 07:00:00', NULL),
(56, 4, 28, 'SATENDER KUMAR', '1990-2-5', 'Mr. rameshwar prasad', 'rz- 49k , gali no.7, tughlkbad extn, nd-19', 'Near', 'Thanagovind puri', 8826539635, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Salaried', 'Married', 2, 25425, 2500, 12, NULL, NULL, NULL, '2', '2019-03-25 07:00:00', NULL),
(57, 24, 29, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-25 07:00:00', NULL),
(58, 24, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-25 07:00:00', NULL),
(59, 24, 30, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-25 07:00:00', NULL),
(60, 24, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-25 07:00:00', NULL),
(61, 24, 31, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-25 07:00:00', NULL),
(62, 24, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-25 07:00:00', NULL),
(63, 24, 32, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-25 07:00:00', NULL),
(64, 24, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-25 07:00:00', NULL),
(65, 24, 33, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-03-27 07:00:00', NULL),
(66, 24, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-27 07:00:00', NULL),
(67, 4, 34, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-28 07:00:00', NULL),
(68, 4, 34, 'SATENDER KUMAR', '1990-2-5', 'Mr rameshwar prasad', 'rz-49k, gali no.7, tughlkbad extn, nd-19', NULL, 'tughlkbad', 8826539635, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Salaried', 'Married', 2, 25425, 2500, 12, NULL, NULL, NULL, '2', '2019-03-28 07:00:00', NULL),
(69, 4, 35, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-03-28 07:00:00', NULL),
(70, 4, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-03-28 07:00:00', NULL),
(71, 4, 36, 'SANDIP', '1992-12-15', 'rajveer singh', 'hno.143, ali village, sarita vihar , new delhi', 'Near Shukla aata chakki', 'Thana aali vihar', 9315173116, 6, 'Not Provided', 'impetus pvt ltd- k-block top floor, nsei noida up', 9315173116, 2, 'Shashi.sric@yahoo.in', 'Salaried', 'Married', 2, 52000, 5200, 20, NULL, NULL, NULL, '1', '2019-03-28 07:00:00', NULL),
(72, 4, 36, NULL, '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '2', '2019-03-28 07:00:00', NULL),
(73, 4, 37, 'SHARUKH KHAN', '1992-7-25', 'Mr.suleman khan', 'A-328/3, sangam vihar new delhi-62', 'Near Shukla aata chakki', 'Thana sangam', 8447267941, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 2, 49000, 3185, 20, NULL, NULL, NULL, '1', '2019-04-01 07:00:00', NULL),
(74, 4, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-01 07:00:00', NULL),
(75, 4, 38, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 54500, 3084, 20, NULL, NULL, NULL, '1', '2019-04-01 07:00:00', NULL),
(76, 4, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-01 07:00:00', NULL),
(77, 4, 39, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-04-01 07:00:00', NULL),
(78, 4, 39, 'RAMNANDAN SHARMA', '1978-2-20', 'Mr, jago sharma', 'i-803, gali no.14, hari nager extn , jaitpur new delhi-44', 'Near Shukla a', 'Thana badarpur', 9911341773, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 2, 42500, 2763, 20, NULL, NULL, NULL, '2', '2019-04-01 07:00:00', NULL),
(79, 4, 40, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', NULL, 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 46500, 3023, 20, NULL, NULL, NULL, '1', '2019-04-01 07:00:00', NULL),
(80, 4, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-01 07:00:00', NULL),
(81, 4, 41, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', NULL, 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 46500, 3023, 20, NULL, NULL, NULL, '1', '2019-04-01 07:00:00', NULL),
(82, 4, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-01 07:00:00', NULL),
(83, 4, 42, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-04-01 07:00:00', NULL),
(84, 4, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-01 07:00:00', NULL),
(85, 4, 43, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-04-04 07:00:00', NULL),
(86, 4, 43, 'RAVI KANT PANDEY', '1977-10-2', 'Mr. uma kant pandey', 'd-267,/a chungi no.3, lal kuan nd-44', 'Near', 'Thana', 9971461661, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 2, 59500, 3099, 24, NULL, NULL, NULL, '2', '2019-04-04 07:00:00', NULL),
(87, 4, 44, 'SANJAY KUMAR YADAV', '1984-1-26', 'Mr. ram varan yadav', 'c-22d, chuungi no.3, lal kuan, pulpehladpur new delhi-44', 'Near Shukla aata chakki', 'Thana lal kuan', 7803109081, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Married', 2, 47000, 3838, 15, NULL, NULL, NULL, '1', '2019-04-04 07:00:00', NULL),
(88, 4, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-04 07:00:00', NULL),
(89, 21, 45, NULL, '09-10-1995', NULL, NULL, NULL, NULL, NULL, NULL, 'Residence', NULL, NULL, NULL, NULL, 'Not Provided', 'Not Provided', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-04-08 07:00:00', NULL),
(90, 21, 45, 'CHANDAN KUMAR', '1991-1-16', 'RAM VILASH CHAUDHARY', '111 POCKET 1 SEC 20 ROHINI', 'Na', 'NA', 9540223388, 5, 'Not Provided', 'NA', 99999999, 3, 'NA', 'Salaried', 'Single', 3, 70000, 7000, 12, NULL, NULL, NULL, '2', '2019-04-08 07:00:00', NULL),
(91, 4, 46, 'Vikash Parashar', '09-10-1995', 'Mr. S.K.Jha', 'C-178, Dabua colony, Faridabad', 'Near Shukla aata chakki', 'Thana Saaran', 9873396412, 6, 'Not Provided', 'C-178, Dabua colony, Faridabad', 9873396412, 2, 'Shashi.sric@yahoo.in', 'Self Employed', 'Single', 2, 1000000, 5000, 20, NULL, NULL, NULL, '1', '2019-04-11 07:00:00', NULL),
(92, 4, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2019-04-11 07:00:00', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2018_12_24_055727_tbl_agent', 2),
(9, '2018_12_24_100323_create_products_table', 3),
(14, '2018_12_24_110819_create_customers_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
(1, NULL, 'Laravel Personal Access Client', 'FkZu7FK31rXc4Ho1xqrcp8d9DiPzbz2S7T2a3zAx', 'http://localhost', 1, 0, 0, '2018-12-23 02:25:00', '2018-12-23 02:25:00'),
(2, NULL, 'Laravel Password Grant Client', 'Yw4xxUwqiaqFmsaWvaphJ6x7nywFyjfxH7HDeIJM', 'http://localhost', 0, 1, 0, '2018-12-23 02:25:00', '2018-12-23 02:25:00');

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
(1, 1, '2018-12-23 02:25:00', '2018-12-23 02:25:00');

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
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('architattrey@gmail.com', 'vqa5CpjMFm8xj3QAFWtfznPo5O6wOU9cxjVC', NULL),
('architattrey@gmail.com', '8PBSH79rXZa8eeXDQb3EgRSUsZ5nx2jGqIT0', NULL),
('architattrey@gmail.com', 'IHJI6iZJPp8G1nncgfx2ed10x4yLYe5CmlTF', NULL),
('architattrey@gmail.com', 'OCESh1Rq8S0HQXJEphtbIVRxKRQYec7c7Aow', NULL),
('architattrey@gmail.com', 'LcNmL06oemhLAWCfCIJW8b7X5x7LuWbavftI', NULL),
('architattrey@gmail.com', 'GEavbURwlh5fUVxPROlMS8XJpI6YBpOs8ypW', NULL),
('architattrey@gmail.com', 'sZaDOl9c7vjdLwzIgIrrfkLqi6OCYlY69b31', NULL),
('architattrey@gmail.com', 'HsJjIjD30qCB6EFEAqFlf8HOhCL6kYQ9JXWp', NULL),
('architattrey@gmail.com', 'toEecTB313MRIph0LpJDhEVdEujUHCHvILaO', NULL),
('architattrey@gmail.com', 'XFbBjOvZBqwGdbTwT1GPWX557er8GCLvdrdD', NULL),
('architattrey@gmail.com', 'c4jegt3ZBraBSeVXb7Sfa9SK1LHT1X4F7uxA', NULL),
('architattrey@gmail.com', '27xHZPQuy9aKoVygioXEWr65BcXkjAqfg0SU', NULL),
('architattrey@gmail.com', 'X0kil0WzRFs8MlWNESxdBTECdEGegCbWKZhw', NULL),
('architattrey@gmail.com', 'EC1ptsjC20mxHAWEkMONtsqbBoN0j5N9aZAm', NULL),
('architattrey@gmail.com', 'SZBO19JAb8Hx2jUIJSxDE9Ks2n11b3Krp68w', NULL),
('architattrey@gmail.com', '8A5ANYqbsrdn2cBNPbEVn7TNZfgB9VmPcsl8', NULL),
('architattrey@gmail.com', 'hRjiR1wF1izmrKcAXKuAQ2as5mnMtpKJLjJ8', NULL),
('architattrey@gmail.com', 'LDJJm0lQt0Dzjt0pBQKKDiMaOlmLiWDidfsu', NULL),
('architattrey@gmail.com', 'P6jYxSLCdYVerD5fPHMPxpQgDa9y3cU9Ksvp', NULL),
('architattrey@gmail.com', '3QhMklLyPLbyIlrWAa1xq5STnWrm3OfUPNhD', NULL),
('architattrey@gmail.com', 'yjse7gIY47yuswUeTznbTCHOdy7hI2B5OX64', NULL),
('bsslarchitattrey@gmail.com', 'V5IRjdNDamhtpXqfB2Qp8F97mqexTP5fwlS9', NULL),
('bsslarchitattrey@gmail.com', '3Y6KbtHCPpft30TfDRCdm9PkYfOHgK5jvWYR', NULL),
('bsslarchitattrey@gmail.com', 'AU3jQbQFQ89uzekifg2rdsS4qFeLEJ7ileUL', NULL),
('bsslarchitattrey@gmail.com', 'EOUBb', NULL),
('bsslarchitattrey@gmail.com', 'mD85d', NULL),
('bsslarchitattrey@gmail.com', 'mrSIh', NULL),
('bsslarchitattrey@gmail.com', 'Rln43', NULL),
('bsslarchitattrey@gmail.com', 'fXKmH', NULL),
('bsslaarchit@gmail.com', 'IuZ0n', NULL),
('bsslaarchit@gmail.com', 'VEmKn', NULL),
('bsslaarchit@gmail.com', 'pvydu', NULL),
('bsslaarchit@gmail.com', 'Vo4Km', NULL),
('bsslaarchit@gmail.com', 'TUOv7', NULL),
('bsslaarchit@gmail.com', 'phuHs', NULL),
('bsslaarchit@gmail.com', '8qSUp', NULL),
('bsslaarchit@gmail.com', 'kMjZo', NULL),
('bsslaarchit@gmail.com', 'sjMdI', NULL),
('bsslaarchit@gmail.com', 'Ym1JQ', NULL),
('bsslaarchit@gmail.com', 'R5gri', NULL),
('bsslaarchit@gmail.com', 'NekBq', NULL),
('bsslaarchit@gmail.com', 'g8L9x', NULL),
('bsslaarchit@gmail.com', 'gNO8Q', NULL),
('bsslaarchit@gmail.com', '7rDp4', NULL),
('bsslaarchit@gmail.com', 'rxY6v', NULL),
('bsslaarchit@gmail.com', '04BAg', NULL),
('bsslaarchit@gmail.com', '9C5Wh', NULL),
('bsslaarchit@gmail.com', 'PUh5K', NULL),
('bsslaarchit@gmail.com', 'kq8su', NULL),
('bsslaarchit@gmail.com', 'DsBx3', NULL),
('bsslaarchit@gmail.com', 'Ox1Uc', NULL),
('bsslaarchit@gmail.com', '4YWGo', NULL),
('bsslaarchit@gmail.com', 'c2e3q', NULL),
('bsslaarchit@gmail.com', '2J0MY', NULL),
('bsslaarchit@gmail.com', 'I2har', NULL),
('bsslaarchit@gmail.com', 'kEPAs', NULL),
('bsslaarchit@gmail.com', 'x56rz', NULL),
('bsslaarchit@gmail.com', 'CmTsi', NULL),
('bsslaanir@gmail.com', 'OMfH0', NULL),
('bsslaanir@gmail.com', '10Lxn', NULL),
('bsslaanir@gmail.com', 'JAwBj', NULL),
('bsslaanir@gmail.com', 'c3TRD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_type`, `created_at`, `updated_at`) VALUES
(1, 'Two Wheeler Loans', NULL, NULL),
(2, 'Three Wheeler Loans', NULL, NULL),
(3, 'Personal Loans', NULL, NULL),
(4, 'Business Loans', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `references`
--

CREATE TABLE `references` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(151) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `son_of` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `references`
--

INSERT INTO `references` (`id`, `agent_id`, `name`, `customer_id`, `son_of`, `address`, `phone_number`, `created_at`, `updated_at`) VALUES
(117, '4', 'monu', '1', 'Not Provided', 'Not Provided', '8178657284', '2019-03-03 07:00:00', NULL),
(118, '4', 'monu', '1', 'Not Provided', 'Not Provided', '8178657284', '2019-03-03 07:00:00', NULL),
(119, '4', 'anand', '2', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9911670988', '2019-03-03 07:00:00', NULL),
(120, '4', 'anand', '2', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9911670988', '2019-03-03 07:00:00', NULL),
(121, '20', 'Vikash Parashar', '3', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-04 07:00:00', NULL),
(122, '20', 'Vikash Parashar', '3', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-04 07:00:00', NULL),
(123, '4', 'pushpender', '4', 'Mr.', 'Not Provided', '9210287451', '2019-03-05 07:00:00', NULL),
(124, '4', 'pushpender', '4', 'Mr.', 'Not Provided', '9210287451', '2019-03-05 07:00:00', NULL),
(125, '4', 'yigesh', '5', 'Mr', 'Not Provided', '9315270436', '2019-03-05 07:00:00', NULL),
(126, '4', 'yigesh', '5', 'Mr', 'Not Provided', '9315270436', '2019-03-05 07:00:00', NULL),
(127, '4', 'basahant singh', '6', 'Mr.', 'Not Provided', '9911198292', '2019-03-07 07:00:00', NULL),
(128, '4', 'basahant singh', '6', 'Mr.', 'Not Provided', '9911198292', '2019-03-07 07:00:00', NULL),
(129, '4', 'basahant', '7', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9911198292', '2019-03-11 07:00:00', NULL),
(130, '4', 'basahant', '7', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9911198292', '2019-03-11 07:00:00', NULL),
(131, '5', 'Vikash Parashar', '8', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-12 07:00:00', NULL),
(132, '5', 'Vikash Parashar', '8', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-12 07:00:00', NULL),
(133, '21', 'MISHRA JI', '9', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-16 07:00:00', NULL),
(134, '21', 'MISHRA JI', '9', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-16 07:00:00', NULL),
(135, '4', 'uma shanker', '10', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873347074', '2019-03-16 07:00:00', NULL),
(136, '4', 'uma shanker', '10', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873347074', '2019-03-16 07:00:00', NULL),
(137, '4', 'soniya', '11', 'Mr.', 'Not Provided', '9910848851', '2019-03-16 07:00:00', NULL),
(138, '4', 'soniya', '11', 'Mr.', 'Not Provided', '9910848851', '2019-03-16 07:00:00', NULL),
(139, '5', 'Vikash Parashar', '12', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-18 07:00:00', NULL),
(140, '5', 'Vikash Parashar', '12', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-18 07:00:00', NULL),
(141, '5', 'Vikash Parashar', '13', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-18 07:00:00', NULL),
(142, '5', 'Vikash Parashar', '13', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-18 07:00:00', NULL),
(143, '21', 'Not Provided', '14', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-19 07:00:00', NULL),
(144, '21', 'Not Provided', '14', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-19 07:00:00', NULL),
(145, '5', 'Vikash Parashar', '15', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(146, '5', 'Vikash Parashar', '15', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(147, '5', 'Vikash Parashar', '16', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(148, '5', 'Vikash Parashar', '16', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(149, '5', 'Vikash Parashar', '17', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(150, '5', 'Vikash Parashar', '17', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(151, '5', 'Vikash Parashar', '18', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(152, '5', 'Vikash Parashar', '18', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(153, '5', 'Vikash Parashar', '19', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(154, '5', 'Vikash Parashar', '19', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(155, '5', 'Vikash Parashar', '20', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(156, '5', 'Vikash Parashar', '20', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(157, '5', 'Vikash Parashar', '21', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(158, '5', 'Vikash Parashar', '21', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(159, '5', 'Vikash Parashar', '22', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(160, '5', 'Vikash Parashar', '22', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(161, '5', 'Vikash Parashar', '23', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(162, '5', 'Vikash Parashar', '23', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873396412', '2019-03-19 07:00:00', NULL),
(163, '21', 'Not Provided', '24', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-22 07:00:00', NULL),
(164, '21', 'Not Provided', '24', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-22 07:00:00', NULL),
(165, '24', 'Not Provided', '25', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-23 07:00:00', NULL),
(166, '24', 'Not Provided', '25', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-23 07:00:00', NULL),
(167, '24', 'Not Provided', '26', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-23 07:00:00', NULL),
(168, '24', 'Not Provided', '26', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-23 07:00:00', NULL),
(169, '4', 'kuldeep', '27', 'Mr.', 'Not Provided', '9717825201', '2019-03-25 07:00:00', NULL),
(170, '4', 'kuldeep', '27', 'Mr.', 'Not Provided', '9717825201', '2019-03-25 07:00:00', NULL),
(171, '4', 'nandan', '28', 'Mr.', 'Not Provided', '9953885444', '2019-03-25 07:00:00', NULL),
(172, '4', 'nandan', '28', 'Mr.', 'Not Provided', '9953885444', '2019-03-25 07:00:00', NULL),
(173, '24', 'Not Provided', '29', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(174, '24', 'Not Provided', '29', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(175, '24', 'Not Provided', '30', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(176, '24', 'Not Provided', '30', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(177, '24', 'Not Provided', '31', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(178, '24', 'Not Provided', '31', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(179, '24', 'Not Provided', '32', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(180, '24', 'Not Provided', '32', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-25 07:00:00', NULL),
(181, '24', 'Not Provided', '33', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-27 07:00:00', NULL),
(182, '24', 'Not Provided', '33', 'Not Provided', 'Not Provided', 'Not Provided', '2019-03-27 07:00:00', NULL),
(183, '4', 'nandan', '34', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9953885444', '2019-03-28 07:00:00', NULL),
(184, '4', 'nandan', '34', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9953885444', '2019-03-28 07:00:00', NULL),
(185, '4', 'nazim', '35', 'Mr.', 'Not Provided', '8826185342', '2019-03-28 07:00:00', NULL),
(186, '4', 'nazim', '35', 'Mr.', 'Not Provided', '8826185342', '2019-03-28 07:00:00', NULL),
(187, '4', 'prashant', '36', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9645932393', '2019-03-28 07:00:00', NULL),
(188, '4', 'prashant', '36', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9645932393', '2019-03-28 07:00:00', NULL),
(189, '4', 'nisha', '37', 'Mr.', 'C-178, Dabua colony N.I.T Faridabad', '8810271779', '2019-04-01 07:00:00', NULL),
(190, '4', 'nisha', '37', 'Mr.', 'C-178, Dabua colony N.I.T Faridabad', '8810271779', '2019-04-01 07:00:00', NULL),
(191, '4', 'kamlesh', '38', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '7550620822', '2019-04-01 07:00:00', NULL),
(192, '4', 'kamlesh', '38', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '7550620822', '2019-04-01 07:00:00', NULL),
(193, '4', 'jagan nath', '39', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '8920126708', '2019-04-01 07:00:00', NULL),
(194, '4', 'jagan nath', '39', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '8920126708', '2019-04-01 07:00:00', NULL),
(195, '4', 'deepak', '40', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9555930034', '2019-04-01 07:00:00', NULL),
(196, '4', 'deepak', '40', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9555930034', '2019-04-01 07:00:00', NULL),
(197, '4', 'deepak', '41', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9555930034', '2019-04-01 07:00:00', NULL),
(198, '4', 'deepak', '41', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9555930034', '2019-04-01 07:00:00', NULL),
(199, '4', 'shitu', '42', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '8368774387', '2019-04-01 07:00:00', NULL),
(200, '4', 'shitu', '42', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '8368774387', '2019-04-01 07:00:00', NULL),
(201, '4', 'shyam', '43', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', 'Not Provided', '2019-04-04 07:00:00', NULL),
(202, '4', 'shyam', '43', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', 'Not Provided', '2019-04-04 07:00:00', NULL),
(203, '4', 'kashi yadav', '44', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873266717', '2019-04-04 07:00:00', NULL),
(204, '4', 'kashi yadav', '44', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9873266717', '2019-04-04 07:00:00', NULL),
(205, '21', 'Not Provided', '45', 'Not Provided', 'Not Provided', 'Not Provided', '2019-04-08 07:00:00', NULL),
(206, '21', 'Not Provided', '45', 'Not Provided', 'Not Provided', 'Not Provided', '2019-04-08 07:00:00', NULL),
(207, '4', 'sanjay', '46', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9315202366', '2019-04-11 07:00:00', NULL),
(208, '4', 'sanjay', '46', 'Mr. S.k. jha', 'C-178, Dabua colony N.I.T Faridabad', '9315202366', '2019-04-11 07:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agent`
--

CREATE TABLE `tbl_agent` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` char(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '3=field boy,2=agent',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` char(251) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` char(251) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `education` text COLLATE utf8mb4_unicode_ci,
  `user_image` text COLLATE utf8mb4_unicode_ci,
  `phone_number` bigint(11) DEFAULT NULL,
  `delete_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=yes,1=no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_agent`
--

INSERT INTO `tbl_agent` (`id`, `user_id`, `user_type`, `first_name`, `last_name`, `gender`, `state`, `city`, `address`, `marital_status`, `date_of_birth`, `education`, `user_image`, `phone_number`, `delete_status`, `created_at`, `updated_at`) VALUES
(4, 19, '2', 'Amit Singh', NULL, 'Male', 'Delhi', 'NEW DELHI', NULL, 'Single', '1989-11-19 00:00:00', 'Graduate', 'public/user_images/_user1549534011.png', 9718091837, '1', '2019-02-06 07:00:00', '2019-03-06 07:00:00'),
(5, 20, '2', 'Sanjay Tiwari', NULL, 'Male', 'Delhi', 'NEW DELHI', NULL, 'Single', '1990-11-14 00:00:00', 'Graduate', 'public/user_images/_user1551244249.png', 9540107749, '1', '2019-02-06 07:00:00', '2019-02-27 07:00:00'),
(6, 21, '3', 'Parmesh Kumar', NULL, 'Male', 'Delhi', 'NEW DELHI', NULL, 'Married', '1981-09-06 00:00:00', 'Graduate', 'public/user_images/_user1551244167.png', 9810741588, '1', '2019-02-06 07:00:00', '2019-03-02 07:00:00'),
(7, 22, '3', 'Nirmal Nagar', NULL, 'Male', 'Delhi', 'NEW DELHI', NULL, 'Married', '1988-07-25 00:00:00', 'Graduate', 'public/user_images/_user1551245192.png', 7835912758, '1', '2019-02-09 07:00:00', '2019-02-27 07:00:00'),
(8, 23, '3', 'Rahul Yadav', NULL, 'Male', 'Delhi', 'NEW DELHI', NULL, 'Single', '1993-12-30 00:00:00', 'Graduate', 'public/user_images/_user1551245774.png', 9599981423, '1', '2019-02-09 07:00:00', '2019-03-12 07:00:00'),
(9, 24, '2', 'Shankar Bagoli', NULL, 'Male', 'Delhi', 'NEW DELHI', NULL, 'Married', '1984-06-15 00:00:00', 'Graduate', 'public/user_images/_user1551158792.png', 9599012600, '1', '2019-02-09 07:00:00', '2019-02-26 07:00:00'),
(12, 28, '2', 'ADVOCATE DHIRAJ SINGH', NULL, 'Male', 'UTTARAKHAND', 'HARIDWAR', NULL, 'Married', '1969-07-01 00:00:00', 'Post Graduate', 'public/user_images/_user1549713663.png', 9810069873, '1', '2019-02-09 07:00:00', '2019-02-09 07:00:00'),
(15, 31, '2', 'Santosh Kumar', NULL, 'Male', 'Delhi', 'WEST DELHI', NULL, 'Married', '1980-07-01 00:00:00', 'Graduate', 'public/user_images/_user1549706570.png', 7290009585, '1', '2019-02-09 07:00:00', '2019-02-09 07:00:00'),
(16, 32, '3', 'KRISHAN LAL', NULL, 'Female', 'Uttar pradesh', 'GHAZIABAD', NULL, 'Single', '1986-06-12 00:00:00', 'Graduate', 'public/user_images/_user1555495932.png', 9599708560, '1', '2019-02-11 07:00:00', '2019-04-17 07:00:00'),
(19, 37, '3', 'MUKESH ARORA', NULL, 'Male', 'New delhi', 'NEW DELHI', NULL, 'Married', '1980-05-13 00:00:00', 'Graduate', 'public/user_images/_user1551094117.png', 9899999441, '1', '2019-02-25 07:00:00', '2019-02-25 07:00:00'),
(20, 38, '2', 'PANKAJ KUMAR', NULL, 'Male', 'Delhi', 'DELHI', NULL, 'Single', '1991-04-04 00:00:00', 'Graduate', 'public/user_images/_user1551247751.png', 7982668593, '1', '2019-02-27 07:00:00', '2019-03-04 07:00:00'),
(21, 39, '2', 'SAMEER KUNDRA', NULL, 'Male', 'Delhi', 'DELHI', NULL, 'Single', '1994-05-17 00:00:00', 'Graduate', 'public/user_images/_user1551261703.png', 7982488107, '1', '2019-02-27 07:00:00', '2019-03-16 07:00:00'),
(22, 40, '2', 'ROSHAN', 'SHIKARI', 'male', 'DELHI', 'DELHI', 'm-7, shakur pur', 'married', '1979-08-15 00:00:00', 'graduate', '', 9811553141, '1', '2019-02-27 07:00:00', NULL),
(23, 41, '2', 'GYAN CHAND', NULL, 'Male', 'Delhi', 'DELHI', NULL, 'Married', '1982-08-08 00:00:00', 'Graduate', 'public/user_images/_user1551416822.png', 9899452344, '1', '2019-03-01 07:00:00', '2019-03-01 07:00:00'),
(24, 42, '2', 'DHARMENDER KAUSHIK', NULL, 'Male', 'Haryana', 'HARYANA', NULL, 'Single', '1992-02-03 00:00:00', 'Graduate', 'public/user_images/_user1551527166.png', 8708987848, '1', '2019-03-02 07:00:00', '2019-03-02 07:00:00'),
(25, 43, '2', 'MOHD', 'TABREZ', 'male', 'NEW DELHI', 'NEW DELHI', 'meethpur', 'single', '1995-02-12 00:00:00', 'graduate', '', 9210006226, '1', '2019-03-05 07:00:00', NULL),
(26, 44, '3', 'SUNNY', 'SUKHIJA', 'male', 'DELHI', 'DELHI', 'SHAHDRA', 'married', '1982-11-21 00:00:00', 'graduate', '', 9818133436, '1', '2019-03-26 07:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=admin,2=agent,3=field Boy',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firebase_token` varchar(251) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `firebase_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'archit', 'bsslarchit@gmail.com', '1', NULL, '$2y$10$QAluUn83rqROASP1oq81teQHxULaQvd7KZ0Za4jysoIqI8TtC.Mt.', '', 'clrmEyu0tbUdVUib83OySg56av2kj7deg5c0GIdHEfJdXBslDPSTTsmWhTHA', '2019-01-01 17:10:52', '2019-01-01 17:10:52'),
(19, 'Amit Singh', 'dote1989@gmail.com', '2', NULL, '$2y$10$Jr3PNu5XAyGe.7a/hy3SquhWvKfRo71PcnsI4CBZLKQqWvtSDM6GG', 'f7Ohf9aFzl0:APA91bG_UfSbFJJJYDeVftdWPBj31CYXFhzYl2PyjAtqC-mIEz0uVWTI1OwpE2eospNF3IfZsgNKXb0rgGqMYPG6PCRcm50vyzNnq64aIrAJhzgOj6weBY-5r9ef863Dr6glcj3dDFuv', NULL, '2019-02-06 19:14:16', '2019-04-11 14:45:33'),
(20, 'Sanjay Tiwari', 'sanjaytiwari9211@gmail.com', '2', NULL, '$2y$10$9FsZfni9ss8PwffVeN6f8umaxu4UIwKNfWSeb6ZRdEmmmZYSjGMUq', 'eWrDfiLaExg:APA91bGAgks5jMqJ0hdWwpZuqeetndiIA87EiQf-FA-dRXxY7sz2azvW3tn1w2nlQrtZaIVq6rQmW2817hWKgdwza36PKVNVHY-Yuwlm_ji3E_gYXaA8JsmWacSQFLCY34WukBvMyh1r', NULL, '2019-02-06 19:16:06', '2019-05-17 19:57:33'),
(21, 'Parmesh Kumar', 'parmesh@upharfinvest.in', '3', NULL, '$2y$10$CodxLNDHT2Hc1b2F2Sc.IeOYSGsIQjWVlBDl/C1xnXOrH.q2LYk5K', 'c6EKuUMraMs:APA91bGWTEYhSaAJ3GW8cArSZPnzVe2A-psdBlk-s7kd7PqUEb2tFtqjH-Rp5QzculC1yPZSTrnrSwWO23aa0GF4OctgGZFqeETZnSoctQvoxudCrLueU69M6AGssgyiAOHlX_LMvB05', NULL, '2019-02-06 19:17:14', '2019-03-20 15:59:14'),
(22, 'Nirmal Nagar', 'nirmalnagar7835@gmail.com', '3', NULL, '$2y$10$7RXhsiBCeBrdVSJW88vPde7i9FSFGlkql6nxxVTQpCSFv2iCI3TTS', 'esL2yFJgpEo:APA91bHTldk9HyH4tVbN4dt_o4qlqtj5W9-0WwhzRAnWGmigKyhvzvIlGCFq7wjrq7FXOFw8IW80GZWX9OxFkntk2g74f3wxA0VHr_KtS34W_EB5wyc2MYXF_1N7BGH-QL-IwAoJfjO4', NULL, '2019-02-09 11:48:08', '2019-03-04 18:08:58'),
(23, 'Rahul Yadav', 'rahul.yadav931230@gmail.com', '3', NULL, '$2y$10$oisqyAIOzJDujlAkDYgxY.na1jTwT1q2vJcZF4ORwea.xlzoCK5Yu', 'cig9bmLT5dE:APA91bFJYvdf3z3cBM0Y1IywIjzBj7GINj4YCB8G80w1yBqXlakrbozxAZKx0wZoyQYOigWhfbYDc9pNs-It3977huyDyv6Q_LXK7yM6NWNNF-vIcYa4jJYGZvay1cU5t6k8pX2cwbDb', NULL, '2019-02-09 11:52:30', '2019-05-05 21:00:38'),
(24, 'Shankar Bagoli', 'pkumar.arp@gmail.com', '2', NULL, '$2y$10$ux4WHcwAO4jWY.IRDUeztemsGMTzieUD9UCn81lwKSr2BQo3yA/c6', 'dCJoDxAOSt4:APA91bHxO41dccgPIhlqKGS3-5TmjbNxYaL0wOC11AvPyHJ9ukGtYQUUpfbWD9O5tPs1h9BXvzUlFjh0ONnOO_M4Pi36CJLdE2InPb0Y8_WJ0WYOW53OfR6OHnhWN3lVqmGTnr8V-XRk', NULL, '2019-02-09 11:56:59', '2019-02-26 12:42:53'),
(28, 'Dhiraj Singh', 'dhirajsingh69@gmail.com', '2', NULL, '$2y$10$0t/VPWD.ysu7zh5/yic7A.lAADBhlUuuopODV6aAGGZhgcQXoFf62', 'fh-IzwZbk2A:APA91bFElEdh2wxwtW0XPCHmLQtu0uUle6t8PBRpVMnIHxRtgFu-HlBUBOgYJTM5lb3nSm7V_GraLdUktnjq7b-G8wMn_CYryUh0gsevL3p2S7eozOCSmQgBqk_hHz6AdGm3UgA8CAMm', NULL, '2019-02-09 13:51:07', '2019-02-09 19:05:11'),
(31, 'Santosh Kumar', 'santosh.p205janvi@gmail.com', '2', NULL, '$2y$10$uNYomFO3iA86N8Fr7G3Roez9FBd8G8Pkqc2F3lLmq0RUbi4mWn4qm', 'fLoJeV5H1jQ:APA91bGEB33F63QeDQXLQS_tfWWEpnzmtUpVeTgvfq6GtlPw-o_8Be1_t8AdAsYh4gLm5YrDl4XgotTH8tNYnpP8rIESrwF6P4QO7XHBYDMoW9lRGAs9pvbaBAAdy-ePJBqGlaDV-LtX', NULL, '2019-02-09 17:00:48', '2019-02-09 17:02:49'),
(32, 'KRISHAN LAL', 'klal06002@gmail.com', '3', NULL, '$2y$10$4rVFpXt19sVRf/J9aoBB1OJxu44hwxGop/E63IV3ZHhDdfMSOnxb.', 'cKaRs-LAQBM:APA91bETNj-z73QnpFt9tyYdYXKE60iOhxOTxGZbx_k3FSoUdsCNGL0MXZlM9nckFt0UdHSMRX05B9lPl7YGZtKb3EfFEZLPjKAuP4EnDXAUXux0xuE6jvZWu5rbWv_w2-SIi_I5etnA', NULL, '2019-02-11 14:18:22', '2019-04-18 12:59:07'),
(36, 'vikas khan', 'viki@gmail.com', '2', NULL, '$2y$10$/JvVzFWZyk1kh3cGmWlT0eQJD0OnHcbqE64JSMztJbQ9tPq/K.jbO', NULL, NULL, '2019-02-19 14:04:05', '2019-02-19 14:04:05'),
(37, 'MUKESH ARORA', 'mukeshkarora1980@gmail.com', '3', NULL, '$2y$10$MsH6fIh7K.8LQDjoyoJ2.urhOf9w09YScfgLwj8iNFvnLk31hIX4W', 'f1p5z7gwJAs:APA91bHwcTbxL6sj6eQUzH2uhLG70XOA9SUhRkVPyDUqCppB-MXKQGYtgNrQhaYujRK-lP3plo-cpTm-K9jFDmhzJbW19-iQ1V1OyY8mdBNdXzc5WqOZ5Qpbca60OJfoOT0Nd1whc2IN', NULL, '2019-02-25 18:27:09', '2019-02-25 18:36:52'),
(38, 'PANKAJ KUMAR', 'jaiswalpankaj742@gmail.com', '2', NULL, '$2y$10$mTNPznLa/K.dCBKRI2TGeehyneJclkf0PASVtNCQgUQQ2yySaCEKS', 'dVSExVaaeAk:APA91bESLTK8KhL1C7VbixwlW4-4Zcf-qvXmoWdH5xZSvpjhgiZGROefguaKeaQ_Hs6oZ3BRGoxBFRpx6BnDBBtYkAj0X3B4JDnsHV1t2Se9ABYCVU59Eg_BzgddK8TnQ9ZNt0l_LeWG', NULL, '2019-02-27 12:51:02', '2019-05-06 23:25:16'),
(39, 'SAMEER KUNDRA', 'kundrasameer96@gmail.com', '2', NULL, '$2y$10$AOpu//4dKVCXNGfzVk/tXOkzfixvutD3HyMY3KORzLZtIrhx3q4tm', 'fDjOvGv97Dk:APA91bEyjfDU4n7a31clKunFn02FgmITV9SC67btGFjTyH9AgFlAgjbr44A8q6weS3zr9JcCV0kXYC68Nsk6kbbYmQOPhveu0R0QScHeuZZGhqGiKjXcvczlVlM7QQnElP_rHxjaQJMZ', NULL, '2019-02-27 16:59:20', '2019-03-16 11:48:07'),
(40, 'ROSHAN SHIKARI', 'rodhan3w@gmail.com', '2', NULL, '$2y$10$Hb8gXnwChJodsKziuF2F/uxB4ZbGtzEhwmQk9vigP49sEFO4VAEj.', NULL, NULL, '2019-02-27 17:02:26', '2019-02-27 17:02:26'),
(41, 'GYAN CHAND', 'gyanji1982@gmail.com', '2', NULL, '$2y$10$7tI/bVuTyMm5yH6tdgoHY.0yYKQdE3ArGBySdkJ21vIXHENbiKhMe', 'dbj3lSzokWE:APA91bFWAEWluNtEp31zRzmUB5cQQrTkRHrcdMh7sbBsFDsGvj92cELzUSpBMG60APDx58L8QPfeMbXKWEzBKSFdWU74kFOrkwFkYNaXgUXGpNIFTJfETBYZvTt9KppBwl1JlYYAkak2', NULL, '2019-03-01 12:04:14', '2019-03-01 12:07:02'),
(42, 'DHARMENDER KAUSHIK', 'dharmender.kaushik36@gmail.com', '2', NULL, '$2y$10$t8vXymCRleqJb3UOLBJEh.2YEU0GFa1Qx3zgMhU8x3uir6znRL3u.', 'eVrws14dx_M:APA91bFV6Gc4RYo2wSV51O-U_A8YAKxvXlbGfaxHyUVPo-hy7S2R7mms3Orev8wIMj0uqBhi2fesyfLKSj1sxec9v7mF7LTvUT7QcFIdv7zfT5oTOj2_K20iK1OBSiEkomP6Y4T0rgKG', NULL, '2019-03-02 17:34:12', '2019-03-28 14:32:29'),
(43, 'MOHD TABREZ', 'mdt7247@gmail.com', '2', NULL, '$2y$10$p09y/sB.iiCtxX1g42Ua.eFLIyCfvW0C/ZcA.05gdpmUvDhBhunAW', NULL, NULL, '2019-03-05 17:56:48', '2019-03-05 17:56:48'),
(44, 'SUNNY SUKHIJA', 'sunnysukheja0021@gmail.com', '3', NULL, '$2y$10$P8EPUisKVAO0ZNLy3yw8/uJE.2da04QXz6UP7u0FWq65iTaYyGTZ2', NULL, NULL, '2019-03-26 13:18:32', '2019-03-26 13:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_manufacture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_model_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `customer_id`, `vehicle_type`, `vehicle_manufacture`, `vehicle_name`, `vehicle_model_no`, `created_at`, `updated_at`) VALUES
(1, '1', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(2, '2', 'Two Wheeler Loans', 'BAJAJ', 'pulsar ns160', '2019', NULL, NULL),
(3, '3', 'Two Wheeler Loans', 'HONDA', 'cb shine sp', '2019', NULL, NULL),
(4, '4', 'Two Wheeler Loans', 'TVS', 'jupiter', '2019', NULL, NULL),
(5, '5', 'Two Wheeler Loans', 'HERO', 'spl+ i3s,', '2019', NULL, NULL),
(6, '6', 'Two Wheeler Loans', 'BAJAJ', 'ct100', '2019', NULL, NULL),
(7, '7', 'Two Wheeler Loans', 'BAJAJ', 'ct100', '2019', NULL, NULL),
(8, '8', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(9, '9', 'Three Wheeler Loans', 'MAA SHAKTI EXIM PVT LTD', 'SARTHAK', '111', NULL, NULL),
(10, '10', 'Two Wheeler Loans', 'BAJAJ', 'ct100', '2019', NULL, NULL),
(11, '11', 'Two Wheeler Loans', 'TVS', 'jupiter std', '2019', NULL, NULL),
(12, '12', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(13, '13', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(14, '14', 'Three Wheeler Loans', 'MAA SHAKTI EXIM PVT LTD', 'SAARTHAK', '123', NULL, NULL),
(15, '15', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(16, '16', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(17, '17', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(18, '18', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(19, '19', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(20, '20', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(21, '21', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(22, '22', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(23, '23', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(24, '24', 'Three Wheeler Loans', 'MAA SHAKTI EXIM PVT LTD', 'SAARTHAK', '111', NULL, NULL),
(25, '25', 'Three Wheeler Loans', 'BAJAJ', 're cimpact', '2019', NULL, NULL),
(26, '26', 'Three Wheeler Loans', 'BAJAJ', 're compact', '2019', NULL, NULL),
(27, '27', 'Two Wheeler Loans', 'HONDA', 'activa', '2019', NULL, NULL),
(28, '28', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(29, '29', 'Three Wheeler Loans', 'BAJAJ', 're compact cng', '2019', NULL, NULL),
(30, '30', 'Three Wheeler Loans', 'BAJAJ', 're compact cng', '2019', NULL, NULL),
(31, '31', 'Three Wheeler Loans', 'BAJAJ', 're compact cng', '2019', NULL, NULL),
(32, '32', 'Three Wheeler Loans', 'BAJAJ', 're compact', '2019', NULL, NULL),
(33, '33', 'Three Wheeler Loans', 'BAJAJ', 're compact', '2019', NULL, NULL),
(34, '34', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(35, '35', 'Two Wheeler Loans', 'TVS', 'APE three wheeler Auto', '2019', NULL, NULL),
(36, '36', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(37, '37', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(38, '38', 'Two Wheeler Loans', 'HERO', 'p.pro disc', '2019', NULL, NULL),
(39, '39', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(40, '40', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(41, '41', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(42, '42', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(43, '43', 'Two Wheeler Loans', 'HERO', 'ppro', '2019', NULL, NULL),
(44, '44', 'Two Wheeler Loans', 'HERO', 'spl+', '2019', NULL, NULL),
(45, '45', 'Three Wheeler Loans', 'MAA SHAKTI EXIM PVT LTD', 'SAATHAK', '0111', NULL, NULL),
(46, '46', 'Two Wheeler Loans', 'BAJAJ', 'ct100', '2019', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financial_buddy_logins`
--
ALTER TABLE `financial_buddy_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantors_and_coborrower`
--
ALTER TABLE `guarantors_and_coborrower`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_agent`
--
ALTER TABLE `tbl_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `financial_buddy_logins`
--
ALTER TABLE `financial_buddy_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `guarantors_and_coborrower`
--
ALTER TABLE `guarantors_and_coborrower`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `references`
--
ALTER TABLE `references`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `tbl_agent`
--
ALTER TABLE `tbl_agent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
