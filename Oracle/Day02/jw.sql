/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2019/3/10 16:49:51                           */
/*==============================================================*/


alter table CLASSES
   drop constraint "FK_CLASSES_MAJOR-CLA_MAJOR";

alter table COURSE
   drop constraint "FK_COURSE_�γ�-��ʦ_TEACHER";

alter table MAJOR
   drop constraint "FK_MAJOR_MAJOR-DEP_DEPARTME";

alter table STUDENT
   drop constraint "FK_STUDENT_STUDENT-C_CLASSES";

alter table STUDENT_CLASS
   drop constraint FK_STUDENT__STUDENT_C_STUDENT;

alter table STUDENT_CLASS
   drop constraint FK_STUDENT__STUDENT_C_COURSE;

alter table TEACHER
   drop constraint "FK_TEACHER_Ժϵ-��ʦ_DEPARTME";

drop index "MAJOR-CLASS_FK";

drop table CLASSES cascade constraints;

drop index "�γ�-��ʦ_FK";

drop table COURSE cascade constraints;

drop table DEPARTMENT cascade constraints;

drop index "MAJOR-DEPT_FK";

drop table MAJOR cascade constraints;

drop index "STUDENT-CLASS_FK";

drop table STUDENT cascade constraints;

drop index STUDENT_CLASS2_FK;

drop index STUDENT_CLASS_FK;

drop table STUDENT_CLASS cascade constraints;

drop index "Ժϵ-��ʦ_FK";

drop table TEACHER cascade constraints;

/*==============================================================*/
/* Table: CLASSES                                               */
/*==============================================================*/
create table CLASSES 
(
   CLASS_ID             VARCHAR2(20)         not null,
   MAJOR_ID             VARCHAR2(20)         not null,
   CLASS_NAME           VARCHAR2(20)         not null,
   constraint PK_CLASSES primary key (CLASS_ID)
);

comment on table CLASSES is
'�༶ʵ��';

comment on column CLASSES.CLASS_ID is
'�༶��';

comment on column CLASSES.MAJOR_ID is
'רҵ���';

comment on column CLASSES.CLASS_NAME is
'�༶����';

/*==============================================================*/
/* Index: "MAJOR-CLASS_FK"                                      */
/*==============================================================*/
create index "MAJOR-CLASS_FK" on CLASSES (
   MAJOR_ID ASC
);

/*==============================================================*/
/* Table: COURSE                                                */
/*==============================================================*/
create table COURSE 
(
   COURSE_ID            VARCHAR2(20)         not null,
   TEACHER_ID           VARCHAR2(20)         not null,
   COURSE               VARCHAR2(20)         not null,
   CREDIT               NUMBER               not null,
   constraint PK_COURSE primary key (COURSE_ID)
);

comment on table COURSE is
'�γ�ʵ��';

comment on column COURSE.COURSE_ID is
'�γ̱��';

comment on column COURSE.TEACHER_ID is
'��ʦ���';

comment on column COURSE.COURSE is
'�γ�����';

comment on column COURSE.CREDIT is
'ѧ��';

/*==============================================================*/
/* Index: "�γ�-��ʦ_FK"                                            */
/*==============================================================*/
create index "�γ�-��ʦ_FK" on COURSE (
   TEACHER_ID ASC
);

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT 
(
   DEPT_ID              VARCHAR2(5)          not null,
   DEPT_NAME            VARCHAR2(20)         not null,
   constraint PK_DEPARTMENT primary key (DEPT_ID)
);

comment on table DEPARTMENT is
'Ժϵʵ��';

comment on column DEPARTMENT.DEPT_ID is
'Ժϵ���';

comment on column DEPARTMENT.DEPT_NAME is
'Ժϵ����';

/*==============================================================*/
/* Table: MAJOR                                                 */
/*==============================================================*/
create table MAJOR 
(
   MAJOR_ID             VARCHAR2(20)         not null,
   DEPT_ID              VARCHAR2(5)          not null,
   MAJOR_NAME           VARCHAR2(20)         not null,
   constraint PK_MAJOR primary key (MAJOR_ID)
);

comment on table MAJOR is
'רҵ';

comment on column MAJOR.MAJOR_ID is
'רҵ���';

comment on column MAJOR.DEPT_ID is
'Ժϵ���';

comment on column MAJOR.MAJOR_NAME is
'רҵ����';

/*==============================================================*/
/* Index: "MAJOR-DEPT_FK"                                       */
/*==============================================================*/
create index "MAJOR-DEPT_FK" on MAJOR (
   DEPT_ID ASC
);

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT 
(
   STUDENT_ID           VARCHAR2(20)         not null,
   CLASS_ID             VARCHAR2(20),
   NAME                 VARCHAR2(10)         not null,
   SEX                  CHAR(2)              not null,
   BIRTHDAY             DATE                 not null,
   SCORE                NUMBER,
   constraint PK_STUDENT primary key (STUDENT_ID)
);

comment on table STUDENT is
'ѧ��ʵ��';

comment on column STUDENT.STUDENT_ID is
'ѧ��ѧ��';

comment on column STUDENT.CLASS_ID is
'�༶��';

comment on column STUDENT.NAME is
'ѧ������';

comment on column STUDENT.SEX is
'ѧ���Ա�';

comment on column STUDENT.BIRTHDAY is
'ѧ����������';

comment on column STUDENT.SCORE is
'ѧ������';

/*==============================================================*/
/* Index: "STUDENT-CLASS_FK"                                    */
/*==============================================================*/
create index "STUDENT-CLASS_FK" on STUDENT (
   CLASS_ID ASC
);

/*==============================================================*/
/* Table: STUDENT_CLASS                                         */
/*==============================================================*/
create table STUDENT_CLASS 
(
   STUDENT_ID           VARCHAR2(20)         not null,
   COURSE_ID            VARCHAR2(20)         not null,
   constraint PK_STUDENT_CLASS primary key (STUDENT_ID, COURSE_ID)
);

comment on column STUDENT_CLASS.STUDENT_ID is
'ѧ��ѧ��';

comment on column STUDENT_CLASS.COURSE_ID is
'�γ̱��';

/*==============================================================*/
/* Index: STUDENT_CLASS_FK                                      */
/*==============================================================*/
create index STUDENT_CLASS_FK on STUDENT_CLASS (
   STUDENT_ID ASC
);

/*==============================================================*/
/* Index: STUDENT_CLASS2_FK                                     */
/*==============================================================*/
create index STUDENT_CLASS2_FK on STUDENT_CLASS (
   COURSE_ID ASC
);

/*==============================================================*/
/* Table: TEACHER                                               */
/*==============================================================*/
create table TEACHER 
(
   TEACHER_ID           VARCHAR2(20)         not null,
   DEPT_ID              VARCHAR2(5)          not null,
   TEACHER_NAME         VARCHAR2(20)         not null,
   constraint PK_TEACHER primary key (TEACHER_ID)
);

comment on table TEACHER is
'��ʦʵ��';

comment on column TEACHER.TEACHER_ID is
'��ʦ���';

comment on column TEACHER.DEPT_ID is
'Ժϵ���';

comment on column TEACHER.TEACHER_NAME is
'��ʦ����';

/*==============================================================*/
/* Index: "Ժϵ-��ʦ_FK"                                            */
/*==============================================================*/
create index "Ժϵ-��ʦ_FK" on TEACHER (
   DEPT_ID ASC
);

alter table CLASSES
   add constraint "FK_CLASSES_MAJOR-CLA_MAJOR" foreign key (MAJOR_ID)
      references MAJOR (MAJOR_ID);

alter table COURSE
   add constraint "FK_COURSE_�γ�-��ʦ_TEACHER" foreign key (TEACHER_ID)
      references TEACHER (TEACHER_ID);

alter table MAJOR
   add constraint "FK_MAJOR_MAJOR-DEP_DEPARTME" foreign key (DEPT_ID)
      references DEPARTMENT (DEPT_ID);

alter table STUDENT
   add constraint "FK_STUDENT_STUDENT-C_CLASSES" foreign key (CLASS_ID)
      references CLASSES (CLASS_ID);

alter table STUDENT_CLASS
   add constraint FK_STUDENT__STUDENT_C_STUDENT foreign key (STUDENT_ID)
      references STUDENT (STUDENT_ID);

alter table STUDENT_CLASS
   add constraint FK_STUDENT__STUDENT_C_COURSE foreign key (COURSE_ID)
      references COURSE (COURSE_ID);

alter table TEACHER
   add constraint "FK_TEACHER_Ժϵ-��ʦ_DEPARTME" foreign key (DEPT_ID)
      references DEPARTMENT (DEPT_ID);

