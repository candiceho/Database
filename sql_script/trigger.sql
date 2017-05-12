use mydb;
SELECT * FROM db_final.article;

delimiter //
create trigger ComIncrease after insert on comment
for each row 
begin 
update Message
set Mg_commentNum = Mg_commentNum + 1
where Mg_ID= new.Mg_ID;
end //
delimiter ;

drop trigger ComIncrease;

insert into Comment (Comment_ID, Comment_Content, Comment_DateTime, Mg_ID, U_ID) 
values (3000600, 'testtrigger', current_date(), '9000000', 1);
------------------------------------------------------------------------------------
select * from delmessage where delmessage_id = 4000100;
select * from message ;

delimiter //
create trigger trigger_DelMessage after delete on message
for each row 
begin
insert into delmessage(DelMessage_ID,  delmessage_datetime, delmessage_reason, manager_id, mg_id)
values(4000100,current_date(), 'too bad', '8010', old.mg_id);
end //
delimiter ;
drop trigger trigger_delmessage;
insert into message values(9001000,'testtrigger', 1,'2015-01-01 11:11:11', 1, null, null, null);
delete from message where mg_id = 9001000;


------------------------------------------------------------------------------------

delimiter //
CREATE TRIGGER message_Photos
after delete ON message
FOR EACH ROW
BEGIN
delete  from  photos
where message.Mg_ID = photos.Mg_ID;
END;
delimiter ;


delimiter //
CREATE TRIGGER message_comments
after delete ON message
FOR EACH ROW
BEGIN
delete from comments
where message.Mg_ID = comments.Mg_ID;
END;
delimiter ;

delimiter //
CREATE TRIGGER message_delmessage
before delete ON message
FOR EACH ROW
BEGIN
insert into delmessage(Mg_ID)
values (message.Mg_ID);
END;
delimiter ;

delimiter //
CREATE TRIGGER videofolder_video
after delete ON videofolder
FOR EACH ROW
BEGIN
delete from videos
where video.VideoFolder_ID = videofolder.VideoFolder_ID;
END;
delimiter ;
------------------------------------------------------------------------------------
-- not work
delimiter //
create trigger trigger_adverManager after update on advertisemanager
for each row 
begin update manager
set manager_id = new.manager_id
where manager_id = old.manager_id;
update advertise
set manger_id = new.manager_id
where manager_id = old.manager_id;
end//
delimiter ;

drop trigger trigger_adverManager;

update advertisemanager
set manager_id = 1234567
where manager_id = 8000;

------------------------------------------------------------------------------------
-- not work
delimiter //
create trigger trigger_managerdirector after update on managerdirector
for each row 
begin 
update manager
set manager_id = new.manager_id
where manager_id = old.manager_id;
end//
delimiter ;

update managerdirector
set manager_id = 1234
where manager_id = 8041;













------------------------------------------------------------------------------------

