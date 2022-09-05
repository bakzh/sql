drop SEQUENCE MEMBER_MEMNO_SEQ;
drop SEQUENCE BOOKMARK_BMNO_SEQ;
drop SEQUENCE facility_fcno_SEQ;
drop table Member;
drop table facility;
drop table Bookmark;

--시퀀스 생성
CREATE SEQUENCE MEMBER_MEMNO_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE BOOKMARK_BMNO_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE facility_fcno_SEQ
START WITH 1
INCREMENT BY 1;

--테이블 생성

CREATE TABLE Member (
MEMNO NUMBER(8) PRIMARY KEY,
MEMID VARCHAR2(40) NOT NULL,
MEMPW VARCHAR2(20) NOT NULL,
MEMTEL VARCHAR2(13) NOT NULL,
MEMNICKNAME VARCHAR2(30) NOT NULL,
MEMEMAIL VARCHAR2(100) NOT NULL,
MEMNAME VARCHAR2(12) NOT NULL,
MEMCODE VARCHAR2(15) NOT NULL,
MEMCDATE DATE NOT NULL,
MEMUDATE DATE NOT NULL
);

create table facility (
  fcno         number(8),
  fcname       varchar2(100),
  fctype       varchar2(20),
  fchomepage   varchar2(100),
  fctel        varchar2(13),
  fclat        number,
  fclng        number,
  fcaddr       varchar2(100),
  fcpostcode   varchar2(10)
);
alter table facility add constraint facility_fcno_pk primary key (fcno);
alter table facility modify fcname constraint facility_fcname_nn not null;

CREATE TABLE Bookmark (
BMNO NUMBER(8) PRIMARY KEY,
MEMNO NUMBER(8)  REFERENCES Member(memno),
FCNO NUMBER(8) REFERENCES Facility(fcno)
);

-- 운동시설 테스트 데이터
insert into facility
  values(facility_fcno_seq.nextval, '운동시설bb1', '당구장업', null, '010-1111-2222',
        36.9626006263, 127.2392144698, '서울특별시 xxx',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '운동시설aa2', '체력단련업', null, '010-1111-2222',
        36.9626006263, 127.8392145598, '충청북도 xxxxxxx',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '운동시설cc3', '간이운동장', null, '010-1111-2222',
        36.9626006263, 127.83921111698, '충청북도 충주시 주덕읍 장록당우길 33',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '운동시설dd4', '당구장업', null, '010-1111-2222',
        36.9626006263, 127.8392148698, '울산광역시 xxxxx 33',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '운동시설cc5', '당구장업', null, '010-1111-2222',
        36.9626006263, 127.8392145698, '부산광역시 부산진구 xxxx',
        27472);        
        
select * from facility;  

-- 회원 테스트 데이터
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen1','naim1111','010-1234-5618','테스터1','test1@test.com','박지훈','admin',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen2','naim1111','010-1234-5688','테스터1','test2@test.com','박지훈1','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen3','naim2222','010-1234-5668','테스터2','test3@test.com','박지훈2','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen4','naim3333','010-1234-5628','테스터3','test4@test.com','박지훈3','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen5','naim4444','010-1234-5638','테스터4','test5@test.com','박지훈4','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen','naim5555','010-1234-5678','테스터5','test@test.com','박지훈5','nomal',sysdate, sysdate);   
  
select * from member;  

-- 즐겨찾기 테스트 데이터
insert into bookmark 
  values(bookmark_bmno_seq.nextval, 1, 1);
insert into bookmark 
  values(bookmark_bmno_seq.nextval, 2, 1);
insert into bookmark 
  values(bookmark_bmno_seq.nextval, 3, 3);
insert into bookmark 
  values(bookmark_bmno_seq.nextval, 4, 2);
insert into bookmark 
  values(bookmark_bmno_seq.nextval, 5, 5);  
  
select * from bookmark;


