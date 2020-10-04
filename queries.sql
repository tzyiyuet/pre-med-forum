/*
Query 1: List all members who are moderators and have used a reaction
*/
SELECT username
FROM Member m
WHERE m.member_rank='Moderator' AND m.username IN(SELECT from_username FROM Reaction)
GROUP BY m.username;

/*
Query 2: List all members who manage a forum and have posted a reply
*/
SELECT username
FROM Member m
WHERE m.username IN(SELECT username FROM Member_Manages_Forum) AND m.username IN(SELECT written_by_username FROM Reply)
GROUP BY username;

/* 
Query 3: A new post was created for the Topic with topic_title = "McGill Medical School". We need to generate a list of all usernames of members following the topic to send them a notification informing them of the new post.
*/ 

SELECT m.username
FROM Topic t, Member_Follows_Topic m
WHERE t.topic_id = m.topic_id AND
	  t.topic_title = 'McGill Medical School'; 
      
      
/* 
Query 4: display the number of reactions, grouped by type of reaction, for the post with post_id = 8. If there are no reactions of a given type, the count should be 0. 
*/ 

SELECT t1.type, COALESCE(t2.num_reactions,0) as num_reactions
FROM
(SELECT DISTINCT type 
FROM Reaction) t1 LEFT JOIN
(SELECT type, COUNT(*) as num_reactions
FROM Reaction
WHERE post_id = 8 
GROUP BY type) t2
ON t1.type = t2.type
;

/* 
Query 5: display the count of reactions, grouped by type of reaction, that member with username 'bazinga' has received on any of his/her post and/or replies. If 'bazinga' has never received a reaction of a certain type on any of his/her posts or replies, the count should be 0. 
*/

SELECT t1.type, COALESCE(t2.num_reactions,0) as num_reactions
FROM
(SELECT DISTINCT type 
FROM Reaction) t1 LEFT JOIN
(SELECT type, COUNT(*) as num_reactions
FROM Reaction r 
WHERE post_id IN (SELECT post_id FROM Post WHERE written_by_username = 'bazinga') OR
	  reply_id IN (SELECT reply_id FROM Reply WHERE written_by_username = 'bazinga')
GROUP BY type) t2
ON t1.type = t2.type; 

/* 
Query 6: generate a list of the usernames of all members currently online 
*/

SELECT username 
FROM Member
WHERE active = 1; 

/* 
Query 7: display the username of the newest member along with the date joined.
*/

SELECT username, date_joined
FROM Member
WHERE date_joined >= ALL (SELECT date_joined FROM Member); 

/* 
Query 8: we want to generate popular contributor statistics! Namely, display the username of the member who generated the most content (the most posts and replies) in the year 2018, along with the content count. 
*/


SELECT p.written_by_username,COALESCE(p.num_posts,0) + COALESCE(r.num_replies,0) as content_count
FROM
(SELECT written_by_username, COUNT(*) AS num_posts
 FROM Post 
 WHERE post_date >= '2018-01-01' AND post_date <= '2018-12-31'
GROUP BY written_by_username) p LEFT JOIN
(SELECT written_by_username, COUNT(*) AS num_replies
 FROM Reply 
 WHERE reply_date >= '2018-01-01' AND reply_date <= '2018-12-31'
GROUP BY written_by_username) r ON  p.written_by_username = r.written_by_username

UNION

SELECT r.written_by_username, COALESCE(p.num_posts,0) + COALESCE(r.num_replies,0) as content_count
FROM
(SELECT written_by_username, COUNT(*) AS num_posts
 FROM Post 
 WHERE post_date >= '2018-01-01' AND post_date <= '2018-12-31'
GROUP BY written_by_username) p RIGHT JOIN
(SELECT written_by_username, COUNT(*) AS num_replies
 FROM Reply 
 WHERE reply_date >= '2018-01-01' AND reply_date <= '2018-12-31'
GROUP BY written_by_username) r ON  p.written_by_username = r.written_by_username
ORDER BY content_count DESC
LIMIT 1
;

/* 
Query 9: Display the title and description of all topics, along with the number of post the topic currently contains. 
If the topic description is null the string 'No description' should appear. 
*/

SELECT topic_title AS Title, COALESCE(description, 'No description') AS Description, COUNT(*) AS 'Number of Posts'
FROM Topic t, Post p
WHERE t.topic_id = p.topic_id
GROUP BY topic_title, description;


/*
Query 10: Display all topics with post related to MCAT
*/
SELECT topic_title 
FROM Topic t, Post p
WHERE t.topic_id = p.topic_id and p.content LIKE "%MCAT%";

/*
Query 11: Display all post titles posted by a Senior Member that has received a trophy
*/

SELECT distinct(post_title) , m.username
FROM Post p, Member m , Trophy t
WHERE m.username = p.written_by_username 
and m.username = t.username 
and member_rank ="Senior Member" ;


/*
Query 12: Display all posts with replies written by newbie 
*/

select post_title, username
from Post p, Reply r, Member m
where p.post_id = r.post_id 
and r.written_by_username = m.username
and m.member_rank = "Newbie";

/*
Query 13: Display the reaction type the most used by members with member_rank = 'Newbie' 
*/

SELECT r.type, count(r.type) as count
FROM Reaction r, Member m
WHERE r.from_username = m.username AND m.member_rank = 'Newbie'
GROUP BY r.type 
HAVING count >= ALL (SELECT count(type) as count FROM Reaction r, Member m WHERE r.from_username = m.username AND member_rank = 'Newbie' GROUP BY type);


/*
Query 14: Display all members and the number of followers each member has 
*/

select username, count(username_following) as followers
from Member m, Following f
where m.username = f.username_being_followed
group by username ;

/*
Query 15: Display the most popular topic (ie. the topic that is followed by most members) 
*/

select topic_title, count(f.topic_id) as followers
from Topic t, Member_Follows_Topic f
where t.topic_id = f.topic_id 
group by topic_title
order by count(f.topic_id) desc
limit 1;

/*
Query 16: List members who are not moderators and have participated in discussions  
*/

select distinct m.username
from Member m, Post p, Reply r
where m.member_rank != 'Moderator' and (m.username=p.written_by_username or m.username=r.written_by_username);

/*
Query 17: List the number of posts that each topic contains 
*/

select t.topic_title, count(p.topic_id) as number_of_posts
from Topic t, Post p
where t.topic_id=p.topic_id
group by t.topic_title;

/*
Query 18: Display the posts that contain at least two replies
*/
select p.post_title
from Post p, Reply r
where p.post_id=r.post_id 
group by p.post_title
having count(r.post_id)>=2;

/*
Query 19: Display the member who has received most trophies and the number of trophies he or she has received 
*/

select m.username, count(t.username)as number_of_trophy
from Member m, Trophy t
where m.username=t.username
group by m.username
order by count(t.username)desc
limit 1;


/*
Query 20: List the username, last visited and rank for all the members that are being followed to by other members 
*/
select distinct f.username_being_followed,m.last_visited,m.member_rank
from Member m, Following f
where m.username=f.username_being_followed;
