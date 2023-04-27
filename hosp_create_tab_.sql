
-- 병원 업무 관리 테이블 구축

CREATE TABLE doctors (
doc_id NUMBER(10) NOT NULL,
major_treat VARCHAR2(25) NOT NULL,
doc_name VARCHAR2(20) NOT NULL,
doc_gen CHAR(1) NOT NULL,
doc_phone VARCHAR2(15) NOT NULL,
doc_email VARCHAR2(50) UNIQUE,
doc_position VARCHAR2(20) NOT NULL
);

ALTER TABLE doctors
ADD CONSTRAINT doc_id_pk PRIMARY KEY (doc_id);


CREATE TABLE Nurses (
nur_id NUMBER(10) NOT NULL,
major_job VARCHAR2(25) NOT NULL,
nur_name VARCHAR2(20) NOT NULL,
nur_gen CHAR(1) NOT NULL,
nur_phone VARCHAR2(15) NOT NULL,
nur_email VARCHAR2(50) NOT NULL,
nur_position VARCHAR2(20) NOT NULL
);

ALTER TABLE Nurses
ADD CONSTRAINT nur_id_pk PRIMARY KEY (nur_id);


CREATE TABLE Patients (
pat_id NUMBER(10) NOT NULL,
nur_id NUMBER(10) NOT NULL,
doc_id NUMBER(10) NOT NULL,
pat_name VARCHAR2(20) NOT NULL,
pat_gen CHAR(1) NOT NULL,
pat_jumin VARCHAR2(14) NOT NULL,
pat_addr VARCHAR2(100) NOT NULL,
pat_phone VARCHAR2(15) NOT NULL,
pat_email VARCHAR2(50) NOT NULL,
pat_job VARCHAR2(20) NOT NULL
);

ALTER TABLE Patients
ADD CONSTRAINT pat_id_pk PRIMARY KEY (pat_id);

ALTER TABLE Patients
ADD (CONSTRAINT R_2 FOREIGN KEY (doc_id) REFERENCES Doctors (doc_id));

ALTER TABLE Patients
ADD (CONSTRAINT R_3 FOREIGN KEY (nur_id) REFERENCES Nurses (nur_id));



CREATE TABLE Treatments (
treat_id NUMBER(15) NOT NULL,
pat_id NUMBER(10) NOT NULL,
doc_id NUMBER(10) NOT NULL,
treat_contents VARCHAR2(1000) NOT NULL,
treat_date date NOT NULL
);

ALTER TABLE Treatments
ADD CONSTRAINT treat_pat_doc_id_pk PRIMARY KEY (treat_id,pat_id,doc_id);

ALTER TABLE Treatments
ADD (CONSTRAINT R_5 FOREIGN KEY (pat_id) REFERENCES Patients (pat_id));

ALTER TABLE Treatments
ADD (CONSTRAINT R_6 FOREIGN KEY (doc_id) REFERENCES Doctors (doc_id));

create table charts(
chart_id varchar2(20) not null,
treat_id number(15) not null,
doc_id number(10) not null,
pat_id number(10) not null,
nur_id number(10) not null,
chart_contents varchar2(1000) not null
);

alter table charts
add constraint chart_treat_doc_pat_id_pk primary key (chart_id, treat_id, doc_id, pat_id);
alter table charts
add (constraint R_4 foreign key (nur_id) references nurses (nur_id));
alter table charts
add (constraint R_7 foreign key (treat_id, pat_id, doc_id) references treatments(treat_id, pat_id, doc_id));

