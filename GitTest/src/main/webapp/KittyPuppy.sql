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

insert into MEMBER (id, pw, picaddress, nick, sex, birth, address, profile)
values('1111','1111',null,'테스트용계정','남자','2022-02-10', '광주광역시 동구 예술길 31-15 3층', '테스트용계정 프로필에 들어가는 내용~~~~~~~~')

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
	constraint animal_nick_fk foreign key(nick) references member(nick)
);

CREATE table follow(
	nick VARCHAR2(20) not null,
	followernick VARCHAR2(20) not null,
	followdate DATE default sysdate,
	constraint follow_pk primary key(nick,followernick),
	constraint follow_nick_fk foreign key(nick) references member(nick),
	constraint follow_follower_nick_fk foreign key(followernick) references member(nick)
);

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
	constraint feed_nick_fk foreign key(nick) references member(nick)
);

CREATE table feed_like(
	feedno INT not null,
	nick VARCHAR2(20) not null,
	constraint feed_like_pk primary key(feedno,nick),
	constraint feed_like_feedno_fk foreign key(feedno) references feed(feedno),
	constraint feed_like_nick_fk foreign key(nick) references member(nick)
);

CREATE table feed_comment(
	fcno INT not null,
	feedno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate not null,
	coupdate DATE,
	constraint feed_comment_fcno_pk primary key(fcno),
	constraint feed_comment_feedno_fk foreign key(feedno) references feed(feedno),
	constraint feed_comment_nick_fk foreign key(nick) references member(nick)
);

CREATE table feed_cocomment(
	cono INT not null,
	fcno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate,
	coupdate DATE,
	constraint fcomment_cono_pk primary key(cono),
	constraint fcomment_fcno_fk foreign key(fcno) references feed_comment(fcno),
	constraint fcomment_nick_fk foreign key(nick) references member(nick)
);

CREATE table scrap(
	nick VARCHAR2(20) not null,
	feedno INT not null,
	scrapdate DATE default sysdate not null,
	constraint scrap_pk primary key(nick,feedno),
	constraint scrap_nick_fk foreign key(nick) references member(nick),
	constraint scarp_feedno_fk foreign key(feedno) references feed(feedno)
);

CREATE table dm(
	dmno INT not null,
	sendnick VARCHAR2(20) not null,
	receivenick VARCHAR2(20) not null,
	content VARCHAR2(500),
	senddate DATE default sysdate not null,
	constraint dm_dmno_pk primary key(dmno),
	constraint dm_sendnick_fk foreign key(sendnick) references member(nick),
	constraint dm_receivenick_fk foreign key(receivenick) references member(nick)
);

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
	content VARCHAR2(2000),
	place VARCHAR2(100),
	ladate DATE default sysdate not null,
	laupdate DATE,
	constraint lost_animal_lostno_pk primary key(lostno),
	constraint lost_animal_nick_fk foreign key(nick) references member(nick),
	constraint lost_animal_type_ck check(nick in ('lost','find'))
);

CREATE table lost_comment(
	locno INT not null,
	lostno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate not null,
	coupdate DATE,
	constraint lost_animal_comment_locno_pk primary key(locno),
	constraint lost_animal_comment_lostno_fk foreign key(lostno) references lost_animal(lostno),
	constraint lost_animal_comment_nick_fk foreign key(nick) references member(nick)
);

CREATE table lost_cocomment(
	cono INT not null,
	locno INT not null,
	nick VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	codate DATE default sysdate not null,
	coupdate DATE,
	constraint lcomment_cono_pk primary key(cono),
	constraint lcomment_locno_fk foreign key(locno) references lost_comment(locno),
	constraint lcomment_nick_fk foreign key(nick) references member(nick)
);

CREATE view feed_scrap_view AS
SELECT f.* FROM feed f, scrap s
WHERE f.nick = s.nick
AND f.feedno = s.feedno;

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





