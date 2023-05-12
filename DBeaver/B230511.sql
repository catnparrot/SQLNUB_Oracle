-- 346
SELECT * FROM members;

CREATE TABLE IF NOT EXISTS `members_alt_test` LIKE `members`;

ALTER TABLE members_alt_test RENAME members_temp;

ALTER TABLE members_temp CHANGE COLUMN jumin juminno varchar(64);

ALTER TABLE members_temp MODIFY COLUMN juminno varchar(64) DEFAULT NULL comment '주민등록번호';

ALTER TABLE members_temp DROP COLUMN IF EXISTS juminno;

ALTER TABLE members_temp ADD COLUMN IF NOT EXISTS juminno varchar(64) NULL DEFAULT NULL comment '주민등록번호' AFTER passwdmdt;

