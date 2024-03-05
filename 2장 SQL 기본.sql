-- 1.1 테이블 생성 + 테이블 제거
create table user1 (
    ID varchar2(20),
    NAME varchar2(20),
    HP char(13),
    AGE NUMBER
);
drop table user1;

//데이터 추가(insert)
insert into user1 values ('a101','김유신','010-1234-1111',25);
insert into user1 (id, name, age) values ('a102','강감찬',45);

//데이터 조회
select * from user1;
select * from user1 WHERE id='a101';
select * from user1 where age >30;
select id, name, age from user1;

//데이터 수정
update user1 set hp='010-1234-4444' where id='a101';
update user1 set age=51 where id='a102';
UPDATE user1 set hp='010-1111-2222' , age =27 where id='a101';

//데이터 삭제
delete from user1 where id= 'a101';
delete from user1 WHere id='a102' and age= 25;
DELETE FROM user1 where age>=30;