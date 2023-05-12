create table ptest(
    pno int primary key,
    pname char(8)
);

select * from user_indexes;

create index idx_ptest on ptest(pname);

create index idx_emp_sal on emp(sal);

drop index idx_ptest;

create view vw_emp20
    as (select empno, ename, job, deptno from emp where deptno =20);
        
select * from user_views;
select * from vw_emp20;

drop view vw_emp20;


create sequence seq_dept_sequence
    increment by 10
    start with 10
    maxvalue 90
    minvalue 0
    nocycle
    cache 2;
    
SELECT
    *
FROM user_sequences;

select seq_dept_sequence.currval from dual;

drop table dept_fk;

create table dept_fk(
deptno number(2) PRIMARY key,
dname varchar(14),
loc varchar(13)
);

drop table dept_fk;
drop table emp_fk;

CREATE TABLE emp_fk(
empno number(4),
ename varchar2(10),
job varchar2(9),
mgr varchar2(4),
hirdate date,
sal number(7,2),
comm number(7,2),
deptno number(2) CONSTRAINT empfk_deptno_fk PRIMARY key REFERENCES dept_fk (deptno)
);
​