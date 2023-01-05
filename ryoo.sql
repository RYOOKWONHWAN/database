SELECT
    first_name
FROM
    employees;

-- 실행 : ctrl + enter
/* 여러라인 주석처리 */

-- 도구 > 환경설정 > 코드 편집기 > 글꼴 > 글꼴 크기

SELECT
    *
FROM
    tab;

/* 
 컬럼명, 테이블명에 별칭(alias)을 지정할 수 있다.
 별칭(alias)에 공백이 있을 때는 " "(쌍따옴표)를 지정한다.
 */

SELECT
    salary,
    salary * 10 AS bonus
FROM
    employees;

SELECT
    salary,
    salary * 10 AS 보너스
FROM
    employees;

SELECT
    salary,
    salary * 10 AS "b o n u s"
FROM
    employees;

SELECT
    last_name
    || '님의 급여는 '
    || salary
    || '입니다.' AS name
FROM
    employees;

SELECT
    first_name
FROM
    employees;

-- DISTINCT은 중복제거를 한 후 출력해 주는 명령어이다.
SELECT DISTINCT
    first_name
FROM
    employees;

-- 다수 행을 나열하면 or이 아닌 and 조건으로 중복제거 후 출력함.
SELECT DISTINCT
    first_name,
    last_name
FROM
    employees;

/* 
first_name last_name
sunder      Abel
sunder      Abel
sunder      Ande
*/

/*
--SELECT 입력순서
SELECT column_name1, colomn_name2
FROM table_name1, table_name2
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

-- SELECT 해석순서
FROM table_name1, table_name2
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name1, colomn_name2
ORDER BY column_name ASC, column_name DESC;
*/

-- 대소문자 정확히 구분, '' "" 구분 정확해야 함, where절에서는 =는 같다를 의미함.(대입이 아님)
-- employees테이블에서 first_name컬럼의 값이 'David' 일때의 First_name, salary을 출력하라.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'David';

-- employees테이블에서 salary이 3000미만 일때의
-- first_name, salary을 출력하라.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary < 3000;

-- 같지 않다
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name != 'David';

-- 같지 않다
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name <> 'David';

-- 같지 않다
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name^= 'David';

-- AND(&&), OR(||)
-- employees테이블에서 salary이 3000, 9000, 17000일때
-- first_name, hire_date, salary을 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary = 3000
    OR salary = 9000
    OR salary = 17000;

--상기 코드와 같은 의미임
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary IN ( 3000, 9000, 17000 );

-- employees테이블에서 salary이 3000부터 5000까지 일때의
-- first_name, hire_date, salary을 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
        salary >= 3000
    AND salary <= 5000;

--상기 코드와 같은 의미임
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary BETWEEN 3000 AND 5000;

--employees테이블에서 job_id가 'IT_PROG'이 아닐때
--first_name, email, job_id을 출력하라
SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    job_id != 'IT_PROG';

SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    job_id <> 'IT_PROG';

SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    job_id^= 'IT_PROG';

SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    ( job_id = 'IT_PROG' );

-- 부정문일때
-- employees테이블에서 salary이 3000, 9000, 17000 아닐때
-- first_name, hire_date, salary을 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    NOT ( salary = 3000
          OR salary = 9000
          OR salary = 17000 );

--상기 코드와 같은 의미임
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary NOT IN ( 3000, 9000, 17000 );

-- employees테이블에서 salary이 3000부터 5000까지 일때의
-- first_name, hire_date, salary을 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    NOT ( salary >= 3000
          AND salary <= 5000 );

--상기 코드와 같은 의미임
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 3000 AND 5000;

-- employees테이블에서 commision_pct이 null일때
-- first_name, salary, commission_pct을 출력하라.
-- NULL 비교할때는 = null 이 아니라 IS NULL을 사용함.
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

-- employees테이블에서 commision_pct이 null아닐
-- first_name, salary, commission_pct을 출력하라.
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

--employees테이블에서 first_name에 'der'이 포함된 
--first_name, salary, email을 출력하라.
SELECT
    first_name,
    salary,
    email
FROM
    employees
WHERE
    first_name LIKE '%der%';

--employees테이블에서 first_name의 값중 'A'로 시작하고
--두번째 문자는 임의 문자이면 'emander'로 끝나는
--first_name, salary, email을 출력하라
SELECT
    first_name,
    salary,
    email
FROM
    employees
WHERE
    first_name LIKE 'A_exander';

/*
WHERE절에서 사용된 연산자 3가지 종류
1. 비교연산자 : = > >= < <= != <> ^=
2. SQL연산자 : BETWEEN a AND b, IN, LIKE, IS NULL
3. 논리연산자 : AND, OR, NOT

우선순위
1 괄호()
2.NOT연산자
3.비교연산자, SQL연산자
4.AND
5.OR
*/

-- employees테이블에서 job_id을 오름차순으로 
-- first_name, email, job_id을 출력하시오.
SELECT
    first_name,
    email,
    job_id
FROM
    employees;
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees;
ORDER BY job_id;

—employees테이블에서 department_id를 오름차순하고
—first_name을 내림차순으로
—department_id, first_name, salary를 출력하시오.
SELECT department_id, first_name, salary
FROM employees;
ORDER BY department_id ASC, first_name DESC;

—employees테이블에서 업무(job_id)이 'FI_ACCOUNT'인 사원들의
—급여(salary)가 높은순으로 first_name, job_id, salary을 출력하시오.
SELECT first_name, job_id, salary
FROM employees;
ORDER BY salary DESC;



SELECT first_name, hire_date
FROM employees;

SELECT first_name || '님은' || to_char(hire_date,'yyyy') || '년'|| ltrim(to_char(hire_date,'mm'),'0')|| '월'||ltrim(to_char(hire_date,'dd'),'0')|| '일에 입사했습니다.'
FROM employees;

/*-----------------------------
일반함수(null)
1. nvl(컬럼, 대체값) :첫번째 인자값이 null이면 0으로 대체해서 출력한다.
    -대체할 값이 숫자이면 두번째 인자값에 숫자를 저장한다.
    -대체할 값이 문자이면 두번째 인자값에 문자를 저장한다.
    -대체할 값이 날짜이면 두번쨰 인자값에 날짜를 저장한다.
---------------------------*/
SELECT commission_pct, nvl(commission_pct,'0')
FROM employees;

SELECT first_name, manager_id, nvl(to_char(manager_id),'CEO')
FROM employees;
    
/*------------------------
일반함수 (null)
2. nvl2(컬럼, 대체값1, 대체값2): 컬럼의 값이 null이 아니면, 대체값1 null이면 대체값 2로 출력한다.
-----------------------------------------*/

SELECT commission_pct , nvl2(commission_pct,1,0)
FROM employees;

SELECT count(*) AS 전체사원수, sum(nvl2(commission_pct,1,0)) as "커미션 지급 사원 수",
count(*)-sum(nvl2(commission_pct,1,0)) as "커미션 미지급 사원 수"
FROM employees;

/*---------------------------------
일반함수 (null)
3. NULLIF(컬럼,비교값)
    컬럼값과 비교값이 같으면 null로 리턴하고 같지않으면 컬럼의 값으로 리턴한다.
-----------------------------*/
SELECT commission_pct, NULLIF(commission_pct,0.4)
FROM employees;


/*--------------------------
일반함수 (null)
4. coalesce(컬럼1, 컬럼2)
    -컬럼1, 컬럼2 모두 null이 아니면 칼럼1을 리턴한다.
    -컬럼1, 컬럼2 중 null이 아닌것을 리턴한다.
    -컬럼 1, 컬럼2 모두 null 이면 null을 리턴한다.
-----------------------------*/
SELECT first_name, commission_pct, salary, coalesce(commission_pct, salary)
FROM employees;


/*-----------------------
decode(컬럼, 조건1, 처리1, 조건2,처리2,그밖의 처리)

------------------*/
SELECT first_name, department_id,
       decode (department_id, 10,'ACCOUNTANT',
                             20, 'RESEARCH',
                             30, 'SALES',
                             40, 'OPERATION' , 'OTHERS') as department_name
FROM employees;
--
--

SELECT job_id, salary, decode(job_id, 'PR_REP',salary*1.05,
                                      'SA_MAN',salary*1.1,
                                      'AC_MGR',salary*1.15,
                                      'PU_CLERK', salary*1.2,
                                      salary)
FROM employees;

/*---------------------------------
case when 조건식1 then 처리1
     when 조건식2 then 처리2
     when 조건식3 then 처리3
     also 처리 n
end AS alias
--------------------------------*/

SELECT first_name, hire_date, 
                   CASE WHEN to_char(hire_date,'mm') <=3 THEN '1사분기'
                        WHEN to_char(hire_date,'mm') <=6 THEN '2사분기'
                        WHEN to_char(hire_date,'mm') <=9 THEN '3사분기'
                        WHEN to_char(hire_date,'mm') <=12 THEN '4사분기'
                   END AS 분기
                
FROM employees;



SELECT first_name, salary, 
                  CASE WHEN salary<10000 THEN '하'
                       WHEN 10000<=salary THEN '중'
                       WHEN 20000<=salary THEN '상'
                  END AS 급여
FROM employees;

/*---------------------------------
집계함수(Aggregate Function), 그룹함수(Group Function)
max([DISTINCT] : [ALL] 컬럼) :최대값
min([DISTINCT] : [ALL] 컬럼) : 최소값
count([DISTINCT] : [ALL] 컬럼) 개수
sum([DISTINCT] : [ALL] 컬럼) 합
avg([DISTINCT] : [ALL] 컬럼) 평균
stddev([DISTINCT] : [ALL] 컬럼) 표준편차
variance([DISTINCT] : [ALL] 컬럼) 분산
---------------------*/
SELECT
    MAX(salary),
    MIN(salary),
    COUNT(salary),
    SUM(salary),
    AVG(salary),
    STDDEV(salary),
    VARIANCE(salary)
FROM
    employees;

SELECT count(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees;

SELECT count(DISTINCT commission_pct)
FROM employees;

SELECT count (ALL commission_pct)
FROM employees;

SELECT COUNT(employee_id)
FROM employees;

--집계함수와 단순칼럼은 함께 사용할 수 없다. 출력되는 레코드 수가 다르기 떄문이다.
--ORA-00937: not a single-group group function 단일그룹의 그룹함수가 아님
SELECT first_name,count(*)
FROM employees;
--그룹함수와 단순컬럼을 사용하기 위해서는 단순칼럼을 그룹화 해야한다.
SELECT department_id, count(*)
FROM employees
GROUP BY department_id
ORDER BY department_id;
--

    
SELECT department_id, count(*)
FROM employees
GROUP BY department_id
HAVING department_id <=50
ORDER BY department_id;

SELECT department_id, count(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*)<=5
ORDER BY department_id;


SELECT job_id, sum(salary)
FROM employees
GROUP BY job_id;

--부서별 최소급여, 최대급여를 출력하는데 최소급여와 최대급여가 같지 않은 경우에만 부서별 오름차순으로 출력하시오

SELECT department_id, min(salary), max(salary)
FROM employees
GROUP BY department_id
HAVING min(salary) != max(salary)
ORDER BY department_id;
/*------------------------------
문제
------------------------------*/
--1) 모든사원에게는 상관(Manager)이 있다. 하지만 employees테이블에 유일하게 상관이
--   없는 로우가 있는데 그 사원(CEO)의 manager_id컬럼값이 NULL이다. 상관이 없는 사원을
--   출력하되 manager_id컬럼값 NULL 대신 CEO로 출력하시오.
SELECT first_name, manager_id, nvl(to_char(manager_id),'CEO')
FROM employees;
    

--2) 가장최근에 입사한 사원의 입사일과 가장오래된 사원의 입사일을 구하시오.
SELECT min(hire_date), max(hire_date)
FROM employees;


--3) 부서별로 커미션을 받는 사원의 수를 구하시오.
SELECT  department_id, count(commission_pct)
FROM employees
GROUP BY department_id
ORDER BY department_id;


   
--4) 부서별 최대급여가 10000이상인 부서만 출력하시오.   
SELECT department_id,max(salary)
FROM employees
HAVING max(salary)>=10000
GROUP BY department_id
ORDER BY department_id;

SELECT *
FROM employees;

--5) employees 테이블에서 직종이 'IT_PROG'인 사원들의 급여평균을 구하는 SELECT문장을 기술하시오.
SELECT  job_id,avg(salary)
FROM employees
HAVING job_id='IT_PROG'
GROUP BY job_id
ORDER BY job_id;


--6) employees 테이블에서 직종이 'FI_ACCOUNT' 또는 'AC_ACCOUNT' 인 사원들 중 최대급여를  구하는 SELECT문장을 기술하시오.   
SELECT  max(salary)
FROM employees
WHERE job_id IN('FI_ACCOUNT', 'AC_ACCOUNT');



  

--7) employees 테이블에서 50부서의 최소급여를 출력하는 SELECT문장을 기술하시오.
SELECT min(salary)
FROM employees
where department_id=50;


    
--8) employees 테이블에서 아래의 결과처럼 입사인원을 출력하는 SELECT문장을 기술하시오.
--   <출력:  2001		   2002		       2003
 --  	     1          7                6   >
SELECT sum(decode(to_char(hire_date,'yyyy'),'2001',1,0)) AS '2001'
       sum(decode(to_char(hire_date,'yyyy'),'2002',1,0)) AS '2002'
       sum(decode(to_char(hire_date,'yyyy'),'2003',1,0)) AS '2003'


--9) employees 테이블에서 각 부서별 인원이 10명 이상인 부서의 부서코드,
--  인원수,급여의 합을 구하는  SELECT문장을 기술하시오.
SELECT department_id as 부서,count(department_id)as 인원수,sum(salary)as 급여총합
FROM employees
HAVING count(department_id)>=10
GROUP BY department_id
ORDER BY department_id;
  
  
--10) employees 테이블에서 이름(first_name)의 세번째 자리가 'e'인 직원을 검색하시오.
SELECT first_name, to_char(first_name)
HAVING first_name[2]='e'
FROM employees;


















