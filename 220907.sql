drop table member;
create table member(
    member_id   number(8),
    email       varchar2(40),
    pw          varchar2(10),
    nickname    varchar2(30),
    cdate       timestamp default systimestamp,
    udate       timestamp default systimestamp
);

--primary key
alter table member add constraint member_member_id_pk primary key(member_id);
--unique
alter table member add constraint member_email_uk unique (email);
--not null
alter table member modify email constraint member_email_nn not null;
alter table member modify pw constraint member_pw_nn not null;
alter table member modify cdate constraint member_cdate_nn not null;
alter table member modify udate constraint member_udate_nn not null;

--½ÃÄö½º»ý¼º
drop sequence member_member_id_seq;
create sequence member_member_id_seq;
