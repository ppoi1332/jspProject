create table "SOLDIER" (
 "NUMBER" number,
 "ID" varchar2(100),
 "DIVISION_CODE" number,
 "POSITION_CODE" number,
 "INDAY" date,
 "OUTDAY" date,
 "YEAR_CODE" number
 );
 
 create table "INFO" (
 "ID" varchar2(100),
 "PASSWD" varchar2(100),
 "NAME" varchar2(100),
 "BIRTH" date,
 "EMAIL" varchar2(100)
 );
 
 create table "DIVISION" (
 "NUMBER" number,
 "DIVISION_NAME" varchar2(100)
 );
 
 create table "POSITION" (
 "NUMBER" number,
 "POSITION_NAME" varchar2(100) 
 );
 
 create table "YEAR" (
 "NUMBER" number,
 "YEAR" varchar(50)
 );
 
alter table "SOLDIER" add constraint "PK_SOLDIER" primary key ("NUMBER");
alter table "DIVISION" add constraint "PK_DIVISION" primary key ("NUMBER");
alter table "POSITION" add constraint "PK_POSITION" primary key ("NUMBER");
alter table "YEAR" add constraint "PK_YEAR" primary key ("NUMBER");
alter table "INFO" add constraint "PK_INFO" primary key ("ID");

alter table "SOLDIER" add constraint "FK_DIVISION_CODE" foreign key("DIVISION_CODE") references "DIVISION"("NUMBER") on delete cascade;
alter table "SOLDIER" add constraint "FK_POSITION_CODE" foreign key("POSITION_CODE") references "POSITION"("NUMBER") on delete cascade;
alter table "SOLDIER" add constraint "FK_YEAR_CODE" foreign key("YEAR_CODE") references "YEAR"("NUMBER") on delete cascade;
alter table "SOLDIER" add constraint "FK_INFO_CODE" foreign key("ID") references "INFO"("ID") on delete cascade;
 
create sequence "SEQ_SOLDIER" nocache;
create sequence "SEQ_DIVISION" nocache;
create sequence "SEQ_POSITION" nocache;
create sequence "SEQ_YEAR" nocache;

insert into "DIVISION" values ("SEQ_DIVISION".nextval, '����');
insert into "DIVISION" values ("SEQ_DIVISION".nextval, '����');
insert into "DIVISION" values ("SEQ_DIVISION".nextval, '�ر�');
insert into "DIVISION" values ("SEQ_DIVISION".nextval, '�غ���');
insert into "DIVISION" values ("SEQ_DIVISION".nextval, '��Ÿ');

insert into "POSITION" values ("SEQ_POSITION".nextval, '����');
insert into "POSITION" values ("SEQ_POSITION".nextval, '������');
insert into "POSITION" values ("SEQ_POSITION".nextval, '������');
insert into "POSITION" values ("SEQ_POSITION".nextval, '�ǹ���');
insert into "POSITION" values ("SEQ_POSITION".nextval, '��纴');
insert into "POSITION" values ("SEQ_POSITION".nextval, '��Ÿ');

insert into "YEAR" values ("SEQ_YEAR".nextval, '1����');
insert into "YEAR" values ("SEQ_YEAR".nextval, '2����');
insert into "YEAR" values ("SEQ_YEAR".nextval, '3����');
insert into "YEAR" values ("SEQ_YEAR".nextval, '4����');
insert into "YEAR" values ("SEQ_YEAR".nextval, '5����');
insert into "YEAR" values ("SEQ_YEAR".nextval, '6����');
insert into "YEAR" values ("SEQ_YEAR".nextval, '7����~');