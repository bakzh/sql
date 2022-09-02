select * from orders;
-- 1-(1)�� ������ȣ�� 1�� ������ �̸�
select bookname from book where bookid = 1;

-- 1-(2)�� ������ 20.000�� �̻��� ������ �̸�
select bookname from book where price > 20000;

-- 1-(3)�� �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) from orders where custid = 1;

-- 1-(4)�� �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
select count(*) from orders where custid = 1;

-- 2-(1)�� ���缭���� ������ �� ����
select count(*) from book;

-- 2-(2)�� ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) from book;
-- 2-(3)�� ��� ���� �̸�,�ּ�
select name, address from customer;

-- 2-(4)�� 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate between '20/07/04' and '20/07/07';
-- 2-(5)�� 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid from orders where orderdate not between '20/07/04' and '20/07/07';  


-- 2-(6)�� ���� '��'���� ���� �̸��� �ּ�
select name, address from customer where name like '��%';

-- 2-(7)�� ����'��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address from customer where name like '��%��';


-- 2-(1)�� ���ο� ����('������ ����','���ѹ̵��',10000��)�� ���缭���� �԰�Ǿ���
insert into book(bookname, publisher, price) values ('������ ����','���ѹ̵��',10000);
--�⺻Ű bookid�� null�� ���� �Ұ���, bookid�� �ʼ���� �׸��� ����ũ�ؾ���

-- 2-(2)�� '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�
delete from book where publisher = '�Ｚ��';
select * from book;
commit;
-- 2-(3)�� '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���
delete from book where publisher = '�̻�̵��';
--orders���� book�ڽ� ���ڵ� �߰�

-- 2-(4)�� ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲپ���
update book set publisher = '���ѹ̵��' where publisher = '���ѹ̵��';

select * from book;






