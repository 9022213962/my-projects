-- social media analysis

-- Designed and implemented a MySQL-based social media analysis project, 
-- leveraging relational database capabilities to efficiently 
-- store, retrieve, and analyze extensive social media data. 
-- Developed features including user profiles, post storage, s
-- entiment analysis, and trend tracking to provide 
-- aluable insights into user behavior and trending topics. 
-- Demonstrated proficiency in database management for 
-- effective data organization and retrieval, showcasing 
-- a keen understanding of scalable and well-structured MySQL systems


-- task-1 data collection
use social_media;
show tables;


-- total 13 table present in database
-- bookmarks
-- comment_likes
-- comments
-- follows
-- hashtag_follow
-- hashtags
-- login
-- photos
-- post
-- post_likes
-- post_tags
-- users
-- videos

-- reletionship(data modelling)

-- task-2 check and explore er digram
-- Explore relationship
-- relationship(data modling)

-- task -3 data cleaning
-- no data cleaning is required
 
 -- task-4 total users
 select count(*) from users;
 
 -- total 50 user data available
 
 -- task-5 total post
 
 select count(*) from post;
 -- total 100 post done by user in our database
 
 -- task-5 user location
 select location from post;
 -- location is not mentioned in a proper way
  --
  
  -- task 7 ave post per user
  select distinct(user_id) from post;
   select count(post_id)/(select count(distinct user_id) from post) avg_post from post;
   
   -- task-8 find users whos have not posted yet
   -- subquary
   select * from users
   where user_id not in (select distinct user_id from post);
  
  -- join
  select * from
  users u1
  left join post p1
  on u1.user_id=p1.user_id
  where p1.post_id is null;
  
  -- five user out of 50 have not postet anything
  
  -- task - 9) display user who have postet 5 or more than 5 post
  
  select u1.username,u1.user_id,count(p1.post_id) total from
  users u1
  inner join post p1
  on u1.user_id=p1.user_id
  group by u1.username
  having total>=5;
  -- 4 user have postet 5 or more than 5 post
  
  -- task-10 display user with 0 comment
     -- subquary
     select * from users
   where user_id not in (select distinct user_id from comments);
   
   -- join
     select * from
  users u1
  left join comments c1
  on u1.user_id=c1.user_id
  where c1.comment_id is null;
  
  
  -- task 11 people who have been using the
  # platform for the longest time,limit 5
  select * from users 
  order by created_at asc 
  limit 5;
  
  -- task-12 longest caption in a post
  select post_id,user_id,caption, length(caption) total from post order by total desc;
  
  -- task-13 find post which has beauty or beauitifull
  select post_id,caption from post where  caption like 'beauty%' or caption like 'beautiful%';
  
  -- task- 14 # display the comment le>=12 char
  select * from comments where length(comment_text)>=12;
  
  -- task- 15 find user whos has follower>=40
  select followee_id,cont(follower_id) total from follows
  group by followee_id 
  having total>=40;
  
  # 14 user have follower>=40
  
  -- task-16 display most liked post
  select * from post_likes;
  
  SELECT post_id,count(*) total FROM 
post_likes
GROUP BY post_id
ORDER BY total DESC;

SELECT p1.post_id,p1.caption,count(*) total 
FROM post p1
INNER JOIN post_likes p2
ON p1.post_id=p2.post_id
GROUP BY p1.post_id
ORDER BY total DESC;
-- post id 42 is most like post

SELECT 
    p1.post_id,
    p2.caption,
    p3.username,
    COUNT(*) AS total
FROM 
    post_likes p1
INNER JOIN 
    post p2 ON p1.post_id = p2.post_id
INNER JOIN
    users p3 ON p2.user_id = p3.user_id
GROUP BY 
    p1.post_id, p2.caption, p3.username
ORDER BY total DESC;


-- task 17 find most commonly used hashtags

select * from hashtags;

select * from post_tags;
select (hashtag_name) from hashtags
group  by hashtag_name ;
--- or
SELECT * FROM hashtags;
SELECT * FROM post_tags;

SELECT h1.hashtag_name,count(*) total FROM 
hashtags h1
INNER JOIN post_tags p1
ON h1.hashtag_id=p1.hashtag_id
GROUP BY h1.hashtag_name
ORDER BY total DESC;



-- beautifull is most commonly use 

-- task 18 find most followed hashtag
SELECT h1.hashtag_name,count(*) total 
FROM hashtags h1
INNER JOIN hashtag_follow hf1
ON h1.hashtag_id=hf1.hashtag_id
GROUP BY h1.hashtag_name
ORDER BY total desc
LIMIT 5;

-- festivel is most tresnding

 # task-19 display users who dont follow anybody
 # task-20   most inactive user ..(post concept) 
 # task-21 most inactive user (post likes)
 # task-22 CHECK FOR BOT,
-- user who commented on every post
# task-23  CHECK FOR BOT,
# users who like every post

-- 19) display users who dont follow anybody
select* from users where
user_id not in( select follower_id from follows);


# task-20   most inactive user ..(post concept) 
 select * from users
   where user_id not in (select distinct user_id from post);
   
    # task-21 most inactive user (post likes)
  select user_id,username from users
   where user_id not in (select distinct user_id from post_likes);
   
  -- 22) user who commented on every post
  select user_id,username from users
   where user_id not in (select distinct user_id from comments);
   
   # raj gupta s inactive user
   
   -- task 23 user who commented on every post
   
SELECT u1.username,count(c1.comment_id) total
FROM 
users u1 INNER JOIN comments c1 
ON u1.user_id=c1.user_id
GROUP BY u1.username
HAVING total=(SELECT count(*) FROM post)
ORDER BY total DESC;

   # task-24  CHECK FOR BOT,
   
   -- user define fuction
   -- stored procedure
   -- trigger
   -- cursor
   -- zomato data analysisq
    





















  
  
  
   
 
  