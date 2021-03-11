
-- --------------------------------------------------------

--
-- Table structure for table `appointmentitems`
--

CREATE TABLE `appointmentitems` (
  `itemId` int(11) NOT NULL,
  `date` double DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `appointmentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointmentitems`
--

INSERT INTO `appointmentitems` (`itemId`, `date`, `typeId`, `description`, `appointmentId`) VALUES
(60, 1492755991121, 6, 'Date Allocated :- 2017-04-22', 20),
(61, 1492755997599, 6, 'Date Allocated :- 2017-04-24', 19),
(62, 1492756002778, 6, 'Date Allocated :- 2017-04-21', 15),
(63, 1492756012843, 6, 'Date Allocated :- 2017-04-22', 13),
(64, 1492756020277, 6, 'Date Allocated :- 2017-04-24', 14),
(65, 1492757531371, 1, 'You are experiencing high fever or low fever?', 13),
(66, 1492757568421, 2, 'low fever!!', 13),
(67, 1492757602756, 3, 'Medicine Prescribed', 13),
(68, 1492757626515, 2, 'Do I have to get through any test?', 13),
(69, 1492757657312, 5, 'Blood Test: Lab Report Requested', 13),
(70, 1492757703928, 4, 'Lab Report arrived', 13),
(71, 1492757720080, 6, 'Closed By Doctor: - Dr. Rachit', 13),
(72, 1614574154920, 6, 'Appointment Created', 21),
(73, 1614574195721, 2, 'hello test', 21);
