--emp ���̺��� �ο� ��, �ִ� �޿�, �ּ� �޿�, �޿��� ���� ���ϴ� select���� �ۼ�
select count(*) as "�ο� ��" , max(sal) as "�ִ� �޿�", min(sal) as "�ּ� �޿�", sum(sal) as "�޿��� ��" 
  from emp;
  
--emp ���̺��� ������ �ִ� �޿�, �ּ� �޿�, �޿��� ���� ���ϴ� select���� �ۼ�
  select job as "����", max(sal) as "�ִ� �޿�", min(sal) as "�ּ� �޿�", sum(sal) as "�޿��� ��" 
    from emp
group by job;

--emp ���̺��� ������ �ο� ���� ���ϴ� select���� �ۼ�
  select job as "����", count(*) as "�ο� ��"
    from emp
group by job;

--emp ���̺��� �ְ� �޿��� �ּ� �޿��� ���̸� ���ϴ� select���� �ۼ�
select max(sal) - min(sal) as "�ְ� �޿� - �ּ� �޿�"
  from emp;
  
--emp ���̺��� �μ��� �ο� ��, ��� �޿�, ���� �޿�, �ְ� �޿�, �޿��� ���� ���ϴ� select���� �ۼ�
  select deptno as "�μ�", count(*) as "�ο� ��", avg(sal) as "��� �޿�", min(sal) as "�����޿�", max(sal) as "�ְ� �޿�", sum(sal) as "�޿��� ��"
    from emp
group by deptno;

--emp ���̺��� �μ��� �ο� ��, ��� �޿�, ���� �޿�, �ְ� �޿�, �޿��� ���� ���ϰ� �޿��� ���� ���� ������ select���� �ۼ� 
  select deptno, count(*) as "�ο� ��", avg(sal) as "��� �޿�", min(sal) as "�����޿�", max(sal) as "�ְ� �޿�", sum(sal) as "�޿��� ��" 
    from emp
group by deptno
order by sum(sal) desc;     
    
--emp ���̺��� �μ�, �������� �׷��Ͽ� �μ���ȣ, ����, �ο� ��, �޿��� ���, �޿��� ���� ���ϴ� select���� �ۼ�
  select deptno as "�μ���ȣ", job as "����", count(*) as "�ο� ��", avg(sal) as "�޿��� ���", sum(sal) as "�޿��� ��"
    from emp
group by deptno, job;

--emp ���̺��� ����, �μ����� �׷��Ͽ� ����, �μ���ȣ, �ο� ��, �޿��� ���, �޿��� ���� ���ϴ� select���� �ۼ�
  select job as "����", deptno as "�μ���ȣ", count(*) as "�ο� ��", avg(sal) as "�޿��� ���", sum(sal) as "�޿��� ��"
    from emp
group by job, deptno;

--emp ���̺��� �ִ� �޿��� 2900�̻��� �μ����� �μ���ȣ, ��� �޿�, �޿��� ���� ���ϴ� select���� �ۼ�
  select deptno as "�μ���ȣ", avg(sal) as "��� �޿�", sum(sal) as "�޿��� ��"
    from emp
group by deptno
  having max(sal) >= 2900;

--emp ���̺��� �ִ� �޿��� 3000�̻��� �������� ������, ��� �޿�, �޿��� ���� ���ϴ� select���� �ۼ�
  select job as "������", avg(sal) as "��� �޿�", sum(sal) as "�޿��� ��"
    from emp
group by job
  having avg(sal) >= 3000;

--emp ���̺��� SALESMAN�� �����ϰ� ������ �޿� ���� 5000�� �ʰ��ϴ� ������ ����, �� �޿� �հ踦 �� �޿� �հ� ������������ ���
  select job as "����", sum(sal) as "�� �޿� �հ�"
    from emp
   where job != 'SALESMAN'
group by job 
  having sum(sal) > 5000
order by sum(sal) desc;     
