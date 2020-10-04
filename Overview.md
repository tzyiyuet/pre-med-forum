# 1. Overview
Undergrads striving to become medical students often experience an abundance of questions. Premed101 is a forum-based online community that facilitates remote communication between premed students, medical students, and even medical professionals, worldwide. Registered members can engage in online discussion, post questions, receive advice, and share experiences for all things premed. Premed101 offers members a diverse range of functionalities, such as blogs, forums, chat boxes, an online store, and support. The following sections highlight the functionalities that are intended to focus on.

## 1.1 Display Forums, Topics, and Posts
The discussion forum of premed101 follows a hierarchical structure. There exists several forums, differentiated by subject matter. A forum may have multiple different topics, each of which may contain a number of posts. For example, in Figure 1 and 2 below, “GENERAL PREMED AND MED SCHOOL TOPICS” and “HEALTHCARE PROFESSIONS” are forums, “General Premed Discussions”, and “Medical Student General Discussions” are topics, and “Phd2Md’s Advice On Interviewing Well” and “FAQ: What are my chances” are posts.

![Figure 1](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure1.jpg)
![Figure 2](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure2.jpg)

The database will be designed to clearly capture the hierarchical relationship between forums, topics, and posts, and thereby facilitates the retrieval of data. The database should allow users to query data and display it as seen in Figures 1 and 2. Moreover, members are allowed to follow topics. Each time a new post is created for a given topic, we must be able to generate a list of members following the topic to send them a notification informing them of the new post.

Members are also able to make reactions to each post and reply. Each reaction can be one of the following five types: (1) like, (2) sad, (3) confused, (4) haha, and (5) thanks. See Figure 3 for a visualization. For each post and reply, total number of reactions it has received will be displayed, and grouped by the type of reaction simultaneously.

![Figure 3](https://github.com/tzyiyuet/pre-med_forum/blob/master/figure3.jpg)

## 1.2 Generate Statistics
Premed101 generates and displays member statistics, forum statistics, the username of popular contributors, and a list of who’s currently online. See Figure 4 for a visualization.

