DROP SEQUENCE SEQ_INQ_TYPE_CODE;
DROP SEQUENCE SEQ_USER_CODE;
DROP SEQUENCE SEQ_INQ_CODE;
DROP SEQUENCE SEQ_NOTICE_CODE;
DROP SEQUENCE SEQ_IMG_CAT_CODE;
DROP SEQUENCE SEQ_ENT_CODE;
DROP SEQUENCE SEQ_AUTH_CODE;
DROP SEQUENCE SEQ_POST_CAT_CODE;
DROP SEQUENCE SEQ_RE_COMMENT_CODE;
DROP SEQUENCE SEQ_IMG_CODE;
DROP SEQUENCE SEQ_REVIEW_CODE;
DROP SEQUENCE SEQ_POST_CODE;
DROP SEQUENCE SEQ_CMT_CODE;
DROP SEQUENCE SEQ_PAYMENT_CODE;

CREATE SEQUENCE SEQ_INQ_TYPE_CODE;
CREATE SEQUENCE SEQ_USER_CODE;
CREATE SEQUENCE SEQ_INQ_CODE;
CREATE SEQUENCE SEQ_NOTICE_CODE;
CREATE SEQUENCE SEQ_IMG_CAT_CODE;
CREATE SEQUENCE SEQ_ENT_CODE;
CREATE SEQUENCE SEQ_AUTH_CODE;
CREATE SEQUENCE SEQ_POST_CAT_CODE;
CREATE SEQUENCE SEQ_RE_COMMENT_CODE;
CREATE SEQUENCE SEQ_IMG_CODE;
CREATE SEQUENCE SEQ_REVIEW_CODE;
CREATE SEQUENCE SEQ_POST_CODE;
CREATE SEQUENCE SEQ_CMT_CODE;
CREATE SEQUENCE SEQ_PAYMENT_CODE;

DROP TABLE INQUIRY CASCADE CONSTRAINTS;
DROP TABLE INQUIRY_TYPE CASCADE CONSTRAINTS;
DROP TABLE "USER" CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE POST_CAT CASCADE CONSTRAINTS;
DROP TABLE RE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE IMG_FILE CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE IMG_CAT CASCADE CONSTRAINTS;
DROP TABLE ENT_CAT CASCADE CONSTRAINTS;
DROP TABLE AUTHENTIC CASCADE CONSTRAINTS;
DROP TABLE POST CASCADE CONSTRAINTS;
DROP TABLE CMT CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE REPORT_PER_MEMBER CASCADE CONSTRAINTS;



CREATE TABLE ENT_CAT (
  -- COLUMN LEVEL CONSTRAINT
  ENT_CODE NUMBER,
  ENT_TYPE VARCHAR2(255) CONSTRAINT NN_ENT_TYPE NOT NULL,
  -- TABLE LEVEL CONSTRAINT
  CONSTRAINT PK_ENT_CODE PRIMARY KEY(ENT_CODE)
);

COMMENT ON COLUMN ENT_CAT.ENT_CODE IS '탈퇴형태카테고리코드';
COMMENT ON COLUMN ENT_CAT.ENT_TYPE IS '탈퇴형태';

INSERT
  INTO ENT_CAT
VALUES
(
  SEQ_ENT_CODE.NEXTVAL,
  '활성회원'
);

INSERT
  INTO ENT_CAT
VALUES
(
  SEQ_ENT_CODE.NEXTVAL,
  '블랙회원'
);

INSERT
  INTO ENT_CAT
VALUES
(
  SEQ_ENT_CODE.NEXTVAL,
  '휴면회원'
);

INSERT
  INTO ENT_CAT
VALUES
(
  SEQ_ENT_CODE.NEXTVAL,
  '본인탈퇴'
);

INSERT
  INTO ENT_CAT
VALUES
(
  SEQ_ENT_CODE.NEXTVAL,
  '강제탈퇴'
);

CREATE TABLE INQUIRY_TYPE(
  INQ_TYPE_CODE NUMBER CONSTRAINT PK_INQ_TYPE_CODE PRIMARY KEY
, INQ_TYPE VARCHAR2(255) CONSTRAINT NN_INQ_TYPE NOT NULL
);

COMMENT ON COLUMN INQUIRY_TYPE.INQ_TYPE_CODE IS '문의유형코드';
COMMENT ON COLUMN INQUIRY_TYPE.INQ_TYPE IS '문의유형';

INSERT
  INTO INQUIRY_TYPE
(
  INQ_TYPE_CODE, INQ_TYPE
)
VALUES
(
  1, '홈페이지사용문의'
);

INSERT
  INTO INQUIRY_TYPE
(
  INQ_TYPE_CODE, INQ_TYPE
)
VALUES
(
  2, '거래문의'
);

INSERT
  INTO INQUIRY_TYPE
(
  INQ_TYPE_CODE, INQ_TYPE
)
VALUES
(
  3, '계정문의'
);

INSERT
  INTO INQUIRY_TYPE
(
  INQ_TYPE_CODE, INQ_TYPE
)
VALUES
(
  4, '기타'
);

CREATE TABLE "USER"(
  USER_CODE NUMBER CONSTRAINT PK_USER_CODE PRIMARY KEY
, ENT_CODE NUMBER  CONSTRAINT NN_ENT_CODE NOT NULL
, USER_ID VARCHAR2(255) CONSTRAINT NN_USER_ID NOT NULL
, USER_PSW VARCHAR2(255) CONSTRAINT NN_USER_PSW NOT NULL
, USER_EMAIL VARCHAR2(255) CONSTRAINT NN_USER_EMAIL NOT NULL
, PHONE VARCHAR2(255) CONSTRAINT NN_PHONE NOT NULL
, USER_NAME VARCHAR2(255) CONSTRAINT NN_USER_NAME NOT NULL
, BIRTH_DATE DATE
, GENDER CHAR(1)
, AUTHORITY CHAR(1) DEFAULT 'N' CONSTRAINT NN_AUTHORITY NOT NULL
, DEPOSIT NUMBER DEFAULT 0 CONSTRAINT NN_DEPOSIT NOT NULL
, PROFILE_ORIG_NAME VARCHAR2(4000)
, PROFILE_UUID_NAME VARCHAR2(4000)
, PROFILE_IMG_PATH VARCHAR2(4000)
, LAST_LOGIN DATE DEFAULT SYSDATE
, ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT NN_ENROLL_DATE NOT NULL
, CONSTRAINT FK_ENT_CODE FOREIGN KEY (ENT_CODE) REFERENCES ENT_CAT(ENT_CODE)
, CONSTRAINT CK_AUTHORITY CHECK(AUTHORITY IN ('Y', 'N'))
, CONSTRAINT CK_GENDER CHECK(GENDER IN ('M','F'))
, CONSTRAINT UK_USER_ID UNIQUE(USER_ID)
);

COMMENT ON COLUMN "USER".USER_CODE IS '사용자코드';
COMMENT ON COLUMN "USER".ENT_CODE IS '탈퇴형태카테고리코드';
COMMENT ON COLUMN "USER".USER_ID IS '아이디';
COMMENT ON COLUMN "USER".USER_PSW IS '비밀번호';
COMMENT ON COLUMN "USER".USER_EMAIL IS '이메일';
COMMENT ON COLUMN "USER".PHONE IS '핸드폰번호';
COMMENT ON COLUMN "USER".USER_NAME IS '이름';
COMMENT ON COLUMN "USER".BIRTH_DATE IS '생년월일';
COMMENT ON COLUMN "USER".GENDER IS '성별';
COMMENT ON COLUMN "USER".AUTHORITY IS '관리권한유무';
COMMENT ON COLUMN "USER".DEPOSIT IS '예치금';
COMMENT ON COLUMN "USER".PROFILE_ORIG_NAME IS '프로필사진원본이름';
COMMENT ON COLUMN "USER".PROFILE_UUID_NAME IS '프로필사진암호화된이름';
COMMENT ON COLUMN "USER".PROFILE_IMG_PATH IS '프로필사진저장경로';
COMMENT ON COLUMN "USER".LAST_LOGIN IS '최종로그인날짜';
COMMENT ON COLUMN "USER".ENROLL_DATE IS '가입날짜';

INSERT
  INTO "USER"
(
  USER_CODE, ENT_CODE, USER_ID, USER_PSW, USER_EMAIL
, PHONE, USER_NAME, BIRTH_DATE, GENDER, AUTHORITY
, DEPOSIT, PROFILE_ORIG_NAME, PROFILE_UUID_NAME, PROFILE_IMG_PATH, LAST_LOGIN
, ENROLL_DATE
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL, 1, 'admin', 'admin', 'email@gmail.com'
, '010-1234-5678', '김준우', TO_DATE('1996-04-03', 'YYYY-MM-DD'), 'M', 'Y'
, '30000', NULL, NULL, NULL, TO_DATE('2021-10-05', 'YYYY-MM-DD')
, TO_DATE('2021-10-05', 'YYYY-MM-DD')
);

INSERT
  INTO "USER"
(
  USER_CODE, ENT_CODE, USER_ID, USER_PSW, USER_EMAIL
, PHONE, USER_NAME, BIRTH_DATE, GENDER, AUTHORITY
, DEPOSIT, PROFILE_ORIG_NAME, PROFILE_UUID_NAME, PROFILE_IMG_PATH, LAST_LOGIN
, ENROLL_DATE
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL, 1, 'user01', 'pass01', 'email01@gmail.com'
, '010-1111-2222', '송언석', TO_DATE('1995-04-15', 'YYYY-MM-DD'), 'M', 'N'
, '35000', NULL, NULL, NULL, TO_DATE('2021-10-03', 'YYYY-MM-DD')
, TO_DATE('2021-05-03', 'YYYY-MM-DD')
);

INSERT
  INTO "USER"
(
  USER_CODE, ENT_CODE, USER_ID, USER_PSW, USER_EMAIL
, PHONE, USER_NAME, BIRTH_DATE, GENDER, AUTHORITY
, DEPOSIT, PROFILE_ORIG_NAME, PROFILE_UUID_NAME, PROFILE_IMG_PATH, LAST_LOGIN
, ENROLL_DATE
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL, 1, 'user02', 'pass02', 'dummydata@gmail.com'
, '010-2222-3333', '이한수', TO_DATE('2002-02-02', 'YYYY-MM-DD'), 'M', 'N'
, '300000', NULL, NULL, NULL, TO_DATE('2021-10-05', 'YYYY-MM-DD')
, TO_DATE('2021-05-10', 'YYYY-MM-DD')
);

INSERT
  INTO "USER"
(
  USER_CODE, ENT_CODE, USER_ID, USER_PSW, USER_EMAIL
, PHONE, USER_NAME, BIRTH_DATE, GENDER, AUTHORITY
, DEPOSIT, PROFILE_ORIG_NAME, PROFILE_UUID_NAME, PROFILE_IMG_PATH, LAST_LOGIN
, ENROLL_DATE
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL, 1, 'user03', 'pass03', 'isntiteasy@gmail.com'
, '010-3333-4444', 'Bob Ross', TO_DATE('1942-10-29', 'YYYY-MM-DD'), 'M', 'N'
, '6300000', NULL, NULL, NULL, TO_DATE('2021-10-07', 'YYYY-MM-DD')
, TO_DATE('2021-05-30', 'YYYY-MM-DD')
);

CREATE TABLE INQUIRY(
  INQ_CODE NUMBER CONSTRAINT PK_INQ_CODE PRIMARY KEY
, INQ_TYPE_CODE NUMBER CONSTRAINT NN_INQ_TYPE_CODE NOT NULL
, USER_CODE NUMBER CONSTRAINT USER_CODE_NN NOT NULL
, INQ_TITLE VARCHAR2(255) CONSTRAINT NN_INQ_TITLE NOT NULL
, INQ_CONTENT VARCHAR2(4000) CONSTRAINT NN_INT_CONTENT NOT NULL
, INQ_TIME DATE DEFAULT SYSDATE CONSTRAINT NN_ITQ_TIME NOT NULL
, ANS_CONTENT VARCHAR2(4000)
, ANS_TIME DATE
, ANS_YN CHAR(1) DEFAULT 'N' CONSTRAINT NN_ANS_YN NOT NULL
, CONSTRAINT FK_INQ_TYPE_CODE FOREIGN KEY (INQ_TYPE_CODE) REFERENCES INQUIRY_TYPE(INQ_TYPE_CODE)
, CONSTRAINT FK_USER_CODE FOREIGN KEY (USER_CODE) REFERENCES "USER"(USER_CODE)
, CONSTRAINT CK_MEM_YN CHECK(ANS_YN IN ('Y', 'N'))
);

COMMENT ON COLUMN INQUIRY.INQ_CODE IS '1:1문의코드';
COMMENT ON COLUMN INQUIRY.INQ_TYPE_CODE IS '문의유형코드';
COMMENT ON COLUMN INQUIRY.USER_CODE IS '사용자코드';
COMMENT ON COLUMN INQUIRY.INQ_TITLE IS '문의제목';
COMMENT ON COLUMN INQUIRY.INQ_CONTENT IS '문의내용';
COMMENT ON COLUMN INQUIRY.INQ_TIME IS '문의날짜';
COMMENT ON COLUMN INQUIRY.ANS_CONTENT IS '답변내용';
COMMENT ON COLUMN INQUIRY.ANS_TIME IS '답변일자';
COMMENT ON COLUMN INQUIRY.ANS_YN IS '답변여부';

INSERT
  INTO INQUIRY
(
  INQ_CODE, INQ_TYPE_CODE, USER_CODE
, INQ_TITLE, INQ_CONTENT, INQ_TIME
, ANS_CONTENT, ANS_TIME, ANS_YN
)
VALUES
(
  SEQ_INQ_CODE.NEXTVAL, 1, 3
, '안녕하세요', '거래가 안돼요 ㅠㅠ', TO_DATE('2021-10-07 15:08:00', 'YYYY-MM-DD HH24:MI:SS')
, '거래 완료 해드렸어요~', TO_DATE('2021-10-05 17:30:17', 'YYYY-MM-DD HH24:MI:SS'), 'Y'
);

INSERT
  INTO INQUIRY
(
  INQ_CODE, INQ_TYPE_CODE, USER_CODE
, INQ_TITLE, INQ_CONTENT, INQ_TIME
, ANS_CONTENT, ANS_TIME, ANS_YN
)
VALUES
(
  SEQ_INQ_CODE.NEXTVAL, 1, 2
, '문의합니다', '답변을 주세요~', TO_DATE('2021-10-08 12:08:00', 'YYYY-MM-DD HH24:MI:SS')
, NULL, NULL, 'N'
);

INSERT
  INTO INQUIRY
(
  INQ_CODE, INQ_TYPE_CODE, USER_CODE
, INQ_TITLE, INQ_CONTENT, INQ_TIME
, ANS_CONTENT, ANS_TIME, ANS_YN
)
VALUES
(
  SEQ_INQ_CODE.NEXTVAL, 1, 2
, 'HI THERE', 'WHY I CANNOT CONNECT TO YOUR SERVER', TO_DATE('2021-10-07 15:08:00', 'YYYY-MM-DD HH24:MI:SS')
, NULL, NULL, 'N'
);

CREATE TABLE NOTICE (
  -- COLUMN LEVEL CONSTRAINT
  NOTICE_CODE NUMBER,
  NOTICE_TITLE VARCHAR2(4000) CONSTRAINT NN_NOTICE_TITLE NOT NULL,
  NOTICE_CONTENT VARCHAR2(4000) CONSTRAINT NN_NOTICE_CONTENT NOT NULL,
  NOTICE_TIME DATE DEFAULT SYSDATE CONSTRAINT NN_NOTICE_TIME NOT NULL,
  -- TABLE LEVEL CONSTRAINT
  CONSTRAINT PK_NOTICE_CODE PRIMARY KEY(NOTICE_CODE)
);

COMMENT ON COLUMN NOTICE.NOTICE_CODE IS '공지사항코드';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항내용';
COMMENT ON COLUMN NOTICE.NOTICE_TIME IS '공지사항작성시간';

INSERT
  INTO NOTICE
VALUES
(
  SEQ_NOTICE_CODE.NEXTVAL,
  '더미 공지사항 1번',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  TO_DATE('2021-10-05 17:21:55', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT
  INTO NOTICE
VALUES
(
  SEQ_NOTICE_CODE.NEXTVAL,
  '더미 공지사항 2번',
  'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
  TO_DATE('2021-10-05 17:25:17', 'YYYY-MM-DD HH24:MI:SS')
);

CREATE TABLE IMG_CAT (
  -- COLUMN LEVEL CONSTRAINT
  IMG_CAT_CODE NUMBER,
  IMG_CAT_NAME VARCHAR2(255) CONSTRAINT NN_IMG_CAT_NAME NOT NULL,
  IMG_PATH VARCHAR2(255),
  -- TABLE LEVEL CONSTRAINT
  CONSTRAINT PK_IMG_CAT_CODE PRIMARY KEY(IMG_CAT_CODE)
);

COMMENT ON COLUMN IMG_CAT.IMG_CAT_CODE IS '이미지종류코드';
COMMENT ON COLUMN IMG_CAT.IMG_CAT_NAME IS '이미지종류';
COMMENT ON COLUMN IMG_CAT.IMG_PATH IS '저장경로';

INSERT
  INTO IMG_CAT
VALUES
(
  SEQ_IMG_CAT_CODE.NEXTVAL,
  '프로필',
  'resource/upload/profile'
);

INSERT
  INTO IMG_CAT
VALUES
(
  SEQ_IMG_CAT_CODE.NEXTVAL,
  '게시물',
  'resource/upload/post'
);

INSERT
  INTO IMG_CAT
VALUES
(
  SEQ_IMG_CAT_CODE.NEXTVAL,
  '1:1문의',
  'resource/upload/inquiry'
);

INSERT
  INTO IMG_CAT
VALUES
(
  SEQ_IMG_CAT_CODE.NEXTVAL,
  '리뷰',
  'resource/upload/reveiw'
);

CREATE TABLE AUTHENTIC (
  -- COLUMN LEVEL CONSTRAINT
  AUTH_CODE NUMBER,
  AUTH_STATUS VARCHAR2(255) CONSTRAINT NN_AUTH_STATUS NOT NULL,
  -- TABLE LEVEL CONSTRAINT
  CONSTRAINT PK_AUTH_CODE PRIMARY KEY(AUTH_CODE)
);

COMMENT ON COLUMN AUTHENTIC.AUTH_CODE IS '감정상태코드';
COMMENT ON COLUMN AUTHENTIC.AUTH_STATUS IS '감정상태';

INSERT
  INTO AUTHENTIC
VALUES
(
  SEQ_AUTH_CODE.NEXTVAL,
  '감정전'
);

INSERT
  INTO AUTHENTIC
VALUES
(
  SEQ_AUTH_CODE.NEXTVAL,
  '감정중'
);

INSERT
  INTO AUTHENTIC
VALUES
(
  SEQ_AUTH_CODE.NEXTVAL,
  '감정완료'
);

INSERT
  INTO AUTHENTIC
VALUES
(
  SEQ_AUTH_CODE.NEXTVAL,
  '감정반려'
);

CREATE TABLE POST_CAT (
    POST_CAT_CODE NUMBER CONSTRAINT PK_POST_CAT_CODE PRIMARY KEY,
    POST_CAT_NAME VARCHAR2(255) CONSTRAINT NN_POST_CAT_NAME NOT NULL
);

    COMMENT ON COLUMN POST_CAT.POST_CAT_CODE IS '게시글카테고리코드';
    COMMENT ON COLUMN POST_CAT.POST_CAT_NAME IS '게시글카테고리';

INSERT
  INTO POST_CAT
VALUES
(
  SEQ_POST_CAT_CODE.NEXTVAL,
  '판매'
);

INSERT
  INTO POST_CAT
  VALUES
(
  SEQ_POST_CAT_CODE.NEXTVAL,
  '자유'
);
    
CREATE TABLE POST(
  POST_CODE NUMBER CONSTRAINT PK_POST_CODE PRIMARY KEY
, SELLER_CODE NUMBER CONSTRAINT NN_SELLER_CODE NOT NULL
, BUYER_CODE NUMBER 
, POST_CAT_CODE NUMBER CONSTRAINT POST_CAT_CODE_NN NOT NULL
, AUTH_CODE NUMBER DEFAULT 1 CONSTRAINT AUTH_CODE_NN NOT NULL
, POST_TITLE VARCHAR2(255) CONSTRAINT NN_POST_TITLE NOT NULL
, POST_CONTENT VARCHAR2(4000) CONSTRAINT NN_POST_CONTENT NOT NULL
, LIKE_COUNT NUMBER DEFAULT 0 CONSTRAINT NN_LIKE_COUNT NOT NULL
, POST_TIME DATE DEFAULT SYSDATE CONSTRAINT NN_POST_TIME NOT NULL
, SOLD_YN CHAR(1) DEFAULT 'N' CONSTRAINT NN_SOLD_YN NOT NULL
, REPORT_COUNT NUMBER DEFAULT 0 CONSTRAINT NN_REPORT_COUNT NOT NULL
, BLIND_YN CHAR(1) DEFAULT 'N' CONSTRAINT NN_BLIND_YN NOT NULL
, ITEM_PRICE NUMBER CONSTRAINT NN_ITEM_PRICE NOT NULL
, POST_VIEW NUMBER DEFAULT 0 CONSTRAINT NN_POST_VIEW NOT NULL
, CONSTRAINT FK_SELLER_CODE FOREIGN KEY (SELLER_CODE) REFERENCES "USER" (USER_CODE)
, CONSTRAINT FK_BUYER_CODE FOREIGN KEY (BUYER_CODE) REFERENCES "USER" (USER_CODE)
, CONSTRAINT POST_CAT_CODE_FK FOREIGN KEY (POST_CAT_CODE) REFERENCES POST_CAT (POST_CAT_CODE)
, CONSTRAINT AUTH_CODE_FK FOREIGN KEY (AUTH_CODE) REFERENCES AUTHENTIC (AUTH_CODE)
, CONSTRAINT CK_SOLD_YN CHECK(SOLD_YN IN ('Y', 'N'))
, CONSTRAINT CK_BLIND_YN CHECK(BLIND_YN IN ('Y', 'N'))
);

    COMMENT ON COLUMN POST.POST_CODE IS '게시글코드';
    COMMENT ON COLUMN POST.SELLER_CODE IS '판매자코드';
    COMMENT ON COLUMN POST.BUYER_CODE IS '구매자코드';
    COMMENT ON COLUMN POST.POST_CAT_CODE IS '게시글카테고리코드';
    COMMENT ON COLUMN POST.AUTH_CODE IS '감정상태코드';
    COMMENT ON COLUMN POST.POST_TITLE IS '게시글제목';
    COMMENT ON COLUMN POST.POST_CONTENT IS '게시글내용';
    COMMENT ON COLUMN POST.LIKE_COUNT IS '!좋아요';
    COMMENT ON COLUMN POST.POST_TIME IS '게시글작성시간';
    COMMENT ON COLUMN POST.SOLD_YN IS '판매유무';
    COMMENT ON COLUMN POST.REPORT_COUNT IS '신고횟수';
    COMMENT ON COLUMN POST.BLIND_YN IS '블라인드처리유무';
    COMMENT ON COLUMN POST.ITEM_PRICE IS '물품가격';
    COMMENT ON COLUMN POST.POST_VIEW IS '조회수';

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-06-05 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#1 판매중인 게시글 입니다.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-06-06 22:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#2 판매중인 게시글 입니다.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 1, TO_DATE('2021-06-07 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#3 판매중인 게시글 입니다.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 1, TO_DATE('2021-06-08 12:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#4 판매중인 게시글 입니다람쥐.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 1, TO_DATE('2021-06-09 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#5 판매중인 게시글 입니다람쥐.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 2, TO_DATE('2021-06-10 16:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#6 판매중인 게시글 입니다람쥐.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-06-11 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#7 판매중인 게시글 입니다.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  -- Constant Data
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  -- Variable Data
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-06-11 22:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#8 판매중인 게시글 입니다.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 1, TO_DATE('2021-06-12 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#9 판매중인 게시글 입니다.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  -- Constant Data
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 15, 0,
  -- Variable Data
  3, 1, TO_DATE('2021-06-12 12:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'Y', 150000,
  '#10 판매중인 게시글 입니다람쥐.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 3, TO_DATE('2021-06-13 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#11 판매중인 게시글 입니다람쥐.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 2, TO_DATE('2021-07-13 16:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#12 판매중인 게시글 입니다람쥐.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-07-05 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#13 판매중인 게시글 입니다.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-07-06 22:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#14 판매중인 게시글 입니다.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 1, TO_DATE('2021-07-07 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#15 판매중인 게시글 입니다.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 1, TO_DATE('2021-07-08 12:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#16 판매중인 게시글 입니다람쥐.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 1, TO_DATE('2021-07-09 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#17 판매중인 게시글 입니다람쥐.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 2, TO_DATE('2021-07-10 16:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#18 판매중인 게시글 입니다람쥐.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 2, TO_DATE('2021-07-11 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#19 판매중인 게시글 입니다.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  2, 1, TO_DATE('2021-07-11 22:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'Y', 210000,
  '#20 판매중인 게시글 입니다.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 3, TO_DATE('2021-07-12 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#21 판매중인 게시글 입니다.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  3, 2, TO_DATE('2021-07-12 12:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 150000,
  '#22 판매중인 게시글 입니다람쥐.',
  '♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동http://kr.battle.net/heroes/ko/'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 1, TO_DATE('2021-07-13 09:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 210000,
  '#23 판매중인 게시글 입니다람쥐.',
  '??어서☆오세요 #밖은 너무 춥다구요♡하스스톤♧워크래프트의 영웅들??카드팩＄＄전원 1회 후불제☜☜※야생에서의 만남￥ 특정조건 §§낙스라마스§§★고블린대 노움★2년 이용시 야생 승격@@@ 퇴직금 10만원 제공♡♡즉시이동kr.battle.net/hearthstone/ko'
);

INSERT INTO POST
(
  POST_CODE, BUYER_CODE, POST_CAT_CODE, LIKE_COUNT, REPORT_COUNT, POST_VIEW,
  SELLER_CODE, AUTH_CODE, POST_TIME, SOLD_YN, BLIND_YN, ITEM_PRICE, POST_TITLE, POST_CONTENT
)
VALUES
(
  SEQ_POST_CODE.NEXTVAL, NULL, 1, 0, 0, 0,
  4, 1, TO_DATE('2021-07-13 16:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 330000,
  '#24 판매중인 게시글 입니다람쥐.',
  'ㄷ1앎블롪ＩＩ✮ ➷ஜzㅔㅈㅓ렉❀쎥01 ி톪♞앓옸ㅏㄷㅏ!! ♔꾾□ㅐ 즉ㅅ1 Lㅔ팗렘읝 힘으로➞ 복구1✇ ㄱㅏ능ஊ! 즉시이동 https://diablo2.blizzard.com/ko-kr/'
);

CREATE TABLE CMT(
    CMT_CODE NUMBER CONSTRAINT PK_CMT_CODE PRIMARY KEY
  , POST_CODE NUMBER NOT NULL CONSTRAINT POST_CODE_FK REFERENCES POST(POST_CODE)
  , CMT_CONTENT VARCHAR2(4000) CONSTRAINT NN_CMT_CONTENT NOT NULL
  , CMT_TIME DATE DEFAULT SYSDATE CONSTRAINT NN_CMT_TIME NOT NULL
  , CMT_YN CHAR(1) DEFAULT 'Y' CONSTRAINT NN_CMT_YN NOT NULL
);
    COMMENT ON COLUMN CMT.CMT_CODE IS '댓글코드';
    COMMENT ON COLUMN CMT.POST_CODE IS '게시글코드';
    COMMENT ON COLUMN CMT.CMT_CONTENT IS '댓글내용';
    COMMENT ON COLUMN CMT.CMT_TIME IS '댓글작성시간';
    COMMENT ON COLUMN CMT.CMT_YN IS '댓글공개여부';
    

CREATE TABLE RE_COMMENT (
    RE_COMMENT_CODE NUMBER CONSTRAINT PK_RE_COMMENT_CODE PRIMARY KEY,
    CMT_CODE NUMBER CONSTRAINT NN_CMT_CODE NOT NULL CONSTRAINT FK_CMT_CODE REFERENCES CMT (CMT_CODE),
    RE_COMMENT_CONTENT VARCHAR2(4000) CONSTRAINT NN_RE_COMMENT_CONTENT NOT NULL,
    RE_COMMENT_TIME DATE DEFAULT SYSDATE CONSTRAINT NN_RE_COMMENT_TIME NOT NULL,
    RE_COMMENT_YN CHAR(1) DEFAULT 'Y' CONSTRAINT NN_RE_COMMENT_YN NOT NULL CONSTRAINT CK_RE_COMMENT_YN CHECK(RE_COMMENT_YN IN ('Y','N'))
);

    COMMENT ON COLUMN RE_COMMENT.RE_COMMENT_CODE IS '대댓글코드';
    COMMENT ON COLUMN RE_COMMENT.CMT_CODE IS '댓글코드';
    COMMENT ON COLUMN RE_COMMENT.RE_COMMENT_CONTENT IS '대댓글내용';
    COMMENT ON COLUMN RE_COMMENT.RE_COMMENT_TIME IS '대댓글작성시간';
    COMMENT ON COLUMN RE_COMMENT.RE_COMMENT_YN IS '대댓글공개여부';

CREATE TABLE REVIEW (
    REVIEW_CODE NUMBER CONSTRAINT PK_REVIEW_CODE PRIMARY KEY,
    POST_CODE NUMBER CONSTRAINT NN_POST_CODE NOT NULL CONSTRAINT FK_POST_CODE REFERENCES POST (POST_CODE),
    REVIEW_CONTENT VARCHAR2(4000) CONSTRAINT NN_REVIEW_CONTENT NOT NULL,
    REVIEW_GRADE NUMBER   DEFAULT '0' CONSTRAINT NN_REVIEW_GRADE NOT NULL,
    REVIEW_TIME DATE DEFAULT SYSDATE CONSTRAINT NN_REVIEW_TIME NOT NULL
);

    COMMENT ON COLUMN REVIEW.REVIEW_CODE IS '리뷰코드';
    COMMENT ON COLUMN REVIEW.POST_CODE IS '게시글코드';
    COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '리뷰내용';
    COMMENT ON COLUMN REVIEW.REVIEW_GRADE IS '리뷰별점';
    COMMENT ON COLUMN REVIEW.REVIEW_TIME IS '리뷰작성시간';

CREATE TABLE IMG_FILE (
    IMG_CODE NUMBER CONSTRAINT PK_IMG_CODE PRIMARY KEY,
    IMG_CAT_CODE NUMBER CONSTRAINT NN_IMG_CAT_CODE NOT NULL CONSTRAINT FK_IMG_CAT_CODE REFERENCES IMG_CAT (IMG_CAT_CODE),
    INQ_CODE NUMBER NULL CONSTRAINT FK2_INQ_CODE REFERENCES INQUIRY (INQ_CODE),
    POST_CODE NUMBER NULL CONSTRAINT FK2_POST_CODE REFERENCES POST (POST_CODE),
    REVIEW_CODE NUMBER NULL CONSTRAINT FK2_REVIEW_CODE REFERENCES REVIEW (REVIEW_CODE),
    ORIG_NAME VARCHAR2(4000) CONSTRAINT NN_ORIG_NAME NOT NULL,
    UUID_NAME VARCHAR2(4000) CONSTRAINT NN_UUID_NAME NOT NULL
);

    COMMENT ON COLUMN IMG_FILE.IMG_CODE IS '이미지코드';
    COMMENT ON COLUMN IMG_FILE.IMG_CAT_CODE IS '이미지종류코드';
    COMMENT ON COLUMN IMG_FILE.INQ_CODE IS '1:1문의코드';
    COMMENT ON COLUMN IMG_FILE.POST_CODE IS '게시글코드';
    COMMENT ON COLUMN IMG_FILE.REVIEW_CODE IS '리뷰코드';
    COMMENT ON COLUMN IMG_FILE.ORIG_NAME IS '원본이름';
    COMMENT ON COLUMN IMG_FILE.UUID_NAME IS '암호화된이름';

CREATE TABLE REPORT(
  REPORT_CODE NUMBER CONSTRAINT PK_REPORT_CODE PRIMARY KEY
, POST_CODE NUMBER CONSTRAINT NN2_POST_CODE NOT NULL
, REASON VARCHAR2(4000) CONSTRAINT NN_REASON NOT NULL
, CONSTRAINT FK4_POST_CODE FOREIGN KEY (POST_CODE) REFERENCES POST (POST_CODE)
);

COMMENT ON COLUMN REPORT.REPORT_CODE IS '신고코드';
COMMENT ON COLUMN REPORT.POST_CODE IS '게시글코드';
COMMENT ON COLUMN REPORT.REASON IS '신고사유';

CREATE TABLE PAYMENT (
  PAYMENT_CODE NUMBER CONSTRAINT PK_PAYMENT_CODE PRIMARY KEY
, POST_CODE NUMBER CONSTRAINT POST_CODE_NN NOT NULL
, PAYMENT_METHOD VARCHAR2(255) NOT NULL
, PAYMENT_TIME DATE DEFAULT SYSDATE NOT NULL
, CONSTRAINT FK3_POST_CODE FOREIGN KEY (POST_CODE) REFERENCES POST(POST_CODE)
);
    COMMENT ON COLUMN PAYMENT.PAYMENT_CODE IS '결제코드';
    COMMENT ON COLUMN PAYMENT.POST_CODE IS '게시글코드';
    COMMENT ON COLUMN PAYMENT.PAYMENT_METHOD IS '결제수단';
    COMMENT ON COLUMN PAYMENT.PAYMENT_TIME IS '결제시간';
    
CREATE TABLE REPORT_PER_MEMBER(
  USER_CODE NUMBER
, POST_CODE NUMBER
, CONSTRAINT PK_RPM PRIMARY KEY(USER_CODE, POST_CODE)
, CONSTRAINT FK_USER_CODE_RPM FOREIGN KEY (USER_CODE) REFERENCES "USER"(USER_CODE)
, CONSTRAINT FK_POST_CODE_RPM FOREIGN KEY (POST_CODE) REFERENCES POST(POST_CODE)
);

    COMMENT ON COLUMN REPORT_PER_MEMBER.USER_CODE IS '사용자코드';
    COMMENT ON COLUMN REPORT_PER_MEMBER.POST_CODE IS '게시글코드';