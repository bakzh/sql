select * from member;
select * from review;

insert into review
values(review_rvno_seq.nextval, '�ü��� ���ƿ�2', 2.2, sysdate, sysdate, 21, 1);

 select review.RVCONTENTS, review.RVCDATE, review.RVSCORE
  from  member, review
 where  member.MEMNO = review.MEMNO;