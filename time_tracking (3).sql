-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 06:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `time_tracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `common_leaves`
--

CREATE TABLE `common_leaves` (
  `id` int(11) NOT NULL,
  `leave_name` varchar(255) NOT NULL,
  `leave_date` date NOT NULL,
  `domain` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `leave_type` varchar(255) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `leave_date` date NOT NULL,
  `full_half` varchar(200) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `domain` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_topic` varchar(255) NOT NULL,
  `meeting_attendees` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`meeting_attendees`)),
  `meeting_guests` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`meeting_guests`)),
  `meeting_agenda` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `created_user_id`, `meeting_date`, `meeting_topic`, `meeting_attendees`, `meeting_guests`, `meeting_agenda`, `created_at`) VALUES
(7, 13, '2025-02-04', 'Since these are asynchronous (Main Topic)', '[\"wpdev@ancbusiness.com\",\"nassar@ancbusiness.com\",\"shifas@ancbusiness.com\",\"arfad@ancbusiness.com\"]', '[]', 'Since these are asynchronous operations, you should use nested callbacks or promises (async/await) for correct execution. Here\'s how to structure it properly (Agenda)', '2025-02-05 09:44:14'),
(10, 13, '2025-02-06', 'Main Topic', '[\"wpdev@ancbusiness.com\",\"akash@ancbusiness.com\",\"nassar@ancbusiness.com\"]', '[\"zs@gmail.com\"]', 'Since these are asynchronous operations, you should use nested callbacks or promises (async/await) for correct execution. Here\'s how to structure it properly (Agenda)', '2025-02-05 10:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `meetingtasks`
--

CREATE TABLE `meetingtasks` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `minute_id` int(11) NOT NULL,
  `task_description` text NOT NULL,
  `assignee` int(11) NOT NULL,
  `priority` enum('High','Medium','Low') NOT NULL,
  `project_or_task` varchar(255) NOT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Pending','In Progress','Cancelled','Completed') NOT NULL,
  `comments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meetingtasks`
--

INSERT INTO `meetingtasks` (`id`, `meeting_id`, `minute_id`, `task_description`, `assignee`, `priority`, `project_or_task`, `due_date`, `status`, `comments`, `created_at`) VALUES
(4, 10, 6, 'dsasadas', 14, 'Medium', 'sdass', '2025-02-21', 'Pending', 'Since these are asynchronous operations, you should use nested callbacks or promises (async/await) for correct execution. Here\'s how to structure it properly (Agenda)', '2025-02-05 10:00:08'),
(5, 10, 6, 'saaasdsaas', 13, 'Medium', 'ssadsad', '2025-02-21', 'Pending', 'Since these are asynchronous operations, you should use nested callbacks or promises (async/await) for correct execution. Here\'s how to structure it properly (Agenda)', '2025-02-05 10:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_minutes`
--

CREATE TABLE `meeting_minutes` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` enum('Information','Action Item') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meeting_minutes`
--

INSERT INTO `meeting_minutes` (`id`, `meeting_id`, `topic`, `description`, `type`, `created_at`) VALUES
(3, 7, 'minute topics', 'Since these are asynchronous operations, you should use nested callbacks or promises (async/await) for correct execution. Here\'s how to structure it properly (Descriptions)', 'Information', '2025-02-05 09:44:14'),
(6, 10, 'minute topic', 'Since these are asynchronous operations, you should use nested callbacks or promises (async/await) for correct execution. Here\'s how to structure it properly (Agenda)', 'Action Item', '2025-02-05 10:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `users_id` varchar(200) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `domain` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `users_id`, `name`, `description`, `domain`) VALUES
(18, '[\"13\",\"15\",\"17\"]', 'Sany Alameriah', 'Sany requirements available', 'ancbusiness.com'),
(19, '[\"13\",\"14\",\"15\"]', 'Kanoo Clean Max', 'Hosting to demo to live server', 'ancbusiness.com'),
(20, '[\"13\",\"16\"]', 'PSL Arabia', 'Sitemap creation', 'ancbusiness.com'),
(21, '[\"8\",\"13\",\"14\",\"15\",\"16\",\"17\"]', 'ANC Business', 'ANC Works full revamp', 'ancbusiness.com');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `status_id` int(11) NOT NULL,
  `updated_user` int(10) DEFAULT NULL,
  `deadline_date` date NOT NULL,
  `time` time NOT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `priority` enum('Low','Medium','High') DEFAULT 'Low',
  `assigning` varchar(100) NOT NULL,
  `domain` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `user_id`, `project_id`, `description`, `status`, `status_id`, `updated_user`, `deadline_date`, `time`, `notes`, `created_at`, `updated_at`, `priority`, `assigning`, `domain`) VALUES
(45, 'Site Map', '13,16', 20, 'Site Map Creation in Like Page', 'new', 0, 0, '2024-11-29', '18:00:00', '', '2024-11-20 03:45:21', '2024-11-20 03:45:21', 'High', 'ANC Business', 'ancbusiness.com'),
(46, 'Navbar creation', '13', 18, 'Add new tabs like Services and Products', 'inProgress', 0, 13, '2024-11-21', '00:00:00', '', '2024-11-20 03:46:35', '2024-11-20 07:17:10', 'High', 'ANC Business', 'ancbusiness.com'),
(48, 'ANC Business Task', '13,15', 21, 'Any requirements in ANC please take this task', 'new', 0, NULL, '2024-12-27', '00:00:00', '', '2024-11-21 05:15:12', '2024-11-21 05:16:05', 'Low', 'ANC Business', 'ancbusiness.com');

-- --------------------------------------------------------

--
-- Table structure for table `time_entries`
--

CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_name` varchar(200) NOT NULL,
  `task_id` int(10) NOT NULL,
  `task_name` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_entries`
--

INSERT INTO `time_entries` (`id`, `title`, `user_id`, `project_id`, `project_name`, `task_id`, `task_name`, `status`, `start_time`, `end_time`, `date`) VALUES
(71, 'ANC Common Works', 13, 21, 'ANC Business', 48, 'ANC Business Task', 'inProgress', '09:51:00', '13:33:00', '2024-11-04'),
(72, 'Sany Works', 13, 18, 'Sany Alameriah', 46, 'Navbar creation', 'inProgress', '14:52:00', '17:59:00', '2024-11-04'),
(73, 'PSL Arabia Works', 13, 20, 'PSL Arabia', 45, 'Site Map', 'inProgress', '09:36:00', '14:41:00', '2024-11-05'),
(74, 'ANC Common Task', 13, 21, 'ANC Business', 48, 'ANC Business Task', 'inProgress', '15:36:00', '19:57:00', '2024-11-05'),
(75, 'Sany Navbar creation', 13, 18, 'Sany Alameriah', 46, 'Navbar creation', 'inProgress', '09:03:00', '14:19:00', '2024-11-06'),
(76, 'ANC Works', 13, 21, 'ANC Business', 48, 'ANC Business Task', 'inProgress', '14:58:00', '17:58:00', '2024-11-06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `domain` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`, `domain`, `created`) VALUES
(8, 'ANC Business', 'info@ancbusiness.com', '$2a$10$LiQoswSf0AoXj0Tb21hPh.I9l4pFfYR9UCkbJ8wGMnKvtpFBjHf12', 'superadmin', 1, 'ancbusiness.com', '2024-11-12 11:18:55'),
(11, 'Emvigo Technologies', 'hr@emvigotech.com', '$2a$10$9fYmfVb881IPIu1qGv8Cvu8ntE3B1RZJPyKzFZBLtWxceRs/XV8GG', 'superadmin', 1, 'emvigotech.com', '2024-11-12 11:19:22'),
(13, 'Zakariya KV', 'wpdev@ancbusiness.com', '$2a$10$/s1TA9uRHW9bILKRvBf3me9WVt/0PHdmAatY80t03U9sWxn.OHdpO', 'user', 1, 'ancbusiness.com', '2024-11-13 07:52:55'),
(14, 'Akash', 'akash@ancbusiness.com', '$2a$10$iZic3FPKJfYa9oSKf8i07OFIq7WJJuuSquiwPDnWe32mMBalnUB0i', 'admin', 1, 'ancbusiness.com', '2024-11-14 09:36:54'),
(15, 'Nassar C', 'nassar@ancbusiness.com', '$2a$10$/s1TA9uRHW9bILKRvBf3me9WVt/0PHdmAatY80t03U9sWxn.OHdpO', 'user', 1, 'ancbusiness.com', '2025-02-04 11:16:25'),
(16, 'Shifas Ahmad', 'shifas@ancbusiness.com', '$2a$10$kDERvM.NsVMyA50Qpbtm1OUUNVfbkBGXv5PUeSIc0YppLrPwiLCZy', 'user', 1, 'ancbusiness.com', '2024-11-20 02:45:05'),
(17, 'Arfad VP', 'arfad@ancbusiness.com', '$2a$10$FFCpMa1TsDx4I4a/zZxt2uwOmDCAY11FyGCWbv.zaMJpXzDVm.kPy', 'user', 1, 'ancbusiness.com', '2024-11-20 02:45:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `common_leaves`
--
ALTER TABLE `common_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetingtasks`
--
ALTER TABLE `meetingtasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `minute_id` (`minute_id`);

--
-- Indexes for table `meeting_minutes`
--
ALTER TABLE `meeting_minutes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `common_leaves`
--
ALTER TABLE `common_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `meetingtasks`
--
ALTER TABLE `meetingtasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meeting_minutes`
--
ALTER TABLE `meeting_minutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meetingtasks`
--
ALTER TABLE `meetingtasks`
  ADD CONSTRAINT `meetingtasks_ibfk_1` FOREIGN KEY (`minute_id`) REFERENCES `meeting_minutes` (`id`);

--
-- Constraints for table `meeting_minutes`
--
ALTER TABLE `meeting_minutes`
  ADD CONSTRAINT `meeting_minutes_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
