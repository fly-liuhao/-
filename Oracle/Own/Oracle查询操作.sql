-- ��ѯEMP���е�����������
SELECT *FROM EMP;

-- ��ʾ���в����ֶΣ�ͶӰ��
SELECT EMPNO,ENAME FROM EMP; 

--ʹ�ñ���
SELECT e.EMPNO,e.ENAME,e.JOB FROM EMP e; 
-- ��������һ�ֲ���
SELECT
    e.EMPNO AS "Ա�����",
    e.ENAME AS "Ա������",
    e.JOB AS "Ա��ְλ" 
FROM EMP e; 

-- ȥ���ظ�����(DISTINCT)
SELECT DISTINCT e.JOB FROM EMP e; 

-- ������ʾ���Ѷ��кϲ���һ�н�����ʾ
SELECT CONCAT(e.EMPNO,e.ENAME) AS "Ա����Ϣ" FROM EMP e; 

--�޶���ѯ
SELECT e.* FROM EMP e WHERE e.EMPNO = 7369;
SELECT e.* FROM EMP e WHERE e.SAL > 2000;
SELECT e.* FROM EMP e WHERE e.SAL >= 2000 AND e.SAL <= 3000;/*(��ѯ������2500��3000��Χ�ڵ�Ա����Ϣ)*/
-- Oracleר�в�ѯ(BETWEEN)
SELECT * FROM EMP WHERE SAL BETWEEN 2500 AND 3000;/*BETWEEN ��Сֵ AND ���ֵ*/
SELECT * FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 20;/*��ѯ���߹�ϵ����Ϣ(��ѯ10���Ż�20���ŵ�����Ա����Ϣ)*/
SELECT e.* FROM EMP e WHERE e.DEPTNO = 10 OR e.DEPTNO = 20;
-- ͨ��IN�ؼ���  (IN��˼�ǰ���)
SELECT e.* FROM EMP e WHERE e.DEPTNO IN(10,20);
SELECT e.* FROM EMP e WHERE e.DEPTNO NOT IN(10,20);

-- �ж��Ƿ�Ϊ�գ�IS NOT NULL�������ֶβ�Ϊ��    IS NULL����ʾ�ֶ�Ϊ�գ�
SELECT e.* FROM EMP e WHERE e.COMM IS NOT NULL;/*��ѯ����Ϊ�յ�Ա����Ϣ*/ 
SELECT e.* FROM EMP e WHERE e.COMM!=0;/*����˵���ֵ*/
SELECT e.* FROM EMP e WHERE e.COMM IS NULL;

-- ģ����ѯ(LIKE %����ƥ��)
SELECT * FROM EMP e WHERE e.ENAME LIKE 'S%';/*��ѯԱ��������S��ͷ������Ա����Ϣ*/
SELECT * FROM EMP e WHERE e.ENAME LIKE '%S%';/*��ѯԱ��������S������Ա����Ϣ*/
SELECT * FROM EMP e WHERE e.ENAME NOT LIKE '%S%';/*��ѯԱ����������S������Ա����Ϣ*/

-- ����ORDER BY  ASC:���� DESC:���� Ĭ���������У�
SELECT e.* FROM EMP e ORDER BY e.SAL;/*��ѯ����Ա����Ϣ�����Ұ���Ա�������ɵ͵�������*/
SELECT e.* FROM EMP e ORDER BY e.SAL ASC;
SELECT e.* FROM EMP e ORDER BY e.SAL DESC;

-- ��ѯ����ALLEN ���������Ա��
SELECT e.* FROM EMP e WHERE e.ENAME = 'ALLEN';
SELECT e.* FROM EMP e WHERE e.ENAME <> 'ALLEN';-- <>:�����ڵ�Ч��



-- ����ѯ
SELECT * FROM EMP;/*14������*/
SELECT * FROM DEPT;/*4������*/
SELECT * FROM EMP,DEPT;/*�������56������-----�ѿ�����ЧӦ��û�мӹ����ֶΣ�*/
SELECT e.* FROM EMP e,DEPT d WHERE e.DEPTNO = d.DEPTNO;/*��ӹ����ֶΣ������ѿ�����*/
/*�����⣺�ѿ�����������ԭ����ʲô��*/
/*�𣺱�֮��û����ӹ����ֶ�*/ 
-- ��ѯ����Ա����Ҫ����ʾԱ����ţ�Ա�����������ű�ţ���������
SELECT e.EMPNO, e.ENAME, d.DEPTNO,d.DNAME FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO;


--���Ӳ�ѯ 
SELECT e.EMPNO, e.ENAME, e.MGR, m.ENAME FROM EMP e, EMP m WHERE e.MGR = m.EMPNO; /*��ѯ��ÿ��Ա����Ա����ţ�Ա���������쵼��ţ��쵼����*/
--�ڶ��ַ�ʽ �����ӣ������Ϊ����ȫ��չʾ���� �����ӣ����ұ�Ϊ����ȫ��չʾ����û��ƥ�䵽����ʾnull���棩
SELECT e.EMPNO, e.ENAME, e.MGR, m.ENAME FROM EMP e LEFT JOIN EMP m on (e.MGR = m.EMPNO);/*������*/
SELECT e.EMPNO, e.ENAME, e.MGR, m.ENAME FROM EMP e RIGHT JOIN EMP m on (e.MGR = m.EMPNO);/*������*/
SELECT e.EMPNO, e.ENAME, e.DEPTNO, d.DNAME FROM EMP e RIGHT JOIN DEPT d on (e.DEPTNO = d.DEPTNO);/*������: ��ѯ��ÿ��Ա����Ա����ţ�Ա�����������ű�ţ���������*/


-- ������ĺϲ���UNION  UNION ALL��
/*
UNION:���ز�ѯ�����ȫ�����ݣ��ظ����ݲ���ʾ
UNION ALL :���ز�ѯ�����ȫ�����ݣ��ظ�����Ҳ����ʾ
*/
SELECT * FROM DEPT
UNION
SELECT * FROM DEPT;

SELECT * FROM DEPT
UNION ALL 
SELECT * FROM DEPT;











