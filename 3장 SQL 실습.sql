-- �ǽ� 1-1 �ǽ� ���̺� ����
//�μ� ���̺�
create table dept (
    depno number(2) constraint pk_dept primary key,
    dname varchar2(14),
    loc varchar2(13)
);

// ���� ���̺�
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

// �޿� ���̺�
create table salgrade (
grade number,
losal number,
hisal NUMBER
);

-- �ǽ� ���̺� ������ �Է�
// �μ� ���̺� ������ �Է�
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

// ���� ���̺� ������ �Է�
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

// �޿� ��� ���̺� ������ �Է�
INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

-- �⺻ ������ ��ȸ
select * from emp;
select empno, ename, deptno from emp;

-- ����
//������ ��ȸ ����
select * from emp order by sal;
select * from emp order by sal desc;
select * from emp order by deptno asc, sal desc;

--�ߺ����ſ� ��Ī
select distinct deptno from emp;
select DISTINCT job, deptno from emp;
select ename, sal , sal*12+comm, comm from emp;
select ename, sal, sal*12+comm as annsal, comm from emp;

-- where ���� ������
// �پ��� �������� ������ ��ȸ
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

//���� ������
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 20;

--SQL ���� �Լ�

//���ڱ���
select ename, length(ename) from emp;

//Upper, Lowser: ���� ��ҹ���
select ename, upper(ename), lower(ename), initcap(ename) from emp;

// subst : ���� �ڸ���
select job, substr(job, 1,2), substr(job,3,2), substr(job,5) from emp;

// instr: ���� ��ġ
select instr('hello oracle!','l')as instar_1, instr('hello oracle!','l',-1) as instra_2 from dual;

//replace: ���� ��ü
SELECT '010-1234-5678', REPLACE('010-1234-5678', '-', '') FROM DUAL;

//lpad, rpad : ���� ä���
select lpad('oracle',10,'#') as lpad, rpad('oracle',10,'*') as rpad from dual;

// concat ���ڿ���
select concat (empno, ename) from emp where ename = 'SCOTT';
select empno || ename from emp where ename = 'SCOTT';

// trim : ���� ���� ����
SELECT
'[ _Oracle_ ]' AS BEFORE, '[' || TRIM(' _Oracle_ ') || ']' AS TRIM FROM DUAL;

//SQL ���� �Լ�

//sum: �հ�
select sum(sal) as �հ� from emp;

//count : ����
select count(*) as ��ü���� from emp;
select count(comm) as comm_���� from emp;

// avg: ���
select avg(sal) as ��� from emp;
select count(comm) as comm_���� from emp;

//round �ݿø�
select round(123.56) as round, round (123.56,0) round_0, 
round(123.56,1) as round_1, round(123.56,2) as round_2 from DUAL;

// ceil, floor : �Ҽ��� �ø�, ����
select ceil(3.14), ceil (3.78), floor(3.14), floor(3.78) from DUAL;

-- sql ��¥ �Լ�

//sysdate: ��¥ �ð� ��ȸ
select sysdate , sysdate -1, sysdate +1 from dual;

// add_months : �� ���� ���� ��¥ ��ȸ
select add_months(sysdate, 1), add_months(sysdate, -1) from DUAL;

-- sql ��Ÿ �Լ�

//to_char: ��¥ �����͸� ���� �����ͷ� ��ȯ
select to_char(sysdate, 'yyyy') as yyyy,
to_char(sysdate, 'mm') as mm,
to_char(sysdate,'DD') as dd,
to_char(sysdate, 'hh24') as hh24,
to_char(sysdate, 'mi') as mi,
to_char(sysdate, 'ss') as ssm,
to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') as ��¥�ð�
from DUAL;

//to_Date : ���� �����͸� ��¥ �����ͷ� ��ȯ
select to_date('20180714', 'YYYY/MM/DD') as ��¥1,
to_Date('180714','YY-MM-DD') as ��¥2,
to_date(sysdate, 'YYYY/MM/DD HH24:MI:SS') as ��¥�ð�
from DUAL;

//nvl(�÷���, null�̸� �ش� �� ���), nvl2 : null üũ �Լ�
select empno, ename, sal, comm, nvl(comm,0), nvl2(comm, 'null�ƴ�','null ����') from emp;

-- �׷�ȭ
select avg(sal), deptno from emp group by deptno;
select avg(sal), deptno from emp group by deptno , job;

--Having
select deptno, job, avg(sal) from emp group by deptno, job having avg(sal) >=2000;

select deptno, job, avg(sal) from emp where sal <=3000 group by deptno, job
having avg(sal) >=2000 order by deptno, job;

--join
//���� ����
select * from emp e join dept d on e.deptno = d.depno;

select * from emp e join dept d using(deptno);

select * from emp e, dept d where e.deptno = d.depno;

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.deptno, d.dname, d.loc
from emp e join dept d on e.deptno= d.depno where sal<=3000 order by e.deptno, empno;

//�ܺ�����
select * from emp e1 left join emp e2 on e1.mgr = e2.empno;
select * from emp e1 right join emp e2 on e1.mgr= e2.empno;
