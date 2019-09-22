--1.1�ַ�����
/*
UPPER(��|�ַ���):���ַ���������ȫ��תΪ��д
LOWER(��|�ַ���):���ַ���������ȫ��תΪСд
INITCAP(��|�ַ���):���ַ���������ĸתΪ��д
LENGTH(��|�ַ���):����ַ����ĳ���
SUBSTR(��|�ַ�������ʼ����������):��ȡ�ַ���
REPLACE(��|�ַ���):�ַ����滻
TRIM(��|�ַ���):ȥ�����ҿո�
INSTR(��|�ַ�����Ҫ���ҵ��ַ��� ):�����ַ�����ĳ���ַ�������
*/
SELECT * FROM EMP;
SELECT UPPER(ENAME),ENAME FROM EMP;/*תΪ��д*/
SELECT LOWER(ENAME),ENAME FROM EMP;/*תΪСд*/
SELECT INITCAP(ENAME),ENAME FROM EMP;/*����ĸ��д*/
SELECT LENGTH(ENAME),ENAME FROM EMP;/*��ȡ�ַ����ĳ���*/
SELECT SUBSTR(ENAME,1,3),ENAME FROM EMP;/*��ȡ�ַ���*/
SELECT REPLACE(ENAME,'S','XXX'),ENAME FROM EMP;/*�ַ����滻*/
SELECT TRIM(ENAME) FROM EMP;/*ȥ�����ҿո�*/
SELECT INSTR(ENAME,'E'), ENAME FROM EMP;/*�����ַ�����ĳ���ַ�������(�ҵ������������Ҳ�������0)*/


--1.2��ֵ����
/*
    ROUND(���֣�����λ��)����С�������������룬����ָ��������λ������ָ����ὫС����֮�������ȫ��������������
    MOD(���֣�����):ȡģ
*/
CREATE TABLE T_SALARY(/*����һ�����ʱ�*/
    EID NUMBER PRIMARY KEY,
    ENAME VARCHAR2(20),
    ESALARY NUMBER
);
INSERT INTO T_SALARY(EID,ENAME,ESALARY) VALUES(1,'zhangsan',4536.25546);
INSERT INTO T_SALARY(EID,ENAME,ESALARY) VALUES(2,'lisi',3985.65845);
INSERT INTO T_SALARY(EID,ENAME,ESALARY) VALUES(3,'wangwu',4937.35468);
SELECT * FROM T_SALARY;
/*��Ա�����ʱ�����λС��*/
SELECT ROUND(s.ESALARY),s.ESALARY FROM T_SALARY s;
SELECT ROUND(s.ESALARY,3),s.ESALARY FROM T_SALARY s;
/*��Ա�����ʶ�1000ȡģ��������*/
SELECT MOD(s.ESALARY,1000),s.ESALARY FROM T_SALARY s;


--1.3���ں���
/*
    ADDDATE(���ڣ�����)��ָ�����������ָ��������������µ�����(MySQLд��)
    ����+���֣�ָ�����������ָ��������������µ�����(Oracleд��)
    ADD_MONTHS(���ڣ�����)��ָ�����������ָ����Լ����������µ�����(Oracleд��)
    LAST_DAY(����)�����ָ������(����)�����һ��
*/
-- 1.3.1��öԵ�ǰϵͳʱ��
/*Oracle д��*/
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE,'yyyy-MM-dd HH24:mi:ss') FROM DUAL;
/* MySQLд��*/
SELECT NOW() FROM t_user;

--1.32 
SELECT TO_CHAR(e.HIREDATE,'yyyy-mm-dd') FROM EMP e;
/*��һ��*/
SELECT adddate(NOW(),1),NOW() FROM t_user;/*MySQLд��*/
SELECT TO_CHAR(SYSDATE + 1,'yyyy-mm-dd hh24-mi-ss') FROM DUAL;
SELECT TO_CHAR(e.HIREDATE + 1,'yyyy-MM-dd HH24:mi:ss'),TO_CHAR(e.HIREDATE,'yyyy-MM-dd HH24:mi:ss') FROM EMP e;
/*��һ����*/
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,1),'yyyy-mm-dd hh24-mi-ss') FROM DUAL;
SELECT TO_CHAR(ADD_MONTHS(e.HIREDATE,1),'yyyy-MM-dd HH24:mi:ss'),TO_CHAR(e.HIREDATE,'yyyy-MM-dd HH24:mi:ss') FROM EMP e;
/*��һ��*/
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,12),'yyyy-mm-dd hh24-mi-ss') FROM DUAL;
SELECT TO_CHAR(ADD_MONTHS(e.HIREDATE,12),'yyyy-MM-dd HH24:mi:ss'),TO_CHAR(e.HIREDATE,'yyyy-MM-dd HH24:mi:ss') FROM EMP e;

/*���㵱ǰ�µ����һ��*/
SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1)),'yyyy-mm-dd') FROM DUAL;


--1.4ͨ�ú���
/*
    IFNULL(�ֶ�����Ĭ��ֵ)��������ֶ�����ΪNULL,������Ĭ��ֵ��MySQL��
    NVL(col,val):��colΪ��ʱȡval��Ϊ����ֵ����col��Ϊ��ʱȡcolֵ
    DECODE(�ֶ�,�ж�ֵ1, ����ֵ1, �ж�ֵ2, ����ֵ2, ... , Ĭ��ֵ):��ֵ�жϣ����ĳһ�е��������ж�ֵ��ͬ����ʹ��ָ������ʾ�����������û����������������ʾĬ��ֵ
    CASE ��|��ֵ WHEN ���ʽ1 THEN ��ʾ���1 ... ELSE ���ʽ2 END:����ʵ�ֶ����жϣ���WHERE֮���д����������THEN֮�� ��д�����������ʾ�����������������ʹ��ELSE�еı��ʽ����
*/
SELECT * FROM EMP;
SELECT NVL(e.COMM,2333) ,e.COMM FROM EMP e;

CREATE TABLE T_USER(/*����һ���û���*/
    USER_ID NUMBER PRIMARY KEY,
    USER_NAME VARCHAR2(20),
    SEX VARCHAR2(20)
);
INSERT INTO T_USER(USER_ID,USER_NAME,SEX) VALUES(1,'zhangsan',null);
INSERT INTO T_USER(USER_ID,USER_NAME,SEX) VALUES(2,'lisi','��');
INSERT INTO T_USER(USER_ID,USER_NAME,SEX) VALUES(3,'wangwu','Ů');
SELECT *FROM T_USER;
/*��ֵ�ж�*/
SELECT NVL(u.SEX,'����'),u.SEX FROM T_USER u;
/*CASE�ж�*/
SELECT CASE WHEN u.SEX = '��' THEN '��' ELSE '��' END, u.SEX FROM T_USER u;
/*DECODE��ֵ�ж�*/
SELECT DECODE(u.SEX,'��','��','Ů','��',null) FROM T_USER u;

--1.5ͳ�ƺ���
/*
    COUNT�����ȫ���ľӼ�¼��(��ҳ��ʱ����õ���
    SUM������ܺ�
    AVG:ƽ��ֵ
    MAX:���ֵ
    MIN:��Сֵ
*/
SELECT * FROM EMP;
/*��ѯԱ������*/
SELECT COUNT(1) FROM EMP;
/*���ÿ����֧�����ܺ�*/
SELECT SUM(SAL)+SUM(COMM) AS SUM FROM EMP; 
/*���Ա����߹���*/
SELECT MAX(SAL) FROM EMP;
/*���Ա����͹���*/
SELECT MIN(SAL) FROM EMP;
/*���Ա��ƽ������*/
SELECT AVG(SAL) FROM EMP;
/*����ʾ����*/
SELECT MAX(SAL) AS "��߹���", MIN(SAL) AS "��͹���", ROUND(AVG(SAL),3) AS "ƽ������" FROM EMP;






