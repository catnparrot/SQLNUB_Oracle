-- employees의 모든 정보를 출력
SELECT * FROM employees;

SELECT
*
FROM employees;
--*: 모든 필드 출력 요청

-- employees 테이블의 employee_id와 first_name과 last_name을 선택하여 직원들의 사원번호와 이름만 출력

select employee_id, first_name, last_name from employees;

SELECT * FROM departments;

select employee_id, first_name, last_name
from employees
ORDER BY employee_id DESC;

--오름차순: ASC, but default가 오름차순이라 필요없음

--Quest: employees 테이블에서 중복 값이 생기지 않도록 job_id를 출력하시오
SELECT DISTINCT job_id
FROM employees;

--employees 테이블에서 employee_id는 '사원번호', first_name은 '이름', last_name은 '성'으로 출력
SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성
FROM employees;

SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM employees;
--영어 하는 것처럼 똑같이 as 생략 가능

--데이터 값 연결
--employees 테이블에서 employee_id를 출력하고 first_name과 last_name을 붙여서 출력
SELECT employee_id AS 사원번호, first_name||last_name 이름
FROM employees;

--employees 테이블에서 employee_id를 출력하고 first_name과 last_name을 붙여서 출력하되 가운데 한 칸을 띄워 주고 다음 열에서 email을 출력하는데 @company.com 문구를 붙여서 출력
SELECT employee_id, first_name||' '||last_name AS 이름, email||'@'||'company.com' AS 이메일
FROM employees;