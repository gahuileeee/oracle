-- 데이터 사전
//전체 사전 조회
select * from DIC;

//테이블 조회 (현재 사용자 기준)
select talbe_name from user_tables;

//전체 테이블 조회 (system 관리자만 가능)
select * from DBA_TABELS;

//전체 사용자 조회 (system 관리자만 가능)
select * from DBA_USERS;

//인덱스
// 현재 사용자 인덱스 조회
select * from USER_INDEXES;

//현재 사용자 인덱스 정보 조회
select * from USER_IND_COLUMNS;

//인덱스 생성
create index IDX_USER1_UID on USER1(id);
select * from USER_IND_COLUMNS;

//인덱스 삭제

drop INDEX IDX_USER1_UID;
select * from USER_IND_COLUMNS;

//뷰
//뷰 생성
create view VW_USER1 as (select name, hp, age from user1);
create view VW_USER2_AGE_UNDER30 as (select * from user2 where age <30);
select * from user_views;

//뷰 조회
select * from VW_USER1;
select * from VW_USER2_AGE_UNDER30;

//뷰 삭제
drop view VW_USER1;
drop view VW_USER2_AGE_UNDER30;

//시퀀스
//시퀀스 전용 테이블 생성
create table user6(
    seq number PRIMARY KEY,
    `name` VARCHAR2(20),
    `gender` char(1),
    age number,
    addr VARCHAR2(255)
);

//시퀀스 생성
create SEQUENCE seq_user6 INCREMENT by 1 start with 1;

//시퀀스 값 입력
insert into user6 values (seq_user5.nextval, '김유신','M',25,'김해시');

//사용자 권한
// 사용자 생성
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER 아이디 identified by 비밀번호;


//4-2. 사용자 조회(SYSTEM 접속)

// 전체 사용자 조회

 SELECT * FROM ALL_USERS;

// 특정 사용자 조회
 SELECT * FROM ALL_USERS WHERE USERNAME='아이디(대문자)';

//사용자 변경(SYSTEM 접속)

// 사용자 비밀번호 변경
 ALTER USER 아이디 IDENTIFIED BY 변경비밀번호;

// 사용자 삭제
 DROP USER 아이디;
// 사용자와 해당 사용자 객체(테이블 등) 모두 삭제
 DROP USER 아이디 CASCADE;
 

// 접속 및 생성 권한 부여
 GRANT CONNECT, RESOURCE TO 아이디; 

// 테이블 스페이스(테이블 파일 생성 공간) 할당량 권한 부여
GRANT UNLIMITED TABLESPACE TO 아이디;

