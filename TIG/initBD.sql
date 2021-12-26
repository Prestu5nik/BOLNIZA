DROP TABLE IF EXISTS BRANCHES CASCADE;
CREATE TABLE public.BRANCHES (
	BID serial NOT NULL,
	BNAME varchar NOT NULL,
	CONSTRAINT BRANCHES_pk PRIMARY KEY (BID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS DRUGS CASCADE;
CREATE TABLE public.DRUGS (
	DID serial NOT NULL,
	DNAME varchar NOT NULL,
	DKOL varchar NOT NULL,
	DTIME varchar,
	CONSTRAINT DRUGS_pk PRIMARY KEY (DID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS POSITIONS CASCADE;
CREATE TABLE public.POSITIONS (
	PID serial NOT NULL,
	PNAME varchar NOT NULL,
	PSUM int NOT NULL,
	CONSTRAINT POSITIONS_pk PRIMARY KEY (PID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS CONCLUSIONS CASCADE;
CREATE TABLE public.CONCLUSIONS (
	CID serial NOT NULL,
	CNAME varchar NOT NULL,
	CONSTRAINT CONCLUSIONS_pk PRIMARY KEY (CID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS ILLS CASCADE;
CREATE TABLE public.ILLS (
	IID serial NOT NULL,
	IFIO varchar NOT NULL,
	IAGE int NOT NULL,
	IADRESS varchar NOT NULL,
	ICID int NOT NULL,
	IBEGIN date NOT NULL,
	IEND date NOT NULL,
	CONSTRAINT ILLS_pk PRIMARY KEY (IID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS STAFF CASCADE;
CREATE TABLE public.STAFF (
	SID serial NOT NULL,
	SFIO varchar NOT NULL,
	SBID int NOT NULL,
	SADRESS varchar NOT NULL,
	SAGE int NOT NULL,
	SPHONE varchar NOT NULL,
	SPID int NOT NULL,
	CONSTRAINT STAFF_pk PRIMARY KEY (SID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS TREATMENT CASCADE;
CREATE TABLE public.TREATMENT (
	TCID int NOT NULL,
	TDID int NOT NULL
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS ROUTINE CASCADE;
CREATE TABLE public.ROUTINE (
	RID serial NOT NULL,
	RNAME varchar NOT NULL,
	RSID int NOT NULL,
	RTIME varchar NOT NULL,
	RSUM int NOT NULL,
	CONSTRAINT ROUTINE_pk PRIMARY KEY (RID)
) 
WITH (OIDS=FALSE);

DROP TABLE IF EXISTS EVENTS CASCADE;
CREATE TABLE public.EVENTS (
	ECID int NOT NULL,
	ERID int NOT NULL
) 
WITH (OIDS=FALSE);

ALTER TABLE ILLS ADD CONSTRAINT ILLS_fk0 FOREIGN KEY (ICID) REFERENCES CONCLUSIONS(CID);

ALTER TABLE STAFF ADD CONSTRAINT STAFF_fk0 FOREIGN KEY (SBID) REFERENCES BRANCHES(BID);
ALTER TABLE STAFF ADD CONSTRAINT STAFF_fk1 FOREIGN KEY (SPID) REFERENCES POSITIONS(PID);

ALTER TABLE TREATMENT ADD CONSTRAINT TREATMENT_fk0 FOREIGN KEY (TCID) REFERENCES CONCLUSIONS(CID);
ALTER TABLE TREATMENT ADD CONSTRAINT TREATMENT_fk1 FOREIGN KEY (TDID) REFERENCES DRUGS(DID);

ALTER TABLE ROUTINE ADD CONSTRAINT ROUTINE_fk0 FOREIGN KEY (RSID) REFERENCES STAFF(SID);

ALTER TABLE EVENTS ADD CONSTRAINT EVENTS_fk0 FOREIGN KEY (ECID) REFERENCES CONCLUSIONS(CID);
ALTER TABLE EVENTS ADD CONSTRAINT EVENTS_fk1 FOREIGN KEY (ERID) REFERENCES ROUTINE(RID);

INSERT INTO CONCLUSIONS VALUES (1,'Вывих');
INSERT INTO CONCLUSIONS VALUES (2,'Растяжение');
INSERT INTO CONCLUSIONS VALUES (3,'Перелом');
INSERT INTO CONCLUSIONS VALUES (4,'Ушиб');
INSERT INTO CONCLUSIONS VALUES (5,'Ковид');
INSERT INTO CONCLUSIONS VALUES (6,'Открытая рана');
INSERT INTO CONCLUSIONS VALUES (7,'Цистит');
INSERT INTO CONCLUSIONS VALUES (8,'ОРВИ');
INSERT INTO CONCLUSIONS VALUES (9,'Гайморит');
INSERT INTO CONCLUSIONS VALUES (10,'ОРЗ');
INSERT INTO CONCLUSIONS VALUES (11,'Аллергия');
INSERT INTO CONCLUSIONS VALUES (12,'Гастрит');
INSERT INTO CONCLUSIONS VALUES (13,'Язва');
INSERT INTO CONCLUSIONS VALUES (14,'Бронхит');
INSERT INTO CONCLUSIONS VALUES (15,'Пневмония');

INSERT INTO BRANCHES VALUES (1, 'Приёмное отделение');
INSERT INTO BRANCHES VALUES (2,'Отделение реанимации');
INSERT INTO BRANCHES VALUES (3,'Терапевтическое отделение');
INSERT INTO BRANCHES VALUES (4,'Хирургическое отделение');
INSERT INTO BRANCHES VALUES (5,'Гинекологическое отделение');
INSERT INTO BRANCHES VALUES (6,'Отделение функциональной диагностики');
INSERT INTO BRANCHES VALUES (7,'Пищеблок');
INSERT INTO BRANCHES VALUES (8,'Архив для хранения мед. документации');
INSERT INTO BRANCHES VALUES (9,'Красная зона');

INSERT INTO POSITIONS VALUES (1,'Глав. врач больницы',200000);
INSERT INTO POSITIONS VALUES (2,'Зам. руководителя больницы',150000);
INSERT INTO POSITIONS VALUES (3,'Заведующий приёмного отделения',50000);
INSERT INTO POSITIONS VALUES (4,'Заведующий реанимационного отделения',50000);
INSERT INTO POSITIONS VALUES (5,'Заведующий терапевтического отделения',50000);
INSERT INTO POSITIONS VALUES (6,'Заведующий хирургического отделения',60000);
INSERT INTO POSITIONS VALUES (7,'Заведующий гинекологического отделения',50000);
INSERT INTO POSITIONS VALUES (8,'Заведующий отделения функциональной диагностики',50000);
INSERT INTO POSITIONS VALUES (9,'Заведующий пищеблока',50000);
INSERT INTO POSITIONS VALUES (10,'Заведующий красной зоны',70000);
INSERT INTO POSITIONS VALUES (11,'Работник приёмного отделения',15000);
INSERT INTO POSITIONS VALUES (12,'Работник реанимационного отделения',20000);
INSERT INTO POSITIONS VALUES (13,'Работник терапевтического отделения',15000);
INSERT INTO POSITIONS VALUES (14,'Работник хирургического отделения',20000);
INSERT INTO POSITIONS VALUES (15,'Работник гинекологического отделения',15000);
INSERT INTO POSITIONS VALUES (16,'Работник отделения функциональной диагностики',15000);
INSERT INTO POSITIONS VALUES (17,'Работник пищеблока',12000);
INSERT INTO POSITIONS VALUES (18,'Работник красной зоны',25000);

INSERT INTO DRUGS VALUES (1,'Бинт стерильный','Один раз','До полного восстановления');
INSERT INTO DRUGS VALUES (2,'Эластичный бинт','Один раз в течение времени бодрствования','До полного восстановления');
INSERT INTO DRUGS VALUES (3,'Жгут','По обстоятельствам','До полной остановки кровотечения');
INSERT INTO DRUGS VALUES (4,'Пантенол','Три раза в день на область проблемного места','До 3-х недель');
INSERT INTO DRUGS VALUES (5,'Перекись водорода 3%','Перед перевязкой ','Неограниченно');
INSERT INTO DRUGS VALUES (6,'Йод','По обстоятельствам','Неограниченно');
INSERT INTO DRUGS VALUES (7,'Парацетамол','Два раз в день','До 3-х недель');
INSERT INTO DRUGS VALUES (8,'Нурофен','Один раз в день','До 2-х недель');
INSERT INTO DRUGS VALUES (9,'Фервекс','Два раз в день','Неограниченно');
INSERT INTO DRUGS VALUES (10,'Стрепсилс','Три раза в день','Неограниченно');
INSERT INTO DRUGS VALUES (11,' Ингалипт','Три раза в день','Неограниченно');
INSERT INTO DRUGS VALUES (12,'Пектусин','Три раза в день','До 1-ой недели');
INSERT INTO DRUGS VALUES (13,'Називин','Три раза в день','До 2-х недель');
INSERT INTO DRUGS VALUES (14,'Карвалол','Один раз в день','До 1-го месяца');
INSERT INTO DRUGS VALUES (15,'Спазмалгон','По обстоятельствам','Неограниченно');
INSERT INTO DRUGS VALUES (16,'Мезим','Три раза в день','До 1-го месяца');
INSERT INTO DRUGS VALUES (17,'Активированный уголь','По обстоятельствам','Неограниченно');
INSERT INTO DRUGS VALUES (18,'Супрастин','Три раза в день','До 1-го месяца');
INSERT INTO DRUGS VALUES (19,'Нашатырный спирт','По обстоятельствам','Неограниченно');
INSERT INTO DRUGS VALUES (20,'Ибупрофен','По обстоятельствам','До 1-ой недели');
INSERT INTO DRUGS VALUES (21,'Линкас','Три раза в день с антибиотиками','До 2-х недель');
INSERT INTO DRUGS VALUES (22,'Смекта','Два раз в день','До 2-х недель');
INSERT INTO DRUGS VALUES (23,'Регидрон','По обстоятельствам','До 2-х недель');
INSERT INTO DRUGS VALUES (24,'Лоперамид','Один раз в день','До 2-х недель');
INSERT INTO DRUGS VALUES (25,'Фурацилин','По обстоятельствам','Неограниченно');

INSERT INTO STAFF VALUES (1,'Исаков Адольф Лукьянович',3,'801850, Амурская область, город Солнечногорск, бульвар Ленина, 85',63,'+ 7(4942)5696095500',1);
INSERT INTO STAFF VALUES (2,'Орехов Севастьян Вячеславович',6,'491667, Томская область, город Домодедово, пл. Будапештсткая, 10',47,'+ 7(4942)4688665882',8);
INSERT INTO STAFF VALUES (3,'Королёв Федор Созонович',4,'163537, Брянская область, город Серебряные Пруды, шоссе 1905 года, 87',32,'+ 7(4942)1292953940',2);
INSERT INTO STAFF VALUES (4,'Исаков Геннадий Адольфович',7,'174857, Челябинская область, город Москва, ул. Балканская, 76',54,'+ 7(4942)9273396703',9);
INSERT INTO STAFF VALUES (5,'Веселов Валерий Матвеевич',9,'748637, Свердловская область, город Истра, спуск Космонавтов, 38',29,'+ 7(4942)1720958520',10);
INSERT INTO STAFF VALUES (6,'Сидоров Парамон Тимофеевич',1,'010351, Челябинская область, город Орехово-Зуево, шоссе Славы, 41',26,'+ 7(4942)4412842420',3);
INSERT INTO STAFF VALUES (7,'Ершов Моисей Оскарович',3,'508248, Калининградская область, город Кашира, пер. Балканская, 13',44,'+ 7(4942)5223055015',13);
INSERT INTO STAFF VALUES (8,'Медведев Аскольд Филиппович',6,'884727, Самарская область, город Серпухов, въезд Домодедовская, 05',39,'+ 7(4942)1520299622',16);
INSERT INTO STAFF VALUES (9,'Ершов Платон Мартынович',9,'902902, Смоленская область, город Серпухов, пер. Гагарина, 78',32,'+ 7(4942)1020410795',18);
INSERT INTO STAFF VALUES (10,'Ширяев Леонтий Германнович',9,'544077, Тюменская область, город Клин, въезд 1905 года, 78',57,'+ 7(4942)8968361690',18);
INSERT INTO STAFF VALUES (11,'Беляков Рудольф Гордеевич',9,'550125, Астраханская область, город Егорьевск, бульвар Ленина, 12',24,'+ 7(4942)9887267329',18);
INSERT INTO STAFF VALUES (12,'Цветков Сергей Лукьянович',7,'351325, Самарская область, город Чехов, пер. Косиора, 35',68,'+ 7(4942)7798577309',17);
INSERT INTO STAFF VALUES (13,'Фадеева Рамина Федоровна',5,'588116, Тульская область, город Подольск, ул. Чехова, 61',46,'+ 7(4942)7103020241',15);
INSERT INTO STAFF VALUES (14,'Гуляева Милена Артёмовна',2,'934088, Астраханская область, город Дмитров, спуск Будапештсткая, 99',44,'+ 7(4942)9328193632',4);
INSERT INTO STAFF VALUES (15,'Миронова Жаклин Рудольфовна',1,'059105, Волгоградская область, город Дмитров, въезд Бухарестская, 35',36,'+ 7(4942)5297497588',11);
INSERT INTO STAFF VALUES (16,'Антонова Диша Григорьевна',3,'874385, Липецкая область, город Зарайск, проезд Космонавтов, 16',28,'+ 7(4942)8113711511',5);
INSERT INTO STAFF VALUES (17,'Галкина Мальта Тихоновна',4,'949522, Ивановская область, город Солнечногорск, проезд Славы, 69',55,'+ 7(4942)8956358091',6);
INSERT INTO STAFF VALUES (18,'Куликова Станислава Пётровна',2,'160582, Саратовская область, город Ступино, пл. Домодедовская, 32',39,'+ 7(4942)7309822563',12);
INSERT INTO STAFF VALUES (19,'Игнатьева Любовь Еремеевна',5,'449661, Московская область, город Зарайск, пр. Косиора, 20',31,'+ 7(4942)6215396576',7);
INSERT INTO STAFF VALUES (20,'Калашникова Елена Александровна',4,'355782, Кировская область, город Орехово-Зуево, ул. Ломоносова, 29',25,'+ 7(4942)1183935633',14);
INSERT INTO STAFF VALUES (21,'Колесникова Эстелла Михайловна',7,'788294, Ярославская область, город Раменское, спуск Гагарина, 65',40,'+ 7(4942)3990497306',17);
INSERT INTO STAFF VALUES (22,'Тихонова Ольга Яковлевна',1,'906422, Новосибирская область, город Озёры, пр. Косиора, 80',30,'+ 7(4942)4314723862',11);
INSERT INTO STAFF VALUES (23,'Лобанова Пелагея Максовна',2,'375608, Магаданская область, город Егорьевск, шоссе Славы, 57',60,'+ 7(4942)8376982251',12);
INSERT INTO STAFF VALUES (24,'Захарова Мария Федоровна',3,'581826, Ульяновская область, город Сергиев Посад, проезд Ладыгина, 19',50,'+ 7(4942)1857187563',13);
INSERT INTO STAFF VALUES (25,'Белоусова Юстина Иосифовна',5,'591967, Пензенская область, город Коломна, спуск Домодедовская, 16',33,'+ 7(4942)9187619118',15);

INSERT INTO ILLS VALUES (1,'Суханов Варлаам Вадимович',46,'385687, Рязанская область, город Красногорск, спуск Домодедовская, 68',5,'2021-05-01' ,'2021-07-15' );
INSERT INTO ILLS VALUES (2,'Орлов Герман Глебович',52,'021267, Рязанская область, город Серпухов, бульвар Славы, 05',5,'2021-05-03' ,'2021-07-16' );
INSERT INTO ILLS VALUES (3,'Панов Аполлон Авксентьевич',61,'633647, Тюменская область, город Павловский Посад, бульвар Сталина, 74',5,'2021-05-05' ,'2021-07-17' );
INSERT INTO ILLS VALUES (4,'Зимин Моисей Феликсович',58,'093163, Московская область, город Щёлково, пр. Гоголя, 54',5,'2021-05-07' ,'2021-07-19' );
INSERT INTO ILLS VALUES (5,'Беляков Эдуард Рубенович',44,'299775, Курганская область, город Сергиев Посад, пр. Гоголя, 52',5,'2021-05-08' ,'2021-07-20' );
INSERT INTO ILLS VALUES (6,'Попов Всеволод Дамирович',77,'016655, Свердловская область, город Сергиев Посад, въезд Ленина, 95',5,'2021-05-10' ,'2021-07-22' );
INSERT INTO ILLS VALUES (7,'Кононов Аристарх Богуславович',46,'748097, Самарская область, город Павловский Посад, шоссе Будапештсткая, 20',5,'2021-05-11' ,'2021-07-23' );
INSERT INTO ILLS VALUES (8,'Фёдоров Осип Федосеевич',61,'659259, Ленинградская область, город Кашира, пр. Славы, 72',5,'2021-05-12' ,'2021-07-24' );
INSERT INTO ILLS VALUES (9,'Богданов Анатолий Артёмович',69,'214098, Ивановская область, город Красногорск, пер. Ленина, 63',5,'2021-05-13' ,'2021-07-27' );
INSERT INTO ILLS VALUES (10,'Князев Пантелеймон Эдуардович',86,'025653, Самарская область, город Сергиев Посад, шоссе Гагарина, 21',5,'2021-05-14' ,'2021-07-28' );
INSERT INTO ILLS VALUES (11,'Соловьёв Адриан Михаилович',58,'801828, Волгоградская область, город Можайск, проезд Ломоносова, 02',5,'2021-05-15' ,'2021-07-30' );
INSERT INTO ILLS VALUES (12,'Семёнов Наум Филатович',68,'355506, Белгородская область, город Дмитров, ул. Гоголя, 91',5,'2021-05-17' ,'2021-07-31' );
INSERT INTO ILLS VALUES (13,'Тимофеев Ростислав Романович',59,'490221, Калужская область, город Сергиев Посад, проезд Ладыгина, 85',5,'2021-05-18' ,'2021-08-02' );
INSERT INTO ILLS VALUES (14,'Евдокимов Иннокентий Артемович',61,'705124, Ленинградская область, город Клин, шоссе Домодедовская, 37',5,'2021-05-19' ,'2021-08-05' );
INSERT INTO ILLS VALUES (15,'Макаров Леонтий Христофорович',33,'970165, Тверская область, город Солнечногорск, пр. Домодедовская, 20',1,'2021-05-20' ,'2021-08-06' );
INSERT INTO ILLS VALUES (16,'Шилов Венедикт Иринеевич',83,'058674, Костромская область, город Шатура, наб. Бухарестская, 08',9,'2021-05-21' ,'2021-08-07' );
INSERT INTO ILLS VALUES (17,'Щербаков Аввакуум Филатович',44,'125175, Томская область, город Воскресенск, шоссе Бухарестская, 64',7,'2021-05-25' ,'2021-08-09' );
INSERT INTO ILLS VALUES (18,'Анисимов Мирослав Геласьевич',85,'413580, Ярославская область, город Подольск, спуск Домодедовская, 45',15,'2021-05-26' ,'2021-08-10' );
INSERT INTO ILLS VALUES (19,'Корнилов Владимир Максович',53,'124655, Ивановская область, город Серебряные Пруды, ул. Ленина, 10',13,'2021-05-27' ,'2021-08-11' );
INSERT INTO ILLS VALUES (20,'Корнилов Герасим Серапионович',69,'165109, Воронежская область, город Красногорск, ул. Домодедовская, 47',6,'2021-05-28' ,'2021-08-14' );
INSERT INTO ILLS VALUES (21,'Фролов Федор Германнович',35,'803264, Московская область, город Подольск, пр. Балканская, 06',4,'2021-05-29' ,'2021-08-16' );
INSERT INTO ILLS VALUES (22,'Ширяев Святослав Дмитриевич',76,'004052, Саратовская область, город Озёры, бульвар Космонавтов, 17',12,'2021-06-01' ,'2021-08-18' );
INSERT INTO ILLS VALUES (23,'Жуков Витольд Серапионович',37,'045131, Курганская область, город Луховицы, проезд Космонавтов, 06',11,'2021-06-02' ,'2021-08-19' );
INSERT INTO ILLS VALUES (24,'Иванков Вальтер Степанович',71,'426594, Иркутская область, город Сергиев Посад, наб. Славы, 93',12,'2021-06-03' ,'2021-08-20' );
INSERT INTO ILLS VALUES (25,'Коновалов Виталий Геннадиевич',65,'194087, Рязанская область, город Балашиха, пл. Гагарина, 33',7,'2021-06-05' ,'2021-08-21' );
INSERT INTO ILLS VALUES (26,'Павлова Нинна Денисовна',57,'672565, Тверская область, город Волоколамск, пер. Бухарестская, 76',6,'2021-06-07' ,'2021-08-23' );
INSERT INTO ILLS VALUES (27,'Беляева Фелиция Анатольевна',40,'943073, Курская область, город Кашира, наб. Ломоносова, 83',3,'2021-06-08' ,'2021-08-24' );
INSERT INTO ILLS VALUES (28,'Муравьёва Аделия Фроловна',38,'028709, Новосибирская область, город Щёлково, спуск Ломоносова, 16',11,'2021-06-10' ,'2021-08-25' );
INSERT INTO ILLS VALUES (29,'Белоусова Милиса Лаврентьевна',47,'732928, Владимирская область, город Солнечногорск, бульвар Ладыгина, 57',1,'2021-06-11' ,'2021-08-26' );
INSERT INTO ILLS VALUES (30,'Сидорова Аэлита Донатовна',60,'463132, Тюменская область, город Раменское, спуск Бухарестская, 57',2,'2021-06-14' ,'2021-08-27' );
INSERT INTO ILLS VALUES (31,'Давыдова Тамара Куприяновна',73,'947836, Белгородская область, город Пушкино, пр. Гоголя, 67',11,'2021-06-15' ,'2021-08-28' );
INSERT INTO ILLS VALUES (32,'Бобылёва Хельга Васильевна',25,'181931, Тамбовская область, город Ступино, пр. Космонавтов, 58',11,'2021-06-16' ,'2021-08-30' );
INSERT INTO ILLS VALUES (33,'Белоусова Эстелла Тихоновна',86,'695511, Курская область, город Домодедово, ул. Бухарестская, 19',1,'2021-06-17' ,'2021-09-01' );
INSERT INTO ILLS VALUES (34,'Костина Роксана Иринеевна',52,'776667, Ленинградская область, город Волоколамск, наб. Славы, 81',8,'2021-06-18' ,'2021-09-02' );
INSERT INTO ILLS VALUES (35,'Данилова Зара Владленовна',31,'028304, Смоленская область, город Щёлково, пл. Бухарестская, 08',8,'2021-06-21' ,'2021-09-04' );
INSERT INTO ILLS VALUES (36,'Соболева Дебора Тимуровна',61,'377885, Ивановская область, город Егорьевск, шоссе Бухарестская, 90',3,'2021-06-22' ,'2021-09-06' );
INSERT INTO ILLS VALUES (37,'Мышкина Азиза Михайловна',39,'194735, Псковская область, город Раменское, въезд Чехова, 98',8,'2021-06-23' ,'2021-09-08' );
INSERT INTO ILLS VALUES (38,'Сысоева Евгения Всеволодовна',90,'600279, Ульяновская область, город Шаховская, пр. Ленина, 24',8,'2021-06-24' ,'2021-09-10' );
INSERT INTO ILLS VALUES (39,'Никитина Лилу Онисимовна',82,'643413, Новгородская область, город Красногорск, пер. Домодедовская, 09',8,'2021-06-26' ,'2021-09-11' );
INSERT INTO ILLS VALUES (40,'Пестова Лиана Михаиловна',27,'046652, Волгоградская область, город Домодедово, пл. Балканская, 39',8,'2021-06-28' ,'2021-09-14' );
INSERT INTO ILLS VALUES (41,'Гришина Богдана Лаврентьевна',51,'635284, Новосибирская область, город Щёлково, спуск Будапештсткая, 83',3,'2021-06-30' ,'2021-09-15' );
INSERT INTO ILLS VALUES (42,'Белоусова Санта Серапионовна',82,'855208, Архангельская область, город Дорохово, въезд Домодедовская, 84',15,'2021-07-01' ,'2021-09-16' );
INSERT INTO ILLS VALUES (43,'Полякова Анжиолетта Романовна',87,'750329, Самарская область, город Наро-Фоминск, шоссе Славы, 58',15,'2021-07-02' ,'2021-09-17' );
INSERT INTO ILLS VALUES (44,'Мельникова Дарьяна Владленовна',46,'469481, Свердловская область, город Ногинск, пр. Сталина, 56',1,'2021-07-03' ,'2021-09-18' );
INSERT INTO ILLS VALUES (45,'Силина Сандра Глебовна',41,'733902, Нижегородская область, город Лотошино, ул. Гоголя, 75',15,'2021-07-05' ,'2021-09-21' );
INSERT INTO ILLS VALUES (46,'Крылова Алеся Никитевна',53,'643429, Ростовская область, город Ступино, шоссе Чехова, 66',15,'2021-07-06' ,'2021-09-22' );
INSERT INTO ILLS VALUES (47,'Муравьёва Версавия Еремеевна',76,'243364, Нижегородская область, город Истра, проезд Ломоносова, 26',3,'2021-07-08' ,'2021-09-23' );
INSERT INTO ILLS VALUES (48,'Корнилова Сильва Никитевна',25,'373842, Московская область, город Серпухов, наб. Сталина, 93',15,'2021-07-10' ,'2021-09-24' );
INSERT INTO ILLS VALUES (49,'Кабанова Эрика Рудольфовна',59,'435702, Орловская область, город Мытищи, наб. Ломоносова, 80',3,'2021-07-13' ,'2021-09-27' );
INSERT INTO ILLS VALUES (50,'Осипова Магда Борисовна',50,'357475, Московская область, город Щёлково, ул. Космонавтов, 78',15,'2021-07-14' ,'2021-09-28' );

INSERT INTO ROUTINE VALUES (1,'Массаж',13,'Два раза в неделю',1500);
INSERT INTO ROUTINE VALUES (2,'ЛФК',13,'Каждый день',1000);
INSERT INTO ROUTINE VALUES (3,'Физиотерапия',14,'Каждый день',3000);
INSERT INTO ROUTINE VALUES (4,'Кольпоскопия',14,'Раз в неделю',1000);
INSERT INTO ROUTINE VALUES (5,'Гастроскопия',14,'Два раза в месяц',500);
INSERT INTO ROUTINE VALUES (6,'МРТ',16,'Два раза в год',6000);
INSERT INTO ROUTINE VALUES (7,'УЗИ',16,'Два раза в год',1000);
INSERT INTO ROUTINE VALUES (8,'ЭКГ',16,'Два раза в год',600);
INSERT INTO ROUTINE VALUES (9,'Флюрография',12,'Два раза в год',500);
INSERT INTO ROUTINE VALUES (10,'Общий анализ',12,'Каждый день',300);

INSERT INTO TREATMENT VALUES (1,1);
INSERT INTO TREATMENT VALUES (1,4);
INSERT INTO TREATMENT VALUES (2,2);
INSERT INTO TREATMENT VALUES (3,1);
INSERT INTO TREATMENT VALUES (3,3);
INSERT INTO TREATMENT VALUES (3,6);
INSERT INTO TREATMENT VALUES (4,7);
INSERT INTO TREATMENT VALUES (5,8);
INSERT INTO TREATMENT VALUES (5,17);
INSERT INTO TREATMENT VALUES (5,20);
INSERT INTO TREATMENT VALUES (6,1);
INSERT INTO TREATMENT VALUES (6,5);
INSERT INTO TREATMENT VALUES (6,6);
INSERT INTO TREATMENT VALUES (6,19);
INSERT INTO TREATMENT VALUES (7,15);
INSERT INTO TREATMENT VALUES (8,9);
INSERT INTO TREATMENT VALUES (8,11);
INSERT INTO TREATMENT VALUES (8,13);
INSERT INTO TREATMENT VALUES (9,17);
INSERT INTO TREATMENT VALUES (9,18);
INSERT INTO TREATMENT VALUES (10,7);
INSERT INTO TREATMENT VALUES (10,8);
INSERT INTO TREATMENT VALUES (10,9);
INSERT INTO TREATMENT VALUES (10,10);
INSERT INTO TREATMENT VALUES (10,11);
INSERT INTO TREATMENT VALUES (10,12);
INSERT INTO TREATMENT VALUES (11,13);
INSERT INTO TREATMENT VALUES (11,18);
INSERT INTO TREATMENT VALUES (12,21);
INSERT INTO TREATMENT VALUES (12,25);
INSERT INTO TREATMENT VALUES (12,16);
INSERT INTO TREATMENT VALUES (13,16);
INSERT INTO TREATMENT VALUES (14,10);
INSERT INTO TREATMENT VALUES (14,12);
INSERT INTO TREATMENT VALUES (15,10);

INSERT INTO EVENTS VALUES (1,2);
INSERT INTO EVENTS VALUES (2,2);
INSERT INTO EVENTS VALUES (4,2);
INSERT INTO EVENTS VALUES (5,10);
INSERT INTO EVENTS VALUES (5,6);
INSERT INTO EVENTS VALUES (5,7);
INSERT INTO EVENTS VALUES (5,8);
INSERT INTO EVENTS VALUES (5,9);
INSERT INTO EVENTS VALUES (6,7);
INSERT INTO EVENTS VALUES (7,7);
INSERT INTO EVENTS VALUES (1,3);
INSERT INTO EVENTS VALUES (3,3);
INSERT INTO EVENTS VALUES (8,10);
INSERT INTO EVENTS VALUES (9,2);
INSERT INTO EVENTS VALUES (10,10);
INSERT INTO EVENTS VALUES (12,4);
INSERT INTO EVENTS VALUES (12,5);
INSERT INTO EVENTS VALUES (13,5);
INSERT INTO EVENTS VALUES (13,10);
INSERT INTO EVENTS VALUES (14,6);
INSERT INTO EVENTS VALUES (14,8);
INSERT INTO EVENTS VALUES (14,9);
INSERT INTO EVENTS VALUES (15,9);
INSERT INTO EVENTS VALUES (15,10);

CREATE TABLE public.DEL_DRUGS (
	DEL_DID serial NOT NULL,
	DEL_DNAME varchar NOT NULL,
	DEL_DKOL varchar NOT NULL,
	DEL_DTIME varchar,
	DEL_DDATE date)
WITH (OIDS=FALSE);

Create or replace function LOG_DEL_DRUGS()
Returns trigger as
$$
Begin
	Insert into DEL_DRUGS
( DEL_DID,DEL_DNAME,DEL_DKOL,DEL_DTIME,DEL_DDATE)
	Values
( OLD.DID, OLD.DNAME, OLD.DKOL, OLD.DTIME, current_date);
RETURN OLD;
End;
$$
LANGUAGE 'plpgsql';

Create or replace trigger LOG_DEL_TRIG
AFTER DELETE
ON DRUGS
FOR EACH ROW
EXECUTE FUNCTION LOG_DEL_DRUGS();

CREATE TABLE public.UP_ILLS (
	UP_IID serial NOT NULL,
	UP_IFIO varchar NOT NULL,
	UP_IAGE int NOT NULL,
	UP_IADRESS varchar NOT NULL,
	UP_ICID int NOT NULL,
	UP_IBEGIN date NOT NULL,
	UP_IEND date NOT NULL)
WITH (OIDS=FALSE);
	
Create or replace function LOG_UP_ILLS()
Returns trigger as
$$
Begin
	Insert into UP_ILLS
( UP_IID,UP_IFIO,UP_IAGE,UP_IADRESS,UP_ICID,UP_IBEGIN,UP_IEND)
	Values
( OLD.IID, OLD.IFIO, OLD.IAGE, OLD.IADRESS, OLD.ICID, OLD.IBEGIN, OLD.IEND);
RETURN NEW;
End;
$$
LANGUAGE 'plpgsql';

Create or replace trigger LOG_UP_TRIG
AFTER UPDATE
ON ILLS
FOR EACH ROW
EXECUTE FUNCTION LOG_UP_ILLS();
