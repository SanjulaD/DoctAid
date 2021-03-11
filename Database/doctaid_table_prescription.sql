
-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `medicineId` int(11) NOT NULL,
  `medicineName` varchar(45) DEFAULT NULL,
  `quantity` double DEFAULT 0,
  `times` int(11) DEFAULT 0,
  `itemId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`medicineId`, `medicineName`, `quantity`, `times`, `itemId`) VALUES
(7, 'Actified Plus', 1, 2, 67);
