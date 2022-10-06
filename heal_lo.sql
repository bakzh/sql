     select t3.no, t3.bdno, t3.bdcg, t3.bdtitle, t3.memno, t3.bdcontent, t3.bdcdate, t3.bdview, t3.memnickname 
       from ( 
      select rownum no, t1.bdno, t1.bdcg, t1.bdtitle, t1.memno, t1.bdcontent, t1.bdcdate, t1.bdview, t2.memnickname
          from board t1, member t2 
        where t1.memno=t2.memno 
       order by t1.bdno desc) t3 
      where no between 1 and 10
         and t3.bdcg = 'BD001'
         and t3.bdtitle like '%헬로입니다%' or t3.bdcontent like '%헬로입니다%' or t3.memnickname like '%헬로입니다%' order by no asc;
         
         
         select no, t3.bdno, t3.bdcg, t3.bdtitle, t3.memno, t3.bdcontent, t3.bdcdate, t3.bdview, t3.memnickname
           from (      select rownum no, t1.bdno, t1.bdcg, t1.bdtitle, t1.memno, t1.bdcontent, t1.bdcdate, t1.bdview, t2.memnickname        
                         from board t1, member t2       where t1.memno=t2.memno       order by t1.bdno desc)t3
          where no between 1 and 12
                             and t3.bdcg = 'BD001'  
                             AND    t3.bdtitle like '%헬로입니다%' or 
                                    t3.bdcontent like '%헬로입니다%' or
                                    t3.memnickname like '%헬로입니다%'
      order by no asc;





 INSERT INTO BOARD (BDNO, BDCG,BDTITLE,MEMNO,BDCONTENT)
 VALUES (BOARD_BDNO_SEQ.nextval, '자유게시판' ,'제목',1,'댓글내용입니다.');
 

 INSERT INTO REPLY(RPNO, BDNO,MEMNO,RPCOMMENT)
 VALUES (REPLY_RPNO_SEQ.nextval, BOARD_BDNO_SEQ.currval, 1,'댓글내용');
 
 insert into member values (member_memno_seq.nextval ,'admin' ,'admin123' ,'010-1234-5678' ,'닉네임'
                            ,'heallo123@naver.com' ,'테스트' ,'ADMIN','JOIN' ,sysdate ,sysdate );

delete member where memno = 23;
select * from member;
select * from review;

select count(mememail)
  from member
 where mememail = 'test3@test.com'; 

-- 리뷰 등록
insert into review
values(review_rvno_seq.nextval, '시설이 좋아요1', 4.5, sysdate, sysdate, 3, 1);

 select review.RVCONTENTS, review.RVCDATE, review.RVSCORE
  from  member, review
 where  member.MEMNO = review.MEMNO;
 
  select * from board;
 SELECT * FROM REPLY;
 
 select board.BDNO bdno, board.BDTITLE bdtitle, board.BDCDATE bdcdate, board.BDVIEW bdview
   from member, board
  where member.MEMNO = board.MEMNO;

 select BOARD.bdno bdno, reply.RPCOMMENT rpcomment ,reply.RPCDATE rpcdate,BOARD.BDTITLE bdtitle
   from MEMBER, BOARD, reply 
  where MEMBER.MEMNO = BOARD.MEMNO and MEMBER.MEMNO = reply.MEMNO;
  
  
 select review.RVCONTENTS rvcontents, review.RVCDATE rvcdate, review.RVSCORE  rvscore
   from  member, review
  where  member.MEMNO = review.MEMNO;

-- 운동시설 중복 체크
SELECT fcno cnt from facility
    where fcname = 1
        and fcaddr = '울산광역시';

-- 운동시설 저장
insert into facility values
      (facility_fcno_seq.nextval, '강bb2', '당구장업', null, '010-1111-2222',
      36.9626006263, 127.2392144698, '서울특별시 zzz', 27472, '폐업',
      'https://cdn.pixabay.com/photo/2020/04/03/20/49/gym-5000169_960_720.jpg',1);

-- 즐겨찾기 추가
insert into bookmark
values(bookmark_bmno_seq.nextval, 21, 42);

-- 회원의 즐겨찾기 리스트 조회
select * from bookmark
where memno = 21;

select * from review;
select * from facility;
delete  from facility;

select t2.FCIMG,t2.FCADDR, t2.FCTEL,t2.FCSCORE
  from BOOKMARK t1,FACILITY t2, member t3
 where t1.FCNO=t2.FCNO and t1.memno = t3.memno;

commit;

 select FACILITY.FCIMG fcimg,FACILITY.FCADDR fcaddr, FACILITY.FCTEL fctel, FACILITY.FCSCORE fcscore, FACILITY.FCNAME fcname
   from BOOKMARK, FACILITY, MEMBER
  where BOOKMARK.FCNO=FACILITY.FCNO and BOOKMARK.memno = MEMBER.memno
  order by bookmark.bmno asc;
  
   select FACILITY.FCIMG fcimg,FACILITY.FCADDR fcaddr, FACILITY.FCTEL fctel, FACILITY.FCSCORE fcscore, FACILITY.FCNAME fcname
   from BOOKMARK, FACILITY, MEMBER
  where BOOKMARK.FCNO=FACILITY.FCNO and BOOKMARK.memno = MEMBER.memno
  order by bookmark.bmno desc;
  
 select reply.RPCOMMENT rpComment, reply.RPCDATE rpCDate ,BOARD.bdno bdno, BOARD.BDTITLE bdtitle
  from MEMBER, BOARD, reply
  where MEMBER.MEMNO = BOARD.MEMNO and MEMBER.MEMNO = reply.MEMNO;


