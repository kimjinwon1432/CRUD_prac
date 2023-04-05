create table userinfo (
    id varchar(20) not null PRIMARY KEY,
    name varchar(10) not null,
    phone varchar(11) not null,
    email varchar(50) not null,
    address varchar(100) not null
);      
alter table userinfo add postnum varchar(100) not null;

create table logininfo(
    id varchar(20) not null PRIMARY KEY,
    password varchar(32) not null,
    
    CONSTRAINT fk_login_id foreign key(id) references userinfo (id)
    ON DELETE CASCADE
);

create table agreement(
    id varchar(20) not null PRIMARY KEY,
    agreeDate DATE DEFAULT to_char(sysdate,'yyyy-mm-dd HH:MM:SS'),
    
    CONSTRAINT fk_agreement_id foreign key(id) references userinfo(id)
    ON DELETE CASCADE
);
ALTER TABLE agreement modify agreeDate DATE DEFAULT to_char(SYSDATE, 'yyyy-mm-dd');

select * from agreement;
drop table agreement;
delete from agreement;

select u.*, (SELECT a.agreedate FROM agreement a WHERE a.id = u.id) as agreedate
from userinfo u;

select * from userinfo;

SELECT  u.id, 
        u.name, 
        u.phone, 
        (SELECT to_char(a.agreedate, 'yyyy-mm-dd') FROM agreement a WHERE a.id = u.id)
         as agreedate
FROM userinfo u
ORDER BY id;

SELECT  u.id, 
        u.name, 
        u.phone, 
        (SELECT to_char(a.agreedate, 'yyyy-mm-dd') FROM agreement a WHERE a.id = u.id)
         as agreedate
FROM userinfo u
ORDER BY agreedate;


SELECT  u.*, 
        (SELECT password FROM logininfo a WHERE a.id = '111112') password
FROM userinfo u
WHERE u.id = '111112';

UPDATE userinfo
    set name='bb',
        email='bb2@bb',
        phone='01041123333',
        postnum='asdf',
        address='bbbb'
    WHERE id like '111112';    

DELETE FROM logininfo WHERE id like 'aaa'   ; 
insert into userinfo(id, name, phone, email, postnum, address) values ('aaa1', 'kim', '01012341234', 'aaaa', 'aaa','1234aa');

UPDATE agreement set agreedate='2023-03-31' where id like 'aa2';
UPDATE agreement set agreedate='2023-03-29' where id like 'aaa2';



select * from logininfo;
select * from board;
CREATE SEQUENCE board_seq
    INCREMENT BY 1
    START WITH  1
    MINVALUE 1
    MAXVALUE 99999;

CREATE table board(
    boardnum NUMBER,
    TITLE       VARCHAR(200) NOT NULL,
    id          VARCHAR(20),
    contents    VARCHAR(1000),
    file_path   VARCHAR(500) default null,
--    file_size   INTEGER default 0,
    updatedate  TIMESTAMP default null,
    regdate     DATE DEFAULT TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') NOT NULL,
    hits        NUMBER default 0,
    
    CONSTRAINT board_pk PRIMARY KEY(boardnum),
    CONSTRAINT board_fk FOREIGN KEY(id) REFERENCES userinfo(id) ON DELETE CASCADE
);

drop table board;
drop sequence board_seq;

alter table board drop column file_size;
alter table board modify updatedate default null;
alter table board modify file_size default 0;

alter table board rename column pile_path to file_path;
alter table board rename column pile_size to file_size;

insert into board(boardnum, title, id, contents, pile_path, pile_size, regdate, hits) 
    VALUES( board_seq.NEXTVAL,
            '�ȳ��ϼ���',
            'aa2',
            '�λ��ϴ� ���Դϴ�. �ȳ��ϼ���~',
            '',
            0,
            null,
            0);
        
select * from board;   
drop table board;

SELECT b.* FROM(
    SELECT rownum rn, a.* 
        FROM (
            SELECT  boardnum, 
                    title, 
                    id, 
                    TO_CHAR(regdate,'YYYY/MM/DD HH24:MI:SS') regdate, 
                    hits
            FROM board) a ) b
WHERE rn >= 1 and rn <=5;  
create table exam01(
    id DATA PRIMARY KEY
);

--create table phonenum(
--    pnumber varchar(11) not null PRIMARY KEY,
--    hi varchar(10) not null
--);
--
--insert into phonenum(pnumber,hi) VALUES ('123', 'as');
--insert into phonenum(pnumber,hi) VALUES ('12345678901', 'asdfg');
--
--delete from phonenum;
--drop table phonenum;