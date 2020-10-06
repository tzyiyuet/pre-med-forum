# 4. Data Dictionary
## 4.1 Description of Entities
|**Entity Name**|**Description**|**Aliases**|**Occurrence**|
|---|---|---|---|
|Forum   |Entity grouping all topics under the same subject.   |   |A forum must contain at least one topic and can contain many. A forum must be managed by at least one moderator and can be managed by many.   |
|Topic   |A topic aggregates posts pertaining to a more specific subject matter within a forum. The topic entity holds information of topics within forums.   |   |A topic belongs to exactly one forum and can be created by exactly one member. A topic can contain zero or many posts and can be followed by zero of many members.   |
|Post   |Holds the information of the posts made under different topics.   |   |A post belongs to exactly one topic and is written by exactly one member. A post can also have zero or many replies and zero or many reactions.   |
|Member   |Entity that contains all required information about the member accounts of Premed101.   |Follower   |A member can write many posts and/or replies. They can react to many posts and/or replies. A member can follow and/or be followed by several members. Several topics can be created and/or followed by a given member.   |
|Reply   |Entity that represents all replies made to posts.   |   |A reply belongs to exactly one post and can be written by exactly one member. A reply can receive zero or many reactions.   |
|Trophies   |Each day, a gold, silver, and bronze trophy is awarded to the members who had the most, second most, and third most liked content on the given day, respectively. The Trophies entity type stores all information about trophies awarded.   |   |A trophy is won by exactly one member.   |

## 4.2 Description of Attributes
|**Entity Name**|**Attributes**|**Description**|**Data Type**|**Multi-valued**|**Derived**|**Default**|
|---|---|---|---|---|---|---|
|**Forum**|forum_ID   |Unique ID for each forum   |SMALLINT|No|No|None|
|   |forum_title   |Subject of the forum   |100 variable chars   |No|No|None|
|   |number_topics   |Counts the number of topics associated with the given forum  |SMALLINT|No|No|None|
|**Topic**|topic_ID   |Unique ID for each topic   |SMALLINT|No|No|None|
|   |topic_title   |Title of the topic   |100 variable chars   |No|No|No|None|
|   |description   |Textual description of the topic   |Text   |No   |No   |null   |
|   |number_posts   |Counts the number of posts that the topic contains   |Integer   |No   |Yes   |None   |
|**Post**|post_ID   |Unique ID for each post   |SMALLINT|No|No|None|
|   |post_title   |Title given to the post   |200 variable chars   |No|No|None|
|   |text   |Textual content of the post   |Text    |No|No|None|
|   |number_replies   |Counts the number of replies a post receives.   |SMALLINT|No|Yes|None|
|**Member**   |username   |Unique name for each member account   |20 variable chars   |No|No|None|
|   |date_joined   |Date on which the member created its account   |Date   |No|No|None|
|   |last_visited   |Date on which the member last visited the website   |Date   |No|No|None|
|   |password   |Password of the member’s account   |20 variable chars   |No|No|None|
|   |gender   |Gender of the user   |ENUM('Male', 'Female', 'Other', 'Not Telling')|No   |No   |'Not Telling'|
|   |like_given   |Counts the number of reactions of type ‘like’ the member has given   |SMALLINT|No|Yes|None|
|   |haha_given   |Counts the number of reactions of type ‘haha’ the member has given   |SMALLINT|No|Yes|None|
|   |thanks_given   |Counts the number of reactions of type ‘thanks’ the member has given   |SMALLINT|No|Yes|None|
|   |confused_given   |Counts the number of reactions of type ‘confused’ the member has given   |SMALLINT|No|Yes|None|
|   |sad_given   |Counts the number of reactions of type ‘sad’ the member has given   |SMALLINT|No|Yes|None|
|   |like_received |Counts the number of reactions of type ‘like’ the member has received   |SMALLINT|No|Yes|None|
|   |haha_received |Counts the number of reactions of type ‘haha’ the member has received   |SMALLINT|No|Yes|None|
|   |thanks_received |Counts the number of reactions of type ‘thanks’ the member has received   |SMALLINT|No|Yes|None|
|   |confused_received |Counts the number of reactions of type ‘confused’ the member has received   |SMALLINT|No|Yes|None|
|   |sad_received |Counts the number of reactions of type ‘sad’ the member has received   |SMALLINT|No|Yes|None|
|   |content_count   |Counts the number of posts made by the member   |SMALLINT|No|Yes|None|
|   |rank   |Describe the privileges of the member.   |Enum(‘Newbie, ‘Senior Member’, ‘Moderator’)   |No  |No   |'Newnbie'   |
|   |reputation   |Counts the total number of reactions, of any type, that the member has received   |SMALLINT|No|No|0|
|   |day_won   |Counts the number of first place trophies the member has won  |SMALLINT|No|No|Yes|None|
|   |active   |Has value 1 if member is currently online, 0 otherwise   |Bit   |No   |No   |0   |
|   |about_me   |Textual description about the member   |Text   |No   |No   |null|
|**Reply**|reply_ID   |Unique ID for each reply   |Small int   |No|No|None|
|   |text   |Textual content of the reply   |Text   |No|No|None|
|**Trophies**   |trophy_id   |Unique ID for each trophy   |Integer   |No|No|None|
|   |place   |Describes the placement of the trophy; that is, 1 = first place, 2 = second place, and 3 = third place.   |Small int   |No|No|None|
|**Reaction**|reaction_ID   |Unique ID for each reaction   |Small int   |No|No|None|
|   |type   |Describes the type of reaction. The type can be one of five options; namely, ‘like’, ‘sad’, ‘confused’, ‘haha’, or ‘thanks’.   |ENUM(‘like’, ‘sad’, ‘confused’, ‘haha’, ‘thanks’)   |No|No|None|

