SELECT * FROM employees;

--같지않다. <>
--employees 테이블에서 manager_id가 105가 아닌 직원을 조회
SELECT * FROM employees
WHERE employee_id <> 105;

--employees 테이블에서 manager_id가 null 값이 아닌 직원을 조회
SELECT * FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees
WHERE manager_id IS NOT NULL;

--employees 테이블에서 first_name과 last_name을 소문자와 대문자로 각각 출력, email의 첫번째 문자는 대문자로 출력
SELECT
last_name,
LOWER(last_name) LOWER_적용,
UPPER(last_name) UPPER_적용,

email,
INITCAP(email) INITCAP_적용
FROM employees;

SELECT job_id, SUBSTR(job_id,1,1) 적용결과
FROM employees;
SELECT job_id, SUBSTR(job_id,1,2) 적용결과
FROM employees;
SELECT job_id, SUBSTR(job_id,1,4) 적용결과
FROM employees;
SELECT job_id, SUBSTR(job_id,4,2) 적용결과
FROM employees;


--employees 테이블에서 job_id 문자열 값이 ACCOUNT면 ACCNT로 출력
SELECT
job_id
FROM employees;

SELECT
job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT')
FROM employees;


SELECT
REPLACE(job_id, 'ACCOUNT', 'ACCNT') job_id
FROM employees;

SELECT
REPLACE(job_id, 'ACCOUNT', 'ACCNT')
FROM employees;
--출력되는 결과가 실제로 저장된 데이터가 아님. 그냥 출력값

--employees 테이블에서 first_name에 대해 12자리의 문자열 자리를 만들되 first name의 데이터 값이 12자리보다 작으면 왼쪽에서부터 *를 채워서 출력
SELECT first_name, LPAD(first_name, 12, '*') LPAD적용결과
FROM employees;


SELECT 'start' || TRIM('    - space -   ')||'end' FROM dual;  --dual: 존재하지 않는 임시 테이블, 테스트용 테이블

--employees 테이블에서 salary를 30일로 나눈 후 값의 소수점 첫째 자리, 소수점 둘째 자리, 정수 첫째 자리에서 반올림한 값을 출력
SELECT
salary,
salary/30 일급,
ROUND(salary/30, 0) 적용결과_0,
ROUND(salary/30, 1) 적용결과_1,
ROUND(salary/30, -1) 적용결과_MINUS_1
FROM employees;

--employees 테이블에서 salary를 30일로 나눈 후 값의 소수점 첫째 자리, 소수점 둘쨰 자리, 정수 첫째 자리에서 절삭하여 출력
SELECT
salary,
salary/30 일급,
TRUNC(salary/30, 0) 적용결과_0,
TRUNC(salary/30, 1) 적용결과_1,
TRUNC(salary/30, -1) 적용결과_MINUS1
FROM employees;

--날짜
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/HH24:MT') 오늘날짜,
    SYSDATE + 1 더하기_1,
    SYSDATE - 1 빼기_1,
    TO_DATE('20211125') - TO_DATE('20230412') 날짜빼기,
    SYSDATE + 13/24
FROM dual;

--뭐가 오타났다는거야?

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/HH24:MI') 오늘날짜,
    SYSDATE + 1 더하기_1,
    SYSDATE - 1 빼기_1,
    TO_DATE('20211125') - TO_DATE('20230412') 날짜빼기,
    SYSDATE + 13/24
FROM dual;

--SQL에서는 IF_THEN<ELSE_ENd를 DECODE로 처리함
--CASE 문 활용
--RANK

--employees 테이블에서 first_name, last name, department_id salary를 출력하되 department_iD가 60dls ruddndpsms rmqdufmf 10% 이상한 값을
--계산하여 출력하고 나머지 경우에는 원래의 값을 출력하시오.
--그리고 department 60dls ruddndpsms 10%인상 출력, 나머 '미인상' 출력
SELECT
    first_name,
    last_name,
    department_id,
    salary 원래급여,
    DECODE(department_id, 60, salary*1.1, salary) 조정된_급여,
    DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM employees;

--employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, salsry를 출력하되 salary가 9000이상이면 '상위급여',
--6000과 8999 사이이면 '중위급여', 그 외는 '하위급여'라고 출력
SELECT employee_id, first_name, last_name, salary,
    CASE
        WHEN salary >= 9000 THEN '상위급여'
        WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
        ELSE '하위급여'
    END AS 급여등급    
FROM employees
WHERE job_id='IT_PROG';

--RANK 함수를 사용하여 employees 테이블의 salary 값이 노은 순서대로 순위를 매겨 출력
SELECT employee_id, salary,
    RANK() OVER(ORDER BY salary DESC) RANK_급여
FROM employees;