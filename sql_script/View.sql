-- 1.messagemanager 
CREATE view v_UserDelMessage  
AS 
SELECT DelMessage.DelMessage_ID, Message.Mg_Content, User.U_ID, User.U_NickName
from 
(User inner join Message 
on User.U_ID= Message.U_ID)
inner join DelMessage 
on Message.Mg_ID= DelMessage.Mg_ID;

SELECT * FROM v_userdelmessage;

-- 2. HottopicManager
CREATE view v_HottopComment  
AS 
SELECT Hottopic.HotTopic_Title, Hottopic.HotTopic_Info, Message.Mg_Content, comment.Comment_Content
from 
(HotTopic inner join Message 
on HotTopic.HotTopic_ID= Message.HotTopic_ID)
inner join comment 
on Message.Mg_ID= comment.Mg_ID;

select * from v_HottopComment;

-- 3.
CREATE view v_PhotoMessage  
AS 
SELECT Message.Mg_Content, Photos.Photos_Description
from 
Message inner join Photos
on Message.Mg_ID= Photos.Mg_ID;

select * from v_photoMessage;


-- 4.
CREATE view v_VideoMessage  
AS 
SELECT Message.Mg_Content, Videos.Videos_Description
from 
Message inner join Videos
on Message.Mg_ID= Videos.Mg_ID;

select * from v_videoMessage;




-- 5.
CREATE view v_AuthenUser -- applicationmanager
AS 
SELECT  User.U_NickName, Authenticated_Type.AuthType_Name, Application.Application_Date
from 
(User inner join Application
on User.U_ID= Application.U_ID )
inner join Authenticated_Type
on Application.AuthType_ID= Authenticated_Type.AuthType_ID;

select * from v_authenuser;


-- 6. create view which shows all the comments of each user
create view v_CommentsOfUser 
as
select a.U_ID, b.Mg_ID,b.Comment_Content,b.Comment_DateTime
FROM user as a left join Comment as b 
on a.U_ID = b.U_ID 
order by a.u_id;

select * from v_commentsofuser;