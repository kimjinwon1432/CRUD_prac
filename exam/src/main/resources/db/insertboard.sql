UPDATE board SET category = 0
            WHERE BOARDNUM = 1;

insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요',
            'aaa1',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            1);
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안11녕하세요',
            'aaa',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            2);
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요',
            'aaa2',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            3);
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요123',
            'asdf1',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            0);      
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요',
            'asdf1',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            1);
            
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요443',
            'asdf1',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            2);
            
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요3',
            'asdf1',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            3);
            
            
insert into board(boardnum, title, id, contents, file_path, updatedate, hits, category) 
    VALUES( board_seq.NEXTVAL,
            '안녕하세요2',
            'asdf1',
            '인사하는 중입니다. 안녕하세요~',
            '',
            null,
            0,
            4);
select * from board;   

                  
            




    