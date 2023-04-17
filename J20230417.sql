SELECT * FROM employees;

--산술처리: employees 테이블에서 employee_id, salary, salary에  500을 더한 값, 100을 뺀 값, 100% 추가해서 2로 나눈 값을 출력
SELECT employee_id 사원번호,
salary 급여,
salary+500 추가급여,
salary-100 이하급여,
(salary*1.1)/2 조정급여
FROM employees;

--SELECT * FROME WHERE (SELECT * FROME WHERE)

--employee_id가 100인 직원 정보 출력
SELECT * FROM employees
WHERE employee_id = 100;

--employees 테이블에서 employee_id가 105 이상인 직원 정보 출력
SELECT * FROM employees
WHERE employee_id >=105;

--employees 테이블에서 salary가 10,000 이상이고 20,000이하인 직원 정보 출력
SELECT * FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--employees 테이블에서 salary가 10000, 17000, 24000인 직원 정보 출력
SELECT * FROM employees
WHERE salary IN(10000, 17000, 24000);

--%: 여러글자 단위
--_: 한글자 단위
--employees 테이블에서 job_id 값이 AD로 시작하는 모든 데이터를 조회
SELECT * FROM employees
WHERE job_id LIKE 'AD%';

--employees 테이블에서 AD로 시작하면서 AD 뒤에 따라오는 문자열이 3자리인 데이터 값 직원정보를 출력
SELECT  *   FROM employees
WHERE job_id LIKE 'AD___';

--응용: 안산에 살고 있는 사람들을 찾고 싶다. => %안산%

--employees 테이블에서 manager_id가 null인 값인 직원 정보 출력
SELECT * FROM employees
WHERE manager_id IS NULL;

--employees 테이블에서 salary가 4000을 초과하면서(AND), job_id가 IT_PROG인 값 조회
SELECT * FROM employees
WHERE salary > 4000 AND job_id = 'IT_PROG';

--employees 테이블에서 salary가 4000을 초과하면서(AND), job_id가 IT_PROG이거나 FI_ACCOUNT인 값 조회
SELECT * FROM employees
WHERE salary > 4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';