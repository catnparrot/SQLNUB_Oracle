--p120 질문
SELECT
    *
FROM employees;



SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;
union
SELECT sal, job, deptno, sal, ename
FROM emp
WHERE deptno = 20;


----본수업----
--다중행 함수
select sum(salary) from employees;

--COUNT 함수를 사용하기 급여 개수 구하기
SELECT  COUNT(DISTINCT salary),
        COUNT(ALL salary),
        COUNT(salary)
FROM    employees;
-- ALL salary == salary -> default가 ALL
--%COUNT 함수의 위험성 -> 공백 문자를 카운트 할 수도 있음 (EXCEL too)

--
SELECT * FROM employees;

SELECT commission_pct FROM employees;

SELECT COUNT(commission_pct) FROM employees;
SELECT COUNT(commission_pct) FROM employees WHERE commission_pct IS NOT NULL;
-- => count는 null 제외

--p183
SELECT MAX(hire_date)
FROM employees
WHERE department_id = 20;

--group by ~ (having): 매우 중요
SELECT AVG(salary), department_id FROM employees;

SELECT AVG(salary), department_id FROM employees

GROUP BY department_id;

--p108 NOT IN
SELECT
    *
FROM employees
WHERE job_id NOT IN('mk_man', 'sa_man', 'sh_clerk');


--183
select min(hire_date)
from employees
where department_id = 20;

select min(to_char(hire_date))
from employees
where department_id = 20;

--191
SELECT
department_id, job_id, AVG(salary)
FROM employees
group by department_id, job_id
    having avg(salary) >= 2000
order by department_id, job_id;
    
SELECT
department_id, job_id, AVG(salary)
FROM employees
WHERE salary <= 3000
group by department_id, job_id
    having avg(salary) >= 2000
order by department_id, job_id;