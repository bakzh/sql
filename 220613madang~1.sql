--3�� ��������
--3-1 �������� ������ ������ ���ǻ�� ���� ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
  select t2.name
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid 
     and t1.bookid = t3.bookid
     and t3.publisher in (select distinct t3.publisher
                            from orders t1, customer t2, book t3
                           where t1.custid = t2.custid 
                             and t1.bookid = t3.bookid
                             and t2.name = '������') 
     and t2.name <> '������';
                
--3-2 �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
  select t4.name
    from customer t4
   where (select count(distinct t3.publisher)
            from orders t1, customer t2, book t3
           where t1.custid = t2.custid
             and t1.bookid = t3.bookid
             and t2.name = t4.name ) >= 2; 
             
--3-3 ��ü ���� 30%�̻��� ������ ����
  select t3.bookname
    from orders t1, customer t2, book t3
   where t1.custid = t2.custid 
     and t1.bookid = t3.bookid
group by t3.bookname
  having count(t2.name) >= (select count(t4.name)* 30/100
                              from customer t4);
--�������
  select t2.bookname  "������"
    from book t2
   where (select count(t1.bookid) 
            from orders t1
           where t1.bookid = t2.bookid) >= ( select count(*) * 0.3
                                               from customer);
--��������
  select t2.bookname "������", count(*) "�Ǹż���"
    from orders t1, book t2
   where t1.bookid = t2.bookid
group by t1.bookid, t2.bookname
  having count(*) >= ( select count(*) * 0.3
                         from customer);
                                                         
--4-5 (���̺� ����) ���ǻ翡 ���� ������ �����ϴ� ���̺� bookcompany(name,address,begin)�� �����ϰ��� �Ѵ�.
--      name�� �⺻Ű�̸� varchar(20), adress�� varchar(20),begin data Ÿ������ �����Ͽ� �����Ͻÿ�.
create table bookcompany(
    name    varchar2(20),
    address varchar2(20),
    begin   date
);
--�⺻Ű
alter table bookcompany add constraint bookcompany_name_pk primary key (name);
--4-6 (���̺� ����) bookcompany ���̺��� ���ͳ� �ּҸ� �����ϴ� webaddress �Ӽ��� varchar(30)���� �߰��Ͻÿ�.
alter table bookcompany add webaddress varchar2(30);
--4-7 bookcompany ���̺��� ������ ���� name = �Ѻ���ī����, address = ����� ������, begin = 1993-01-01,
--      webaddress = http://hanbit.co.kr �� �����Ͻÿ�.
insert into bookcompany values ('�Ѻ���ī����','����� ������','19930101','http://hanbit.co.kr');

desc bookcompany;
select * from bookcompany;
commit;

--6
  select ���Ƹ�, count(���� ��)
    from ����
   where �л� �� >= 10
group by ���Ƹ�;
--7
  select ���ǻ��, count(*)
    from ����
   where ����⵵ > 2000
group by ���ǻ��
  having count(*) >= 10;
---8
create table R(
    a char(1),
    d char(1),
    c char(1)
);
alter table r modify c char(2);

create table S(
    a char(1),
    d char(1),
    e char(1)
);

insert into r values ('1','a','10');
insert into r values ('1','a','11');
insert into r values ('1','a','25');
insert into r values ('2','b','22');
insert into r values ('3','b','21');
insert into r values ('4','c','17');

insert into s values ('1','p','x');
insert into s values ('1','p','y');
insert into s values ('2','q','y');
insert into s values ('4','r','w');
insert into s values ('6','s','z');

commit;
select * from r;
select * from s;

(select distinct a from r)
union all       --������(�ߺ�����)
(select a from s);

(select distinct a from r)
union       --������(�ߺ�����)
(select a from s);

--9
  select �μ�.�μ���, count(*)
    from ����,�μ�
   where ����.�ҼӺμ���ȣ = �μ�.�μ���ȣ
     and ����.�޿� >= 40000
group by �μ�.�μ���

