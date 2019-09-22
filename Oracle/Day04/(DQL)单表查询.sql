-- �����༶��
CREATE TABLE classes(
    class_id VARCHAR2(10) PRIMARY KEY,
    class_name VARCHAR2(20) 
);
-- ��������:INSERT INTO ����(�ֶ���1,�ֶ���2,...) VALUES(ֵ1,ֵ2,...);
INSERT INTO classes VALUES ('10','��һ��');-- Ĭ�ϲ���(���ն���˳��������д)
INSERT INTO classes VALUES ('20','������');
INSERT INTO classes VALUES ('30','����һ��');
INSERT INTO classes (class_id,class_name) VALUES ('40','��������');-- ͨ�������ֶδ���
INSERT INTO classes (class_id,class_name) VALUES ('50','��ýһ��');
INSERT INTO classes (class_id,class_name) VALUES ('60','��һ��');
-- �ύ����
COMMIT;-- �����ݿ��ύ

-- ��ѯ������ 
SELECT * FROM classes;-- ��ѯ�������У�FROM��SELECT��ִ�У�
SELECT class_id FROM classes;-- ��ѯ�����У�ͶӰ��

-- ����
/*��ı���*/
SELECT  c.class_id,c.class_name FROM classes c;-- ���ֱ�Ӹ��ϱ���
/*�ֶεı���*/
SELECT class_id ѧ�����, class_name ѧ������ FROM classes;-- ֱ�����ֶκ���ӱ���
SELECT class_id "ѧ�����", class_name "ѧ������" FROM classes;-- ����ʹ��˫����
SELECT class_id AS ѧ�����, class_name AS ѧ������ FROM classes;-- AS �� ����
SELECT class_id AS "ѧ�����", class_name AS "ѧ������" FROM classes;-- AS + ���ű���

-- ȥ����ѯ�����ĳ�ֶ��ظ��� 
SELECT DISTINCT class_name FROM classes;
SELECT DISTINCT class_name,class_id FROM classes;

-- �����ֶ�(||����CONCAT)
SELECT  class_id||class_name FROM classes;-- ʹ�á�||��
SELECT CONCAT(class_id,class_name) AS "�༶��Ϣ" FROM classes; -- ʹ�á�CONCAT��

-- ����(Ĭ������)
SELECT  class_id,class_name FROM classes ORDER BY class_id;-- Ĭ������
SELECT  class_id,class_name FROM classes ORDER BY class_id ASC;-- ����(ASC)
SELECT  class_id,class_name FROM classes ORDER BY class_id DESC;-- ����(DESC)
SELECT  class_id AS cid,class_name FROM classes ORDER BY cid DESC;-- �����ֶα�������


-- ����ѧ����
CREATE TABLE student(
    stu_id VARCHAR2(20) PRIMARY KEY,
    stu_name VARCHAR2(20) ,
    sex VARCHAR2(2),
    birthday DATE ,
    score NUMBER ,
    mobile VARCHAR2(11),
    stu_class_id VARCHAR2(10),
    CONSTRAINT FK_STUDENTS FOREIGN KEY (stu_class_id) REFERENCES CLASSES(class_id)
);
INSERT INTO student (stu_class_id,Stu_Id, stu_name, sex, birthday, score, mobile) VALUES ('10','2001', '����', '��', TO_DATE('2001-04-01 12:07:56', 'YYYY-MM-DD HH24:MI:SS'), '3.23', '13587569541');
INSERT INTO student (stu_class_id,stu_id, stu_name, sex, birthday, score, mobile) VALUES ('10','2002', '����', '��', TO_DATE('1998-12-24 12:08:22', 'YYYY-MM-DD HH24:MI:SS'), '2.14', null);
INSERT INTO student (stu_class_id,stu_id, Stu_Name, Sex, Birthday, Score, Mobile) VALUES ('20','2003', '����', 'Ů', TO_DATE('1999-03-12 12:09:22', 'YYYY-MM-DD HH24:MI:SS'), '2.62', '12345678910');
INSERT INTO student (stu_class_id,stu_id, stu_name, sex, birthday, score, mobile) VALUES ('30','2004', '����', '��', TO_DATE('1999-06-04 12:09:26', 'YYYY-MM-DD HH24:MI:SS'), '3.47', 'null');
INSERT INTO student (stu_class_id,stu_id, stu_name, sex, birthday, score, mobile) VALUES ('40','2005', '��_��', 'Ů', TO_DATE('2000-09-04 12:09:26', 'YYYY-MM-DD HH24:MI:SS'), '3.77', '14856987645');
INSERT INTO student (stu_class_id,stu_id, stu_name, sex, birthday, score, mobile) VALUES ('50','2006', '�ܻ���', '��', null, '3.77', 14852658458);

--�޶���ѯ
/* =�� >��<��<>��>=��<=��!= */
SELECT * FROM student WHERE sex = 'Ů';
SELECT * FROM student WHERE sex != 'Ů';
SELECT * FROM student WHERE score >= 3.0 ;
SELECT * FROM student WHERE score <= 3.0 ;
SELECT * FROM student WHERE stu_class_id != '10';
SELECT * FROM student WHERE stu_class_id <> '10';-- ��Ų�Ϊ10��ѧ����<>�൱��!=��
/*AND*/
SELECT * FROM student WHERE SCORE>3.0 AND SEX = 'Ů';-- ѧ�ִ���3.0���Ա���Ů��ѧ��
/*OR*/
SELECT * FROM student WHERE stu_class_id = '10' OR stu_class_id = '30';-- �༶Ϊ10����Ϊ30��ѧ��
SELECT * FROM student WHERE SCORE>3.0 OR SEX = '��' AND stu_class_id = '10';/*AND���ȼ���OR��*/
/*IN*/
SELECT * FROM student WHERE stu_class_id IN('10','30');-- �����10����20��ѧ��
/*NOT IN*/
SELECT * FROM student WHERE stu_class_id NOT IN('10','30');-- ��Ų���10����20��ѧ��
/*BETTON AND*/--(�����߽�ֵ)
SELECT * FROM student WHERE score BETWEEN 2.5 AND 3.5;-- ѧ����2.5~3.5֮�е�ѧ��
/*NOT BETTON AND*/
SELECT * FROM student WHERE Score NOT BETWEEN 2.5 AND 3.5;-- ѧ�ֲ���2.5~3.5֮�е�ѧ��
/*IS NULL*/
SELECT * FROM student WHERE mobile IS NULL;-- �绰�ǿյĵ�ѧ��
/*IS NOT NULL*/
SELECT * FROM student WHERE birthday IS NOT NULL;-- �������ڲ�Ϊ�յ�ѧ��
/*LIKE(ģ����ѯ)*/
SELECT * FROM student WHERE stu_name LIKE '��%';-- ���������ִ�ͷ��ѧ��
SELECT * FROM student WHERE stu_name LIKE '%��%';-- ���ֺ��л��ֵ�ѧ��
SELECT * FROM student WHERE stu_name LIKE '%��';-- ���������β��ѧ��
SELECT * FROM student WHERE stu_name LIKE '_��_';-- �����к��ԣ���ǰ���һ���ַ���ѧ����"_"����ʾ�����ַ���
SELECT * FROM student WHERE stu_name LIKE '%%';--����Ϊ����ֵ��ѧ�����ǿգ�
SELECT * FROM student WHERE stu_name LIKE '%\_%' ESCAPE '\';-- ���ֺ��С�_����ѧ�������������ַ���ʹ��ESCAPE�Զ���ת���ַ���
/*NOT LIKE*/
SELECT * FROM student WHERE stu_name NOT LIKE '��%';-- ���ֲ����Ŵ�ͷ��ѧ��

-- �����⣺ģ������LIKE '%%' ��ֱ�Ӳ�ѯ������
/*
    1.ͨ����һ�ַ�ʽ���ѯ��������
    2.ͨ���ڶ��ַ�ʽ��ѯ������в������յ�����
*/
CREATE TABLE book(
    bookname VARCHAR2(20),
    pub VARCHAR(20)
);
INSERT INTO book VAlUES('����ϵͳ','');-- pubΪ��
INSERT INTO book VAlUES('����ԭ��','');
INSERT INTO book VAlUES('','���ӹ�ҵ������');-- booknameΪ��
INSERT INTO book VAlUES('','�����ʵ������');
INSERT INTO book VAlUES('�������','�廪��ѧ������');--����Ϊ��
INSERT INTO book VAlUES('Java�������','���ϴ�ѧ������');

SELECT * FROM book;
SELECT * FROM book WHERE bookname LIKE '%%' AND pub LIKE '%%';





