create table dept_temp
    as select * from dept;
    
SELECT * FROM dept_temp;

insert into dept_temp (deptno, dname, loc)
                values (50, 'DATABASE', 'SEOUL');

--//오류가 발생하는 하는 insert문//--
--지정한 열보다 입력하는 데이터의 갯수가 적어서 오류가 난 경우
insert into dept_temp(deptno, dname, loc)
                values(60, 'NETWORK');

--지정한 열보다 입력하는 데이터의 갯수가 많아서 오류가 난 경우
insert into dept_temp(deptno, dname, loc)
                values(60, 'NETWORK', 'BUSAN', 'WRONG');

--숫자 데이터가 들어가야하는 DEPTNO 열에 문자열 데이터를 지정하여 오류가 난 경우
insert into dept_temp(deptno, dname, loc)
                values('WRONG', 'NETWORK', 'BUSAN');

--두 자리 숫자까지 허용되는 DEPTNO 열에 세 자리 숫자를 지정하여 오류가 난 경우
insert into dept_temp(deptno, dname, loc)
                values(600, 'NETWORK', 'BUSAN');

--열 지정 없이 데이터 추가 -> 해당 테이블의 열 순서에 따라 데이터 입력
insert into dept_temp
                values(60, 'NETWORK', 'BUSAN');

--NULL
insert into dept_temp (deptno, dname, loc)
                values(70, 'WEB', NULL);
                
--빈공백도 NULL값으로 입력 가능하다
insert into dept_temp (deptno, dname, loc)
                values(80, 'MOBILE', '');

insert into dept_temp (deptno, loc)
                values(90, 'INCHEON');

--날짜 데이터 입력--
create table emp_temp
    as select *
                from emp
                where 1 <> 1;

select * from emp_temp;

--날짜 입력 방식
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
                values (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
                values (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
              
                    --오류
                    insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
                                 values (2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
             values (2111, '이순신', 'MANAGER', 9999, to_date('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
             values (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
             
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)      --서브쿼리로 여러 데이터 추가
             select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
                from emp e
                --scott계정에서만 가능한 명령
                --from emp e, salgrade s where e.sal between s.losal and s.hisal and s.grade = 1
                ;
                
--//테이블에 있는 데이터 수정//--
create table dept_temp2
as select * from dept;

select * from dept_temp2;

--테이블 업데이트하기
update dept_temp2
set loc = 'SEOUL';

rollback;

--테이블 데이터 중 일부분만 수정
update dept_temp2
    set dname = 'DATABASE',
    loc = 'SEOUL'
    where deptno = 40;
    
--서브 쿼리로 일부분 수정
update dept_temp2
set(dname, loc) = (select dname, loc
                    from dept
                    where deptno = 40)
where deptno = 40;

update dept_temp2
set dname = (select dname
                from dept
                where deptno = 40),
    loc = (select loc
            from dept
            where deptno =40)
where deptno = 40;

--where 절에 서브쿼리 사용하기
update dept_temp2
set loc = 'SEOUL'
where deptno = (select deptno
                from dept_temp2
                where dname = 'OPERATIONS');

--//테이블에 있는 데이터 삭제하기//--
create table emp_temp2
as select * from emp;

select * from emp_temp2;

delete from emp_temp2
where job = 'MANAGER';