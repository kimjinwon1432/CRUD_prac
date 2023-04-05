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

CREATE SEQUENCE board_seq
    INCREMENT BY 1
    START WITH  1
    MINVALUE 1
    MAXVALUE 99999;

drop table board;
drop sequence boardseq;

CREATE table board(
    boardnum NUMBER,
    TITLE       VARCHAR(200) NOT NULL,
    id          VARCHAR(20),
    contents    VARCHAR(1000),
    pile_path   VARCHAR(500),
    pile_size   INTEGER,
    updatedate  TIMESTAMP,
    regdate     TIMESTAMP DEFAULT TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    hits        NUMBER default 0,
    
    CONSTRAINT board_pk PRIMARY KEY(boardnum),
    CONSTRAINT board_fk FOREIGN KEY(id) REFERENCES userinfo(id) ON DELETE CASCADE
);

insert into board(boardnum, title, id, contents, pile_path, pile_size, updatedate, hits) 
    VALUES( boardseq.NEXTVAL,
            '안녕하세요',
            'aa2',
            '인사하는 중입니다. 안녕하세요~',
            '',
            0,
            '',
            0);
        
select * from board;        

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