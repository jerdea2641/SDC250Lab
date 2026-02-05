--Jeremy Dean

--QUESTION 1
--Alter the PRODUCTLIST table to include a PRICE and DESCRIPTION column 
--Write a series of update statements to move the price and description data stored within STOREFRONT to the new columns in PRODUCTLIST
--Drop the STOREFRONT table

ALTER TABLE productlist
ADD(
    price           NUMBER(8,2),
    description     VARCHAR2(255)
);

UPDATE productlist
SET
    price =(
        SELECT s.price
        FROM   storefront s
        WHERE  s.productcode = productlist.productcode
    ),
    description =(
        SELECT  s.description
        FROM    storefront s
        WHERE   s.productcode = productlist.productcode
    );

DROP TABLE storefront;

--QUESTION 2
--Create a CHATLOG table with this design:
--Include a column named CHATID with the data type NUMBER(3)
--Include a column named RECEIVERID with the data type NUMBER(3)
--Include a column named SENDERID with the data type NUMBER(3)
--Include a column named DATESENT with the data type DATE
--Include a column named CONTENT with the data type VARCHAR2(250)
--Include a Primary Key constraint on the CHATID column
--Include a Foreign Key constraint on RECEIVERID that references the USERID column in the USERBASE table
--Include a Foreign Key constraint on SENDERID that references the USERID column in the USERBASE table
--Insert 10 - 15 rows of sample data into the CHATLOG table


CREATE TABLE chatlog(
        chatid      NUMBER(3)PRIMARY KEY,
        receiverid  NUMBER(3),
        senderid    NUMBER(3),
        datesent    DATE,
        content     VARCHAR(250),
        CONSTRAINT   fk_receiver FOREIGN KEY (receiverid) REFERENCES userbase (userid),
        CONSTRAINT   fk_sender FOREIGN KEY (senderid)     REFERENCES userbase (userid)
);

INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 1, 110, 101, TO_DATE ('2021-01-01 08:00', 'YYYY-MM-DD HH24:MI'), 'I am going to be late to work');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 2, 100, 110, TO_DATE ('2021-01-01 08:30', 'YYYY-MM-DD HH24:MI'), 'Okay. Meeting will start without you');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 3, 108, 102, TO_DATE ('2021-02-03 09:00', 'YYYY-MM-DD HH24:MI'), 'What do you want for dinner?');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 4, 102, 108, TO_DATE ('2021-02-03 09:35', 'YYYY-MM-DD HH24:MI'), 'Lets go out to eat tonight.');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 5, 109, 101, TO_DATE ('2022-04-01 07:24', 'YYYY-MM-DD HH24:MI'), 'What do do for April fools this year?');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 6, 104, 109, TO_DATE ('2022-06-01 13:00', 'YYYY-MM-DD HH24:MI'), 'When will I be promoted?');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 7, 105, 104, TO_DATE ('2022-06-01 16:00', 'YYYY-MM-DD HH24:MI'), 'Sometime in the next year.');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 8, 103, 102, TO_DATE ('2024-02-25 12:00', 'YYYY-MM-DD HH24:MI'), 'What is the status of the work?');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES( 9, 104, 108, TO_DATE ('2025-11-12 09:00', 'YYYY-MM-DD HH24:MI'), 'Lets go to the parade this year!');
INSERT INTO chatlog( chatid, receiverid, senderid, datesent, content) VALUES(10, 101, 107, TO_DATE ('2026-01-06 08:00', 'YYYY-MM-DD HH24:MI'), 'We will graduate next year!');

--QUESTION 3
--Create a FRIENDSLIST table with this design:
--Include a column named USERID with the data type NUMBER(3)
--Include a column named FRIENDID with the data type NUMBER(3)
--Include a Primary Key constraint on the USERID and FRIENDID columns
--Include a Foreign Key constraint on USERID that references the USERID in the USERBASE table
--Include a Foreign Key constraint on FRIENDID that references the USERID column in the USERBASE table
--Insert 10 - 15 rows of sample data into the FRIENDSLIST table.

CREATE TABLE friendslist(
        userid      NUMBER(3),
        friendid    NUMBER(3),
CONSTRAINT pk_friends PRIMARY KEY (userid, friendid),
CONSTRAINT fk_userid FOREIGN KEY (userid)     REFERENCES userbase (userid),
CONSTRAINT fk_friendid FOREIGN KEY (friendid) REFERENCES userbase(userid)
);

INSERT INTO friendslist (userid, friendid) VALUES (101, 102);
INSERT INTO friendslist (userid, friendid) VALUES (101, 103);
INSERT INTO friendslist (userid, friendid) VALUES (101, 104);
INSERT INTO friendslist (userid, friendid) VALUES (101, 105);
INSERT INTO friendslist (userid, friendid) VALUES (101, 106);
INSERT INTO friendslist (userid, friendid) VALUES (101, 107);
INSERT INTO friendslist (userid, friendid) VALUES (102, 103);
INSERT INTO friendslist (userid, friendid) VALUES (102, 104);
INSERT INTO friendslist (userid, friendid) VALUES (102, 105);
INSERT INTO friendslist (userid, friendid) VALUES (103, 104);
INSERT INTO friendslist (userid, friendid) VALUES (103, 105);
INSERT INTO friendslist (userid, friendid) VALUES (103, 106);
INSERT INTO friendslist (userid, friendid) VALUES (103, 108);

--QUESTION 4
--Create a WISHLIST table with this design:
--Include a column named USERID with the data type NUMBER(3)
--Include a column named PRODUCTCODE with the data type VARCHAR2(5)
--Include a column named POSITION with the data type NUMBER(3)
--Include a Primary Key constraint on the USERID and PRODUCTCODE columns
--Include a Foreign Key constraint on USERID that references the USERID column in the USERBASE table
--Include a Foreign Key constraint on PRODUCTCODE that references the PRODUCTCODE column in the PRODUCTLIST table
--Insert 10 - 15 rows of sample data into the WISHLIST table.

CREATE TABLE wishlist(
        userid          NUMBER(3),
        productcode     VARCHAR2(5),
        position        NUMBER(3),
    CONSTRAINT pk_wishlist PRIMARY KEY (userid, productcode),
    CONSTRAINT fk_wishlist_userid FOREIGN KEY (userid) REFERENCES userbase (userid),
    CONSTRAINT fk_wishlist_productcode FOREIGN KEY (productcode) REFERENCES productlist (productcode)
);

Insert INTO wishlist (userid, productcode, position) VALUES (101, 'GAME1', 1);
Insert INTO wishlist (userid, productcode, position) VALUES (102, 'GAME2', 2);
Insert INTO wishlist (userid, productcode, position) VALUES (103, 'GAME3', 3);
Insert INTO wishlist (userid, productcode, position) VALUES (104, 'GAME4', 4);
Insert INTO wishlist (userid, productcode, position) VALUES (105, 'GAME5', 3);
Insert INTO wishlist (userid, productcode, position) VALUES (106, 'GAME6', 1);
Insert INTO wishlist (userid, productcode, position) VALUES (107, 'GAME7', 5);
Insert INTO wishlist (userid, productcode, position) VALUES (108, 'GAME8', 2);
Insert INTO wishlist (userid, productcode, position) VALUES (109, 'GAME9', 4);
Insert INTO wishlist (userid, productcode, position) VALUES (110, 'RPG10', 1);

--QUESION 5
--Create a USERPROFILE table with this design:
--Include a column named USERID with the data type NUMBER(3)
--Include a column named IMAGEFILE with the data type VARCHAR2(250)
--Include a column named DESCRIPTION with the data type VARCHAR2(250)
--Include a Primary Key constraint on the USERID column
--Include a Foreign Key constraint on USERID that references the USERID column in the USERBASE table
--Insert 10 - 15 rows of sample data into the USERPROFILE table.

CREATE TABLE userprofile(
        userid          NUMBER(3),
        imagefile       VARCHAR2(250),
        description     VARCHAR2(250),
    CONSTRAINT pk_userprofile PRIMARY KEY (userid),
    CONSTRAINT fk_userprofile_userid FOREIGN KEY (userid) REFERENCES userbase (userid)
);

INSERT INTO userprofile ( userid, imagefile, description) VALUES (101, 'images/profile101.jpg', 'John');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (102, 'images/profile102.jpg', 'Jacob');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (103, 'images/profile103.jpg', 'Catherine');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (104, 'images/profile104.png', 'Bobby');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (105, 'images/profile105.jpg', 'Jebediah');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (106, 'images/profile106.jpg', 'Scott');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (107, 'images/profile107.png', 'Susan');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (108, 'images/profile108.jpg', 'Jeffery');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (109, 'images/profile109.jpg', 'Collin');
INSERT INTO userprofile ( userid, imagefile, description) VALUES (110, 'images/profile110.png', 'Heather');

--QUESTION 6
--Create a SECURITYQUESTION table with this design:
--Include a column named QUESTIONID with the data type NUMBER
--Include a column named USERID with the data type NUMBER(3)
--Include a column named QUESTION with the data type VARCHAR2(250)
--Include a column named ANSWER with the data type VARCHAR2(250)
--Include a Primary Key constraint on the QUESTIONID column
--Include a Foreign Key constraint on USERID that references the USERID column in the USERBASE table
--Insert 10 - 15 rows of sample data into the SECURITYQUESTION table.

CREATE TABLE securityquestion(
        questionid      NUMBER,
        userid          NUMBER (3),
        question        VARCHAR2(250),
        answer          VARCHAR2(250),
    CONSTRAINT pk_securityquestion PRIMARY KEY (questionid),
    CONSTRAINT fk_securityquestion_userid FOREIGN KEY (userid) REFERENCES userbase (userid)
);

INSERT INTO SECURITYQUESTION VALUES (1, 101, 'What was the name of your first pet?', 'Buddy');
INSERT INTO SECURITYQUESTION VALUES (2, 102, 'What city were you born in?', 'Denver');
INSERT INTO SECURITYQUESTION VALUES (3, 103, 'What is your favorite video game?', 'Skyrim');
INSERT INTO SECURITYQUESTION VALUES (4, 104, 'What is your mother’s maiden name?', 'Lopez');
INSERT INTO SECURITYQUESTION VALUES (5, 105, 'What was the make of your first car?', 'Toyota');
INSERT INTO SECURITYQUESTION VALUES (6, 106, 'What is your favorite movie?', 'Inception');
INSERT INTO SECURITYQUESTION VALUES (7, 107, 'What was the name of your elementary school?', 'Lincoln');
INSERT INTO SECURITYQUESTION VALUES (8, 108, 'What is your favorite food?', 'Pizza');
INSERT INTO SECURITYQUESTION VALUES (9, 109, 'What is the name of your favorite teacher?', 'Mr. Adams');
INSERT INTO SECURITYQUESTION VALUES (10, 110, 'What city did you meet your best friend?', 'Seattle');

--Question 7
--Create a COMMUNITYRULES table with this design:
--Include a column named RULENUM with the data type NUMBER(3)
--Include a column named TITLE with the data type VARCHAR2(250)
--Include a column named DESCRIPTION with the data type VARCHAR2(250)
--Include a column named SEVERITYPOINT with the data type NUMBER(4)
--Include a Primary Key constraint on the RULENUM column
--Insert 10 - 15 rows of sample data into the COMMUNITYRULES table.

CREATE TABLE communityrules(
        rulenum         NUMBER(3),
        title           VARCHAR2(250),
        description     VARCHAR2(250),
        severitypoint   NUMBER(4),
    CONSTRAINT pk_communityrules PRIMARY KEY (rulenum)
);

INSERT INTO communityrules VALUES (1, 'Respect Others', 'Treat all community members with respect.', 50);
INSERT INTO communityrules VALUES (2, 'No Harassment', 'Harassment or bullying of any kind is prohibited.', 75);
INSERT INTO communityrules VALUES (3, 'No Hate Speech', 'Hate speech or discriminatory language is not allowed.', 100);
INSERT INTO communityrules VALUES (4, 'No Cheating', 'Using cheats or exploits in games is forbidden.', 60);
INSERT INTO communityrules VALUES (5, 'Appropriate Language', 'Avoid excessive profanity or offensive language.', 75);
INSERT INTO communityrules VALUES (6, 'No Spamming', 'Do not spam messages, links, or advertisements.', 50);
INSERT INTO communityrules VALUES (7, 'Follow Moderator Instructions', 'Users must comply with moderator directions.', 100);
INSERT INTO communityrules VALUES (8, 'No Impersonation', 'Do not impersonate other users or staff.', 60);
INSERT INTO communityrules VALUES (9, 'No NSFW Content', 'Posting NSFW or explicit content is prohibited.', 40);
INSERT INTO communityrules VALUES (10, 'Protect Privacy', 'Do not share personal information of yourself or others.', 45);

--QUESTION 8
--Create an INFRACTIONS table with this design:
--Include a column named INFRACTIONID with the data type NUMBER
--Include a column named USERID with the data type NUMBER(3)
--Include a column named RULENUM with the data type NUMBER(3)
--Include a column named DATEASSIGNED with the data type DATE
--Include a column named PENALTY with the data type VARCHAR2(250)
--Include a Primary Key constraint on the INFRACTIONID column
--Include a Foreign Key constraint on USERID that references the USERID column in the USERBASE table
--Include a Foreign Key constraint on RULENUM that references the RULENUM column in the COMMUNITYRULES table
--Insert 10 - 15 rows of sample data into the INFRACTIONS table

CREATE TABLE infractions(
        infractionid    NUMBER,
        userid          NUMBER(3),
        rulenum         NUMBER(3),
        dateassigned    DATE,
        penalty         VARCHAR2(250),
    CONSTRAINT pk_infractions PRIMARY KEY (infractionid),
    CONSTRAINT fk_infractions_userid FOREIGN KEY (userid) REFERENCES userbase (userid),
    CONSTRAINT fk_infractions_rulenum FOREIGN KEY (rulenum) REFERENCES communityrules (rulenum)
);

INSERT INTO infractions VALUES (1, 101, 1, DATE '2024-01-10', 'Warning issued for disrespectful language.');
INSERT INTO infractions VALUES (2, 101, 6, DATE '2024-01-15', 'Muted for 24 hours due to spamming.');
INSERT INTO infractions VALUES (3, 101, 4, DATE '2024-02-01', 'Temporary game ban for cheating.');
INSERT INTO infractions VALUES (4, 102, 5, DATE '2024-02-05', 'Warning issued for inappropriate language.');
INSERT INTO infractions VALUES (5, 103, 3, DATE '2024-02-20', 'Account suspended for hate speech.');
INSERT INTO infractions VALUES (6, 103, 8, DATE '2024-03-01', 'Warning issued for impersonation.');
INSERT INTO infractions VALUES (7, 104, 9, DATE '2024-03-10', 'Content removed and warning issued.');
INSERT INTO infractions VALUES (8, 104, 10, DATE '2024-03-15', 'Account warning for sharing personal information.');
INSERT INTO infractions VALUES (9, 105, 2, DATE '2024-03-25', 'Muted for harassment.');
INSERT INTO infractions VALUES (10, 105, 7, DATE '2024-04-01', 'Warning for ignoring moderator instructions.');

--QUESTION 9
--Create a USERSUPPORT table with this design:
--Include a column named TICKETID with the data type NUMBER
--Include a column named EMAIL with the data type VARCHAR2(250)
--Include a column named ISSUE with the data type VARCHAR2(250)
--Include a column named DATESUBMITTED with the data type DATE
--Include a column named DATEUPDATED with the data type DATE
--Include a column named STATUS with the data type VARCHAR2(250)
--Include a Primary Key constraint on the TICKETID column
--Insert 10 - 15 rows of sample data into the USERSUPPORT table.

CREATE TABLE usersupport(
        ticketid        NUMBER,
        email           VARCHAR2(250),
        issue           VARCHAR2(250),
        datesubmitted   DATE,
        dateupdated     DATE,
        status          VARCHAR2(250),
    CONSTRAINT pk_usersupport PRIMARY KEY (ticketid)
);

INSERT INTO USERSUPPORT VALUES (1, 'user101@email.com', 'Unable to reset password', DATE '2024-01-05', DATE '2024-01-06', 'Resolved');
INSERT INTO USERSUPPORT VALUES (2, 'user102@email.com', 'Game crashes on startup', DATE '2024-01-08', DATE '2024-01-10', 'Resolved');
INSERT INTO USERSUPPORT VALUES (3, 'user103@email.com', 'Profile picture not uploading', DATE '2024-01-12', DATE '2024-01-14', 'In Progress');
INSERT INTO USERSUPPORT VALUES (4, 'user104@email.com', 'Unable to join multiplayer lobby', DATE '2024-01-15', DATE '2024-01-18', 'Resolved');
INSERT INTO USERSUPPORT VALUES (5, 'user105@email.com', 'Billing issue with subscription', DATE '2024-01-20', DATE '2024-01-22', 'Resolved');
INSERT INTO USERSUPPORT VALUES (6, 'user106@email.com', 'Chat messages not sending', DATE '2024-01-25', DATE '2024-01-27', 'In Progress');
INSERT INTO USERSUPPORT VALUES (7, 'user107@email.com', 'Account locked after failed logins', DATE '2024-02-01', DATE '2024-02-02', 'Resolved');
INSERT INTO USERSUPPORT VALUES (8, 'user108@email.com', 'Missing in-game items', DATE '2024-02-05', DATE '2024-02-07', 'In Progress');
INSERT INTO USERSUPPORT VALUES (9, 'user109@email.com', 'Unable to change email address', DATE '2024-02-10', DATE '2024-02-11', 'Resolved');
INSERT INTO USERSUPPORT VALUES (10, 'user110@email.com', 'Friend list not updating', DATE '2024-02-15', DATE '2024-02-18', 'Resolved');

--QUESTION 10
--Create a view that displays every unique QUESTION from the SECURITYQUESTION table.

CREATE VIEW unique_securityquestion_view AS
SELECT DISTINCT question
FROM securityquestion;

--Create a view that diplays the TICKETID, EMAIL, ISSUE, DATEUPDATED only for ticket with a STATUS of NEW or IN PROGRESS
--sorted by the earliest dateupdated.
CREATE VIEW active_tickets_view AS
SELECT ticketid, email, issue, dateupdated
FROM usersupport
WHERE
    status IN ('New', 'In Progess')
ORDER BY 
    dateupdated;

