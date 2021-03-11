
-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorId`, `degree`, `specialization`) VALUES
(11, 'MBBS MD BHHS', 'Neurologist'),
(12, 'MBBS BDS', 'Physician'),
(13, 'MBBS BDS', 'Dermatologist'),
(14, 'MBBS BHBS MD', 'Cardiologist'),
(15, 'MBBS MD BDS', 'Gynecologist');
