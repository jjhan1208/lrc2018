CREATE TABLE `sawon` (
  `id` varchar(30) NOT NULL,
  `pw` varchar(15) NOT NULL,
  `grade` varchar(12),
  `name` varchar(15) NOT NULL,
  `phone` varchar(11) NOT NULL,
  'email' varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into sawon values('jjhan1208', 'dhlrc2018^^', '관리자', '김진한', '01038090981', 'jjhan1208@naver.com');

commit;

select * from sawon;

CREATE TABLE `job_assignment` (
  `num` int auto_increment,
  `space` varchar(50) NOT NULL,
  `job_separ_1` varchar(50) NOT NULL,
  `job_separ_2` varchar(50),
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from job_assignment;

create table paint_price(
	num int auto_increment,
	brand varchar(30) not null,
	commodity varchar(150) not null,
	volumne int,
	unit varchar(10),
	area int,
	unitprice int,
	remark varchar(100),
	jobnum int REFERENCES job_assignment(num),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table mat_price(
	num int auto_increment,
	brand varchar(30) not null,
	commodity varchar(150) not null,
	symbol varchar(50) not null,
	volumne int,
	unit varchar(10),
	area int,
	unitprice int,
	remark varchar(100),
	jobnum int REFERENCES job_assignment(num),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table pay_price(
	num int auto_increment,
	job_separ_3 varchar(50),
	region varchar(15),
	able varchar(20),
	contition1 varchar(20),
	contition2 varchar(20),
	contition3 varchar(20),
	area varchar(20),
	unit VARCHAR(10),
	unitprice int,
	remark varchar(100),
	jobnum int REFERENCES job_assignment(num),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table calculation(
	num int auto_increment,
	standard VARCHAR(30),
	contition1 varchar(20),
	contition2 varchar(20),
	contition3 varchar(20),
	unit varchar(10),
	consum DOUBLE,
	volume int,
	remark varchar(100),
	jobnum int REFERENCES job_assignment(num),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table commision(
	num int auto_increment,
	office_name VARCHAR(30),
	justnum int,
	ceo varchar(20),
	hp varchar(20),
	tel varchar(10),
	address varchar(200),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table manager(
	num int auto_increment,
	name VARCHAR(30),
	duty VARCHAR(20),
	hp varchar(20),
	office varchar(20),
	birthday varchar(20),
	born varchar(30),
	apt_name varchar(50),
	workstart date,
	workend date,
	home_add varchar(200),
	remark varchar(100),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table delegate(
	num int auto_increment,
	apt_name varchar(50),
	name VARCHAR(30),
	respons VARCHAR(20),
	hp varchar(20),
	email varchar(100),
	former varchar(20),
	home_add varchar(200),
	born varchar(30),
	workstart date,
	workend date,
	remark varchar(100),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table lrc_office(
	num int auto_increment,
	office_name varchar(20),
	ceo varchar(10),
	tel varchar(20),
	fax varchar(20),
	homepage varchar(100),
	email varchar(50),
	address varchar(150),
	remark varchar(50),
	PRIMARY KEY (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table lrc_staff(
	num int auto_increment,
	name varchar(10),
	repons varchar(20),
	officenum int references lec_office(num),
	hp varchar(20),
	email varchar(50),
	startdate date,
	enddate date,
	birthday date,
	born varchar(20),
	remark varchar(50),
	PRIMARY key (num)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;