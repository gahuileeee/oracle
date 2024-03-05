//기본키 실습

create table user2(
    id varchar2(20) primary key,
    name varchar2(20),
    hp char(13),
    age number(2)
);

//고유키
create table user3(
    id varchar(20) PRIMARY KEY,
    name VARCHAR2(20),
    hp CHAR(13) UNIQUE,
    age number(3)
);

//외래키
CREATE table parent (
 pid VARCHAR2(20) primary key,
 name VARCHAR2(20),
 hp CHAR(13) UNIQUE
 );
 
 CREATE table child(
 cid VARCHAR2(20) PRIMARY key,
 name VARCHAR2(20),
 hp char(13) unique,
 parent varchar(20),
 FOREIGN key (parent) references parent (pid)
 );
 
 insert into parent values ('p101','김서현','010-1234-1001');
 insert into parent values ('p102','이성계','010-1234-1002');
 insert into parent values ('p103','신사임당','010-1234-1003');
 
 insert into child values ('c101','김유신','010-1234-2001','p101');
 insert into child values ('c102','이방우','010-1234-2002','p102');
 insert into child values ('c103','이방원','010-1234-2003','p102');
 insert into child values ('c104','이이','010-1234-2004','p103'); 
 
 //default와 not null
 create table user4(
  name VARCHAR2(20) not null,
  gender char(1) not null,
  age int default 1,
  addr VARCHAR2(255)
 );
 
 insert into user4 values ('김유신','M',23,'김해시');
 insert into user4 values ('김춘추','M',21,'경주시'); 
 insert into user4 (name, gender, addr) values ('신사임당','F','강릉시');
 insert into user4 (name,gender) values ('이순신','M');
 insert into user4 (name, age) values ('정약용',33); //에러 (not null 제약조건 위배)
 
 //check (저장할 수 있는 값의 범위 또는 범주를 정의)
 create table user5(
  name VARCHAR2(20) not null,
  gender char(1) not null CHECK(gender in ('M','F')),
  age int DEFAULT 1 check(age >0 and age<100),
  addr VARCHAR2(255)
 );
 
 insert into user5 values ('김유신' ,'M',23,'김해시');
 insert into user5 VALUES ('김춘추','M',21,'경주시');
 insert into user5 (name, gender, addr) VALUES ('신사임당','F','강릉시');
 insert into user5 (name, gender) VALUES ('이순신','M');
 insert into user5 (name, age) VALUES ('정약용',33); //에러 not null 제약조건 위배