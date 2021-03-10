-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 26, 2021 at 12:27 AM
-- Server version: 10.2.36-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rendereiwebstagi_whiteboard_renderei`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_downloads`
--

CREATE TABLE `tbl_downloads` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_greyangles`
--

CREATE TABLE `tbl_greyangles` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `file_name` varchar(2558) NOT NULL,
  `thumb_small` varchar(255) NOT NULL,
  `comments` text DEFAULT NULL,
  `is_selected` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plandata_submissions`
--

CREATE TABLE `tbl_plandata_submissions` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `thumb_small` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_plandata_submissions`
--

INSERT INTO `tbl_plandata_submissions` (`id`, `project_id`, `file_name`, `thumb_small`, `created_at`) VALUES
(1, 2, '12.jpg', '', '2021-02-25 15:13:59'),
(2, 2, 'images.jpg', '', '2021-02-25 15:13:59'),
(3, 2, 'images1.jpg', '', '2021-02-25 15:13:59'),
(4, 2, 'Pelican_Pointe-6.jpg', '', '2021-02-25 15:13:59'),
(5, 2, 'Pelican_Pointe-9.jpg', '', '2021-02-25 15:13:59'),
(6, 2, 'Pelican_Pointe-12.jpg', '', '2021-02-25 15:13:59'),
(7, 2, 'Pelican_Pointe-14.jpg', '', '2021-02-25 15:13:59'),
(8, 2, 'images.jpg', 'images_thumb.jpg', '2021-02-25 15:28:23'),
(9, 2, 'Pelican_Pointe-23.jpg', 'Pelican_Pointe-23_thumb.jpg', '2021-02-25 15:28:23'),
(10, 2, 'remove-objects-after.jpg', 'remove-objects-after_thumb.jpg', '2021-02-25 15:28:25'),
(11, 2, 'window-pull-before.png', 'window-pull-before_thumb.png', '2021-02-25 15:28:26'),
(12, 2, 'images3.jpg', 'images3_thumb.jpg', '2021-02-25 15:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `alloted_greyangles` int(11) DEFAULT NULL,
  `status` enum('plandata_submission','grey_angle','revision','verified','completed') NOT NULL DEFAULT 'plandata_submission',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`id`, `project_name`, `client_id`, `alloted_greyangles`, `status`, `created_at`, `modified_at`) VALUES
(1, 'Test Project 123', 12, 1, '', '2021-02-18 14:06:09', '2021-02-18 15:00:56'),
(2, 'Project Test', 5, 5, '', '2021-02-18 14:39:47', NULL),
(3, 'Test project 1234', 7, 3, 'plandata_submission', '2021-02-22 07:36:26', NULL),
(4, 'Test project 1', 6, 3, 'plandata_submission', '2021-02-22 07:43:01', '2021-02-22 07:43:31'),
(5, 'Test project 123', 6, 3, 'plandata_submission', '2021-02-23 13:40:10', NULL),
(6, 'Test project 1234', 12, 3, 'plandata_submission', '2021-02-24 11:38:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_revisions`
--

CREATE TABLE `tbl_revisions` (
  `id` int(11) NOT NULL,
  `revision_batches_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `thumb_small` varchar(255) NOT NULL,
  `annotations` text DEFAULT NULL COMMENT 'Json Annotations',
  `comments` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_revision_batches`
--

CREATE TABLE `tbl_revision_batches` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_verified` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `roles` enum('admin','client') NOT NULL DEFAULT 'client',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `forgot_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `email`, `password`, `name`, `phone_number`, `contact_name`, `roles`, `status`, `forgot_token`, `created_at`, `modified_at`) VALUES
(1, 'admin@renderei.com', '0192023a7bbd73250516f069df18b500', 'Admin', NULL, NULL, 'admin', 'active', '', '2021-02-17 11:08:14', '2021-02-18 06:56:00'),
(5, 'showmacktest@gmail.com', '318901f5f2cba859f5cc914483d34480', 'Test Client', '1234567890', 'test', 'client', 'active', 'ab3be2756aa2cfc01bec90d16476f57e', '2021-02-17 15:47:08', '2021-02-24 10:57:46'),
(6, 'steven@example.com', '318901f5f2cba859f5cc914483d34480', 'Steven', '1234567890', 'John - Green Houses', 'client', 'active', '', '2021-02-18 05:39:20', '2021-02-18 08:01:16'),
(7, 'show.mack.te.st@gmail.com', '23702766ed0cc0bc29308b5a5ac14490', 'Julie Harrison', '1234567890', 'Rose', 'client', 'active', '', '2021-02-18 07:05:05', '2021-02-18 07:20:31'),
(12, 'test@example.com', 'dbc291741c0d503c20f21d3ae18eca7c', 'Johnathan', '2147483647', 'Matt', 'client', 'active', '', '2021-02-18 08:00:44', '2021-02-18 08:01:01'),
(21, 'bhagyalakshmigandham@gmail.com', 'c8190605370893b1b69507da2c5e4323', 'Test client 1', '1234567890', 'Test', 'client', 'active', '050a7c42d40741d76bcd04808bfd5975', '2021-02-24 10:58:54', '2021-02-25 05:21:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_downloads`
--
ALTER TABLE `tbl_downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_greyangles`
--
ALTER TABLE `tbl_greyangles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_plandata_submissions`
--
ALTER TABLE `tbl_plandata_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_projects_client_id` (`client_id`);

--
-- Indexes for table `tbl_revisions`
--
ALTER TABLE `tbl_revisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_revision_batches`
--
ALTER TABLE `tbl_revision_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_downloads`
--
ALTER TABLE `tbl_downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_greyangles`
--
ALTER TABLE `tbl_greyangles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_plandata_submissions`
--
ALTER TABLE `tbl_plandata_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_revisions`
--
ALTER TABLE `tbl_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_revision_batches`
--
ALTER TABLE `tbl_revision_batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD CONSTRAINT `tbl_projects_client_id` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
