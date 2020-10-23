# 1. Overview
Undergrads striving to become medical students often experience an abundance of questions. [Premed101](http://forums.premed101.com/) is a forum-based online community that facilitates remote communication between premed students, medical students, and even medical professionals, worldwide. Registered members can engage in online discussion, post questions, receive advice, and share experiences for all things premed. Premed101 offers members a diverse range of functionalities, such as blogs, forums, chat boxes, an online store, and support. The following sections highlight the functionalities that are intended to focus on.

## 1.1 Display Forums, Topics, and Posts
The discussion forum of premed101 follows a hierarchical structure. There exists several forums, differentiated by subject matter. A forum may have multiple different topics, each of which may contain a number of posts. For example, in Figure 1 and 2 below, “GENERAL PREMED AND MED SCHOOL TOPICS” and “HEALTHCARE PROFESSIONS” are forums, “General Premed Discussions”, and “Medical Student General Discussions” are topics, and “Phd2Md’s Advice On Interviewing Well” and “FAQ: What are my chances” are posts.

![Figure 1](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure1.jpg)
![Figure 2](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure2.jpg)

The database will be designed to clearly capture the hierarchical relationship between forums, topics, and posts, and thereby facilitates the retrieval of data. The database should allow users to query data and display it as seen in Figures 1 and 2. Moreover, members are allowed to follow topics. Each time a new post is created for a given topic, we must be able to generate a list of members following the topic to send them a notification informing them of the new post.

Members are also able to make reactions to each post and reply. Each reaction can be one of the following five types: (1) like, (2) sad, (3) confused, (4) haha, and (5) thanks. See Figure 3 for a visualization. For each post and reply, total number of reactions it has received will be displayed, and grouped by the type of reaction simultaneously.

![Figure 3](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure3.jpg)

## 1.2 Generate Statistics
Premed101 generates and displays member statistics, forum statistics, the username of popular contributors, and a list of who’s currently online, which are demonstrated by Figure 4.

![Figure 4](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure4.jpg)

The database will allow users to query and display a list of all members currently online (for the scope of our project we ignore guests and anonymous). Users can retrieve and display the following member statistics: (1) the total number of users, and (2) the username and join date of the newest member (for the scope of our project we ignore most online). The forum statistics that users can generate are: (1) total topics, and (2) total posts. Lastly, users are allowed to query and display the username of popular contributors. Namely, the username of the member who created the most content (posts) this week, this month, this year, and all time.

## 1.3 Generate Leaderboard
Each day, Premed101 determines the members who received the most likes on their content. As Figure 5 indicates, the top 3 members are awarded a first, second, and third place trophy respectively.

![Figure 5](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure5.jpg)

For a given day, users are able to query and display the top three members who received the most likes on that day, ordered by likes received.

Furthermore, Premed101 generates a list o the top 8 members in terms of the most content created and the greatest reputation score (Figure 5). The reputation score of a member is equal to the count of the number of reactions received (of any type).

![Figure 6](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure6.jpg)

Users are able to query and display a list of the 8 members who have created the most content and a list of the 8 members who have the greatest reputation.

## 1.4 Generate Member Account Pages
Users must be able to generate member account pages and display them as seen in Figure 7 below.

![Figure 7](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure7.jpg)

That is, users must be able to query and display the username of the member, the content count (number of posts created), the date the member joined (created an account), the date the member last visited the site, the days won (the number of times of member has won a gold trophy), the date of the last day the member won a gold trophy (if applicable), the gender of the member, the rank of the member, and the reputation score of the member. The rank of the member describes his privileges in the forum. 

The description of the Premed101 ranking system is not provided, and thus assumptions of the following ranks are made based on the scope of the project:
* **Newbie**: rank is set to Newbie by default when a member account is created. No additional privileges.
* **Senior Member**: once a member has created more than 500 posts (content count >= 500), a member is promoted to Senior Member rank. No additional privileges.
* **Moderator**: once a member has created more than 1000 posts (content count >=1000) and has a reputation score greater than 100, a member is promoted to Moderator rank. A Moderator is assigned one or more forums which they must supervised. They are responsible for deleting inappropriate posts and can ban or suspend members as well as rename topics.

Lastly, for each member, users must be able to display the count of reactions received and reactions given, grouped by reaction type. See Figure 8 for a visual.

![Figure 8](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure8.jpg)
