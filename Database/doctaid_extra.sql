
--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentId`),
  ADD KEY `appointment_ibfk_1_idx` (`patientId`),
  ADD KEY `appointment_ibfk_2_idx` (`doctorId`);

--
-- Indexes for table `appointmentitems`
--
ALTER TABLE `appointmentitems`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `appointmentId` (`appointmentId`),
  ADD KEY `type` (`typeId`);

--
-- Indexes for table `appointmentitemstype`
--
ALTER TABLE `appointmentitemstype`
  ADD PRIMARY KEY (`typeId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorId`),
  ADD UNIQUE KEY `id_UNIQUE` (`doctorId`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`labId`),
  ADD KEY `labfk1_idx` (`itemId`),
  ADD KEY `labfk2_idx` (`doctorId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`),
  ADD UNIQUE KEY `id_UNIQUE` (`patientId`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `userName_UNIQUE` (`userName`),
  ADD KEY `type` (`personType`);

--
-- Indexes for table `persontype`
--
ALTER TABLE `persontype`
  ADD PRIMARY KEY (`typeId`),
  ADD UNIQUE KEY `id_UNIQUE` (`typeId`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`medicineId`),
  ADD KEY `medine_key1_idx` (`itemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `appointmentitems`
--
ALTER TABLE `appointmentitems`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `appointmentitemstype`
--
ALTER TABLE `appointmentitemstype`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `labId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `persontype`
--
ALTER TABLE `persontype`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `medicineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`);

--
-- Constraints for table `appointmentitems`
--
ALTER TABLE `appointmentitems`
  ADD CONSTRAINT `appointmentItems_ibfk_3` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`),
  ADD CONSTRAINT `appointmentItems_ibfk_4` FOREIGN KEY (`typeId`) REFERENCES `appointmentitemstype` (`typeId`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `labfk1` FOREIGN KEY (`itemId`) REFERENCES `appointmentitems` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `labfk11` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`personType`) REFERENCES `persontype` (`typeId`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `medine_key1` FOREIGN KEY (`itemId`) REFERENCES `appointmentitems` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
