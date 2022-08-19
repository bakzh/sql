-- 1-(1)�� ������ȣ�� 1�� ������ �̸�
select bookname from book where bookid = 1;

-- 1-(2)�� ������ 20.000�� �̻��� ������ �̸�
select bookname from book where price >= 20000;

-- 1-(3)�� �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) as "�������� �� ���ž�" from orders where custid = 1;

-- 1-(4)�� �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
select count(*) as "�������� ������ ������ ��"  from orders where custid = 1;


-- 2-(1)�� ���缭���� ������ �� ����
select count(*) as "������ �� ����" from book;

-- 2-(2)�� ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(DISTINCT publisher) as "���ǻ� �� ����" from book;

-- 2-(3)�� ��� ���� �̸�,�ּ�
select name as "�̸�", address as "�ּ�" from customer;

-- 2-(4)�� 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate between '20/7/4' and '20/7/7';
select orderid from orders where orderdate >= '20/7/4' and orderdate <= '20/7/7';

-- 2-(5)�� 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid from orders where orderdate not between '20/7/4' and '20/7/7';
select orderid from orders where not(orderdate >= '20/7/4' and orderdate <= '20/7/7');


-- 2-(6)�� ���� '��'���� ���� �̸��� �ּ�
select name as "�̸�",address as "�ּ�" from customer where name like '��%';

-- 2-(7)�� ����'��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name as "�̸�",address as "�ּ�" from customer where name like '��%��';

desc book;
-- 2-(1)�� ���ο� ����('������ ����','���ѹ̵��',10000��)�� ���缭���� �԰�Ǿ���
insert into book(bookname, publisher, price) values ('������ ����', '���ѹ̵��', 10000);
--�⺻Ű bookid�� null�� ���� �Ұ���, bookid�� �ʼ���� �׸��� ����ũ�ؾ���

-- 2-(2)�� '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�
delete from book where publisher = '�Ｚ��';
rollback;
commit;
select * from book;

-- 2-(3)�� '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���
delete from book where publisher = '�̻�̵��';
delete from orders where bookid in (7,8);
select * from book;
commit;
select * from orders;
--orders���� book�ڽ� ���ڵ� �߰�

-- 2-(4)�� ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲپ���
update book set publisher = '�������ǻ�' where publisher = '���ѹ̵��';
rollback;
select * from book;

select * from book;
select * from customer;
select * from orders;









