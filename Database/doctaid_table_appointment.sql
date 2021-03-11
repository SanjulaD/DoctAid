
-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `isClosed` int(11) DEFAULT 0,
  `dateCreated` double DEFAULT 0,
  `symptons` varchar(45) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  `preferredDate` double DEFAULT 0,
  `allocatedDate` double DEFAULT 0,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentId`, `patientId`, `doctorId`, `isClosed`, `dateCreated`, `symptons`, `disease`, `preferredDate`, `allocatedDate`, `title`) VALUES
(13, 1, 11, 1, 1492755207471, 'Cough, Sneezing, Fever', 'Diphtheria', 1492713000000, 1492799400000, 'Cough'),
(14, 2, 15, 0, 1492755288148, 'Headache, Fever, Sweating', 'Malaria', 1492972200000, 1492972200000, 'Headache'),
(15, 3, 14, 0, 1492755373422, 'weakness, anemia', 'Scurvy', 1492713000000, 1492713000000, 'Dizziness'),
(16, 4, NULL, 0, 1492755623567, 'red eyes, fever, cough', 'Measles', 1493145000000, 0, 'Red Eyes'),
(17, 2, NULL, 0, 1492755684391, 'Sweating, ache in stomach', 'Worms', 1492972200000, 0, 'Stomach Ache'),
(18, 5, NULL, 0, 1492755818061, 'Nose Bleeding, Pain', 'Fracture in Nose', 1492972200000, 0, 'Nose Bleeding'),
(19, 6, 12, 0, 1492755887085, 'bad bowels, headache', 'Constipation', 1492972200000, 1492972200000, 'Bad Bowel Movement'),
(20, 7, 11, 0, 1492755929549, 'Frequent Headache', 'Migrane', 1492799400000, 1492799400000, 'Headache'),
(21, 10, NULL, 0, 1614574154913, 'chest pain and health', 'fracture', 1616005800000, 0, 'Stress');
