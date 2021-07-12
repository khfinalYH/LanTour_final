
DROP SEQUENCE MEMBER_NO_SEQ;
DROP SEQUENCE NOTICE_NO_SEQ;
DROP SEQUENCE COMMUNITY_NO_SEQ;
DROP SEQUENCE HOTEL_NO_SEQ;
DROP SEQUENCE LANTOUR_NO_SEQ;
DROP SEQUENCE RESERVATION_NO_SEQ;
DROP SEQUENCE CHAT_NO_SEQ;
DROP SEQUENCE COMMENT_NO_SEQ;
DROP SEQUENCE REVIEW_NO_SEQ;
DROP SEQUENCE ROOM_NO_SEQ;


DROP TABLE MEMBER;
DROP TABLE NOTICE;
DROP TABLE COMMUNITY;
DROP TABLE HOTEL;
DROP TABLE LANTOUR;
DROP TABLE RESERVATION;
DROP TABLE CHAT;
DROP TABLE COMMENT_TABLE;
DROP TABLE REVIEW;
DROP TABLE ROOM;

select * from member;

CREATE SEQUENCE MEMBER_NO_SEQ;
CREATE SEQUENCE NOTICE_NO_SEQ;
CREATE SEQUENCE COMMUNITY_NO_SEQ;
CREATE SEQUENCE HOTEL_NO_SEQ;
CREATE SEQUENCE LANTOUR_NO_SEQ;
CREATE SEQUENCE RESERVATION_NO_SEQ;
CREATE SEQUENCE CHAT_NO_SEQ;
CREATE SEQUENCE COMMENT_NO_SEQ;
CREATE SEQUENCE REVIEW_NO_SEQ;
CREATE SEQUENCE ROOM_NO_SEQ;


CREATE TABLE MEMBER(
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(20) NOT NULL,
	MEMBER_PASSWORD VARCHAR2(200) NOT NULL,
	MEMBER_NAME VARCHAR2(50) NOT NULL,
	MEMBER_GRADE VARCHAR2(2) NOT NULL,
	MEMBER_AGE NUMBER NOT NULL,
	MEMBER_GENDER VARCHAR2(2) NOT NULL,
	MEMBER_EMAIL VARCHAR2(50) NOT NULL,
	MEMBER_PHONE VARCHAR2(50) NOT NULL,
	MEMBER_SECESSION VARCHAR2(2) NOT NULL,
	CONSTRAINT MEMBER_MEMBER_GRADE_CHK CHECK(MEMBER_GRADE IN ('H','U','A')),
	CONSTRAINT MEMBER_MEMBER_GENDER_CHK CHECK(MEMBER_GENDER IN ('F','M')),
	CONSTRAINT MEMBER_MEMBER_SECESSION_CHK CHECK(MEMBER_SECESSION IN ('Y','N'))
);

CREATE TABLE NOTICE(
	NOTICE_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	NOTICE_TITLE VARCHAR2(100) NOT NULL,
	NOTICE_CONTENT VARCHAR2(3000) NOT NULL,
	NOTICE_DATE DATE NOT NULL,
	CONSTRAINT NOTICE_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE COMMUNITY(
	COMMUNITY_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	COMMUNITY_TITLE VARCHAR2(500) NOT NULL,
	COMMUNITY_CONTENT VARCHAR2(2000) NOT NULL,
	COMMUNITY_REGDATE DATE NOT NULL,
	COMMUNITY_READCOUNT NUMBER NOT NULL,
	COMMUNITY_DELFLAG VARCHAR2(2) NOT NULL,
	CONSTRAINT COMMUNITY_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT COMMUNITY_DELFLAG_CHK CHECK(COMMUNITY_DELFLAG IN ('Y','N'))
);

CREATE TABLE HOTEL(
	HOTEL_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	HOTEL_TYPE VARCHAR2(50) NOT NULL,
	HOTEL_TITLE VARCHAR2(400) NOT NULL,
	HOTEL_CONTENT VARCHAR2(2000) NOT NULL,
	HOTEL_REGDATE DATE NOT NULL,
	HOTEL_PRICE NUMBER NOT NULL,
	HOTEL_ADDR VARCHAR2(200) NOT NULL,
	HOTEL_IMAGE VARCHAR2(4000) NOT NULL,
	HOTEL_CONVINENCE VARCHAR2(500) NOT NULL,
	HOTEL_MAXCOUNT NUMBER NOT NULL,
	HOTEL_DATE VARCHAR2(500) NOT NULL,
	CONSTRAINT HOTEL_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE LANTOUR(
	LANTOUR_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	LANTOUR_TITLE VARCHAR2(500) NOT NULL,
	LANTOUR_CONTENT VARCHAR2(2000) NOT NULL,
	LANTOUR_REGDATE DATE NOT NULL,
	LANTOUR_RTC VARCHAR2(1000) NOT NULL,
	LANTOUR_ADDR VARCHAR2(1000) NOT NULL,
	LANTOUR_IMAGE VARCHAR2(4000) NOT NULL,
	LANTOUR_MAXCOUNT NUMBER NOT NULL,
	LANTOUR_PRICE NUMBER NOT NULL,
	LANTOUR_DATE VARCHAR2(500) NOT NULL,
	CONSTRAINT LANTOUR_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE RESERVATION(
	RESERVATION_NO NUMBER PRIMARY KEY,
	LANTOUR_NO NUMBER,
	ROOM_NO NUMBER,
	HOTEL_NO NUMBER,
	MEMBER_NO NUMBER NOT NULL,
	RESERVATION_DATE DATE NOT NULL,
	RESERVATION_PRICE NUMBER NOT NULL,
	RESERVATION_PAY VARCHAR2(2) NOT NULL,
	RESERVATION_PAYDATE DATE NOT NULL,
	CONSTRAINT RESERVATION_PAY_CHK CHECK(RESERVATION_PAY IN ('Y','N')),
	CONSTRAINT RESERVATION_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT RESERVATION_LANTOUR_NO_FK FOREIGN KEY(LANTOUR_NO) REFERENCES LANTOUR(LANTOUR_NO),
	CONSTRAINT RESERVATION_ROOM_NO_FK FOREIGN KEY(ROOM_NO) REFERENCES ROOM(ROOM_NO),
	CONSTRAINT RESERVATION_HOTEL_NO_FK FOREIGN KEY(HOTEL_NO) REFERENCES HOTEL(HOTEL_NO)
);

CREATE TABLE CHAT(
	CHAT_NO NUMBER PRIMARY KEY,
	MEMBER_CLIENTNO NUMBER NOT NULL,
	MEMBER_HOSTNO NUMBER NOT NULL,
	CHAT_DATE DATE NOT NULL,
	CHAT_CONTENT VARCHAR2(500) NOT NULL,
	CONSTRAINT CHAT_MEMBER_CLIENTNO_FK FOREIGN KEY(MEMBER_CLIENTNO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT CHAT_MEMBER_HOSTNO_FK FOREIGN KEY(MEMBER_HOSTNO) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE COMMENT_TABLE(
	COMMENT_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	COMMUNITY_NO NUMBER NOT NULL,
	COMMENT_TITLE VARCHAR2(100) NOT NULL,
	COMMENT_CONTENT VARCHAR2(3000) NOT NULL,
	COMMENT_DATE DATE NOT NULL,
	COMMENT_DELFLAG VARCHAR2(2) NOT NULL,
	CONSTRAINT COMMENT_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT COMMENT_DELFLAG_CHK CHECK(COMMENT_DELFLAG IN ('Y','N'))
);

CREATE TABLE REVIEW(
	REVIEW_NO NUMBER PRIMARY KEY,
	ROOM_NO NUMBER,
	LANTOUR_NO NUMBER,
	MEMBER_NO NUMBER NOT NULL,
	REVIEW_DATE DATE NOT NULL,
	REVIEW_TITLE VARCHAR2(500) NOT NULL,
	REVIEW_SCORE NUMBER NOT NULL,
	CONSTRAINT REVIEW_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT REVIEW_ROOM_NO_FK FOREIGN KEY(ROOM_NO) REFERENCES ROOM(ROOM_NO)	
);

CREATE TABLE ROOM(
	ROOM_NO NUMBER PRIMARY KEY,
	HOTEL_NO NUMBER NOT NULL,
	ROOM_CONTENT VARCHAR2(2000) NOT NULL,
	ROOM_PRICE NUMBER NOT NULL,
	ROOM_CONVINENCE VARCHAR2(500) NOT NULL,
	ROOM_MAXCOUNT NUMBER NOT NULL,
	ROOM_IMAGE VARCHAR2(4000) NOT NULL,
	CONSTRAINT ROOM_HOTEL_NO_FK FOREIGN KEY(HOTEL_NO) REFERENCES HOTEL(HOTEL_NO)
);

select * from LANTOUR;
