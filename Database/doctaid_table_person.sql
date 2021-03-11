
-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personId` int(11) NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(10) DEFAULT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `dob` double DEFAULT NULL,
  `token` varchar(10) CHARACTER SET big5 DEFAULT '0',
  `personType` int(1) NOT NULL DEFAULT 1,
  `gender` varchar(2) DEFAULT 'NA',
  `address` varchar(45) DEFAULT NULL,
  `contactNumber` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personId`, `firstName`, `lastName`, `userName`, `password`, `dob`, `token`, `personType`, `gender`, `address`, `contactNumber`) VALUES
(1, 'Kasun', 'Perera', 'kasun', 'qwerty', 925842600000, '1', 1, 'M', 'NO.520, USILARAMA ROAD, Malambe', '9521113802'),
(2, 'Tharushi ', 'Silva', 'tharushi', 'qwerty', 925842600000, '1', 1, 'F', '82 Thurstan Road, Colombo 03', '9571620779'),
(3, '	Sachini', 'Silva', 'sachini', 'qwerty', 925842600000, '1', 1, 'F', 'KIPZ PHASE II, RING ROAD 3', '8981000909'),
(4, 'Supun', 'Fernando', 'supun', 'qwerty', 925842600000, '1', 1, 'M', '63 3rd Cross Street, Colombo 11', '8981000899'),
(5, 'Lahiru', 'De Silva', 'lahiru', 'qwerty', 925842600000, '1', 1, 'M', '220 Old Moor Street, Colombo 12', '8981001717'),
(6, 'Fathima', 'Ramzina', 'fathima', 'qwerty', 925842600000, '1', 1, 'F', '63 3rd Cross Street, 11', '9521113806'),
(7, 'Rashmi', 'Abeysena', 'rashmi', 'qwerty', 925842600000, '1', 1, 'F', '220 Old Moor Street, 12', '9521113816'),
(8, 'Chathura', 'Senavirath', 'chathura', 'qwerty', 925842600000, '1', 1, 'M', '101 Sri Kathiresan Street, 13', '9163990299'),
(9, 'Shehan', 'Silva', 'shehan', 'qwerty', 925842600000, '1', 1, 'M', '13 1/2 Messenger Street, 12', '9830085588'),
(10, 'Emalshi', 'Perera', 'emalshi', 'qwerty', 889236840000, '1', 1, 'F', 'No.40, Bandaranayake Mawatha', '8100055671'),
(11, 'Dr. Rachit', 'Mohommed', 'rachit', 'qwerty', 925842600000, '1', 2, 'M', '266 Vauxhall Street, 02', '8114487323'),
(12, 'Dr. Alwis', 'De', 'alwis', 'qwerty', 889236840000, '1', 2, 'M', '117/2 4th Cross Street, 11', '8240558662'),
(13, 'Dr. Nathasha', 'Sewwandi', 'nathasha', 'qwerty', 925842600000, '1', 2, 'F', '194 1/11 Prince Street, 11', '9521356402'),
(14, 'Dr. Perera', 'Sachith', 'sachith', 'qwerty', 889236840000, '1', 2, 'M', '114 Ward Place, 07', '8987213127'),
(15, 'Dr. Manas', 'Jain', 'manas', 'qwerty', 925842600000, '1', 2, 'M', '93/6 Keyzer Street, 11', '8898645151'),
(16, 'Ruchira', 'Perera', 'ruchira', 'qwerty', 925842600000, '1', 3, 'F', '98 Canal Bank Road, Off Hill Street', '8574878596'),
(17, 'Ritu', 'Akarsha', 'ritu', 'qwerty', 925842600000, '1', 4, 'F', '3/6 Keyzer Street, 11', '8574875485'),
(18, 'Karishma', 'sanjeewa', 'karishma', 'qwerty', 925842600000, '1', 5, 'F', 'Sri Wimalaramaya Street, Ritas Road', '9865478521'),
(19, 'Hiruni', 'Silva', 'hiruni', 'qwerty', 777753000000, '1', 1, 'F', '148, MALIGAWA ROAD', '9685748754');
