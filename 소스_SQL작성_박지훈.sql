-- 1) 
  select name "�̸�", address "�ּ�", phone "����ó"
    from customer;
-- 2)
  select *
    from customer
   where address like '%���ѹα�%';
-- 3)
  select name "�̸�" 
    from customer
   where phone is null;
-- 4)
  select count(distinct publisher) "���ǻ��� �� ����"
    from book;
-- 5)
  select *
    from book
   where bookname like '%����%'; 
-- 6)
  select count(*) "�ֹ� �Ǽ�", avg(saleprice) "��� �Ǹž�", max(saleprice) "�ִ� �Ǹž�", min(saleprice) "�ּ� �Ǹž�", sum(saleprice) "�� �Ǹž�"
    from orders;
-- 7)
  select publisher "���ǻ�", count(publisher) "���� �Ǽ�"
    from book
group by publisher
order by count(*) desc;
-- 8)
  select publisher "���ǻ�", count(publisher) "���� �Ǽ�", max(price) "�ְ� ����", min(price) "���� ����", sum(price)"���� ������ ��"
    from book
group by publisher
order by publisher;
-- 9)
  select max(price) - min(price) "���� ��� ������ ���� �� ������ ��������"
    from book;
-- 10)
  select custid "����ȣ", count(*) "���� �Ǽ�"
    from orders
group by custid
  having count(*) >= 2
order by count(*) desc;
-- 11)
  select orderid "�ֹ� ��ȣ"
    from orders
   where orderdate not between '20/07/04' and '20/07/07';
-- 12)
  select orderdate "�ֹ� ����", saleprice "�����"
    from orders
group by orderdate, saleprice
order by saleprice desc;
-- 13)
  select orderdate "�ֹ� ����"
    from orders
   where orderdate != '20/07/02'
group by orderdate, saleprice
  having saleprice > 20000
order by orderdate desc;
-- 14)
  select publisher "���ǻ�"
    from book
group by publisher
  having count(*) >= 2;
-- 15)
insert into book (bookname, publisher, price)
     values ('�����ͺ��̽�', '�Ѻ�', 30000);
-- 16)
update book set publisher = '�������ǻ�' where publisher = '���ѹ̵��';
commit;
select * from book;
-- 17)

-- 18)
update customer set address = '���ѹα� ���' where name = '�߽ż�';
commit;
select * from customer;
-- 19)
delete from customer where phone is null;
commit;
select * from customer; 
-- 20)
delete from customer where name = '������';