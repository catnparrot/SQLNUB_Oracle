SELECT
    *
FROM emp;

SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm,
    deptno, d.dname, d.loc
FROM emp e NATURAL JOIN dept d
ORDER BY deptno, e.empno;

SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm,
    deptno, d.dname, d.loc
FROM emp e JOIN dept d USING (deptno)
WHERE sal >= 3000
ORDER BY deptno, e.empno;


--//서브쿼리
--사원 중 jones인 사원의 급여
SELECT sal
FROM emp
WHERE ename='JONES';

--윗 사람보다 높은 급여를 받는 사람 출력
SELECT *
FROM emp
WHERE sal>2975;
--=>
SELECT * FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename='JONES');

