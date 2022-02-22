DROP table member cascade constraint;
DROP table animal cascade constraint;
DROP table follow cascade constraint;
DROP table feed cascade constraint;
DROP table feed_like cascade constraint;
DROP table feed_comment cascade constraint;
DROP table feed_cocomment cascade constraint;
DROP table scrap cascade constraint;
DROP table dm cascade constraint;
DROP table lost_animal cascade constraint;
DROP table lost_comment cascade constraint;
DROP table lost_cocomment cascade constraint;
DROP view feed_scrap_view;

DROP sequence feed_feedno_seq;
DROP sequence feed_comment_fcno_seq;
DROP sequence feed_cocomment_cono_seq;
DROP sequence dm_dmno_seq;
DROP sequence lost_animal_lostno_seq;
DROP sequence lost_comment_locno_seq;
DROP sequence lost_cocomment_cono_seq;

SELECT * from member;
SELECT * from animal;
SELECT * from follow;
SELECT * from feed;
SELECT * from feed_like;
SELECT * from feed_comment;
SELECT * from feed_cocomment;
SELECT * from scrap;
SELECT * from dm;
SELECT * from lost_animal;
SELECT * from lost_comment;
SELECT * from lost_cocomment;
select * from all_constraints where owner = 'CAMPUS_F_1_0115' and constraint_name like '%FK';

-- fk �̸��� ������ �ش� fk�� �����ִ� ���̺� �̸��� �� �� ���� > �ش� ���̺��� �����͸� ������ �θ����̺��� ���� ����
SELECT CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FEED_LIKE_FEEDNO_FK'


CREATE table member(
	id VARCHAR2(20) not null,
	pw VARCHAR2(15) not null,
	picaddress VARCHAR2(100),
	nick VARCHAR2(20) not null unique,
	sex VARCHAR2(10) not null,
	birth VARCHAR2(10) not null,
	address VARCHAR2(50) not null,
	profile VARCHAR2(300),
	constraint member_id_pk primary key(id)
);

CREATE table animal(
	nick VARCHAR2(20) not null,
	animalname VARCHAR2(20) not null,
	animalpic VARCHAR2(200),
	upkind VARCHAR2(20) not null,
	kind VARCHAR2(20) not null,
	animalsex VARCHAR2(20),
	animalage INT,
	animalprofile VARCHAR2(300),
	constraint animal_pk primary key(nick,animalname),
	constraint animal_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table animal drop constraint animal_nick_fk;
ALTER table animal add constraint animal_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table follow(
	nick VARCHAR2(20) not null,
	followernick VARCHAR2(20) not null,
	followdate DATE default sysdate,
	constraint follow_pk primary key(nick,followernick),
	constraint follow_nick_fk foreign key(nick) references member(nick) on delete cascade,
	constraint follow_follower_nick_fk foreign key(followernick) references member(nick) on delete cascade
);

ALTER table follow drop constraint follow_nick_fk;
ALTER table follow drop constraint follow_follower_nick_fk;
ALTER table follow add constraint follow_nick_fk foreign key(nick) references member(nick) on delete cascade;
ALTER table follow add constraint follow_follower_nick_fk foreign key(followernick) references member(nick) on delete cascade;

CREATE table feed(
	feedno INT not null,
	nick VARCHAR2(20) not null,
	picaddress VARCHAR2(2000) not null,
	content VARCHAR2(2000),
	tag VARCHAR2(245) not null,
	feeddate DATE default sysdate not null,
	feedupdate DATE,
	openrange INT not null,
	constraint feed_feedno_pk primary key(feedno),
	constraint feed_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table feed drop constraint feed_nick_fk;
ALTER table feed add constraint feed_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table feed_like(
	feedno INT not null,
	nick VARCHAR2(20) not null,
	constraint feed_like_pk primary key(feedno,nick),
	constraint feed_like_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade,
	constraint feed_like_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table feed_like drop constraint feed_like_feedno_fk;
ALTER table feed_like drop constraint feed_like_nick_fk;
ALTER table feed_like add constraint feed_like_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade;
ALTER table feed_like add constraint feed_like_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table feed_comment(
	fcno INT not null,
	feedno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate not null,
	coupdate DATE,
	constraint feed_comment_fcno_pk primary key(fcno),
	constraint feed_comment_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade,
	constraint feed_comment_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table feed_comment drop constraint feed_comment_feedno_fk;
ALTER table feed_comment drop constraint feed_comment_nick_fk;
ALTER table feed_comment add constraint feed_comment_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade;
ALTER table feed_comment add constraint feed_comment_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table feed_cocomment(
	cono INT not null,
	fcno INT not null,
	feedno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate,
	coupdate DATE,
	constraint fcomment_cono_pk primary key(cono),
	constraint fcomment_fcno_fk foreign key(fcno) references feed_comment(fcno) on delete cascade,
	constraint fcomment_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade,
	constraint fcomment_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table feed_cocomment drop constraint fcomment_fcno_fk;
ALTER table feed_cocomment drop constraint fcomment_feedno_fk;
ALTER table feed_cocomment drop constraint fcomment_nick_fk;
ALTER table feed_cocomment add constraint fcomment_fcno_fk foreign key(fcno) references feed_comment(fcno) on delete cascade;
ALTER table feed_cocomment add constraint fcomment_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade;
ALTER table feed_cocomment add constraint fcomment_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table scrap(
	nick VARCHAR2(20) not null,
	feedno INT not null,
	scrapdate DATE default sysdate not null,
	constraint scrap_pk primary key(nick,feedno),
	constraint scrap_nick_fk foreign key(nick) references member(nick) on delete cascade,
	constraint scarp_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade
);

ALTER table scrap drop constraint scrap_nick_fk;
ALTER table scrap drop constraint scarp_feedno_fk;
ALTER table scrap add constraint scrap_nick_fk foreign key(nick) references member(nick) on delete cascade;
ALTER table scrap add constraint scarp_feedno_fk foreign key(feedno) references feed(feedno) on delete cascade;

CREATE table dm(
	dmno INT not null,
	sendnick VARCHAR2(20) not null,
	receivenick VARCHAR2(20) not null,
	content VARCHAR2(500),
	senddate DATE default sysdate not null,
	constraint dm_dmno_pk primary key(dmno),
	constraint dm_sendnick_fk foreign key(sendnick) references member(nick) on delete cascade,
	constraint dm_receivenick_fk foreign key(receivenick) references member(nick) on delete cascade
);

ALTER table dm drop constraint dm_sendnick_fk;
ALTER table dm drop constraint dm_receivenick_fk;
ALTER table dm add constraint dm_sendnick_fk foreign key(sendnick) references member(nick) on delete cascade;
ALTER table dm add constraint dm_receivenick_fk foreign key(receivenick) references member(nick) on delete cascade;

CREATE table lost_animal(
	lostno INT not null,
	latype VARCHAR2(20) not null,
	nick VARCHAR2(20) not null,
	animalname VARCHAR2(20),
	animalpic VARCHAR2(2000),
	upkind VARCHAR2(20),
	kind VARCHAR2(20),
	sex VARCHAR2(10),
	color VARCHAR2(20),
	animalsize VARCHAR2(10),
	istag VARCHAR2(10),
	feature VARCHAR2(500),
	place VARCHAR2(100),
	ladate DATE default sysdate not null,
	laupdate DATE,
	constraint lost_animal_lostno_pk primary key(lostno),
	constraint lost_animal_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table lost_animal DROP constraint lost_animal_nick_fk;
ALTER table lost_animal add constraint lost_animal_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table lost_comment(
	locno INT not null,
	lostno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate not null,
	coupdate DATE,
	constraint lost_animal_comment_locno_pk primary key(locno),
	constraint lost_animal_comment_lostno_fk foreign key(lostno) references lost_animal(lostno) on delete cascade,
	constraint lost_animal_comment_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table lost_comment DROP constraint lost_animal_comment_lostno_fk;
ALTER table lost_comment DROP constraint lost_animal_comment_nick_fk;
ALTER table lost_comment add constraint lost_animal_comment_lostno_fk foreign key(lostno) references lost_animal(lostno) on delete cascade;
ALTER table lost_comment add constraint lost_animal_comment_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE table lost_cocomment(
	cono INT not null,
	locno INT not null,
	lostno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate not null,
	coupdate DATE,
	constraint lcomment_cono_pk primary key(cono),
	constraint lcomment_locno_fk foreign key(locno) references lost_comment(locno) on delete cascade,
	constraint lcomment_lostno_fk foreign key(lostno) references lost_animal(lostno) on delete cascade,
	constraint lcomment_nick_fk foreign key(nick) references member(nick) on delete cascade
);

ALTER table lost_cocomment DROP constraint lcomment_locno_fk;
ALTER table lost_cocomment DROP constraint lcomment_lostno_fk;
ALTER table lost_cocomment DROP constraint lcomment_nick_fk;
ALTER table lost_cocomment add constraint lcomment_locno_fk foreign key(locno) references lost_comment(locno) on delete cascade;
ALTER table lost_cocomment add constraint lcomment_lostno_fk foreign key(lostno) references lost_animal(lostno) on delete cascade;
ALTER table lost_cocomment add constraint lcomment_nick_fk foreign key(nick) references member(nick) on delete cascade;

CREATE view feed_scrap_view AS
SELECT f.*, s.nick AS snick FROM feed f, scrap s
WHERE f.feedno = s.feedno;
 
SELECT * from feed_scrap_view WHERE SNICK = 'bamtol';

CREATE sequence feed_feedno_seq
start with 1
increment by 1
nocache;

CREATE sequence feed_comment_fcno_seq
start with 1
increment by 1
nocache;

CREATE sequence feed_cocomment_cono_seq
start with 1
increment by 1
nocache;

CREATE sequence dm_dmno_seq
start with 1
increment by 1
nocache;

CREATE sequence lost_animal_lostno_seq
start with 1
increment by 1
nocache;

CREATE sequence lost_comment_locno_seq
start with 1
increment by 1
nocache;

CREATE sequence lost_cocomment_cono_seq
start with 1
increment by 1
nocache;

drop table member;


-- ���õ����� ����------------------------------------

-- member
insert into member values ('123@123.com', '123',null,'mushroom10','����', '1991-01-31', '���ֱ����� ���� ����', '�ȳ��ϼ���, ���� �ƺ� �Դϴ�!');
insert into member values('sample@sample.sample','sample',null,'sample','����','1111-11-11', '���ֱ����� ���� ���嵿',null);
insert into member values('qo1515@aka.com','123','./assets/img/����.jpg','�°�','����','1999-11-23','���ֱ����� ���� ���嵿',null);
insert into member values ('wdog@ani.com',' wdog',null,'�Ͼ績','����','2000-01-01','���ֱ����� ���� ����','�Ͼ績 �Դϴ� ���� �Ͼ��̶� ���� ģ���ؿ�~~');
insert into member values ('bamtol@google.com','123456','./assets/img/������.jpg','bamtol','����','2020-02-02','���ֱ����� ���� ���嵿 4�� 34','�Ϳ��� �����̢�');
insert into MEMBER (id, pw, picaddress, nick, sex, birth, address, profile)
values('1111','1111',null,'�׽�Ʈ�����','����','2022-02-10', '���ֱ����� ���� ������ 31-15 3��', '�׽�Ʈ����� �����ʿ� ���� ����~~~~~~~~')


-- animal
insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('bamtol','������','./assets/img/�ݷ�����.jpg','�����','�ڸ��Ƽ����','��','3','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('mushroom10', '����', './assets/img/img22.jpg','��','��� ��Ʈ����','��','2','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('�°�','����','./assets/img/���.jpg','�����','��','��','3','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('sample','sampleani','null','�η�','�̱���','��','33','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('�Ͼ績','�Ͼ���','./assets/img/dog(�Ͼ���profile).png','��','�ͽ���','��','6','�Ͼ��̴� ��å�� �����ϱ��� ���� �����ϴ� �� �Ͼ������ϴ�!!! ')


--feed-----
insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'bamtol','./assets/img/�ǵ����1.jpg, ./assets/img/�ǵ����2.jpg, ./assets/img/�ǵ����3.jpg','������ ȭ��','#����� #�ڼ� #������ϻ�',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'mushroom10','./assets/img/img22.jpg','ù �ǵ塦!','#����, #ŰƼ����,#ù ���',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'mushroom10','./assets/img/img32.jpg','�츮 ���� �ǰ�����~!','#����, #�ǰ�',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'�°�','./assets/img/����.jpg','���� ��հ� ��Ҵ٤���','#����',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'','','','',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'sample','./assets/img/bigat.jpg','big cat','#cat',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'sample','./assets/img/catsleep.jpg','so cute','#cat',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'�Ͼ績','./assets/img/dog(feed).jpg','�Ͼ��� �Ϳ���!!! ���� ��å ������ �غ� �Ϸ�!!','#������å',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'bamtol','./assets/img/�ǵ����4.jpg, ./assets/img/�ǵ����5.jpg, ./assets/img/�ǵ����6.jpg','â�۱����ϱ�','#����� #�ڼ� #������ϻ� #ŰƼ����',default,null,'1')


--feed_comment---
insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'1','bamtol','�ʹ� �Ϳ���~',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'9','bamtol','�� ���� �ִ°ž� ����',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'3','mushroom10','�ǰ��ϸ� ��,',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'5','�°�','��վ���',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'9','�°�','��վ���',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'6','sample','�Ϳ���???',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'7','sample','�Ϳ���!!!',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'8','�Ͼ績','���� �������� �����ؿ�',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'','','',default,null);

-- feed_cocomment ------
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'1', 1, 'bamtol','�������~',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'2', 9, 'bamtol','ȣ��� ����!',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'3', 3, 'mushroom10','�츮 ������ ����',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'4', 5, '�°�','���� ������',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'6', 6, 'sample','�Ϳ���???',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'8', 8, '�Ͼ績','���� ��ƿ�~',default,null);


--scrap -----
insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('bamtol','3',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('mushroom10','5',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('�°�','6',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('sample','8',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('�Ͼ績','1',default)


--lostAnimal
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', 'bamtol', '�̸���', './assets/img/���⵿��.jpg', '��', '�ͽ���', '����', '���', '����', 'false', '������ �ϰ� �־��. ���� �����׿� �� �Ҿ�����ź� �����ּ���', '���ֱ����� ���� ���嵿', sysdate, null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', 'mushroom10',null,null,'��','�����ݸ�',null,null,'����', null, '�� ����� �� ����','�뱸������ ����',sysdate,null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', '�Ͼ績','�Ͼ���ģ��','./assets/img/img1.jpg','��','�ͽ���','����','�Ͼ��','����',null,'�Ͱ� ������','���� ����',sysdate, null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', '�°�','�����','./assets/img/�����.jpg','��','����ġ�ҵ�','����','���','����','false','���� ũ�� �󱼿� ���� ����',' �����',sysdate,null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'lost', 'sample','sampleani',null,'�η�','�̱���','����','���','����','false','�ݹ߸Ӹ�','���ֽ� ���嵿',sysdate,null);

--follow
insert into follow values ('�°�', 'mushroom10', sysdate);
insert into follow values ('�°�', '�Ͼ績', sysdate);
insert into follow values ('�°�', 'sample', sysdate);

insert into follow values ('mushroom10', '�Ͼ績', sysdate);
insert into follow values ('mushroom10', 'bamtol', sysdate);

insert into follow values ('�Ͼ績', '�°�', sysdate);
insert into follow values ('�Ͼ績', 'bamtol', sysdate);
insert into follow values ('�Ͼ績', 'sample', sysdate);

insert into follow values ('bamtol', 'mushroom10', sysdate);
insert into follow values ('bamtol', '�Ͼ績', sysdate);

insert into follow values ('sample', '�Ͼ績', sysdate);

-- DM ------
insert into dm values(dm_dmno_seq.NEXTVAL, 'mushroom10' ,'�°�' ,'1-2'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, 'mushroom10' ,'�°�' ,'����'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '�°�' , '�Ͼ績'  ,'2-3'   , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '�Ͼ績' ,  'bamtol', '3-4'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, 'bamtol' , 'sample','4-5'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, 'sample', 'mushroom10','5-1' , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '�Ͼ績' , '�°�'  ,'�ȳ�'   , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '�°�', 'mushroom10','�ȳ�' , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '�°�', 'sample','5-1' , default);


-- ���-----
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 4, 'bamtol', '���� ���� ã������ ���ڳ׿�', default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 5, 'mushroom10', '�̤�', default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 6, '�Ͼ績', '���� ����Ʈ ������ ��� �������ΰ� ���ƿ� ', default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 7, '�°�', '���� ã���ּ����' , default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 8, 'sample', '���� ã�� �ʹ١�', default, null);


-- ����--
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 1, 4,  'bamtol', '�Ⱦ������� ��', default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 2, 5,  'mushroom10', '�̤�..', default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 3, 6,  '�Ͼ績', '���� ���Ǹ� ã���ּż� �����մϴ�', default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 4, 7,  '�°�', '��ȭ�ּ���' , default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 5, 8,  'sample', 'ã�Ҵ�!', default, null);
=======

>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-1/KittyPuppy.git