use mydb;
-- 1. create search fans procudure
delimiter //
create procedure sp_searchFans(
In userid int
)
begin
select U_NickName,U_Gender,U_Email, U_Webside, concat(u_firstname, ' ', u_lastname) as U_FullName from user
where u_id in (select U_Fans_ID from user_fans where u_id = userid);
end//
delimiter ;
 
call sp_searchFans(1);

-- 2. create search following procedufe
delimiter //
create procedure sp_searchfollowing(
In userid int
)
begin
select U_NickName,U_Gender,U_Email, U_Webside, concat(u_firstname, ' ', u_lastname) as U_FullName from user
where u_id in (select U_Follow_ID from user_follow where u_id = userid);
end//
delimiter ;

call sp_searchfollowing(1);

-- 3. Create procedure which user can use to search all of the messages he or she have posed
delimiter //
create procedure sp_searchOwnMessage(
In userid int
)
begin
select Mg_ID,Mg_Content,Mg_DateTime, Mg_Video, Mg_Image,Mg_commentNum from message
where u_id = userid;
end//
delimiter ;

call sp_searchOwnMessage(1);


-- 4. User can search all of the comments of his a certain message 
delimiter //
create procedure sp_searchComments(
In userid int,
In MessageId int
)
begin 
select a.Mg_ID, Mg_Content,Comment_ID, Comment_Content, Comment_DateTime
from Message as a Left join Comment as b on a.Mg_ID = b.Mg_ID
where a.Mg_id = MessageId;
end//
delimiter ;

call sp_searchComments(1, 9000109);

-- 5. Find all of the comments a user has made
delimiter //
create procedure sp_usercomments(
In Userid int
)
begin
select b.u_id, c.U_NickName, a.Mg_Content, b.Comment_Content 
from message as a left join v_commentsofuser as b 
on a.Mg_ID = b.Mg_ID
left join User as c 
on a.u_ID = c.U_ID
where b.U_ID = Userid
order by c.U_NickName;
end//
delimiter ;

call sp_usercomments(1);

-- 6. Order search
delimiter //     
CREATE procedure sp_UserOrder
   (in UserID int)
begin  
select User.U_ID, User.U_NickName,  Orders.OrderType_ID, Orders.Order_Date 
from User inner join Orders
on User.U_ID = Orders.U_ID 
where User.U_ID= UserID;
end // 
delimiter ;

call sp_userorder(3);


