USE TICKET_1;

-- payment_method
INSERT INTO `payment method` VALUES (1,'Credit Card');
INSERT INTO `payment method` VALUES (2,'Cash');
INSERT INTO `payment method` VALUES (3,'Debit');
INSERT INTO `payment method` VALUES (4,'EMT');

-- sales channel
INSERT INTO `sales channel` VALUES (1,'on site');
INSERT INTO `sales channel` VALUES (2,'web');
INSERT INTO `sales channel` VALUES (3,'mobile app');
INSERT INTO `sales channel` VALUES (4,'newspaper');


-- organizer
INSERT INTO `venue organizers` VALUES (1,1,'Air Canada Centre','50 bay St #500','Toronto','ON','M5J 2L2');
INSERT INTO `venue organizers` VALUES (2,2,'Rogers Centre','1 Blue Jays Way','Toronto','ON','M5V 1J1');
INSERT INTO `venue organizers` VALUES (3,3,'Toronto City Sports Centre','32 Curity Ave','Toronto','ON','M4B 0A2');
INSERT INTO `venue organizers` VALUES (4,1,'Toronto Pan Am Sports Centre',' 875 Morningside Ave','Toronto','ON','M1C 0C7');
INSERT INTO `venue organizers` VALUES (5,2,'Metro Sports Center','1510 Birchmount Rd','Toronto','ON','M1P 2G6');
INSERT INTO `venue organizers` VALUES (6,1,'Athletic Centre','55 Harbord St','Toronto','ON','M5S 2W6');

-- Reseller
INSERT INTO `Reseller` VALUES (1,1,'Shoppers','1800 Sheppard Ave E Unit 2075','Toronto','ON','M2J 5A7');
INSERT INTO `Reseller` VALUES (2,2,'Indigo Books & Music','1600 University Ave,','Toronto','ON','M5G 1X5');
INSERT INTO `Reseller` VALUES (3,3,'Rotate This','186 Ossington Ave','Toronto','ON','M6J 2Z7');
INSERT INTO `Reseller` VALUES (4,1,'Greek World','996 Pape Ave','Toronto','ON','M4K 3V7');
INSERT INTO `Reseller` VALUES (5,2,'One Stop Ticket Shop','40 King St W','Toronto','ON','M5H 3Y2');
INSERT INTO `Reseller` VALUES (6,3,'Metro','444 Yonge St','Toronto','ON','M5G 2B3');

-- Customers 
INSERT INTO `customer` VALUES (1,'Terry','Wang','M','terence.wang@gmail.com','4165587894');
INSERT INTO `customer` VALUES (2,'John','Smith','M','John.Smith@gmail.com','6475566894');
INSERT INTO `customer` VALUES (3,'Ace','Jane','F','Ace.Jane@gmail.com','4165637822');
INSERT INTO `customer` VALUES (4,'Allen','James','M','Allen.James@gmail.com','4165557879');
INSERT INTO `customer` VALUES (5,'Bean','Roy','M','Bean.Roy@gmail.com','6475587883');
INSERT INTO `customer` VALUES (6,'Alin','Louis','F','Alin.Louis@gmail.com','4165597866');

-- Ticket Type
INSERT INTO `ticket_type` VALUES(1,'NBA',0.1);
INSERT INTO `ticket_type` VALUES(2,'Baseball',0.15);
INSERT INTO `ticket_type` VALUES(3,'Hockey',0.2);
INSERT INTO `ticket_type` VALUES(4,'Skiing',0.12);

-- Ticket
INSERT INTO `ticket` VALUES(1,1,2,1,3,3,39.9,1,'2021-02-03');
INSERT INTO `ticket` VALUES(2,2,6,2,3,3,128.0,3,'2021-02-14');
INSERT INTO `ticket` VALUES(3,3,1,3,3,3,29.9,9,'2021-02-14');
INSERT INTO `ticket` VALUES(4,4,4,4,3,1,36.0,2,'2021-02-15');
INSERT INTO `ticket` VALUES(5,1,1,5,3,1,100.0,5,'2021-03-01');
INSERT INTO `ticket` VALUES(6,1,5,1,3,4,88.8,2,'2021-02-03');








