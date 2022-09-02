drop table MEMBER;
drop SEQUENCE MEMBER_MEMBER_ID_SEQ;

create SEQUENCE MEMBER_MEMBER_ID_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
create table MEMBER (
  MEMBER_ID   NUMBER  (8) PRIMARY Key,
  EMAIL       VARCHAR2(40) UNIQUE NOT NULL,
  PW          VARCHAR2(10) NOT NULL,
  NICKNAME    VARCHAR2(30),
  CDATE       TIMESTAMP DEFAULT systimestamp Not null,
  UDATE       TIMESTAMP DEFAULT systimestamp not null
);


insert into member (MEmber_id,email,pw,nickname) 
  VALUES(MEMBER_MEMBER_ID_SEQ.nextval,'naim1234@gmail.com','naim1234','로니콜먼');
insert into member (MEmber_id,email,pw,nickname) 
  VALUES(MEMBER_MEMBER_ID_SEQ.nextval,'naim5678@gmail.com','naim1234','로니콜먼2');
insert into member (MEmber_id,email,pw,nickname) 
  VALUES(MEMBER_MEMBER_ID_SEQ.nextval,'naim9012@gmail.com','naim1234','로니콜먼3');                          


select member_id,email,pw,nickname,cdate,udate 
  from member
 where member_id = 1;                          
                        
update member 
   set pw = 'naim5678',
       nickname =  '로니콜먼5',
       udate = systimestamp
 where member_id = 2;
 
commit;

delete from member 
 where member_id = 1;

select MEMBER_MEMBER_ID_SEQ.nextval from dual;
select MEMBER_MEMBER_ID_SEQ.currval from dual;
 
rollback;
select * from member;
