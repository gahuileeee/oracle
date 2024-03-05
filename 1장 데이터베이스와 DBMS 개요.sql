
-- �ǽ��ϱ� 1.2 Number �ڷ��� ����

create table type_test_number(
    num1 number,
    num2 number(2),
    num3 number(3,1),
    num4 number(4,2),
    num5 number(5,6)
);

//num1 number -> ��� �� �����
insert into type_test_number (num1) values (1);
insert into type_test_number (num1) values (123);
insert into type_test_number (num1) values (123.73);
insert into type_test_number (num1) values (123.12345);

//num2 number(2)
INSERT into type_test_number (num2) VALUES (12);
INSERT into type_test_number (num2) VALUES (123); //���� �߻�
INSERT into type_test_number (num2) VALUES (1.2); //1�� ����
INSERT into type_test_number (num2) VALUES (1.23); //1�� ����
INSERT into type_test_number (num2) VALUES (12.34567); //12�� ����
INSERT into type_test_number (num2) VALUES (12.56789); //13���� ����
INSERT into type_test_number (num2) VALUES (123.56789); //���� �߻�

//num3 number(3,1)
INSERT into type_test_number (num3) VALUES (12);
INSERT into type_test_number (num3) VALUES (123); //���� �߻�(�Ҽ��� ���� 3�ڸ���)
INSERT into type_test_number (num3) VALUES (1.2); 
INSERT into type_test_number (num3) VALUES (1.23); //1.2�� ����
INSERT into type_test_number (num3) VALUES (12.34567); //12.3���� ����
INSERT into type_test_number (num3) VALUES (12.56789); //12.6���� ����
INSERT into type_test_number (num3) VALUES (123.56789); //���� �߻�

-- �ǽ��ϱ� 1-3 ������ �ڷ��� ����
CREATE TABLE TYPE_TEST_CHAR (
char1 CHAR(1),
char2 CHAR(2),
char3 CHAR(3),
vchar1 VARCHAR2(1),
vchar2 VARCHAR2(2),
vchar3 VARCHAR2(3),
nvchar1 NVARCHAR2(1),
nvchar2 NVARCHAR2(2),
nvchar3 NVARCHAR2(3)
);

//CHAR
insert into TYPE_TEST_CHAR (char1) values ('A');
insert into TYPE_TEST_CHAR (char1) values ('��'); //����
//VARCHAR2
insert into TYPE_TEST_CHAR (vchar1) values ('A');
insert into TYPE_TEST_CHAR (vchar2) values ('AB');
insert into TYPE_TEST_CHAR (vchar3) values ('��'); //��� ���������� ��
//NVARCHAR2
insert into TYPE_TEST_CHAR (nvchar1) values ('A');
insert into TYPE_TEST_CHAR (nvchar2) values ('AB');
insert into TYPE_TEST_CHAR (nvchar3) values ('������'); //��� ���������� ��