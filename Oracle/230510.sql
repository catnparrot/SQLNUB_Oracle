create sequence sequenceA
increment by 10
start with 10
maxvalue 90
minvalue 0
nocycle
cache 2;

drop sequence sequenceA;


create table dept_sequence
as SELECT
    *
FROM dept
where 1<>1;

insert into dept_sequence (deptno, dname, loc)
values (seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');

SELECT
    *
FROM dept_sequence;