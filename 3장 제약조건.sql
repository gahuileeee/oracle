//�⺻Ű �ǽ�

create table user2(
    id varchar2(20) primary key,
    name varchar2(20),
    hp char(13),
    age number(2)
);

//����Ű
create table user3(
    id varchar(20) PRIMARY KEY,
    name VARCHAR2(20),
    hp CHAR(13) UNIQUE,
    age number(3)
);

//�ܷ�Ű
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
 
 insert into parent values ('p101','�輭��','010-1234-1001');
 insert into parent values ('p102','�̼���','010-1234-1002');
 insert into parent values ('p103','�Ż��Ӵ�','010-1234-1003');
 
 insert into child values ('c101','������','010-1234-2001','p101');
 insert into child values ('c102','�̹��','010-1234-2002','p102');
 insert into child values ('c103','�̹��','010-1234-2003','p102');
 insert into child values ('c104','����','010-1234-2004','p103'); 
 
 //default�� not null
 create table user4(
  name VARCHAR2(20) not null,
  gender char(1) not null,
  age int default 1,
  addr VARCHAR2(255)
 );
 
 insert into user4 values ('������','M',23,'���ؽ�');
 insert into user4 values ('������','M',21,'���ֽ�'); 
 insert into user4 (name, gender, addr) values ('�Ż��Ӵ�','F','������');
 insert into user4 (name,gender) values ('�̼���','M');
 insert into user4 (name, age) values ('�����',33); //���� (not null �������� ����)
 
 //check (������ �� �ִ� ���� ���� �Ǵ� ���ָ� ����)
 create table user5(
  name VARCHAR2(20) not null,
  gender char(1) not null CHECK(gender in ('M','F')),
  age int DEFAULT 1 check(age >0 and age<100),
  addr VARCHAR2(255)
 );
 
 insert into user5 values ('������' ,'M',23,'���ؽ�');
 insert into user5 VALUES ('������','M',21,'���ֽ�');
 insert into user5 (name, gender, addr) VALUES ('�Ż��Ӵ�','F','������');
 insert into user5 (name, gender) VALUES ('�̼���','M');
 insert into user5 (name, age) VALUES ('�����',33); //���� not null �������� ����