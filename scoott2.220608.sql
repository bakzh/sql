--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
select * from emp;

select count(*) as "�ο� ��" , max(sal) as "�ִ� �޿�", min(sal) as "�ּ� �޿�", sum(sal) as "�޿��� ��" 
  from emp;
--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.
  select job as "����", max(sal) as "�ִ� �޿�", min(sal) as "�ּ� �޿�", sum(sal) as "�޿��� ��" 
    from emp
group by job;
--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
  select job as "����", count(*) as "�ο� ��"
    from emp
group by job;
--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
select max(sal) - min(sal) as "�ְ� �޿� - �ּ� �޿�"
  from emp;
  
--5. EMP ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.
  select deptno as "�μ�", count(*) as "�ο� ��", avg(sal) as "��� �޿�", min(sal) as "�����޿�", max(sal) as "�ְ� �޿�", sum(sal) as "�޿��� ��"
    from emp
group by deptno;

--6. �� �μ����� �ο���,�޿��� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� �޿��� ���� ���� ������ ����Ͽ���.
  select deptno, count(*) as "�ο� ��", avg(sal) as "��� �޿�", min(sal) as "�����޿�", max(sal) as "�ְ� �޿�", sum(sal) as "�޿��� ��" 
    from emp
group by deptno
order by sum(sal) desc;     --��Ī���ε� ���� -"�޿��� ��" desc;
    
--7. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����Ͽ���. 
  select deptno as "�μ���ȣ", job as "����", count(*) as "�ο� ��", avg(sal) as "�޿��� ���", sum(sal) as "�޿��� ��"
    from emp
group by deptno, job;

--8. ������, �μ��� �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����Ͽ���.
  select job as "����", deptno as "�μ���ȣ", count(*) as "�ο� ��", avg(sal) as "�޿��� ���", sum(sal) as "�޿��� ��"
    from emp
group by job, deptno;

--9. EMP ���̺��� �޿��� �ִ� 2900�̻��� �μ��� ���ؼ� �μ���ȣ, ��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.
  select deptno as "�μ���ȣ", avg(sal) as "��� �޿�", sum(sal) as "�޿��� ��"
    from emp
group by deptno
  having max(sal) >= 2900;

--10. EMP ���̺��� ������ �޿��� ����� 3000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.
  select job as "������", avg(sal) as "��� �޿�", sum(sal) as "�޿��� ��"
    from emp
group by job
  having avg(sal) >= 3000;

--11. EMP ���̺��� ��ü ������ 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����Ͽ���. �� �Ǹſ��� �����ϰ� �� �޿� �հ�� ����(��������)�Ͽ���
  select job as "����", sum(sal) as "�� �޿� �հ�"
    from emp
   where job != 'SALESMAN'
group by job 
  having sum(sal) > 5000
order by sum(sal) desc;     --��Ī���ε� ���� -"�� �޿� �հ�" desc;

--12. EMP ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����϶�
  select deptno as "�μ���ȣ", count(*) as "�ο� ��", sum(sal) as "�޿��� ��"
    from emp
group by deptno
  having count(*) > 4;

 


