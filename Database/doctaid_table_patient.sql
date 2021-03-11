
-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `bloodGroup` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `height`, `weight`, `bloodGroup`) VALUES
(1, 178, 60, 'A+'),
(2, 165, 80, 'A+'),
(3, 171, 49, 'A-'),
(4, 180, 51, 'O+'),
(5, 175, 59, 'O-'),
(6, 176, 75, 'B+'),
(7, 170, 80, 'B+'),
(8, 165, 100, 'B-'),
(9, 166, 120, 'B-'),
(10, 159, 69, 'AB+'),
(19, 174, 51, 'A-');
