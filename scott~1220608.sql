--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
  select empno "�����ȣ", ename "�̸�", job "������", sal "�޿�"
    from emp 
   where sal >= 3000;
--3. EMP ���̺��� �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
  select ename "�̸�", deptno "�μ���ȣ"
    from emp
   where empno = 7788;
--4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.
  select ename "�̸�", job "������", hiredate "�Ի���"
    from emp
   where hiredate between '81/02/20' and '81/05/01'
order by hiredate;
--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.
  select *
    from emp
   where deptno in (10,20);
--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.
  select ename "Employee", sal "Monthly Salary"
    from emp
   where sal >= 1500 and deptno in (10, 30);
--7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
  select *
    from emp
   where hiredate between '82/01/01' and '82/12/31';
--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
  select *
    from emp
   where comm is not null; 
--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.
  select ename "�̸�", sal "�޿�", comm "���ʽ�"
    from emp
   where comm > (sal * 1.1);

--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
  select *
    from emp
   where job in('CLERK','ANALIST') and sal not in(1000,3000,5000);
--11. EMP ���̺��� �̸��� L�� �� �ڰ� �ְ�  �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
  select *
    from emp
   where ename like '%L%L%' and (deptno = 30 or mgr = 7782);