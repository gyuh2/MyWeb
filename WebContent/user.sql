create table user(
	userID varchar(20) primary key,
	userPassword varchar(20) not null,
	userName varchar(20) not null,
	userAge varchar(10) not null,
	userGender varchar(10) not null,
	userEmail varchar(30) not null,
	userPhone varchar(20) not null,
	userReg_date timestamp default current_timestamp
);