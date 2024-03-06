-- ������ ����
//��ü ���� ��ȸ
select * from DIC;

//���̺� ��ȸ (���� ����� ����)
select talbe_name from user_tables;

//��ü ���̺� ��ȸ (system �����ڸ� ����)
select * from DBA_TABELS;

//��ü ����� ��ȸ (system �����ڸ� ����)
select * from DBA_USERS;

//�ε���
// ���� ����� �ε��� ��ȸ
select * from USER_INDEXES;

//���� ����� �ε��� ���� ��ȸ
select * from USER_IND_COLUMNS;

//�ε��� ����
create index IDX_USER1_UID on USER1(id);
select * from USER_IND_COLUMNS;

//�ε��� ����

drop INDEX IDX_USER1_UID;
select * from USER_IND_COLUMNS;

//��
//�� ����
create view VW_USER1 as (select name, hp, age from user1);
create view VW_USER2_AGE_UNDER30 as (select * from user2 where age <30);
select * from user_views;

//�� ��ȸ
select * from VW_USER1;
select * from VW_USER2_AGE_UNDER30;

//�� ����
drop view VW_USER1;
drop view VW_USER2_AGE_UNDER30;

//������
//������ ���� ���̺� ����
create table user6(
    seq number PRIMARY KEY,
    `name` VARCHAR2(20),
    `gender` char(1),
    age number,
    addr VARCHAR2(255)
);

//������ ����
create SEQUENCE seq_user6 INCREMENT by 1 start with 1;

//������ �� �Է�
insert into user6 values (seq_user5.nextval, '������','M',25,'���ؽ�');

//����� ����
// ����� ����
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER ���̵� identified by ��й�ȣ;


//4-2. ����� ��ȸ(SYSTEM ����)

// ��ü ����� ��ȸ

 SELECT * FROM ALL_USERS;

// Ư�� ����� ��ȸ
 SELECT * FROM ALL_USERS WHERE USERNAME='���̵�(�빮��)';

//����� ����(SYSTEM ����)

// ����� ��й�ȣ ����
 ALTER USER ���̵� IDENTIFIED BY �����й�ȣ;

// ����� ����
 DROP USER ���̵�;
// ����ڿ� �ش� ����� ��ü(���̺� ��) ��� ����
 DROP USER ���̵� CASCADE;
 

// ���� �� ���� ���� �ο�
 GRANT CONNECT, RESOURCE TO ���̵�; 

// ���̺� �����̽�(���̺� ���� ���� ����) �Ҵ緮 ���� �ο�
GRANT UNLIMITED TABLESPACE TO ���̵�;

