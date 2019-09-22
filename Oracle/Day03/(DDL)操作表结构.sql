-- ����Ժϵ��
CREATE TABLE T_DEPATMENT(
    dept_id VARCHAR2(10) PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL UNIQUE
);

-- ����רҵ��
CREATE TABLE T_MAJOR(
    major_id VARCHAR2(10) PRIMARY KEY,
    major_name VARCHAR2(20) NOT NULL UNIQUE,
    major_dept_id VARCHAR2(10),
    CONSTRAINT FK_Major FOREIGN KEY (major_dept_id) REFERENCES T_DEPATMENT(dept_id)
);

-- �����༶��
CREATE TABLE T_CLASS(
    class_id VARCHAR2(10) PRIMARY KEY,
    class_name VARCHAR2(20) NOT NULL UNIQUE,
    class_major_id VARCHAR(20),
    CONSTRAINT FK_CLASS FOREIGN KEY (class_major_id) REFERENCES T_MAJOR(major_id)
);

-- ����ѧ����
CREATE TABLE T_STUDENT(
    stu_id VARCHAR2(20) PRIMARY KEY,
    stu_name VARCHAR2(20) NOT NULL,
    sex VARCHAR2(2),
    birthday DATE NOT NULL,
    score NUMBER NOT NULL CHECK(score >= 2.0 AND score <= 4.0),
    mobile VARCHAR2(11) UNIQUE,
    stu_class_id VARCHAR2(10),
    CONSTRAINT FK_STUDENT FOREIGN KEY (stu_class_id) REFERENCES T_Class(class_id)
);

-- ������ʦ��
CREATE TABLE T_TEACHER(
    teacher_id VARCHAR2(10) PRIMARY KEY,
    teacher_name VARCHAR2(20) NOT NULL,
    teacher_dept_id VARCHAR(20),
    CONSTRAINT FK_TEACHER FOREIGN KEY (teacher_dept_id) REFERENCES T_DEPATMENT(dept_id)
);

-- �����γ̱�
CREATE TABLE T_COURSE(
    course_id VARCHAR2(10) PRIMARY KEY,
    course_name VARCHAR2(20) NOT NULL UNIQUE,
    course_credit NUMBER NOT NULL,
    course_teacher_id VARCHAR2(20),
    CONSTRAINT FK_COURSE FOREIGN KEY (course_teacher_id) REFERENCES T_TEACHER(teacher_id)
);

-- ����ѧ��-�γ̱�
CREATE TABLE T_STUDENT_COURSE(
    sc_stu_id VARCHAR2(10),
    sc_course_id VARCHAR2(10),
    CONSTRAINT PK_STUDENT_COURSE PRIMARY KEY  (sc_stu_id,sc_course_id),
    CONSTRAINT FK_STUDENT_COURSE_C_STUDENT FOREIGN KEY (sc_stu_id) REFERENCES T_STUDENT(stu_id),
    CONSTRAINT FK_STUDENT_COURSE_C_COURSE FOREIGN KEY (sc_course_id) REFERENCES T_COURSE(course_id)
);

INSERT INTO T_DEPATMENT(dept_id,dept_name) VALUES('01','��е����ϵ');-- ����һ������
INSERT INTO T_DEPATMENT(dept_id,dept_name) VALUES('02','���ӹ���ϵ');
INSERT INTO T_DEPATMENT(dept_id,dept_name) VALUES('03','�Զ���ϵ');
INSERT INTO T_DEPATMENT(dept_id,dept_name) VALUES('04','��ѧ�뻯��ϵ');
INSERT INTO T_DEPATMENT(dept_id,dept_name) VALUES('05','���������ϵ');

INSERT INTO T_MAJOR(major_id,major_name,major_dept_id) VALUES('001','�������ѧ�뼼��','05');
INSERT INTO T_MAJOR(major_id,major_name,major_dept_id) VALUES('002','�������','05');
INSERT INTO T_MAJOR(major_id,major_name,major_dept_id) VALUES('003','���繤��','05');
INSERT INTO T_MAJOR(major_id,major_name,major_dept_id) VALUES('004','����ý�弼��','05');

INSERT INTO T_CLASS(class_id,class_name,class_major_id) VALUES('0001','��һ','002');
INSERT INTO T_CLASS(class_id,class_name,class_major_id) VALUES('0002','����','002');
INSERT INTO T_CLASS(class_id,class_name,class_major_id) VALUES('0003','�ƿ�һ','001');
INSERT INTO T_CLASS(class_id,class_name,class_major_id) VALUES('0004','��ýһ','004');

INSERT INTO T_STUDENT(stu_id,stu_name,sex,birthday,score,mobile,stu_class_id) VALUES('000024','����','��',to_date('19980105','yyyymmdd'),3.27,'15364925795','0002');
INSERT INTO T_STUDENT(stu_id,stu_name,sex,birthday,score,mobile,stu_class_id) VALUES('000025','���ƿ�','��',to_date('1998-05-25','yyyy-mm-dd'),3.69,'15135451575','0003');

SELECT * FROM T_DEPATMENT;-- �鿴������
SELECT * FROM T_MAJOR;
SELECT * FROM T_CLASS;
SELECT * FROM T_STUDENT;


-- ��֤ΨһԼ���Ƿ����Ϊ�գ����������Ƿ�ֻ����һ�������Զ��)
CREATE TABLE T_USER(
    userid NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    userOrderid NUMBER UNIQUE,
    usersex VARCHAR2(2)
);
INSERT INTO T_USER(userid,username,userOrderid,usersex) VALUES(1,'����',1001,'��');
INSERT INTO T_USER(userid,username,userOrderid,usersex) VALUES(2,'����',null,'��');
INSERT INTO T_USER(userid,username,userOrderid,usersex) VALUES(3,'����',null,'Ů');
SELECT * FROM T_USER;

-- ��֤���Լ��
CREATE TABLE T_USER2(
    userid NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    userOrderid NUMBER UNIQUE,
    usersex VARCHAR2(2) DEFAULT ('��'),
    u2ID NUMBER REFERENCES T_USER(userid)
);
INSERT INTO T_USER2(userid,username��u2ID) VALUES(1,'����',1);
INSERT INTO T_USER2(userid,username��u2ID) VALUES(2,'����',3);
SELECT * FROM T_USER2;

-- ɾ����
DROP TABLE T_USER;
DROP TABLE T_USER2;

-- �޸ı�ṹ
DESC T_USER; /*��ʾ��ṹ*/
RENAME T_USER TO T_USER2;/*�޸ı���-�ڶ��ַ�ʽ*/
ALTER TABLE T_USER2 RENAME TO T_USER;/*�޸ı���-�ڶ��ַ�ʽ*/
ALTER TABLE T_USER MODIFY userid VARCHAR(20);/*�޸��ֶ�����*/
ALTER TABLE T_USER RENAME COLUMN userid TO user_id;/*�޸��ֶ���*/
ALTER TABLE T_USER ADD homemobile VARCHAR2(11);/*����ֶ�*/
ALTER TABLE T_USER DROP COLUMN homemobile;/*ɾ���ֶ�*/

-- �޸ı�����
CREATE TABLE T_USER( 
	id NUMBER PRIMARY KEY,
	name VARCHAR2(20) NOT NULL,
	age NUMBER,
	sex VARCHAR2(3),
	email VARCHAR2(50) UNIQUE
);
INSERT INTO T_USER(id,name,age,sex,email) VALUES(1,'zhangsan',22,'��','zhangsan@163.com');-- ����һ������
UPDATE T_USER SET name='lisi' WHERE id = 1;-- ��ĸ��²���������ָ��id������ֵ
DELETE FROM T_USER WHERE id = 1;-- ɾ��idΪ1������
SELECT * FROM T_USER;-- �鿴������

-- ��ȡ��
select table_name from user_tables; /*��ǰ�û��ı�*/     
select table_name from all_tables; /*�����û��ı�*/   
select table_name from dba_tables; /*����ϵͳ��*/ 
-- ��ȡ���ֶΣ� 
select * from user_tab_columns where Table_Name='�û���'; 
select * from all_tab_columns where Table_Name='�û���'; 
-- ��ȡ��ע�ͣ� 
select * from user_tab_comments;
-- ��ȡ�ֶ�ע��
select * from user_col_comments;


DROP TABLE T_STUDENT;
