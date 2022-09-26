select * from member;
select * from review;

insert into review
values(review_rvno_seq.nextval, '시설이 좋아요2', 2.2, sysdate, sysdate, 21, 1);

 select review.RVCONTENTS, review.RVCDATE, review.RVSCORE
  from  member, review
 where  member.MEMNO = review.MEMNO;