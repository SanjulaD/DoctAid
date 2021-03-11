
-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `labId` int(11) NOT NULL,
  `labName` varchar(45) NOT NULL,
  `testFor` varchar(45) NOT NULL,
  `labResult` varchar(45) DEFAULT NULL,
  `reportFile` varchar(45) DEFAULT NULL,
  `itemId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`labId`, `labName`, `testFor`, `labResult`, `reportFile`, `itemId`, `doctorId`) VALUES
(5, 'Blood Test', 'Haemoglobin', 'low', NULL, 70, 11);
