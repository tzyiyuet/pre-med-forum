# 2. Mission Statement and Objectives

## 2.1 Mission Statement 
The purpose of the Premed101 database is to store the required data to display forums, topics, and posts, generate statistics, generate the leaderboard, and generate member account pages. Through creating and designing a database that will enable the execution of the foregoing functionalities, it will succeed in facilitating the knowledge sharing between pre-medical school students, as well as current medical school students.

## 2.2 Mission Objectives
### a. Data Maintenance
* To maintain (enter, update, delete) data on forums.
* To maintain (enter, update, delete) data on topics.
* To maintain (enter, update, delete) data on posts.
* To maintain (enter, update, delete) data pertaining to the relationship between forums, topics, and posts.
* To maintain (enter, update, delete) data on replies; that is, the content of the reply, the date and time it was created, which member authored it, and to which post it is replying.
* To maintain (enter, update, delete) data on reactions; that is, the type of reaction, which member the reaction comes from, and to which post or reply the reaction is intended.
* To maintain (enter, update, delete) data on member.
* To maintain (enter, update, delete) data on trophies.

### b. Data Retrieval
* To display Forums, Topics, and Posts:
  * Query and display all topic titles and their descriptions grouped by the title of the forum to which they belong to.
  * For each topic, query and display the number of posts they currently contain.
  * For each topic, retrieve and display the title of the most recent post, the username of the member who created the post, and the time/date of the post.
  * For each post, we must be able to query and display the date it was created, the username of the member who created it, its title, its textual content, the current number of replies it has received, and the username of member who created the most recent reply.
  * For each post and each reply, display the total number of reactions it has received, grouped by the type of reaction.
* To calculate member statistics:
  * Query and display the total number of members at a given point in time.
  * Generate a list of all members currently online.
  * Query and display the username of the newest member.
* To calculate forum statistics:
  * Query and display the total number of topics at a given point in time.
  * Query and display the total number of posts at a given point in time.
* To calculate popular contributor statistics:
  * Query and display the username of the member who generated the most content for a given week, month, year, and since the inception of the website.
* To generate Leaderboard:
  * Each day, query and display the 3 members who received the most likes on their content, award them a 1st, 2nd, and 3rd place trophy respectively.
  * Generate a list of the top 8 members grouped by most content and greatest reputation.
* To generate Member Account Pages:
  * For each member generate an account pages that display the follows: the member’s username, content count, date joined, date last visited, days won, date of the last day the member won a gold trophy (if applicable), gender, rank, reputation score.
  * Display the count of reactions received and given, grouped by reaction type.
* To generate notifications:
  * Each time a new post is created for a given topic, generate a list of members following the topic to send them a notification informing them of the new post.
 
