DROP TABLE com_member;

--1.테이블,데이터 작성 및 질의 결과 출력
CREATE TABLE com_member (
    id NUMBER(3) NOT NULL PRIMARY KEY,
    name VARCHAR2(10) NOT NULL,
    job VARCHAR2(10) NOT NULL,
    security_number VARCHAR2(15) NOT NULL,
    salary NUMBER(5) NOT NULL,
    department VARCHAR2(10) NOT NULL
);

SELECT
    id AS 사원번호, name AS 이름, job AS 직급, security_number AS 주민번호, salary AS 급여, department AS 부서명
FROM com_member;

INSERT INTO com_member (id, name, job, security_number, salary, department)
VALUES
(101, '김사랑', '사원', '831212-2212112', 250, '인사부');

INSERT INTO com_member (id, name, job, security_number, salary, department)
VALUES
(102, '한예슬', '대리', '771227-2323123', 300, '영업부');

INSERT INTO com_member (id, name, job, security_number, salary, department)
VALUES
(103, '오지호', '과장', '720224-1013112', 500, '인사부');

INSERT INTO com_member (id, name, job, security_number, salary, department)
VALUES
(104, '이병헌', '부장', '710509-1934142', 600, '영업부');

--2.한예슬 부서 변경
UPDATE com_member
SET department = '총무'
WHERE name = '한예슬';

--3.급여300~500 사이
SELECT * FROM com_member
WHERE salary BETWEEN 300 AND 500;

--4.오지호 삭제
DELETE FROM com_member
WHERE name = '오지호';

--5.데이터 삭제
DELETE FROM com_member;