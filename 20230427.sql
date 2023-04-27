SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS t_member;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE t_member (
    id varchar2(10) NOT NULL PRIMARY KEY,
    pv varchar2(10) NOT NULL,
    name varchar2(50) NOT NULL,
    email varchar2(50) NOT NULL,
    joinDate date DEFAULT SYSDATE
);