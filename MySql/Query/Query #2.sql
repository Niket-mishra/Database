use organization;
--- 0
select * from emp;
--- 1
select * from emp order by ename; 
--- 2
select * from emp where DEPTNO  IN (20, 30) order by DEPTNO;
--- 3
select * from emp where JOB = "MANAGER" order by ename;
--- 4
select * from emp where SAL between 2000 and 3000 order by SAL desc;
--- 5
select * from emp where COMM is null ;
--- 6
select ENAME, SAL, COMM, (SAL + ifnull(COMM, 0))  as "total_salary" 
from emp;
--- 7
ALTER TABLE emp ADD CurrentDate varchar(255) ;
select CurrentDate from emp;
SET SQL_SAFE_UPDATES = 0;
update emp set CurrentDate = "2024-04-10 00:00:00" ;
Select HIREDATE, CurrentDate, FLOOR(datediff(current_date(),HIREDATE)/(365)) as "Tenure" from emp;
--- 8 
select * from emp where ENAME LIKE 's%';
--- 9
Select distinct DEPTNO from emp;
--- 10
select ENAME, JOB, lower(ENAME) as "Ename",  lower(JOB) as "JOB" FROM emp;
--- 11
select * from emp order by SAL desc LIMIT 3;
--- 12
select * from emp where DEPTNO = 10 AND (JOB = "MANAGER" OR JOB = "CLERK");
--- 13
select * FROM emp where JOB ='CLERK' order by DEPTNO ASC;
--- 16
#execute using self join
select * from emp where DEPTNO = (select DEPTNO from emp where ename = 'SCOTT') and ename!='SCOTT';
--- 17
select * from emp where JOB = (select JOB FROM EMP WHERE ENAME = 'SMITH');
--- 18
SELECT * FROM EMP WHERE MGR = ( SELECT EMPNO from EMP WHERE ENAME = 'KING');
--- 19
SELECT * FROM EMP WHERE SAL = ( SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');
--- 20
select dePTNO,count(*) FROM EMP GROUP BY DEPTNO;
--- 21
SELECT JOB,count(*) FROM EMP group by JOB;
--- 22
select DEPTNO,JOB, count(*) FROM EMP GROUP BY DEPTNO, JOB order by DEPTNO;
--- 23
select DEPTNO,count(*) FROM EMP group by DEPTNO having count(*) > 3;
--- 24
SELECT  JOB, count(*) FROM EMP group by JOB having count(*)>3;
--- 25
select E.ENAME, D.DNAME, D.LOC FROM EMP E RIGHT JOIN DEPT D ON E.DEPTNO = D.DEPTNO;






