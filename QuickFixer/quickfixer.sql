CREATE DATABASE quickfixer;

USE quickfixer;

CREATE TABLE `authorities_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
)

insert into authorities_tbl(id,authority) 
	values(1,'ROLE_ADMIN');
insert into authorities_tbl(id,authority) 
	values(2,'ROLE_USER');

CREATE TABLE `user_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `authority_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_tbl_ibfk_1` (`authority_id`),
  CONSTRAINT `user_tbl_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authorities_tbl` (`id`)
);

-- admin@123 - password
insert into tbl_user(name, password, gender, nationality, licence, authority_id)
	values('admin','$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu','Male','Indian','LIC123',1);	

CREATE TABLE `address_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseNumber` varchar(255) DEFAULT NULL,
  `society` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ticket_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `crt_date` datetime NOT NULL,
  `upd_date` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `ticket_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`id`),
  CONSTRAINT `ticket_tbl_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address_tbl` (`id`)
);

