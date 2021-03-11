
-- --------------------------------------------------------

--
-- Table structure for table `appointmentitemstype`
--

CREATE TABLE `appointmentitemstype` (
  `typeId` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointmentitemstype`
--

INSERT INTO `appointmentitemstype` (`typeId`, `description`) VALUES
(1, 'Message from Doctor'),
(2, 'Message from Patient'),
(3, 'Prescription'),
(4, 'Lab Report'),
(5, 'Request For Lab Report'),
(6, 'System');
