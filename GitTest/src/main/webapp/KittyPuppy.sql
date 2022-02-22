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

-- fk 이름을 넣으면 해당 fk로 묶여있는 테이블 이름을 알 수 있음 > 해당 테이블의 데이터를 삭제후 부모테이블의 내용 삭제
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


-- 샘플데이터 쿼리------------------------------------

-- member
insert into member values ('123@123.com', '123',null,'mushroom10','남성', '1991-01-31', '광주광역시 동구 동명동', '안녕하세요, 리나 아빠 입니다!');
insert into member values('sample@sample.sample','sample',null,'sample','남성','1111-11-11', '광주광역시 동구 충장동',null);
insert into member values('qo1515@aka.com','123','./assets/img/손흥.jpg','태경','남자','1999-11-23','광주광역시 동구 충장동',null);
insert into member values ('wdog@ani.com',' wdog',null,'하양맘','여성','2000-01-01','광주광역시 동구 동명동','하양맘 입니당 저의 하양이랑 같이 친구해요~~');
insert into member values ('bamtol@google.com','123456','./assets/img/프로필.jpg','bamtol','여성','2020-02-02','광주광역시 동구 충장동 4가 34','귀여운 밤톨이♥');
insert into MEMBER (id, pw, picaddress, nick, sex, birth, address, profile)
values('1111','1111',null,'테스트용계정','남자','2022-02-10', '광주광역시 동구 예술길 31-15 3층', '테스트용계정 프로필에 들어가는 내용~~~~~~~~')


-- animal
insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('bamtol','밤톨이','./assets/img/반려동물.jpg','고양이','코리아숏헤어','암','3','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('mushroom10', '리나', './assets/img/img22.jpg','개','골든 리트리버','암','2','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('태경','꼬꼬','./assets/img/고양.jpg','고양이','샴','암','3','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('sample','sampleani','null','인류','미국인','남','33','null')

insert into animal (nick, animalname, animalpic, upkind, kind, animalsex, animalage, animalprofile)
values
('하양맘','하양이','./assets/img/dog(하양이profile).png','개','믹스견','수','6','하양이는 산책을 좋아하구요 제일 좋아하는 건 북어포랍니다!!! ')


--feed-----
insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'bamtol','./assets/img/피드사진1.jpg, ./assets/img/피드사진2.jpg, ./assets/img/피드사진3.jpg','밤톨이 화보','#고양이 #코숏 #고양이일상',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'mushroom10','./assets/img/img22.jpg','첫 피드…!','#리나, #키티퍼피,#첫 사용',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'mushroom10','./assets/img/img32.jpg','우리 리나 건강하자~!','#리나, #건강',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'태경','./assets/img/음식.jpg','오늘 재밌게 놀았다ㅎㅎ','#맛집',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'','','','',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'sample','./assets/img/bigat.jpg','big cat','#cat',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'sample','./assets/img/catsleep.jpg','so cute','#cat',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values(feed_feedno_seq.NEXTVAL,'하양맘','./assets/img/dog(feed).jpg','하양이 귀엽죵!!! 오늘 산책 나가기 준비 완료!!','#동명동산책',default,null,'1')

insert into feed (FEEDNO, NICK, PICADDRESS, CONTENT, TAG, FEEDDATE, FEEDUPDATE, OPENRANGE)
values
(feed_feedno_seq.NEXTVAL,'bamtol','./assets/img/피드사진4.jpg, ./assets/img/피드사진5.jpg, ./assets/img/피드사진6.jpg','창밖구경하기','#고양이 #코숏 #고양이일상 #키티퍼피',default,null,'1')


--feed_comment---
insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'1','bamtol','너무 귀여워~',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'9','bamtol','뭘 보고 있는거얌 ㅋㅋ',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'3','mushroom10','건강하면 또,',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'5','태경','재밌었다',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'9','태경','재밌었다',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'6','sample','귀여워???',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'7','sample','귀여워!!!',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'8','하양맘','저희 강아지도 좋아해요',default,null);

insert into feed_comment (FCNO, FEEDNO, NICK, CONTENT, CODATE, COUPDATE)
values(feed_comment_fcno_seq.NEXTVAL,'','','',default,null);

-- feed_cocomment ------
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'1', 1, 'bamtol','사랑둥이~',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'2', 9, 'bamtol','호기심 가득!',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'3', 3, 'mushroom10','우리 리나지 ㅎㅎ',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'4', 5, '태경','나도 데려가',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'6', 6, 'sample','귀여워???',default,null);
insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,'8', 8, '하양맘','같이 놀아요~',default,null);


--scrap -----
insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('bamtol','3',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('mushroom10','5',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('태경','6',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('sample','8',default)

insert into scrap (NICK, FEEDNO, SCRAPDATE)
values('하양맘','1',default)


--lostAnimal
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', 'bamtol', '이름모름', './assets/img/유기동물.jpg', '개', '믹스견', '수컷', '흰색', '소형', 'false', '목줄을 하고 있어요. 많이 말랐네요 ㅠ 잃어버리신분 연락주세요', '광주광역시 동구 충장동', sysdate, null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', 'mushroom10',null,null,'개','보더콜리',null,null,'소형', null, '줄 비슷한 게 있음','대구광역시 남구',sysdate,null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', '하양맘','하양이친구','./assets/img/img1.jpg','개','믹스견','수컷','하얀색','소형',null,'귀가 접혀짐','광주 동명동',sysdate, null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'find', '태경','박춘삼','./assets/img/춘삼이.jpg','개','프렌치불독','수컷','흰색','소형','false','눈이 크고 얼굴에 점이 있음',' 충장로',sysdate,null);
insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL, 'lost', 'sample','sampleani',null,'인류','미국인','수컷','흰색','대형','false','금발머리','광주시 충장동',sysdate,null);

--follow
insert into follow values ('태경', 'mushroom10', sysdate);
insert into follow values ('태경', '하양맘', sysdate);
insert into follow values ('태경', 'sample', sysdate);

insert into follow values ('mushroom10', '하양맘', sysdate);
insert into follow values ('mushroom10', 'bamtol', sysdate);

insert into follow values ('하양맘', '태경', sysdate);
insert into follow values ('하양맘', 'bamtol', sysdate);
insert into follow values ('하양맘', 'sample', sysdate);

insert into follow values ('bamtol', 'mushroom10', sysdate);
insert into follow values ('bamtol', '하양맘', sysdate);

insert into follow values ('sample', '하양맘', sysdate);

-- DM ------
insert into dm values(dm_dmno_seq.NEXTVAL, 'mushroom10' ,'태경' ,'1-2'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, 'mushroom10' ,'태경' ,'ㅎㅇ'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '태경' , '하양맘'  ,'2-3'   , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '하양맘' ,  'bamtol', '3-4'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, 'bamtol' , 'sample','4-5'  , default);
insert into dm values(dm_dmno_seq.NEXTVAL, 'sample', 'mushroom10','5-1' , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '하양맘' , '태경'  ,'안녕'   , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '태경', 'mushroom10','안녕' , default);
insert into dm values(dm_dmno_seq.NEXTVAL, '태경', 'sample','5-1' , default);


-- 댓글-----
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 4, 'bamtol', '주인 빨리 찾았으면 좋겠네요', default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 5, 'mushroom10', 'ㅜㅜ', default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 6, '하양맘', '저희 아파트 옆동에 사는 강아지인것 같아요 ', default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 7, '태경', '제발 찾아주세요ㅠ' , default, null);
insert into lost_comment values(lost_comment_locno_seq.NEXTVAL, 8, 'sample', '빨리 찾고 싶다…', default, null);


-- 대댓글--
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 1, 4,  'bamtol', '안쓰러워요 ㅠ', default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 2, 5,  'mushroom10', 'ㅜㅜ..', default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 3, 6,  '하양맘', '저의 해피를 찾아주셔서 감사합니다', default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 4, 7,  '태경', '전화주세요' , default, null);
insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL, 5, 8,  'sample', '찾았다!', default, null);
=======

>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-1/KittyPuppy.git