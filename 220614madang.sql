--4-1
select abs(-78), abs(+78)
  from dual;
--4-2
select round(4.875, 1)
  from dual;
--4-3
  select custid "����ȣ", round(sum(saleprice)/count(*), -2) "��ձݾ�"
    from orders
group by custid;
--4-4
select bookid,replace(bookname, '�߱�', '��') bookname,publisher,price
  from book;
--4-5
select bookname "����", length (bookname) "���ڼ�", lengthb(bookname) "����Ʈ��"
  from book
 where publisher = '�½�����';
--4-6
  select substr(name, 1, 1)"��", count(*) "�ο�"
    from customer
group by substr(name, 1, 1);
--4-7
select orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate +10 "Ȯ��"
  from orders;
  
select sysdate
  from dual;

select to_char(sysdate,'d')
  from dual;
--���� ����(��=1,��=2...��=7)
select to_char(to_date('2022-06-14','yyyy-mm-dd'),'d')
  from dual;
--����  
select to_char(to_date('2022-06-14','yyyy-mm-dd'),'day')
  from dual;  
select to_char(to_date('2022-06-14','yyyy-mm-dd'),'dy')
  from dual;
--��¥(�ޱ���)
select to_char(to_date('2022-06-14','yyyy-mm-dd'),'dd')
  from dual;
--��¥(�����)
select to_char(to_date('2022-06-14','yyyy-mm-dd'),'ddd')
  from dual;
--�ð�(12�ð� ǥ��)
select to_char(sysdate,'hh')
  from dual;
select to_char(sysdate,'hh12')
  from dual;
--�ð�(24�ð� ǥ��)  
select to_char(sysdate,'hh24')
  from dual;
--��
select to_char(sysdate,'mi')
  from dual;
--�� ����(����)
select to_char(sysdate,'mm')
  from dual;
--�� ����(�� �̸�)
select to_char(sysdate,'mon')
  from dual;
select to_char(sysdate,'month')
  from dual;  
--��
select to_char(sysdate,'ss')
  from dual;
--4�ڸ� ����
select to_char(sysdate,'yyyy')
  from dual;
--4�ڸ� ������ ������ 3,2,1�ڸ�
select to_char(sysdate,'yyy/yy/y')
  from dual;

select TO_char(orderdate,'yyyy') "��",
       TO_char(orderdate,'mon') "��",
       TO_char(orderdate,'d') "��",
       TO_char(orderdate,'hh') "�ð�",
       TO_char(orderdate,'mi') "��",
       TO_char(orderdate,'ss') "��"
  from orders;

  select TO_char(orderdate,'yyyy') "��", TO_char(orderdate,'mon') "��",TO_char(orderdate,'d') "��", 
         count(*) "�ֹ� �Ǽ�"
    from orders
group by TO_char(orderdate,'yyyy'), TO_char(orderdate,'mon'),TO_char(orderdate,'d')
order by count(*) desc;

select orderid, orderdate, add_months(orderdate,12*2)+3
  from orders;

--4-8
select orderid "�ֹ���ȣ", to_char(orderdate,'yyyy-mm-dd dy') "�ֹ���", 
       custid "����ȣ", bookid "������ȣ"
  from orders 
 where orderdate = to_date('20200707','yyyymmdd'); 

--4-9
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
  from dual;
  
select abs(-15)  from dual;
select ceil(15.7) from dual;
select cos(3.14159)  from dual;
select floor(15.7)  from dual;
select log(10,100)  from dual;
select mod(11,4)  from dual;
select power(3,2)  from dual;
select round(15.7)  from dual;
select sign(-15)  from dual;
select trunc(15.7)  from dual;
select chr(67)  from dual;
select concat('happy','birthday')  from dual;
select lower('Birthday')  from dual;
select lpad('page 1',15,'*.')  from dual;
select ltrim('page 1','ae')  from dual;
select replace('JACK','J','BL')  from dual;
select rpad('page 1',15,'*.')  from dual;
select rtrim('page 1','ae')  from dual;
select substr('ABCDEFG',3,4)  from dual;
select trim(leading 0 from '00aa00')  from dual;
select upper('Birthday')  from dual;
select ASCii ('A')  from dual;
select instr('CORPORATE FLOOR','OR',3,2)  from dual;
select length('Birthday')  from dual;
select add_months('14/05/21',1)  from dual;
select last_day(sysdate)  from dual;
select next_day(sysdate,'ȭ')  from dual;
select round(sysdate)  from dual;
select sysdate  from dual;
select to_char(sysdate)  from dual;
select to_char(123)  from dual;
select to_date('12 05 2014', 'DD MM YYYY')  from dual;
select to_number('12.3')  from dual;
select DECODE(1,1,'aa','bb')  from dual;
select nullif(123,345)  from dual;
select nvl(null, 123)  from dual;

select * from customer;
update customer
   set phone = ' '
 where custid = 5;
rollback;
select * 
  from customer
 where phone is null; 
  
select * from book;
insert into book(bookid,bookname,publisher) values (11,'�����ͺ��̽�','�Ѻ�');

select sum(price)/count(*)
  from book; 

select sum(price)/count(price)
  from book;
  
select count(*) from book;

select
      (select count(*)
         from book
        where price >= 10000)
        +
       (select count(*)
         from book
        where price < 10000)
  from dual;

select * from book;
update book
   set price = price + 1000;

select avg(price)/count(price)
  from book
 where price > 50000; 

select count(price)
  from book
 where price > 50000;
--4-10 
select name, address,nvl(phone, '����ó ����'), nvl2(phone, '����ó ����', '����ó ����')
  from customer;
--4-11
select rownum "����", custid, name, phone
  from customer
 where rownum <= 2;
 
select * from book;
rollback;

  select *
    from book
   where rownum <= 5
order by price; 

--���� ������ ���� ������ ���� 2�� �ุ ���̽ÿ�.(�� ���ȣ�� ���������� ǥ���Ͻÿ�)

  select rownum "����", t1.bookname "������", t1.price "����"
    from (select *
           from book
       order by price desc) t1    --�ζ��� ��   
   where rownum <= 2;
   

   
   
   




