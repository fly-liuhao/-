SELECT * FROM emp;

-- 1.ASCII
-- ����ָ�����ַ���������ʮ������
SELECT ascii('A'),ascii('a'),ascii('0'),ascii(' ') FROM dual;

-- 2.CHR 
-- �����������ض�Ӧ���ַ�
SELECT chr(65),chr(97),chr(48),chr(32) FROM dual;

-- 3.CONCAT
-- ���������ַ���;
  SELECT concat('010-','88888888')||'ת110'  �绰 FROM dual;
  
-- 4.INITCAP
-- �����ַ��������ַ����ĵ�һ����ĸ��Ϊ��д;
  SELECT initcap('smith') upp FROM dual;

-- 5.INSTR(C1,C2,I,J)
-- ��һ���ַ���������ָ�����ַ�,���ط���ָ�����ַ���λ��;
  SELECT instr('oracle traning','ra',1,2) instring FROM dual;

-- 6.LENGTH *
-- �����ַ����ĳ���
SELECT  ename, length(ename)  FROM emp;

-- 7.LOWER
-- �����ַ���,�������е��ַ�Сд
SELECT lower('AaBbCcDd')   AaBbCcDd FROM dual;
SELECT deptno FROM emp WHERE lower(ename)='scott';

-- 8.UPPER
-- �����ַ���,�������е��ַ���д
  SELECT upper('AaBbCcDd') upper FROM dual;

-- 9.RPAD��LPAD
-- RPAD  ���е��ұ�ճ���ַ�
-- LPAD  ���е����ճ���ַ�
-- �����ַ�����*������
SELECT rpad('gao',5,'*') FROM dual;
SELECT lpad('gao',5,'*') FROM dual;
SELECT lpad(rpad('gao',10,'*'),17,'*') FROM dual;


-- 10.LTRIM��RTRIM *
-- LTRIM  ɾ����߳��ֵ��ַ���
-- RTRIM  ɾ���ұ߳��ֵ��ַ���
SELECT ltrim('***gao qian jing****','*') FROM dual;
SELECT rtrim('***gao qian jing****','*') FROM dual;
SELECT ltrim(rtrim('****gao qian jing****','*'),'*') FROM dual;

-- 11.SUBSTR(string,start,count) *
-- ȡ���ַ���,��start��ʼ,ȡcount��    ��ѧ��162054225��
SELECT substr('123456789',3,8)  FROM  dual;

-- 12.REPLACE('string','s1','s2')
--   string   ϣ�����滻���ַ������ 
--   s1       ���滻���ַ���
--   s2       Ҫ�滻���ַ���
SELECT replace('He love you','He','I') FROM dual;
        
-- 13. TRIM('s' FROM 'string') 
--       LEADING   ����ǰ����ַ�
--       TRAILING  ����������ַ�
select trim('a' FROM 'a b 123') FROM dual;

-- 14. ABS
-- ����ָ��ֵ�ľ���ֵ
SELECT abs(100),abs(-100) FROM dual;                

-- 15. CEIL *
-- ���ش��ڻ���ڸ������ֵ���С����
SELECT ceil(3.1415927) FROM dual;

-- 16. FLOOR *
-- �Ը���������ȡ����
SELECT floor(2345.67) FROM dual;

-- 17. MOD(n1,n2) *
--  ����һ��n1����n2������
SELECT mod(10,3),mod(3,3),mod(2,3) FROM dual;

-- 18. ROUND *
-- ����ָ���ľ��Ƚ�������(�Ա�20)
SELECT round(55.5),round(-55.4),trunc(55.5),trunc(-55.5) FROM dual;
SELECT round(3.1415926,3),round(-3.1415926,3),trunc(3.1415926,3),trunc(-3.1415926,3) FROM dual;

-- 19.SIGN *
-- ȡ����n�ķ���,����0����1,С��0����-1,����0����0
SELECT sign(100),sign(-100),sign(0) FROM dual;
        
-- 20.TRUNC *
-- ����ָ���ľ��Ƚ�ȡһ����
SELECT trunc(124.1666,-2) trunc1,trunc(124.16666,2) FROM dual;

-- 21.ADD_MONTHS *
-- ���ӻ��ȥ�·�
SELECT to_char(add_months(to_date('200712','yyyymm'),2),'yyyymm') FROM dual; 

SELECT to_char(add_months(to_date('200712','yyyymm'),-2),'yyyymm') FROM dual;

-- 22. LAST_DAY
-- ��������(����)�����һ��
SELECT last_day(to_date('2007-05-12','yyyy-mm-dd'))FROM dual;
SELECT to_char(to_date('2007-05-12','yyyy-mm-dd'),'yyyy-mm-dd') FROM dual;
SELECT to_char(last_day(to_date('2007-05-12','yyyy-mm-dd')),'yyyy-mm-dd')FROM dual;
SELECT to_char(SYSDATE,'yyyy-mm-dd hh24-mi-ss day') FROM dual;
SELECT to_char(last_day(SYSDATE),'yyyy-mm-dd') FROM dual;

-- 23.NEXT_DAY(date,'day')
-- ��������date������x֮�������һ�����ڵ�����
SELECT next_day('08-8��-2007','������') next_day FROM dual;
            
-- 24.SYSDATE  **
-- �����õ�ϵͳ�ĵ�ǰ����
SELECT to_char(sysdate,'yyyy-mm-dd day') FROM dual;

-- 25. TO_CHAR(date,'format') **
SELECT to_char(sysdate,'yyyy/mm/dd hh24:mi:ss day') FROM dual;
SELECT to_char(sysdate,'yyyy-mm-dd hh-mi-ss am') FROM dual;

-- 26. TO_DATE(string,'format') **
-- ���ַ���ת��ΪORACLE�е�һ������
SELECT to_date('2003-09-08 18:26:37', 'yyyy-mm-dd hh24:mi:ss') from dual;

-- 27. TO_NUMBER *
-- ���������ַ�ת��Ϊ����
SELECT to_number('2019') year FROM dual;

-- 28. GREATEST *
-- ����һ����ʽ�е����ֵ,���Ƚ��ַ��ı����С.
SELECT greatest('AA','AB','AC') FROM dual;
SELECT greatest('a','b','c') FROM dual;

-- 29. LEAST *
-- ����һ����ʽ�е���Сֵ 
SELECT least('��','��','��') FROM dual;
SELECT least('a','b','c') FROM dual;

-- 30.UID
-- ���ر�ʶ��ǰ�û���Ψһ����
SELECT uid FROM dual;
SELECT uid FROM emp;

-- 31.USER
-- ���ص�ǰ�û�������
SHOW user;
SELECT user FROM  dual;

-- 32.AVG(DISTINCT|ALL) *
-- all��ʾ�����е�ֵ��ƽ��ֵ,distinctֻ�Բ�ͬ��ֵ��ƽ��ֵ
SELECT avg(distinct sal) FROM emp;
SELECT avg(all sal) FROM emp;

-- 33.MAX(DISTINCT|ALL) *
-- �����ֵ,ALL��ʾ�����е�ֵ�����ֵ,DISTINCT��ʾ�Բ�ͬ��ֵ�����ֵ,��ͬ��ֻȡһ��
SELECT max(distinct sal) FROM emp;

-- 34.MIN(DISTINCT|ALL) *
-- ����Сֵ,ALL��ʾ�����е�ֵ����Сֵ,DISTINCT��ʾ�Բ�ͬ��ֵ����Сֵ,��ͬ��ֻȡһ��
SELECT min(all sal) FROM emp;

-- 35.GROUP BY *
-- ��Ҫ������һ��������ͳ��
SELECT deptno,count(*),sum(sal) FROM emp group by deptno;

-- 36.HAVING *
-- �Է���ͳ���ټ���������
SELECT deptno,count(*),sum(sal) FROM emp group by deptno 
having count(*)>=5;

-- 37. ORDER BY *
-- ���ڶԲ�ѯ���Ľ�������������
SELECT deptno,ename,sal FROM emp order by deptno,sal desc;

-- 38. Extract(date FROM datetime)
-- ������ʱ����ȡ���ض����ݣ�����ȡ���¡���ȣ�
SELECT extract(YEAR FROM sysdate)   FROM dual;
SELECT extract(MONTH FROM sysdate) FROM dual;
SELECT extract(DAY FROM sysdate)    FROM dual;
SELECT extract(HOUR FROM localtimestamp) FROM dual;
SELECT extract(MINUTE FROM localtimestamp) FROM dual;
SELECT extract(SECOND FROM localtimestamp) FROM dual;

--39. DECODE(expr,search1,result1[,search2,result2][,default])**
-- ��ֵ�жϣ����ĳһ�е��������ж�ֵ��ͬ����ʹ��ָ������ʾ�����������û����������������ʾĬ��ֵ
SELECT deptno,DECODE(deptno,'10','ABC','20','DEF','30','AAA','NO') result FROM dept;

-- 40.NULLIF(expr1,expr2)
-- ���expr1��expr2��ֵ��ȣ��򷵻�NULL�����򷵻�expr1
SELECT NULLIF('abc','abc') result FROM dual;
SELECT NULLIF('abc','abb') result FROM dual;


-- 41.NVL(expr1,expr2)**
-- ���expr1��null,�򷵻�expr2; ���expr1��Ϊnull,�򷵻�expr1
SELECT empno,ename,comm,NVL(comm,0) FROM emp;


-- 42. NVL2(expr1,expr2,expr3)
-- ���expr1����null,�򷵻�expr2;���expr1��null,�򷵻�expr3;����expr1�����������������ͣ���expr2��expr3�����ǳ�Long֮����κ���������
SELECT empno,ename,comm,NVL2(comm,1,0) FROM emp;

-- 43.Translate(x,from_string,to_string) *
-- ��'a1b0c2d3'�����ڡ�3210���г��ֹ����ַ����ҵ����á�pqxy����Ӧλ�õ��ַ��滻
-- ʵ��ʹ�������ʹ�ڶ������� �� ������������λ��һ��
-- 0 �� y ����, 1 �� x ����, 2 �� q ����, 3 �� p ����
SELECT translate('a1b0c2d3','3210','pqxy') from dual;
SELECT translate('32100123','3210','pqxy') from dual;






















