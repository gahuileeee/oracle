-- 실습 1-1 실습 테이블 생성
//부서 테이블
create table dept (
    depno number(2) constraint pk_dept primary key,
    dname varchar2(14),
    loc varchar2(13)
);

// 직원 테이블
create table emp (
 empno number(4) constraint pk_emp primary key,
 ename VARCHAR2(10),
 job VARCHAR2(9),
 mgr NUMBER(4),
 hiredate date,
 sal number(7,2),
 comm number (7,2),
 deptno number(2) constraint fk_deptino references dept
);

// 급여 테이블
create table salgrade (
grade number,
losal number,
hisal NUMBER
);

-- 실습 테이블 데이터 입력
// 부서 테이블 데이터 입력
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

// 직원 테이블 데이터 입력
INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, '80-12-17', 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '81-02-20',1600,300,30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, '81-02-22', 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, '81-02-04',2975,NULL,20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '81-09-28',1250,1400,30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, '81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, '81-06-09',2450,NULL,10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, '87-04-19',3000,NULL,20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, '81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, '81-09-08',1500,0,30);
INSERT INTO EMP VALUES (7876, 'ADAMS','CLERK', 7788, '87-05-23',1100,NULL,20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, '81-12-03', 950,NULL,30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981', 'dd-mm-yyyy'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782,to_date('23-1-1982', 'dd-mm-yyyy'), 1300, NULL, 10);

// 급여 등급 테이블 데이터 입력
INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

-- 기본 데이터 조회
select * from emp;
select empno, ename, deptno from emp;

-- 정렬
//데이터 조회 정렬
select * from emp order by sal;
select * from emp order by sal desc;
select * from emp order by deptno asc, sal desc;

--중복제거와 별칭
select distinct deptno from emp;
select DISTINCT job, deptno from emp;
select ename, sal , sal*12+comm, comm from emp;
select ename, sal, sal*12+comm as annsal, comm from emp;

-- where 절과 연산자
// 다양한 조건으로 데이터 조회
select * from emp where demptno = 30;
select * from emp where deptno=30 and job= 'salesman';
select * from emp where deptno=30 or job='clerk';

SELECT * FROM EMP WHERE SAL * 12 = 36000;
SELECT * FROM EMP WHERE SAL >= 3000;
SELECT * FROM EMP WHERE SAL != 3000;
SELECT * FROM EMP WHERE SAL <> 3000;
SELECT * FROM EMP WHERE NOT SAL = 3000;
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
SELECT * FROM EMP WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
SELECT * FROM EMP WHERE ENAME LIKE '_L%';
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';
SELECT * FROM EMP WHERE COMM = NULL;
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;

//집합 연산자
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 20;

--SQL 문자 함수

//문자길이
select ename, length(ename) from emp;

//Upper, Lowser: 문자 대소문자
select ename, upper(ename), lower(ename), initcap(ename) from emp;

// subst : 문자 자르기
select job, substr(job, 1,2), substr(job,3,2), substr(job,5) from emp;

// instr: 문자 위치
select instr('hello oracle!','l')as instar_1, instr('hello oracle!','l',-1) as instra_2 from dual;

//replace: 문자 교체
SELECT '010-1234-5678', REPLACE('010-1234-5678', '-', '') FROM DUAL;

//lpad, rpad : 문자 채우기
select lpad('oracle',10,'#') as lpad, rpad('oracle',10,'*') as rpad from dual;

// concat 문자연결
select concat (empno, ename) from emp where ename = 'SCOTT';
select empno || ename from emp where ename = 'SCOTT';

// trim : 문자 공백 제거
SELECT
'[ _Oracle_ ]' AS BEFORE, '[' || TRIM(' _Oracle_ ') || ']' AS TRIM FROM DUAL;

//SQL 숫자 함수

//sum: 합계
select sum(sal) as 합계 from emp;

//count : 갯수
select count(*) as 전체갯수 from emp;
select count(comm) as comm_갯수 from emp;

// avg: 평균
select avg(sal) as 평균 from emp;
select count(comm) as comm_갯수 from emp;

//round 반올림
select round(123.56) as round, round (123.56,0) round_0, 
round(123.56,1) as round_1, round(123.56,2) as round_2 from DUAL;

// ceil, floor : 소수점 올림, 내림
select ceil(3.14), ceil (3.78), floor(3.14), floor(3.78) from DUAL;

-- sql 날짜 함수

//sysdate: 날짜 시간 조회
select sysdate , sysdate -1, sysdate +1 from dual;

// add_months : 몇 개월 이후 날짜 조회
select add_months(sysdate, 1), add_months(sysdate, -1) from DUAL;

-- sql 기타 함수

//to_char: 날짜 데이터를 문자 데이터로 변환
select to_char(sysdate, 'yyyy') as yyyy,
to_char(sysdate, 'mm') as mm,
to_char(sysdate,'DD') as dd,
to_char(sysdate, 'hh24') as hh24,
to_char(sysdate, 'mi') as mi,
to_char(sysdate, 'ss') as ssm,
to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') as 날짜시간
from DUAL;

//to_Date : 문제 데이터를 날짜 데이터로 변환
select to_date('20180714', 'YYYY/MM/DD') as 날짜1,
to_Date('180714','YY-MM-DD') as 날짜2,
to_date(sysdate, 'YYYY/MM/DD HH24:MI:SS') as 날짜시간
from DUAL;

//nvl(컬럼명, null이면 해당 값 출력), nvl2 : null 체크 함수
select empno, ename, sal, comm, nvl(comm,0), nvl2(comm, 'null아님','null 맞음') from emp;

-- 그룹화
select avg(sal), deptno from emp group by deptno;
select avg(sal), deptno from emp group by deptno , job;

--Having
select deptno, job, avg(sal) from emp group by deptno, job having avg(sal) >=2000;

select deptno, job, avg(sal) from emp where sal <=3000 group by deptno, job
having avg(sal) >=2000 order by deptno, job;

--join
//내부 조인
select * from emp e join dept d on e.deptno = d.depno;

select * from emp e join dept d using(deptno);

select * from emp e, dept d where e.deptno = d.depno;

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.deptno, d.dname, d.loc
from emp e join dept d on e.deptno= d.depno where sal<=3000 order by e.deptno, empno;

//외부조인
select * from emp e1 left join emp e2 on e1.mgr = e2.empno;
select * from emp e1 right join emp e2 on e1.mgr= e2.empno;
