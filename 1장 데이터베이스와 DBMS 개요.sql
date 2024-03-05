
-- 실습하기 1.2 Number 자료형 이해

create table type_test_number(
    num1 number,
    num2 number(2),
    num3 number(3,1),
    num4 number(4,2),
    num5 number(5,6)
);

//num1 number -> 모두 잘 저장됨
insert into type_test_number (num1) values (1);
insert into type_test_number (num1) values (123);
insert into type_test_number (num1) values (123.73);
insert into type_test_number (num1) values (123.12345);

//num2 number(2)
INSERT into type_test_number (num2) VALUES (12);
INSERT into type_test_number (num2) VALUES (123); //오류 발생
INSERT into type_test_number (num2) VALUES (1.2); //1로 저장
INSERT into type_test_number (num2) VALUES (1.23); //1로 저장
INSERT into type_test_number (num2) VALUES (12.34567); //12로 저장
INSERT into type_test_number (num2) VALUES (12.56789); //13으로 저장
INSERT into type_test_number (num2) VALUES (123.56789); //오류 발생

//num3 number(3,1)
INSERT into type_test_number (num3) VALUES (12);
INSERT into type_test_number (num3) VALUES (123); //오류 발생(소숫점 포함 3자리임)
INSERT into type_test_number (num3) VALUES (1.2); 
INSERT into type_test_number (num3) VALUES (1.23); //1.2로 저장
INSERT into type_test_number (num3) VALUES (12.34567); //12.3으로 저장
INSERT into type_test_number (num3) VALUES (12.56789); //12.6으로 저장
INSERT into type_test_number (num3) VALUES (123.56789); //오류 발생

-- 실습하기 1-3 문자형 자료형 이해
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
insert into TYPE_TEST_CHAR (char1) values ('가'); //오류
//VARCHAR2
insert into TYPE_TEST_CHAR (vchar1) values ('A');
insert into TYPE_TEST_CHAR (vchar2) values ('AB');
insert into TYPE_TEST_CHAR (vchar3) values ('가'); //모두 정상적으로 들어감
//NVARCHAR2
insert into TYPE_TEST_CHAR (nvchar1) values ('A');
insert into TYPE_TEST_CHAR (nvchar2) values ('AB');
insert into TYPE_TEST_CHAR (nvchar3) values ('가나다'); //모두 정상적으로 들어감