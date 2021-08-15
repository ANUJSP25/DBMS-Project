-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 10:43 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jayrolex`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adid` int(11) DEFAULT NULL,
  `usename` varchar(30) DEFAULT NULL,
  `adname` varchar(30) DEFAULT NULL,
  `ademail` varchar(30) DEFAULT NULL,
  `adpass` varchar(30) DEFAULT NULL,
  `adrole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adid`, `usename`, `adname`, `ademail`, `adpass`, `adrole`) VALUES
(1, 'admin', 'Admin', 'admin@gmail.com', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) UNSIGNED NOT NULL,
  `movie_name` varchar(255) NOT NULL DEFAULT '',
  `movie_year` int(4) NOT NULL,
  `movie_rating` varchar(10) NOT NULL DEFAULT '',
  `movie_bio` varchar(255) DEFAULT NULL,
  `movie_img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `movie_name`, `movie_year`, `movie_rating`, `movie_bio`, `movie_img`) VALUES
(1, 'Lord of the Rings: The Fellowship of the Ring', 2001, 'PG-13', 'A battle between good and evil in which a Hobbit must deliver a ring into a volcano.', 'assets/img/lordOfRings.jpg'),
(2, 'Pacific Rim', 2013, 'PG-13', 'Giant robots fight giant monsters in Japan.', 'assets/img/pacificRim.jpg'),
(4, 'Batman & Robin', 1997, 'PG', 'The worst Batman movie, ever...', 'assets/img/batmanRobin.jpg'),
(5, 'District 9', 2009, 'R', 'A man has an unexpected surprise when he visits an alien slum in Johannesburg, South Africa.', 'assets/img/district9.jpg');

--
-- Triggers `movies`
--
DELIMITER $$
CREATE TRIGGER `aftermoviedelete` AFTER DELETE ON `movies` FOR EACH ROW UPDATE usertrigger 
SET total = total + 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) UNSIGNED NOT NULL,
  `review_movie_id` int(11) UNSIGNED NOT NULL,
  `review_user_id` int(11) UNSIGNED NOT NULL,
  `review_rating` int(11) NOT NULL,
  `review_content` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `review_movie_id`, `review_user_id`, `review_rating`, `review_content`) VALUES
(6, 1, 39, 4, 'This is one of my favorite movies of all time!'),
(7, 1, 39, 1, 'On second thought, this was awful.'),
(8, 1, 40, 4, 'good moviee'),
(9, 2, 38, 5, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `user_full_name` varchar(150) NOT NULL DEFAULT '',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_password` varchar(255) NOT NULL DEFAULT '',
  `user_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_full_name`, `user_email`, `user_password`, `user_role`) VALUES
(38, 'admin', 'Admin 1', 'admin@admin.com', 'admin', 1),
(39, 'test', 'Test', 'test@test.com', 'test', 2),
(40, 'naveen', 'Naveen HP', 'naveenhp158@gmail.com', '123456', 2);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `afteruserdelete` AFTER DELETE ON `users` FOR EACH ROW UPDATE usertrigger 
SET total = total + 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `usertrigger`
--

CREATE TABLE `usertrigger` (
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertrigger`
--

INSERT INTO `usertrigger` (`total`) VALUES
(1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_movie_id` (`review_movie_id`),
  ADD KEY `review_user_id` (`review_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`review_movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`review_user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
