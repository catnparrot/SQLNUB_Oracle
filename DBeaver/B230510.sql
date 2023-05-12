--https://nickjoit.tistory.com/144;

use mysql;

select host, user, password from user;

create user 'mytest'@'%' identified by '12345';

GRANT ALL PRIVILEGES ON mytest.* TO ezen@'%' IDENTIFIED BY '12345';





drop database myrun;




create database myrun;
show databases;

GRANT ALL PRIVILEGES ON myrun.* TO ezen@'%';

revoke all on myrun.* from ezen;