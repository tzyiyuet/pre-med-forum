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
|**Entity Name**|**Attributes**|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
