
-- --------------------------------------------------------

--
-- Table structure for table `persontype`
--

CREATE TABLE `persontype` (
  `typeId` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persontype`
--

INSERT INTO `persontype` (`typeId`, `description`, `type`) VALUES
(1, 'Patient', 'Patient'),
(2, 'Doctor', 'Doctor'),
(3, 'Admin', 'Admin'),
(4, 'Lab Person', 'LabPerson'),
(5, 'Receptionist', 'Reception');
