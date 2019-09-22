-- 1.from ��1����2 ������������where��������
SELECT a.empno AS Ա�����, a.ename AS Ա������, b.dname as ���� FROM emp a, dept b WHERE a.deptno = b.deptno;
-- 2.inner join ������
SELECT a.empno As Ա�����, a.ename AS Ա������, b.dname as ���� FROM emp a JOIN dept b ON a.deptno = b.deptno ; 
-- 3.left outer join ��ѯ������˷��ذ��������������У����������a���в����������������У����в�������������������b����ֶ�ֵ������Ϊ��
SELECT a.empno As Ա�����, a.ename AS Ա������, b.dname as ���� FROM emp a LEFT OUTER JOIN dept b ON a.deptno = b.deptno;
-- 4.right outer join ��ѯ������˷��ذ��������������У��������ұ�b���в����������������У����в�������������������a����ֶ�ֵ������Ϊ�ա�
SELECT a.empno As Ա�����, a.ename AS Ա������, b.dname as ���� FROM emp a RIGHT OUTER JOIN dept b ON a.deptno = b.deptno;
-- 5.full outer join
SELECT a.empno As Ա�����, a.ename AS Ա������, b.dname as ���� FROM emp a FULL OUTER JOIN dept b ON a.deptno = b.deptno;
-- 6.cross  join
/***********************************����ѯ***************************************************/
-- һ��������
-- <1.��ֵ����>
-- ��ʾѧ��ѧ�š������Ͱ༶����
-- 1.��д��from ��1����2 ������������where��������
SELECT stu_id ,stu_name,class_name FROM t_student a,t_class b WHERE a.STU_CLASS_ID = B.CLASS_ID; 
-- 2.��д�� INNER JOIN ...ON (����)��
SELECT stu_id ,stu_name,class_name FROM t_student a INNER JOIN t_class b ON A.STU_CLASS_ID = b.CLASS_ID; 
-- ��ʾѧ��ѧ�š������Ͱ༶���ơ���ţ�ָ��������
SELECT stu_id ,stu_name,class_name��STU_CLASS_ID FROM t_student a INNER JOIN t_class b ON A.STU_CLASS_ID = b.CLASS_ID; 
-- ��ʾѧ�ּ������1.9��ѧ��ѧ�š������Ͱ༶���ƣ���������ѯ��
SELECT stu_id ,stu_name,class_name FROM t_student a INNER JOIN t_class b ON A.STU_CLASS_ID = b.CLASS_ID AND a.SCORE>1.9;
-- ��ʾѧ�ּ�����1.9��2.2֮���ѧ��ѧ�š������Ͱ༶���ƣ���������ѯ��
SELECT stu_id ,stu_name,class_name FROM t_student a INNER JOIN t_class b ON A.STU_CLASS_ID = b.CLASS_ID AND SCORE BETWEEN  1.9  AND 2.2;

-- <2.�ǵ�ֵ����>
SELECT * FROM emp;
SELECT * FROM salgrade;
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

-- <3.������>����һ�����У�
-- ��ʾԱ�������Լ��ϼ��쵼����
SELECT * FROM emp;
SELECT w.ename, m.ename FROM emp w, emp m WHERE w.mgr = m.empno;

-- <4.��Ȼ����>
-- ��Ȼ����(Natural join)��һ������ĵ�ֵ���ӣ���Ҫ��������ϵ�н��бȽϵķ�����������ͬ�������飬�����ڽ���а��ظ���������ȥ��������ֵ���Ӳ���ȥ���ظ��������С�
CREATE TABLE R(
 A NUMBER,
 B VARCHAR2(1),
 C NUMBER
);
INSERT INTO R(A,B,C) VALUES(1,'a',3);
INSERT INTO R(A,B,C) VALUES(2,'b',6);
INSERT INTO R(A,B,C) VALUES(3,'c',7);
CREATE TABLE S(
 D NUMBER,
 B VARCHAR2(1),
 E NUMBER
);
INSERT INTO S(D,B,E) VALUES(2,'c',7);
INSERT INTO S(D,B,E) VALUES(3,'d',5);
INSERT INTO S(D,B,E) VALUES(1,'a',3);
SELECT * FROM R INNER JOIN S ON S.b = R.b;-- ��ȥ���ظ���������
SELECT * FROM R Natural INNER JOIN S;-- ���ظ���������ȥ��

-- ����������
-- ��ʾ����ѧ����ѧ�š������Ͱ༶����
-- <1.������left outer join> ��ѯ������˷��ذ��������������У����������a���в����������������У����в�������������������b����ֶ�ֵ������Ϊ��
SELECT stu_id ,stu_name,class_name��STU_CLASS_ID FROM t_student a LEFT OUTER JOIN t_class b ON a.stu_class_id = b.class_id; 

-- <2.������right outer join> ��ѯ������˷��ذ��������������У��������ұ�b���в����������������У����в�������������������a����ֶ�ֵ������Ϊ�ա�
SELECT stu_id ,stu_name,class_name��STU_CLASS_ID FROM t_student a RIGHT OUTER JOIN t_class b ON a.stu_class_id = b.class_id; 

-- <3.ȫ����full outer join> ��ѯ������˷��ذ��������������У����������(a)���ұ�b���в����������������У����в������������������е��ֶ�ֵ������Ϊ�ա�
SELECT stu_id ,stu_name,class_name��STU_CLASS_ID FROM t_student a FULL OUTER JOIN t_class b ON a.stu_class_id = b.class_id; 

-- ������������
SELECT stu_id ,stu_name,class_name��STU_CLASS_ID FROM t_student,t_class ; -- Ĭ�Ͼ��ǽ�������
SELECT stu_id ,stu_name,class_name��STU_CLASS_ID FROM t_student a CROSS JOIN t_class b ; 

-- ���ű��ѯ
-- ��д��
SELECT stu_id ,stu_name,class_name,major_name FROM t_student a,t_class b,t_major c WHERE a.STU_CLASS_ID = B.CLASS_ID AND b.class_major_id = c.major_id; 
-- ��д��
SELECT stu_id ,stu_name,class_name,major_name FROM t_student a INNER JOIN t_class b ON a.STU_CLASS_ID = b.class_id INNER JOIN t_major c ON b.class_major_id = c.major_id; 


/***********************************��ͼ***************************************************/
-- ������ͼ
CREATE VIEW stu_view AS SELECT stu_id ,stu_name,class_name,score FROM t_student INNER JOIN t_class ON STU_CLASS_ID = class_id;
-- �鿴��ͼ
SELECT * FROM stu_view;
-- ɾ����ͼ
DROP VIEW stu_view;

/***********************************�Ӳ�ѯ***************************************************/
-- �Ӳ�ѯ��SELECT����Ƕ�ף�
-- <1.�����Ӳ�ѯ>
-- ��ѯ��SCOTTͬһ���ŵ�Ա����Ϣ
SELECT ename,sal,deptno FROM emp WHERE deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');
-- <2.�����Ӳ�ѯ>
-- ��ѯ��10�Ų���Ա��ְλ��ͬ��Ա����Ϣ��
SELECT ename,job,sal,deptno FROM emp WHERE job IN (SELECT DISTINCT job FROM emp WHERE deptno=10);
SELECT ename,sal,deptno FROM emp WHERE sal> ALL (SELECT sal FROM emp WHERE deptno=30);-- ALL
SELECT ename,sal,deptno FROM emp WHERE sal> ANY (SELECT sal FROM emp WHERE deptno=30); -- ANY
-- <3.�����Ӳ�ѯ>
-- ��ѯ��SMITH���ڲ��ź�ְ����ͬ��Ա����Ϣ
SELECT ename,job,sal,deptno FROM emp WHERE (deptno,job)=(SELECT deptno,job FROM emp WHERE ename='SMITH');
-- ���ڲ���ƽ�����ʵĹ�Ա��Ϣ
SELECT ename,job,sal FROM emp INNER JOIN (SELECT deptno,avg(sal) avgsal FROM emp GROUP BY deptno) dept ON emp.deptno=dept.deptno AND sal>dept.avgsal;


/***********************************CASE***************************************************/
-- CASE���ʽ��ֻ������Oracle�У�
--����Ա����EMP,��10�Ų���Ա�����ʶ���,Ա�����ʴ���3000��grade��1������2000��grade��2������grade��3��
SELECT ename,sal, CASE WHEN sal>3000 THEN 1
                      WHEN sal>2000 THEN 2
                      ELSE 3 END grade
FROM emp WHERE deptno=10;

-- NVL()--��ֵ����
-- ��ʾԱ�������Ͳ�����comm��
SELECT ename, comm FROM emp;
-- ��ʾԱ�������Ͳ�����comm��������Ϊ��NULL�ģ���0�滻
SELECT enamel, NVL(comm,0) FROM emp;




-- �κ���ҵ
-- 1. ���񣺰ٶ���������Ȼ���ӡ������֮���´ο������ȡ���⣩
-- ����Ȼ����(Natural join)��һ������ĵ�ֵ���ӣ���Ҫ��������ϵ�н��бȽϵķ�����������ͬ�������飬�����ڽ���а��ظ���������ȥ��������ֵ���Ӳ���ȥ���ظ��������С�
CREATE TABLE R(
 A NUMBER,
 B VARCHAR2(1),
 C NUMBER
);
INSERT INTO R(A,B,C) VALUES(1,'a',3);
INSERT INTO R(A,B,C) VALUES(2,'b',6);
INSERT INTO R(A,B,C) VALUES(3,'c',7);

CREATE TABLE S(
 D NUMBER,
 B VARCHAR2(1),
 E NUMBER
);
INSERT INTO S(D,B,E) VALUES(2,'c',7);
INSERT INTO S(D,B,E) VALUES(3,'d',5);
INSERT INTO S(D,B,E) VALUES(1,'a',3);

SELECT * FROM R INNER JOIN S ON S.b = R.b;-- ��ȥ���ظ���������
SELECT * FROM R Natural INNER JOIN S;-- ���ظ���������ȥ��

SELECT * FROM t_student a INNER JOIN t_class b ON A.STU_CLASS_ID = b.CLASS_ID; /*��ֵ����ȥ���˱Ƚϵ���*/
SELECT * FROM t_student a Natural INNER JOIN t_class b; /*��ֵ����ȥ���˱Ƚϵ���*/

-- 2. ������ʾѧ���������༶���ơ�רҵ���ơ�ʹ��3�ű�ѧ�����༶��רҵ��
SELECT stu_name AS ѧ������, class_name AS �༶����, major_name AS רҵ���� FROM t_student INNER JOIN t_class ON stu_class_id = class_id INNER JOIN t_major ON class_major_id = major_id;

-- 3. ������ʾ�༶���Ϊ10��ѧ���������༶���ơ�רҵ���ơ�ʹ��3�ű�ѧ�����༶��רҵ��
SELECT stu_name AS ѧ������, class_name AS �༶����, major_name AS רҵ���� FROM t_student INNER JOIN t_class ON stu_class_id = class_id INNER JOIN t_major ON class_major_id = major_id AND class_id = 10;

-- 4. ���񣺴���һ����ͼ������ѧ��������ѧ�ּ��㡢�ֻ�����š��༶���ơ�רҵ���ơ��Ӹ���ͼ�в�ѯ���Ϊ10��ѧ���������༶���ơ�д��������ͼ����SQL��䡣
CREATE VIEW stu_class_major AS SELECT stu_name, score, mobile, class_id, class_name, major_name FROM t_student INNER JOIN t_class ON stu_class_id = class_id INNER JOIN t_major ON class_major_id = major_id;
SELECT * FROM stu_class_major;

-- 5. ��������Oracle���ϲ�����ѧ֮[UNION|UNION ALL|INTERSECT|MINUS]���´ο������ȡ���⣩��
-- UNION (���ز���)����ִ��UNION ʱ���Զ�ȥ��������е��ظ��У����Ե�һ�еĽ��������������
SELECT * FROM emp WHERE sal >= 2000 AND sal <=3000
UNION
SELECT * FROM emp WHERE sal >= 2000;
-- UNION ALL (���ز���)����ȥ���ظ��У����Ҳ��Խ������������
SELECT * FROM emp WHERE sal >= 2000 AND sal <=3000
UNION ALL
SELECT * FROM emp WHERE sal >= 2000;
-- INTERSECT  (����)��ȡ����������Ľ����������Ե�һ�еĽ�������������С�
SELECT * FROM emp WHERE sal >= 2000 AND sal <=3000
INTERSECT
SELECT * FROM emp WHERE sal >= 2000;
-- MINUS  (�)��ֻ��ʾ�ڵ�һ�������д��ڣ��ڵڶ��������в����ڵ����ݡ������Ե�һ�еĽ��������������
SELECT * FROM emp WHERE sal >= 2000
MINUS
SELECT * FROM emp WHERE sal >= 2000 AND sal <=3000;

-- ��һ������
SELECT deptno FROM emp 
UNION 
SELECT deptno FROM emp ;

SELECT deptno FROM emp 
UNION ALL
SELECT deptno FROM emp ;

SELECT deptno FROM emp 
INTERSECT
SELECT deptno FROM emp ;

SELECT deptno FROM emp 
MINUS
SELECT deptno FROM emp ;


-- 6. ��ʾ���й�Ա��ƽ�����ʡ��ܹ��ʡ���߹��ʡ���͹���
SELECT AVG(sal), SUM(sal), MAX(sal), MIN(sal)  FROM emp;

-- 7. ��ʾÿ�ָ�λ�Ĺ�Ա������ƽ������
SELECT COUNT(e.empno), AVG(sal) FROM emp e GROUP BY e.job;

-- 8. ��ʾ��Ա�������Լ���ò����Ĺ�Ա��
SELECT COUNT(e.empno), COUNT(e.comm) FROM emp e;

-- 9. ��ʾ����������
SELECT COUNT( DISTINCT mgr) FROM emp;

-- 10. ��ʾ��Ա���ʵ������
SELECT MAX(sal)- MIN(sal) FROM emp;

-- 11. ��ʾÿ����ÿ��λ��ƽ�����ʡ�ÿ�����ŵ�ƽ�����ʡ�ÿ��λ��ƽ������
SELECT deptno,job, AVG(sal) FROM emp GROUP BY deptno,job;
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno;
SELECT job, AVG(sal) FROM emp GROUP BY job;

-- 12. ��ʾ����20�Ĳ������ơ��Լ��ò��ŵ����й�Ա���֡���Ա���ʺ͸�λ
SELECT dname, ename, sal, job FROM emp INNER JOIN dept ON emp.deptno = dept.deptno  AND emp.deptno = 20;

-- 13. ��ʾ��ò��������й�Ա���֡������Լ����ڲ���
SELECT ename, comm, deptno FROM emp WHERE comm IS NOT NULL AND comm != 0;
SELECT ename, comm, deptno FROM emp WHERE comm IS NOT NULL AND comm <> 0;
SELECT ename, comm, deptno FROM emp WHERE empno NOT IN (SELECT empno FROM emp WHERE comm IS NULL OR comm = 0);-- �Ӳ�ѯ

-- 14. ��ʾ��DALLAS���������й�Ա���֡���Ա�����Լ����ڲ���
SELECT ename, sal, d.dname FROM emp e INNER JOIN dept d ON e.deptno = d.deptno AND d.loc = 'DALLAS'; 

-- 15. ��ʾ��ԱSCOTT�Ĺ���������
SELECT b.ename FROM emp a ,emp b WHERE a.mgr = b.empno AND a.ename = 'SCOTT';
SELECT b.ename FROM emp a INNER JOIN emp b ON a.mgr = b.empno AND a.ename = 'SCOTT';
SELECT ename FROM emp WHERE empno = (SELECT mgr FROM emp WHERE ename = 'SCOTT');-- �Բ�ѯ

-- 16. ��ѯEMP���SALGRADE����ʾ����20�Ĺ�Ա���֡������Լ��乤�ʼ���
SELECT ename, sal, CASE WHEN sal >= 700 AND sal <= 1200 THEN 1
                        WHEN sal >= 1201  AND sal <= 1400 THEN 2
                        WHEN sal >= 1401  AND sal <= 2000 THEN 3
                        WHEN sal >= 2001  AND sal <= 3000 THEN 4
                        WHEN sal >= 3001  AND sal <= 9999 THEN 5 
                        END grade
FROM emp WHERE deptno = 20;

-- 17. ��ʾ����10�����й�Ա���֡��������ơ��Լ�������������
SELECT ename, dname FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno AND e.deptno = 10;

-- 18. ��ʾ����10�����й�Ա���֡��������ơ��Լ�������Ա����
SELECT ename ,dname FROM emp e LEFT OUTER JOIN dept d ON e.deptno = d.deptno AND e.deptno = 10;

-- 19. ��ʾ����10�����й�Ա���֡��������ơ��Լ������������ƺ͹�Ա����
SELECT ename ,dname FROM emp e FULL OUTER JOIN dept d ON e.deptno = d.deptno AND e.deptno = 10;


-- ѡ����
-- 1. ��ʾBLAKEͬ���ŵ�����Ա����������ʾBLAKE
SELECT ename FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'BLAKE') AND ename <> 'BLAKE';

-- 2. ��ʾ����ƽ�����ʵ�����Ա���������ʺͲ��ź�
SELECT ename, sal, deptno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);

-- 3. ��ʾ��������ƽ�����ʵ�����Ա���������ʺͲ��ź�
SELECT ename, sal, e.deptno, avg_sal 
FROM emp e 
INNER JOIN (SELECT deptno, avg(sal) avg_sal FROM emp GROUP BY deptno) temp 
ON e.deptno = temp.deptno AND e.sal > temp.avg_sal;

-- 4. ��ʾ����CLERK��λ���й�Ա���ʵ����й�Ա�������ʺ͸�λ
SELECT ename, sal, job FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE job = 'CLERK');
SELECT ename, sal, job FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE job = 'CLERK');

-- 5. ��ʾ���ʡ�������SCOTT��ȫһ�µ����й�Ա�������ʺͲ���
SELECT ename, sal, comm FROM emp WHERE (sal,NVL(comm,0)) = (SELECT sal, NVL(comm,0) FROM emp WHERE ename = 'SCOTT');







