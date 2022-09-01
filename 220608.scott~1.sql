--emp 테이블에서 인원 수, 최대 급여, 최소 급여, 급여의 합을 구하는 select문을 작성
select count(*) as "인원 수" , max(sal) as "최대 급여", min(sal) as "최소 급여", sum(sal) as "급여의 합" 
  from emp;
  
--emp 테이블에서 업무별 최대 급여, 최소 급여, 급여의 합을 구하는 select문을 작성
  select job as "업무", max(sal) as "최대 급여", min(sal) as "최소 급여", sum(sal) as "급여의 합" 
    from emp
group by job;

--emp 테이블에서 업무별 인원 수를 구하는 select문을 작성
  select job as "업무", count(*) as "인원 수"
    from emp
group by job;

--emp 테이블에서 최고 급여와 최소 급여의 차이를 구하는 select문을 작성
select max(sal) - min(sal) as "최고 급여 - 최소 급여"
  from emp;
  
--emp 테이블에서 부서별 인원 수, 평균 급여, 최저 급여, 최고 급여, 급여의 합을 구하는 select문을 작성
  select deptno as "부서", count(*) as "인원 수", avg(sal) as "평균 급여", min(sal) as "최저급여", max(sal) as "최고 급여", sum(sal) as "급여의 합"
    from emp
group by deptno;

--emp 테이블에서 부서별 인원 수, 평균 급여, 최저 급여, 최고 급여, 급여의 합을 구하고 급여의 합이 많은 순으로 select문을 작성 
  select deptno, count(*) as "인원 수", avg(sal) as "평균 급여", min(sal) as "최저급여", max(sal) as "최고 급여", sum(sal) as "급여의 합" 
    from emp
group by deptno
order by sum(sal) desc;     
    
--emp 테이블에서 부서, 업무별로 그룹하여 부서번호, 업무, 인원 수, 급여의 평균, 급여의 합을 구하는 select문을 작성
  select deptno as "부서번호", job as "업무", count(*) as "인원 수", avg(sal) as "급여의 평균", sum(sal) as "급여의 합"
    from emp
group by deptno, job;

--emp 테이블에서 업무, 부서별로 그룹하여 업무, 부서번호, 인원 수, 급여의 평균, 급여의 합을 구하는 select문을 작성
  select job as "업무", deptno as "부서번호", count(*) as "인원 수", avg(sal) as "급여의 평균", sum(sal) as "급여의 합"
    from emp
group by job, deptno;

--emp 테이블에서 최대 급여가 2900이상인 부서별로 부서번호, 평균 급여, 급여의 합을 구하는 select문을 작성
  select deptno as "부서번호", avg(sal) as "평균 급여", sum(sal) as "급여의 합"
    from emp
group by deptno
  having max(sal) >= 2900;

--emp 테이블에서 최대 급여가 3000이상인 업무별로 업무명, 평균 급여, 급여의 합을 구하는 select문을 작성
  select job as "업무명", avg(sal) as "평균 급여", sum(sal) as "급여의 합"
    from emp
group by job
  having avg(sal) >= 3000;

--emp 테이블에서 SALESMAN을 제외하고 업무별 급여 합이 5000을 초과하는 업무별 업무, 월 급여 합계를 월 급여 합계 내림차순으로 출력
  select job as "업무", sum(sal) as "월 급여 합계"
    from emp
   where job != 'SALESMAN'
group by job 
  having sum(sal) > 5000
order by sum(sal) desc;     
