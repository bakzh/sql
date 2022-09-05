drop SEQUENCE MEMBER_MEMNO_SEQ;
drop SEQUENCE BOOKMARK_BMNO_SEQ;
drop SEQUENCE facility_fcno_SEQ;
drop table Member;
drop table facility;
drop table Bookmark;

--������ ����
CREATE SEQUENCE MEMBER_MEMNO_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE BOOKMARK_BMNO_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE facility_fcno_SEQ
START WITH 1
INCREMENT BY 1;

--���̺� ����

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

-- ��ü� �׽�Ʈ ������
insert into facility
  values(facility_fcno_seq.nextval, '��ü�bb1', '�籸���', null, '010-1111-2222',
        36.9626006263, 127.2392144698, '����Ư���� xxx',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '��ü�aa2', 'ü�´ܷþ�', null, '010-1111-2222',
        36.9626006263, 127.8392145598, '��û�ϵ� xxxxxxx',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '��ü�cc3', '���̿��', null, '010-1111-2222',
        36.9626006263, 127.83921111698, '��û�ϵ� ���ֽ� �ִ��� ��ϴ��� 33',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '��ü�dd4', '�籸���', null, '010-1111-2222',
        36.9626006263, 127.8392148698, '��걤���� xxxxx 33',
        27472);
insert into facility
  values(facility_fcno_seq.nextval, '��ü�cc5', '�籸���', null, '010-1111-2222',
        36.9626006263, 127.8392145698, '�λ걤���� �λ����� xxxx',
        27472);        
        
select * from facility;  

-- ȸ�� �׽�Ʈ ������
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen1','naim1111','010-1234-5618','�׽���1','test1@test.com','������','admin',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen2','naim1111','010-1234-5688','�׽���1','test2@test.com','������1','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen3','naim2222','010-1234-5668','�׽���2','test3@test.com','������2','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen4','naim3333','010-1234-5628','�׽���3','test4@test.com','������3','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen5','naim4444','010-1234-5638','�׽���4','test5@test.com','������4','nomal',sysdate, sysdate);
insert into member
   values (member_memno_seq.NEXTVAL ,'proteen','naim5555','010-1234-5678','�׽���5','test@test.com','������5','nomal',sysdate, sysdate);   
  
select * from member;  

-- ���ã�� �׽�Ʈ ������
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


