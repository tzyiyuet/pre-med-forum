Forum(forum_ID, forum_title, number_topics)
Primary Key: forum_ID


Topic(topic_ID, topic_title, description, number_posts, creator_username, forum_ID)
Primary Key: topic_ID
Foreign Key: creator_username REFERENCES Member(username)
Foreign Key: forum_ID REFERENCES Forum(forum_ID)


Post(post_ID, post_title, text, number_replies, written_by_username, topic_ID, post_date, post_time)
Primary Key: post_ID
Foreign Key: written_by_username REFERENCES Member(username)
Foreign Key: topic_ID REFERENCES Topic(topic_ID)


Member(username, date_joined, last_visited, password, content_count, gender, rank, reputation, days_won, about_me, active, like_given, haha_given, thanks_give, confused_given, sad_given, like_received, haha_received, thanks_received, confused_received, sad_received)
Primary Key: username


Member_follows_Topic(topic_ID, username)
Primary Key: topic_ID, username
Foreign Key: topic_ID REFERENCES Topic(topic_ID)
Foreign Key: username REFERENCES Member(username)


Member_Manages_Forum(forum_ID, username)
Primary Key: forum_ID, username
Foreign Key: forum_ID REFERENCES Forum(forum_ID)
Foreign Key: username REFERENCES Member(username)


Following(username_following, username_being_followed)
Primary Key: username_following, username_being_followed
Foreign Key: username_following REFERENCES Member(username)
Foreign Key: username_being_followed REFERENCES Member(username)


Reply(reply_ID, text, post_ID, written_by_username, reply_date, reply_time)
Primary Key: reply_ID
Foreign Key: written_by_username REFERENCES Member(username)
Foreign Key: post_ID REFERENCES Post(post_ID)


Reaction(reaction_ID, type, post_ID, reply_ID, from_username)
Primary Key: reaction_ID
Foreign Key: post_ID REFERENCES Post(post_ID)
Foreign Key: reply_ID REFERENCES Reply(reply_ID)
Foreign Key: from_username REFERENCES Member(username)


Trophy(trophy_id, place, date_won, username)
Primary Key: trophy_id
Foreign Key: username REFERENCES Member(username)
