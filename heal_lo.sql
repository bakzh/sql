  INSERT INTO BOARD (BDNO, BDCG,BDTITLE,MEMNO,BDCONTENT)
  VALUES (BOARD_BDNO_SEQ.nextval, '�����Խ���','����1',2,'���������Դϴ�.');

  INSERT INTO BOARD (BDNO, BDCG,BDTITLE,MEMNO,BDCONTENT)
  VALUES (BOARD_BDNO_SEQ.nextval, '�����Խ���','����2',2,'���������Դϴ�.');

  INSERT INTO BOARD (BDNO, BDCG,BDTITLE,MEMNO,BDCONTENT)
  VALUES (BOARD_BDNO_SEQ.nextval, '�����Խ���','����3',2,'���������Դϴ�.');


select * from board;










select * from member;
select * from review;

select count(mememail)
  from member
 where mememail = 'test3@test.com'; 

-- ���� ���
insert into review
values(review_rvno_seq.nextval, '�ü��� ���ƿ�1', 4.5, sysdate, sysdate, 3, 1);

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

-- ��ü� �ߺ� üũ
SELECT fcno cnt from facility
    where fcname = 1
        and fcaddr = '��걤����';

-- ��ü� ����
insert into facility values
      (facility_fcno_seq.nextval, '��bb2', '�籸���', null, '010-1111-2222',
      36.9626006263, 127.2392144698, '����Ư���� zzz', 27472, '���',
      'https://cdn.pixabay.com/photo/2020/04/03/20/49/gym-5000169_960_720.jpg',1);

-- ���ã�� �߰�
insert into bookmark
values(bookmark_bmno_seq.nextval, 21, 42);

-- ȸ���� ���ã�� ����Ʈ ��ȸ
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


