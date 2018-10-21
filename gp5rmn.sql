--Airports create
CREATE TABLE AIRPORTS 
(
  AIRPORT_ID NUMBER NOT NULL --pk
, COUNTRY VARCHAR2(20) 
, CITY VARCHAR2(20) 
, NAME VARCHAR2(50) 
, IATA_CODE VARCHAR2(20) NOT NULL 
, CONSTRAINT AIRPORTS_PK PRIMARY KEY (AIRPORT_ID)
);
--Booking create
CREATE TABLE BOOKING 
(
  BOOKING_ID VARCHAR2(20) NOT NULL --pk
, BOOKING_DATE DATE 
, STATUS_CODE VARCHAR2(20) NOT NULL --paid/booked/canceled
, CURRENCY_CODE VARCHAR2(20) --canceled/booked --> null
, CONSTRAINT BOOKING_PK PRIMARY KEY (BOOKING_ID)
);
--Flight_crew create
CREATE TABLE FLIGHT_CREW 
(
  FLIGHT_CREW_ID NUMBER NOT NULL --pk
, FIRSTNAME VARCHAR2(20) 
, LASTNAME VARCHAR2(20) 
, PILOT_TYPE VARCHAR2(20) --captain/firstofficer
, CONSTRAINT FLIGHT_CREW_PK PRIMARY KEY (FLIGHT_CREW_ID)
 );

CREATE TABLE AIRCRAFTS 
(
  AIRCRAFT_ID NUMBER(20) NOT NULL --pk
, AIRCRAFT_TYPE VARCHAR2(20) NOT NULL 
, REGISTRATION VARCHAR2(20) NOT NULL 
, AIRCRAFT_CAPACITY NUMBER 
, CONSTRAINT AIRCRAFTS_PK PRIMARY KEY (AIRCRAFT_ID)
);
--Passengers create
CREATE TABLE PASSENGERS 
(
  PASSENGER_ID NUMBER NOT NULL --pk 
, FIRSTNAME VARCHAR2(20) NOT NULL 
, LASTNAME VARCHAR2(20) NOT NULL 
, DATEOFBIRTH DATE 
, GENDER VARCHAR2(20) 
, EMAILADDRESS VARCHAR2(50) UNIQUE --egyedinek kell lenni
, SUB NUMBER --sub emailre (0 ha nem 1 ha igen)
, CONSTRAINT PASSENGERS_PK PRIMARY KEY (PASSENGER_ID)
, CONSTRAINT sub_ck CHECK (SUB BETWEEN 0 AND 1) --csak 0 vagy 1 lehet, mas nem
);
--Segments create
CREATE TABLE SEGMENTS 
(
  SEGMENT_ID NUMBER NOT NULL --pk
, DEPARTURE_DATE DATE 
, DEPARTURE_AIRPORT_ID NUMBER --fk --> airports(airport_ID) 
, ARRIVAL_AIPORT_ID NUMBER --fk --> airports(airport_ID)
, AIRCRAFT_ID NUMBER NOT NULL --fk --> aircrafts(aircraft_ID)
, CAPTAIN_ID NUMBER NOT NULL --fk --> flight_crew(flight_crew_ID)
, FIRSTOFFICER_ID NUMBER --fk --> flight_crew(flight_crew_ID)
, CONSTRAINT SEGMENTS_PK PRIMARY KEY (SEGMENT_ID),
  CONSTRAINT ARR_AP_FK foreign key (ARRIVAL_AIPORT_ID) REFERENCES AIRPORTS(AIRPORT_ID),
  CONSTRAINT DEP_AP_FK foreign key (DEPARTURE_AIRPORT_ID) REFERENCES AIRPORTS(AIRPORT_ID),
  CONSTRAINT AIRCRAFT_FK foreign key (AIRCRAFT_ID) REFERENCES AIRCRAFTS(AIRCRAFT_ID),
  CONSTRAINT CAPTAIN_FK foreign key (CAPTAIN_ID) REFERENCES FLIGHT_CREW(FLIGHT_CREW_ID),
  CONSTRAINT FIRSTOFFICER_FK foreign key (FIRSTOFFICER_ID) REFERENCES FLIGHT_CREW(FLIGHT_CREW_ID)
);
--Journey create
CREATE TABLE JOURNEY 
(
  JOURNEY_ID VARCHAR2(20) NOT NULL --pk, de lehetne candidate key is, akkor passenger_ID-ra es segment_ID-ra tuti egyedi a tabla (egy utas csak egyszer lehet egy gepen)
, BOOKING_ID VARCHAR2(20) --fk --> booking(booking_ID)
, PASSENGER_ID NUMBER --fk --> passengers(passenger_ID)
, SEGMENT_ID NUMBER  --fk --> segments(segment_ID)
, CONSTRAINT JOURNEY_PK PRIMARY KEY (JOURNEY_ID),
  CONSTRAINT JOURNEY_BOOKING_FK foreign key (BOOKING_ID) REFERENCES BOOKING(BOOKING_ID),
  CONSTRAINT JOURNEY_PASSENGERS_FK foreign key (PASSENGER_ID) REFERENCES PASSENGERS(PASSENGER_ID),
  CONSTRAINT JOURNEY_SEGMENT_FK foreign key (SEGMENT_ID) REFERENCES SEGMENTS(SEGMENT_ID)
);
--Booking tabla feltoltese
insert into BOOKING values ('W001',TO_DATE('2018-06-17','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W002',TO_DATE('2018-06-25','YYYY.MM.DD'),'canceled',null);
insert into BOOKING values ('W003',TO_DATE('2018-03-14','YYYY.MM.DD'),'paid','eur');
insert into BOOKING values ('W004',TO_DATE('2018-02-28','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W005',TO_DATE('2018-01-17','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W006',TO_DATE('2018-04-14','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W007',TO_DATE('2018-10-10','YYYY.MM.DD'),'paid','usd');
insert into BOOKING values ('W008',TO_DATE('2018-09-14','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W009',TO_DATE('2018-02-07','YYYY.MM.DD'),'canceled',null);
insert into BOOKING values ('W010',TO_DATE('2018-03-12','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W011',TO_DATE('2018-06-25','YYYY.MM.DD'),'paid','eur');
insert into BOOKING values ('W012',TO_DATE('2018-06-28','YYYY.MM.DD'),'paid','gbp');
insert into BOOKING values ('W013',TO_DATE('2018-09-17','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W014',TO_DATE('2018-01-01','YYYY.MM.DD'),'booked',null);
insert into BOOKING values ('W015',TO_DATE('2018-09-27','YYYY.MM.DD'),'paid','eur');
insert into BOOKING values ('W016',TO_DATE('2018-01-13','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W017',TO_DATE('2018-09-08','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W018',TO_DATE('2018-10-01','YYYY.MM.DD'),'canceled',null);
insert into BOOKING values ('W019',TO_DATE('2018-09-23','YYYY.MM.DD'),'booked','huf');
insert into BOOKING values ('W020',TO_DATE('2018-08-12','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W021',TO_DATE('2018-07-21','YYYY.MM.DD'),'paid','usd');
insert into BOOKING values ('W022',TO_DATE('2018-02-21','YYYY.MM.DD'),'booked',null);
insert into BOOKING values ('W023',TO_DATE('2018-08-19','YYYY.MM.DD'),'booked',null);
insert into BOOKING values ('W024',TO_DATE('2018-01-15','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W025',TO_DATE('2018-06-30','YYYY.MM.DD'),'canceled',null);
insert into BOOKING values ('W026',TO_DATE('2018-02-13','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W027',TO_DATE('2018-01-26','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W028',TO_DATE('2018-08-30','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W029',TO_DATE('2018-06-18','YYYY.MM.DD'),'paid','eur');
insert into BOOKING values ('W030',TO_DATE('2018-04-24','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W031',TO_DATE('2018-05-19','YYYY.MM.DD'),'paid','usd');
insert into BOOKING values ('W032',TO_DATE('2018-09-27','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W033',TO_DATE('2018-06-16','YYYY.MM.DD'),'paid','gbp');
insert into BOOKING values ('W034',TO_DATE('2018-06-15','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W035',TO_DATE('2018-08-19','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W036',TO_DATE('2018-03-24','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W037',TO_DATE('2018-05-12','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W038',TO_DATE('2018-08-11','YYYY.MM.DD'),'paid','gbp');
insert into BOOKING values ('W039',TO_DATE('2018-04-19','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W040',TO_DATE('2018-01-12','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W041',TO_DATE('2018-02-11','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W042',TO_DATE('2018-08-12','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W043',TO_DATE('2018-09-10','YYYY.MM.DD'),'paid','gbp');
insert into BOOKING values ('W044',TO_DATE('2018-07-10','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W045',TO_DATE('2018-08-13','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W046',TO_DATE('2018-04-17','YYYY.MM.DD'),'paid','eur');
insert into BOOKING values ('W047',TO_DATE('2018-01-13','YYYY.MM.DD'),'paid','usd');
insert into BOOKING values ('W048',TO_DATE('2018-02-19','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W049',TO_DATE('2018-01-27','YYYY.MM.DD'),'paid','eur');
insert into BOOKING values ('W050',TO_DATE('2018-08-18','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W051',TO_DATE('2018-05-14','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W052',TO_DATE('2018-04-18','YYYY.MM.DD'),'paid','usd');
insert into BOOKING values ('W053',TO_DATE('2018-02-21','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W054',TO_DATE('2018-03-18','YYYY.MM.DD'),'paid','gbp');
insert into BOOKING values ('W055',TO_DATE('2018-06-17','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W056',TO_DATE('2018-06-15','YYYY.MM.DD'),'paid','usd');
insert into BOOKING values ('W057',TO_DATE('2018-03-12','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W058',TO_DATE('2018-09-10','YYYY.MM.DD'),'paid','gbp');
insert into BOOKING values ('W059',TO_DATE('2018-09-28','YYYY.MM.DD'),'paid','huf');
insert into BOOKING values ('W060',TO_DATE('2018-08-17','YYYY.MM.DD'),'paid','huf');
--Passengers tabla feltoltese
insert into PASSENGERS values (1,'Bendeguz','Foldi',TO_DATE('1997-07-05','YYYY.MM.DD'),'male','bendeguz.foldi@gmail.com',1);
insert into PASSENGERS values (2,'Evelin','Nemeth',TO_DATE('2000-05-07','YYYY.MM.DD'),'female','evelin.nemeth@gmail.com',1);
insert into PASSENGERS values (3,'Gabriella','Komari',TO_DATE('1996-11-04','YYYY.MM.DD'),'female','torpilla@gmail.com',1);
insert into PASSENGERS values (4,'Peter','Kovacs',TO_DATE('1999-12-13','YYYY.MM.DD'),'male','kovacsp@gmail.com',1);
insert into PASSENGERS values (5,'Tamara','Takacs',TO_DATE('2000-04-30','YYYY.MM.DD'),'female','tami2000@gmail.com',0);
insert into PASSENGERS values (6,'Orsolya','Toth',TO_DATE('1978-12-19','YYYY.MM.DD'),'female','orsi78@freemail.hu',0);
insert into PASSENGERS values (7,'Petra','Sipos',TO_DATE('1994-02-12','YYYY.MM.DD'),'female','petras@gmail.com',1);
insert into PASSENGERS values (8,'Ildiko','Horvath',TO_DATE('1994-01-12','YYYY.MM.DD'),'female','ildiko94@freemail.hu',1);
insert into PASSENGERS values (9,'Gabriella','Szekeres',TO_DATE('1993-12-16','YYYY.MM.DD'),'female','szekeresg@gmail.com',0);
insert into PASSENGERS values (10,'Balazs','Csernak',TO_DATE('1992-02-18','YYYY.MM.DD'),'male','csernakbalazs@gmail.com',0);
insert into PASSENGERS values (11,'Gergely','Kiss',TO_DATE('1997-08-19','YYYY.MM.DD'),'male','kissgergo@gmail.com',01);
insert into PASSENGERS values (12,'Zsofia','Kezer',TO_DATE('2000-02-18','YYYY.MM.DD'),'female','kezer.zs@freemail.hu',1);
insert into PASSENGERS values (13,'Noemi','Toth',TO_DATE('1978-04-15','YYYY.MM.DD'),'female','noemitoth@freemail.hu',1);
insert into PASSENGERS values (14,'Luca','Nagy',TO_DATE('1996-07-08','YYYY.MM.DD'),'female','nagyluca@yahoo.com',1);
insert into PASSENGERS values (15,'Zsuzsanna','Kiss',TO_DATE('1992-12-12','YYYY.MM.DD'),'female','kiss.zsuzsa@gmail.com',0);
insert into PASSENGERS values (16,'Edit','Nagy',TO_DATE('1979-03-18','YYYY.MM.DD'),'female','editnagy@gmail.com',1);
insert into PASSENGERS values (17,'Balazs','Kovacs',TO_DATE('1949-04-19','YYYY.MM.DD'),'male','kovacsb@gmail.com',0);
insert into PASSENGERS values (18,'Tamara','Kiss',TO_DATE('1999-12-18','YYYY.MM.DD'),'male','kisstamara@gmail.com',1);
insert into PASSENGERS values (19,'Jozsef','Toth',TO_DATE('1998-12-18','YYYY.MM.DD'),'male','tothjozsef@gmail.com',1);
insert into PASSENGERS values (20,'Peter','Nagy',TO_DATE('1993-04-01','YYYY.MM.DD'),'male','peternagy@freemail.hu',1);
insert into PASSENGERS values (21,'Gabriella','Pentek',TO_DATE('1982-11-23','YYYY.MM.DD'),'female','gabriellapentek@gmail.com',1);
insert into PASSENGERS values (22,'Tamas','Szombathelyi',TO_DATE('1989-10-21','YYYY.MM.DD'),'male','szombathelyit@freemail.hu',1);
insert into PASSENGERS values (23,'Denes','Kovacs',TO_DATE('1993-06-11','YYYY.MM.DD'),'male','denes93@gmail.com',1);
insert into PASSENGERS values (24,'Karolina','Kezer',TO_DATE('1983-02-12','YYYY.MM.DD'),'female','kezerkarolina@gmail.com',0);
insert into PASSENGERS values (25,'Csaba','Banczik',TO_DATE('1968-12-01','YYYY.MM.DD'),'male','csaba68@gmail.com',1);
insert into PASSENGERS values (26,'Jozsef','Takacs',TO_DATE('1964-07-18','YYYY.MM.DD'),'male','takacsjozsef@freemail.hu',0);
insert into PASSENGERS values (27,'Bela','Marton',TO_DATE('1983-12-26','YYYY.MM.DD'),'male','martonbela@freemail.hu',1);
insert into PASSENGERS values (28,'Zoltan','Bathori',TO_DATE('1974-12-14','YYYY.MM.DD'),'male','bathorizoltan@freemail.hu',1);
insert into PASSENGERS values (29,'Katalin','Pongracz',TO_DATE('1975-12-15','YYYY.MM.DD'),'female','pongraczkatalin@gmail.com',1);
insert into PASSENGERS values (30,'Istvan','Macsai',TO_DATE('1983-04-21','YYYY.MM.DD'),'male','macsaiistvan@gmail.com',1);
insert into PASSENGERS values (31,'Laszlo','Kulin',TO_DATE('1999-10-21','YYYY.MM.DD'),'male','kulinlaszlo@gmail.com',0);
insert into PASSENGERS values (32,'Erika','Pap',TO_DATE('1991-06-01','YYYY.MM.DD'),'female','erikapap@gmail.com',1);
insert into PASSENGERS values (33,'Imre','Szabo',TO_DATE('1993-08-09','YYYY.MM.DD'),'male','imreszabo@gmail.com',0);
insert into PASSENGERS values (34,'Richard','Katona',TO_DATE('1996-12-13','YYYY.MM.DD'),'male','katonar@freemail.hu',1);
insert into PASSENGERS values (35,'Tivadar','Takacs',TO_DATE('1979-05-19','YYYY.MM.DD'),'male','takacstivadar@freemail.hu',0);
insert into PASSENGERS values (36,'Andrea','Boda',TO_DATE('1978-04-23','YYYY.MM.DD'),'female','andrea78@gmail.com',1);
insert into PASSENGERS values (37,'Helga','Kovacs',TO_DATE('1999-02-01','YYYY.MM.DD'),'female','kovacshelga@freemail.hu',0);
insert into PASSENGERS values (38,'Beatrix','Hajdu',TO_DATE('1993-06-01','YYYY.MM.DD'),'female','hajdub@freemail.hu',1);
insert into PASSENGERS values (39,'Rebeka','Juhasz',TO_DATE('1983-11-01','YYYY.MM.DD'),'female','juhasz@gmail.com',0);
insert into PASSENGERS values (40,'Adam','Bekesi',TO_DATE('1992-12-04','YYYY.MM.DD'),'male','bekesiadam@gmail.com',1);
insert into PASSENGERS values (41,'Istvan','Nagy',TO_DATE('1967-04-15','YYYY.MM.DD'),'male','nagyistvan@freemail.hu',0);

--Airports tabla feltoltese
insert into AIRPORTS values (1,'Hungary','Budapest','Budapest Ferenc Liszt National Airport','BUD');
insert into AIRPORTS values (2,'England','London','Luton Airport','LTN');
insert into AIRPORTS values (3,'England','London','Heathrow Airport','LHR');
insert into AIRPORTS values (4,'Poland','Warsaw','Warsaw Chopin Airport','WAW');
insert into AIRPORTS values (5,'Hungary','Debrecen','Debrecen International Airport','DEB');
insert into AIRPORTS values (6,'Poland','Katowice','Katowice International Airport','KTW');
insert into AIRPORTS values (7,'Czech Republic','Prague','Vodochody Airport','VOD');
insert into AIRPORTS values (8,'Austira','Linz','Linz Airport','LNZ');
insert into AIRPORTS values (9,'Italy','Milan','Milan Linate Airport','LIN');
insert into AIRPORTS values (10,'Romania','Cluj-Napoca','Cluj-Napoca International Airport','CLJ');
insert into AIRPORTS values (11,'France','Paris','Orly Airport','ORY');
insert into AIRPORTS values (12,'Poland','Gdansk','Gdansk Airport','GDN');
insert into AIRPORTS values (13,'Sweden','Stockholm','Stockholm Airport','NYO');
insert into AIRPORTS values (14,'Germany','Dortmund','Dortmund Airport','DTM');
insert into AIRPORTS values (15,'Spain','Barcelona','Barcelona International Airport','BCN');
--Aircrafts tabla feltoltese
insert into AIRCRAFTS values (1,'Airbus A320-200','HA-LYA',230);
insert into AIRCRAFTS values (2,'Airbus A320-200','HA-LYB',230);
insert into AIRCRAFTS values (3,'Airbus A320-200','HA-LYC',230);
insert into AIRCRAFTS values (4,'Airbus A320-200','HA-LYD',230);
insert into AIRCRAFTS values (5,'Airbus A320-200','HA-LYE',230);
insert into AIRCRAFTS values (6,'Airbus A320-200','HA-LYF',230);
insert into AIRCRAFTS values (7,'Airbus A320-200','HA-LYG',230);
insert into AIRCRAFTS values (8,'Airbus A321-200','HA-LYH',230);
insert into AIRCRAFTS values (9,'Airbus A321-200','HA-LYI',230);
insert into AIRCRAFTS values (10,'Airbus A321-200','HA-LYJ',230);
insert into AIRCRAFTS values (11,'Airbus A321-200','HA-LYK',230);
insert into AIRCRAFTS values (12,'Airbus A321-200','HA-LYL',230);
insert into AIRCRAFTS values (13,'Airbus A321-200','HA-LYM',230);
insert into AIRCRAFTS values (14,'Airbus A321-200','HA-LYN',230);
insert into AIRCRAFTS values (15,'Airbus A321-200','HA-LYO',230);
insert into AIRCRAFTS values (16,'Airbus A321-200','HA-LYP',230);
insert into AIRCRAFTS values (17,'Airbus A321-200','HA-LYQ',230);
insert into AIRCRAFTS values (18,'Airbus A321-200','HA-LYR',230);
insert into AIRCRAFTS values (19,'Airbus A321-200','HA-LYS',230);
insert into AIRCRAFTS values (20,'Airbus A321-200','HA-LYT',230);
--Flight_crew tabla feltoltese
insert into FLIGHT_CREW values (1,'Balint','Toth','captain');
insert into FLIGHT_CREW values (2,'Janos','Kovacs','captain');
insert into FLIGHT_CREW values (3,'Andras','Kiss','captain');
insert into FLIGHT_CREW values (4,'Jozsef','Meszaros','captain');
insert into FLIGHT_CREW values (5,'Peter','Nagy','captain');
insert into FLIGHT_CREW values (6,'Barnabas','Szilagyi','captain');
insert into FLIGHT_CREW values (7,'Balazs','Cegledi','captain');
insert into FLIGHT_CREW values (8,'Gergely','Nemeth','captain');
insert into FLIGHT_CREW values (9,'Gabor','Toth','captain');
insert into FLIGHT_CREW values (10,'Bence','Takacs','captain');
insert into FLIGHT_CREW values (11,'Oliver','Fazekas','firstofficer');
insert into FLIGHT_CREW values (12,'Richard','Kiss','firstofficer');
insert into FLIGHT_CREW values (13,'Peter','Kosa','firstofficer');
insert into FLIGHT_CREW values (14,'Viktor','Varga','firstofficer');
insert into FLIGHT_CREW values (15,'Balazs','Kertesz','firstofficer');
insert into FLIGHT_CREW values (16,'Csaba','Dravucz','firstofficer');
insert into FLIGHT_CREW values (17,'Mate','Kovacs','firstofficer');
insert into FLIGHT_CREW values (18,'Krisztian','Veres','firstofficer');
insert into FLIGHT_CREW values (19,'Adam','Szabolcs','firstofficer');
insert into FLIGHT_CREW values (20,'Dominika','Meszaros','firstofficer');
--Segments tabla feltoltese
insert into SEGMENTS values (1,TO_DATE('2018-10-17','YYYY.MM.DD'),1,2,6,1,20); --BUD-LTN
insert into SEGMENTS values (2,TO_DATE('2018-10-17','YYYY.MM.DD'),4,15,7,2,19); --WAW-BCN
insert into SEGMENTS values (3,TO_DATE('2018-10-17','YYYY.MM.DD'),2,1,6,1,20); --LTN-BUD
insert into SEGMENTS values (4,TO_DATE('2018-10-17','YYYY.MM.DD'),15,4,7,2,19); --BCN-WAW
insert into SEGMENTS values (5,TO_DATE('2018-10-18','YYYY.MM.DD'),12,13,10,3,18); --GDN-NYO
insert into SEGMENTS values (6,TO_DATE('2018-10-18','YYYY.MM.DD'),10,8,11,4,17); --CLJ-LNZ
insert into SEGMENTS values (7,TO_DATE('2018-10-18','YYYY.MM.DD'),13,12,10,3,18); --NYO-GDN
insert into SEGMENTS values (8,TO_DATE('2018-10-18','YYYY.MM.DD'),8,10,11,4,17); --LNZ-CLJ
insert into SEGMENTS values (9,TO_DATE('2018-10-18','YYYY.MM.DD'),9,4,3,5,16); --LIN-WAW
insert into SEGMENTS values (10,TO_DATE('2018-10-19','YYYY.MM.DD'),12,2,9,6,15); --GDN-LTN 
insert into SEGMENTS values (11,TO_DATE('2018-10-19','YYYY.MM.DD'),10,9,5,7,14); --CLJ-LIN
insert into SEGMENTS values (12,TO_DATE('2018-10-19','YYYY.MM.DD'),2,12,9,6,15); --LTN-GDN
insert into SEGMENTS values (13,TO_DATE('2018-10-19','YYYY.MM.DD'),9,10,5,7,14); --LIN-CLJ
insert into SEGMENTS values (14,TO_DATE('2018-10-20','YYYY.MM.DD'),1,4,16,8,13); --BUD-WAW
insert into SEGMENTS values (15,TO_DATE('2018-10-20','YYYY.MM.DD'),5,2,18,9,12); --DEB-LTN
insert into SEGMENTS values (16,TO_DATE('2018-10-20','YYYY.MM.DD'),4,1,16,8,13); --WAW-BUD
insert into SEGMENTS values (17,TO_DATE('2018-10-20','YYYY.MM.DD'),2,5,18,9,12); --LTN-DEB
--Journey tabla feltoltese
--10.17
--BUD-LTN
insert into JOURNEY values (1,'W001',1,1); 
insert into JOURNEY values (2,'W001',2,1); 
insert into JOURNEY values (3,'W003',3,1); 
insert into JOURNEY values (4,'W003',5,1); 
insert into JOURNEY values (5,'W004',6,1);
insert into JOURNEY values (6,'W060',18,1);
insert into JOURNEY values (7,'W055',34,1);

--WAW-BCN 
insert into JOURNEY values (8,'W005',41,2);
insert into JOURNEY values (9,'W005',8,2);
insert into JOURNEY values (10,'W005',12,2);
insert into JOURNEY values (11,'W006',9,2);
insert into JOURNEY values (12,'W006',21,2);
--LTN-BUD
insert into JOURNEY values (13,'W001',1,3);
insert into JOURNEY values (14,'W001',2,3);
insert into JOURNEY values (15,'W003',3,3);
insert into JOURNEY values (16,'W003',5,3);
insert into JOURNEY values (17,'W004',6,3);
insert into JOURNEY values (18,'W059',28,3);
insert into JOURNEY values (19,'W054',29,3);
--BCN-WAW
insert into JOURNEY values (20,'W005',41,4);
insert into JOURNEY values (21,'W005',8,4);
insert into JOURNEY values (22,'W005',12,4);
insert into JOURNEY values (23,'W006',9,4);
insert into JOURNEY values (24,'W006',21,4);
--10.18
--GDN-NYO
insert into JOURNEY values (25,'W003',12,5);
insert into JOURNEY values (26,'W003',14,5);
insert into JOURNEY values (27,'W003',18,5);
insert into JOURNEY values (28,'W007',32,5);
insert into JOURNEY values (29,'W007',11,5);
insert into JOURNEY values (30,'W001',1,5);
insert into JOURNEY values (31,'W001',2,5);
--CLJ-LNZ
insert into JOURNEY values (32,'W016',8,6);
insert into JOURNEY values (33,'W016',6,6);
insert into JOURNEY values (34,'W017',41,6);
insert into JOURNEY values (35,'W017',7,6);
insert into JOURNEY values (36,'W017',9,6);
--NYO-GDN
insert into JOURNEY values (37,'W003',12,7);
insert into JOURNEY values (38,'W003',14,7);
insert into JOURNEY values (39,'W003',18,7);
insert into JOURNEY values (40,'W007',32,7);
insert into JOURNEY values (41,'W007',11,7);
insert into JOURNEY values (42,'W059',16,7);
insert into JOURNEY values (43,'W054',36,7);
--LNZ-CLJ
insert into JOURNEY values (44,'W016',8,8);
insert into JOURNEY values (45,'W016',6,8);
insert into JOURNEY values (46,'W017',41,8);
insert into JOURNEY values (47,'W017',7,8);
insert into JOURNEY values (48,'W017',9,8);
--LIN-WAW
insert into JOURNEY values (49,'W001',28,9);
insert into JOURNEY values (50,'W001',29,9);
insert into JOURNEY values (51,'W001',34,9);
insert into JOURNEY values (52,'W001',17,9);
insert into JOURNEY values (53,'W001',19,9);
--10.19
--GDN-LTN
insert into JOURNEY values (54,'W021',10,10);
insert into JOURNEY values (55,'W021',20,10);
insert into JOURNEY values (56,'W024',15,10);
insert into JOURNEY values (57,'W024',26,10);
insert into JOURNEY values (58,'W024',34,10);
insert into JOURNEY values (59,'W041',35,10);
insert into JOURNEY values (60,'W042',36,10);
--CLJ-LIN
insert into JOURNEY values (61,'W008',18,11);
insert into JOURNEY values (62,'W010',19,11);
insert into JOURNEY values (63,'W010',13,11);
insert into JOURNEY values (64,'W010',39,11);
insert into JOURNEY values (65,'W010',40,11);
--LTN-GDN
insert into JOURNEY values (66,'W021',10,12);
insert into JOURNEY values (67,'W021',20,12);
insert into JOURNEY values (68,'W024',15,12);
insert into JOURNEY values (69,'W024',26,12);
insert into JOURNEY values (70,'W024',34,12);
--LIN-CLJ
insert into JOURNEY values (71,'W008',18,13);
insert into JOURNEY values (72,'W010',19,13);
insert into JOURNEY values (73,'W010',13,13);
insert into JOURNEY values (74,'W010',39,13);
insert into JOURNEY values (75,'W010',40,13);
insert into JOURNEY values (76,'W059',25,13);
insert into JOURNEY values (77,'W054',27,13);
--10.20
--BUD-WAW
insert into JOURNEY values (78,'W001',1,14);
insert into JOURNEY values (79,'W001',2,14);
insert into JOURNEY values (80,'W020',41,14);
insert into JOURNEY values (81,'W020',4,14);
insert into JOURNEY values (82,'W020',5,14);
--DEB-LTN
insert into JOURNEY values (83,'W013',6,15);
insert into JOURNEY values (84,'W015',7,15);
insert into JOURNEY values (85,'W015',8,15);
insert into JOURNEY values (86,'W015',9,15);
insert into JOURNEY values (87,'W015',10,15);
--WAW-BUD
insert into JOURNEY values (88,'W001',1,16);
insert into JOURNEY values (89,'W001',2,16);
insert into JOURNEY values (90,'W020',41,16);
insert into JOURNEY values (91,'W020',4,16);
insert into JOURNEY values (92,'W020',5,16);
--LTN-DEB
insert into JOURNEY values (93,'W013',6,17);
insert into JOURNEY values (94,'W015',7,17);
insert into JOURNEY values (95,'W015',8,17);
insert into JOURNEY values (96,'W015',9,17);
insert into JOURNEY values (97,'W015',10,17);
insert into JOURNEY values (98,'W033',11,17);
insert into JOURNEY values (99,'W038',12,17);
insert into JOURNEY values (100,'W045',13,17);
