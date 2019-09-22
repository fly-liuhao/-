/***********************************DML���***************************************************/
-- DML��䣺INSERT��UPDATE��DELETE

-- 1. INSERT INTO
INSERT INTO dept VALUES(20,��K��,��L��); -- �������ֶ�����ֵ
INSERT INTO dept(deptno,dname) VALUES(20,��K��); --����ָ���ֶ�ֵ
INSERT INTO dept VALUES(60,��MARKET��,DEFAULT); -- ʹ��Ĭ��ֵ
INSERT INTO employee (empno,ename,sal,deptno) SELECT empno,ename,sal,deptno FROM emp WHERE deptno=20; -- ��INSERT��ʹ���Ӳ�ѯ
-- ʹ�ö��������ݣ������ã�
INSERT ALL
WHEN deptno=10 THEN INTO dept10
WHEN deptno=20 THEN INTO dept20
WHEN deptno=30 THEN INTO dept30
WHEN job='CLERK' THEN INTO clerk
ELSE INTO other
SELECT * FROM emp;

COMMIT;--�ύ����


-- 2. UPDATE
UPDATE emp SET sal=2560 WHERE ename='SCOTT';
UPDATE emp SET sal=sal*1.5,comm=sal*0.1 WHERE deptno=20;
UPDATE emp SET hiredate=TO_DATE('2007-12-25','yyyy-mm-dd') WHERE empno=7788;

UPDATE emp SET (job,sal,comm)=(SELECT job,sal,comm FROM emp WHERE ename='SMITH') WHERE ename='SCOTT';
UPDATE employee SET deptno=(SELECT deptno FROM emp WHERE empno=7788) WHERE job=(SELECT job FROM emp WHERE empno=7788); --����һ�ű��޸���һ�ű�

COMMIT;--�ύ����


-- 3. DELETE
DELETE FROM emp WHERE ename='SMITH'; --FROM����ʡ��
DELETE FROM emp;
DELETE FROM emp WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES');-- DELETE��ʹ���Ӳ�ѯ

COMMIT;--�ύ����

/***********************************����***************************************************/
--�ύ���� COMMIT;(DML���֮��Ҫ�ύ���� �ڴ�->Ӳ��)
--�ع���������� ROLLBACK;

UPDATE account SET balance=balance-100 WHERE account='A';
UPDATE account SET balance=banlance+100 WHERE account='B';--ִ��ʧ�ܣ����ս���أ�

UPDATE account SET balance=balance-100 WHERE account='A';
UPDATE account SET balance=banlance+100 WHERE account='B';--ִ��ʧ�ܣ����ս���أ�
ROLLBACK;--�ع����񣬻������񣬳�����һ�����ӵĽ��

















