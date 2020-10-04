-- Create Member relation

CREATE TABLE Member ( 
	username VARCHAR(20) NOT NULL,
	date_joined DATE NOT NULL,
	last_visited DATE NOT NULL,
	password VARCHAR(20) NOT NULL,
	gender VARCHAR(12) DEFAULT 'Not Telling', 
	member_rank ENUM('Newbie', 'Senior Member', 'Moderator') DEFAULT 'Newbie', 
	active BIT DEFAULT B'0',
	about_me text,
	PRIMARY KEY (username)
); 

-- insert records into Member relation

INSERT INTO Member VALUES
        ('bazinga', '2017-01-01', '2019-03-15', 'bazingarules', 'male', 'Moderator', b'1', null),
         ('premed_67', '2017-01-31', '2019-03-10', 'hello123', 'female', 'Senior Member', b'0', null),
        ('doctorwho', '2018-04-04', '2019-03-16', 'froyo', 'male', 'Newbie', b'0', 'first year premed student'),
         ('future_doc', '2019-01-01', '2019-03-17', 'ilovemedicine', null, 'Newbie', b'1', 'aspiring doctor'),
          ('bambi', '2015-02-06', '2019-03-15', 'bambi123', 'male', 'Moderator', b'0', null),
        ('Robert', '2016-02-01', '2019-03-01', 'k91ka', null, 'Senior Member',default,'Premed student at McGill Univserity'),
        ('PlsAcceptMe', '2019-03-17', '2019-03-20', 'plsplspls', 'female', 'Newbie', b'0', null),
        ('patj82','2018-12-04','2019-03-16','8j6753GHD',default,default,default,NULL),
        ('Kex','2017-06-07','2019-03-17','jBB89kiokL','Female','Senior Member',default,NULL),			('lopo3','2012-11-03','2019-03-15','0987AbCd',default,'Moderator',default,'Our knowledge has made us cynical.
Our cleverness, hard and unkind.
We think too much and feel too little.
More than machinery we need humanity.
More than cleverness we need kindness and gentleness.
Without these qualities, life will be violent and all will be lost.'), 
		('jay8502','2017-02-02','2019-02-28','bnJD82Kj','Male','Senior Member',default,NULL),				('TopChef','2016-04-05','2019-03-17','bubuLULU99','Male','Senior Member',default,NULL),
        ('Alex grey','2017-09-14','2019-03-11','phD66552ok','Female',default,default,NULL),						('zizoupandacad','2012-12-30','2019-03-16','panda6754Hy',default,'Newbie',default,NULL),					('montreal25','2015-10-21','2019-03-14','vbghJ9988',default,default,default,NULL),
        ('eg0g','2017-10-03','2019-03-15','67ghjPlPbn','Male','Moderator',default,NULL),
        ('Arztin90','2013-08-12','2019-01-07','JJJKKK9j9k','Female','Moderator',default,'test');
        
        
-- Create Forum relation 

CREATE TABLE Forum (
	forum_id SMALLINT AUTO_INCREMENT,
	forum_title VARCHAR(100) NOT NULL,
	PRIMARY KEY (forum_id) 
); 

-- insert records into Forum relation

INSERT INTO Forum (forum_title) VALUES 
	('GENERAL PREMED AND MED SCHOOL TOPICS'), 
    ('HEALTHCARE PROFESSIONS'), 
    ('ONTARIO MEDICAL SCHOOLS'), 
    ('QUEBEC MEDICAL SCHOOLS'), 
    ('ATLANTIC MEDICAL SCHOOLS'), 
    ('INFORMATION EXCHANGE'); 


-- Create Topic relation 

CREATE TABLE Topic (
	topic_id SMALLINT AUTO_INCREMENT,
	topic_title VARCHAR(100) NOT NULL,
	description text,
	forum_id SMALLINT NOT NULL,
	creator_username VARCHAR(20),
	PRIMARY KEY (topic_id),
	FOREIGN KEY (forum_id) REFERENCES Forum(forum_id),
	FOREIGN KEY (creator_username) REFERENCES Member(username)
);

-- insert records into Topic relation

INSERT INTO Topic (topic_title, description, forum_id, creator_username) VALUES
	('General Premed Discussions', 'Premed topics on Canadian med school admissions. Specific med school topics go below in their respective medical school forums.', 1, 'Robert'), 
	('Medical Student General Discussions', 'An area for Canadian medical students to interact and share information.', 1, 'Robert'),
	('Research Dicussions', 'Discuss research topics and opportunities here, including NSERC.', 1, 'bambi'), 
	('Dental Student General Dicussions', 'An area for Canadian dental students to interact and share information.', 2, 'bambi'),
	('Optometry Discussions', 'An area for Canadian optometry students and applicants to interact and share information.', 2, 'premed_67'), 
	('Veterinary Medicine Dicussions', 'An area for Canadian veterinary students and applicants to interact and share information.', 2, 'premed_67'), 
	('General Ontario Discussions (OMSAS)', 'General Ontario med school topics: eg. tuition, seats, cutoffs, OMSAS applications.', 3, 'Robert'),
	('University of Western Ontario Medical School', null, 3, 'bambi'), 
	('University of Toronto Medical School', null, 3, 'bambi'), 
	('General Quebec Discussions', 'General Quebec premed and med school discussions, including CEGEP.', 4, 'premed_67'), 
	('McGill Medical School', null, 4, 'Robert'),
	('University of Sherbrooke Medical School', null, 4, 'premed_67'),
	('Dalhousie University Medical School', null, 5, 'bazinga'),
	('Memorial University Medical School', null, 5, 'bazinga'),
	('Textbook and Equipement Reviews', 'Your Consumer Reports for medical textbooks and equipment.', 6, 'bazinga'), 
	('Fore Sale/Trade Classifieds', 'Your place to sell old premed and medical items (eg. MCAT/DAT supplies, textbooks, etc). No dealers please.', 6, 'Robert'); 
     
     
-- Create Post relation

CREATE TABLE Post ( 
	post_id  SMALLINT NOT NULL AUTO_INCREMENT, 
	post_title VARCHAR(200) NOT NULL,
	content text NOT NULL,
	post_date DATE,
	post_time TIME,
	topic_id SMALLINT NOT NULL,
	written_by_username VARCHAR(20) NOT NULL,
	PRIMARY KEY (post_id),
	FOREIGN KEY (topic_id) REFERENCES Topic(topic_id),
	FOREIGN KEY (written_by_username) REFERENCES Member(username)
); 

-- insert records into Post relation

INSERT INTO 
Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('UBC Invite/Regrets 2019', "Thought I'd start this thread. When do UBC invites come out?", '2019-01-07', '06:43:00', 4, 'Alex grey'); 

INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('Dentist in the canadian forces/army', 'Hi everyone,

 

I am starting my 3rd year of dental school in august and I applied to the canadian forces to become a military dentist. I wrote my aptitude test but they told me there were 7 people on the waiting list before me. I have friends in the army and the army recruiter that came last year told us they were almost "desperate" to recruit dental students so I was a bit surprised and disappointed that I would at least have to wait for another year (maybe two and by then I will have graduated...) to join the canadian forces.

Is anyone in the same situation? Is anyone a dentist in the army at the moment? I would like to get your feedbacks about your experience! 

 

Thank you,

 

Doomz', '2018-07-22', '09:56:00', 4, 'lopo3');

INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('FREE Study guides', 'I have FREE study guides for the MCAT, DAT, OAT, LSAT, PCAT, GRE, and GMAT. PM me if you want one! :)', '2018-11-24', '13:45:00', 16,'lopo3');

INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('DATcrusher subscription available! For February 219 DAT practice','Hi ! 

For anyone planning on writing the February 2019 DAT, my DATcrusher account is available until March 25, 2019. I am selling it for a discounted price since I am no longer using the account. 

I wrote the Novemeber 2018 DAT and I highly recommend DATcrusher for Canadian students writing the DAT or need practice. 

Please message me or reply to this for more details! :)','2018-11-15','12:44:00',16,'premed_67');


INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('Thinking of applying to OMFS Programs in the USA?',"I'd like to be a resource for people. Something that I never had. 

Feel free to ask any questions regarding the application process, CBSE, 4 vs 6, interviews, grades, etc.

I'm a mid-level resident at a 6 year program. 

NB",'2018-11-27','15:35:00',4,'lopo3');

INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('UofT 2019 Application Discussion Thread','This is the place to speculate and ask questions.','2019-02-13','13:05:00',9,'Kex');


INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES ('Writing MCAT in summer after 2nd year',"Hey,

I'm in a bit of a dilemma. I want to write the MCAT this summer, but I'm not sure when I should take it. I wanna self-study it, and apparently 2 months are adequate if you don't have other commitments. However, I've looked at the test dates and almost all of the August ones are booked, so I don't know what to do. Write in July and try to re-write in August if I don't too well? Or do August test dates get rescheduled and will I have a chance to schedule for the date I'm interested in?",'2019-03-16','14:57:00',1,'Alex grey');


INSERT INTO Post(post_title,content,post_date,post_time,topic_id,written_by_username) VALUES 
('Research funding for medical students', "I am a first year medical student that is beginning to extensively involve myself in clinical research - I was wondering if there were any grants, scholarships, or bursaries that I could apply for to aid in this process. I am aware of the ones at my school, thanks!", '2018-03-23','15:05:00', 3, 'bazinga' ), 
('How to research', "I'll be working on a research project this summer. It will be my first time analyzing data and writing a paper. Any tips on how to work on the project efficiently? Any guides on how to approach research?", '2018-01-31', '13:23:01', 3, 'Robert'), 
('DMD mcgill', "as DMD results are approaching, (this upcoming wednesday), I wanted to know if there was a history of mcgill sending out results for DMD earlier than the target date, like monday or tuesday.", '2019-03-20', '06:03:00',11, 'PlsAcceptMe' ),
('Post-interview impressions', "Now that the McGill interviews are all done, I am starting this thread to discuss how we feel about our interview experiences. (Of course, let’s not talk about specific questions or anything confidential).
 
Personally, I feel great about three stations, awful about 2 stations that I’m pretty sure I’ve done poorly at, and ok about the rest.  The McGill MMI style is definitely unique. ", '2017-05-11', '18:30:01', 11, 'bazinga'); 


-- Create Reply relation

CREATE TABLE Reply ( 
	reply_id SMALLINT NOT NULL AUTO_INCREMENT,
	content text NOT NULL, 
	reply_date DATE,
	reply_time TIME,
	post_id SMALLINT NOT NULL, 
 	written_by_username VARCHAR(20) NOT NULL,
	PRIMARY KEY (reply_id),
	FOREIGN KEY (written_by_username) REFERENCES Member (username),
	FOREIGN KEY (post_id) REFERENCES Post (post_id)
); 

-- insert records into Reply relation

INSERT INTO Reply (content, reply_date, reply_time, post_id, written_by_username)
VALUES 
	("Same

I feel that i didn't stand out. I feel that i could done better. :( I really mess up 2-3 station as well.", '2017-05-11', '19:01:00', 8, 'Arztin90');

INSERT INTO Reply (content, reply_date, reply_time, post_id, written_by_username)
VALUES('Clinical research and case reports, thanks!','2018-05-23','11:20:00',6,'premed_67');

INSERT INTO Reply (content, reply_date, reply_time, post_id, written_by_username)
VALUES('what day was your mmi?','2019-02-23','09:45:00',8,'bambi');

INSERT INTO Reply (content, reply_date, reply_time, post_id, written_by_username)
VALUES('For MDCM too ? Or only DMD ?','2019-03-17','15:38:00',7,'bazinga');

INSERT INTO Reply (content, reply_date, reply_time, post_id, written_by_username)
VALUES('Strap yourself in, prepare for endless delays and frustration. Prepare to have your work scrutinized to no end. There is no such thing as efficiency. Its fun though. Enjoy, welcome to research.','2018-05-28','22:20:00',6,'doctorwho');


-- Create Reaction relation

CREATE TABLE Reaction ( 
	reaction_id INTEGER NOT NULL AUTO_INCREMENT,
	type ENUM('like', 'sad', 'confused', 'haha', 'thanks') NOT NULL,
	post_id SMALLINT,
	reply_id SMALLINT,
	from_username VARCHAR(20),
	PRIMARY KEY (reaction_id),
	FOREIGN KEY (post_id) REFERENCES Post(post_id),
	FOREIGN KEY (reply_id) REFERENCES Reply(reply_id),
	FOREIGN KEY (from_username) REFERENCES Member(username)
); 

INSERT INTO Reaction(type, post_id, reply_id, from_username) VALUES 
	('like',8,null,'jay8502'), 
    ('like',6,null,'patj82'),
    ('sad',8,null,'Kex'),
    ('confused',6,null,'doctorwho'),
    ('haha',7,null,'bazinga'),
    ('like',8, null, 'bambi'),
    ('haha',8, null, 'premed_67'),
    ('haha',8, null, 'Robert'),
    ('like',8, null, 'doctorwho'),
    ('haha',8, null, 'patj82'),
    ('like',8, null, 'TopChef'),
    ('thanks',8, null, 'zizoupandacad'),
    ('sad', null, 4, 'doctorwho'),
    ('sad', null, 4, 'premed_67'),
    ('like', 5, null, 'Alex grey'); 
   

-- Create Trophy relation

CREATE TABLE Trophy ( 
	place SMALLINT NOT NULL,
	username VARCHAR(20) NOT NULL,
	date_won DATE NOT NULL,
	PRIMARY KEY (place, date_won),
	FOREIGN KEY (username) REFERENCES Member(username)
); 

-- insert records into Trophy table

INSERT INTO Trophy VALUES (1,'Robert','2018-09-21'),(2,'jay8502','2019-01-02'),(3,'Kex','2019-03-01'),(1,'Robert','2019-01-13'),(2,'Arztin90','2019-01-03');


-- Create Following relation

CREATE TABLE Following(
	username_following VARCHAR(20) NOT NULL,
	username_being_followed VARCHAR(20) NOT NULL,
	PRIMARY KEY (username_following, username_being_followed),
	FOREIGN KEY (username_being_followed) REFERENCES Member(username),
	FOREIGN KEY (username_following) REFERENCES Member(username)
); 

-- insert records into Following relation

INSERT INTO Following VALUES 
	('Alex grey','Arztin90'),
    ('future_doc','Arztin90'),
    ('TopChef','bambi'),
    ('Robert','bazinga'),
    ('doctorwho','Robert'), 
    ('bambi', 'TopChef'),
    ('future_doc', 'bambi'); 

-- Create Member_Follows_Topic relation

CREATE TABLE Member_Follows_Topic ( 
	topic_id SMALLINT NOT NULL,
	username VARCHAR(20) NOT NULL,
	PRIMARY KEY (topic_id, username),
	FOREIGN KEY (username) REFERENCES Member(username),
	FOREIGN KEY (topic_id) REFERENCES Topic(topic_id)
); 

-- insert records into Member_Follows_Topic relation 

INSERT INTO Member_Follows_Topic VALUES 
	(11,'Robert'),
    (1,'Robert'),
    (1,'Arztin90'),
    (4,'patj82'),
    (3,'bazinga'), 
    (11, 'bambi'),
    (11, 'future_doc'),
    (11, 'premed_67'),
    (11, 'bazinga');

-- Create Member_Manages_Forum relation

CREATE TABLE Member_Manages_Forum (
	forum_id SMALLINT NOT NULL,
	username VARCHAR(20) NOT NULL,
	PRIMARY KEY (forum_id, username), 
	FOREIGN KEY (forum_id) REFERENCES Forum(forum_id),
	FOREIGN KEY (username) REFERENCES Member(username)
);	

-- insert records into Member_Manages_Forum relation 

INSERT INTO Member_Manages_Forum VALUES 
	(4,'Robert'),
    (1,'bazinga'),
    (2,'bambi'),
    (1,'Arztin90'),
    (3,'eg0g');
                 
