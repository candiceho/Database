use mydb;
CREATE USER 'user123'@'localhost' IDENTIFIED BY 'user123';

grant select on mydb.user_fans to 'user123'@'localhost';
grant select on mydb.user_follow to 'user123'@'localhost';
grant select on mydb.comment to 'user123'@'localhost';
grant select on mydb.hottopic to 'user123'@'localhost';
grant select on mydb.locationhistory to 'user123'@'localhost';
grant select on mydb.friendlylink to 'user123'@'localhost';
grant select on mydb.activity to 'user123'@'localhost';
grant select, update, insert on mydb.videofolder to 'user123'@'localhost';
grant select, update, insert on mydb.videos to 'user123'@'localhost';
grant select, update, insert on mydb.photofolder to 'user123'@'localhost';
grant select, update, insert on mydb.photos to 'user123'@'localhost';
grant select, update, insert on mydb.message to 'user123'@'localhost';
grant select on mydb.vipprivilege to 'user123'@'localhost';


CREATE USER 'vip123'@'localhost' IDENTIFIED BY 'vip123';

grant select on mydb.user_fans to 'vip123'@'localhost';
grant select on mydb.user_follow to 'vip123'@'localhost';
grant select on mydb.comment to 'vip123'@'localhost';
grant select on mydb.hottopic to 'vip123'@'localhost';
grant select on mydb.locationhistory to 'vip123'@'localhost';
grant select on mydb.friendlylink to 'user123'@'localhost';
grant select on mydb.activity to 'user123'@'localhost';
grant select, update, insert on mydb.videofolder to 'vip123'@'localhost';
grant select, update, insert on mydb.videos to 'vip123'@'localhost';
grant select, update, insert on mydb.photofolder to 'vip123'@'localhost';
grant select, update, insert on mydb.photos to 'vip123'@'localhost';
grant select, update, insert on mydb.message to 'vip123'@'localhost';
grant select on mydb.vipprivilege to 'vip123'@'localhost';
grant select on mydb.orders to 'vip123'@'localhost';
grant select on mydb.vip to 'vip123'@'localhost';
grant select on mydb.ordertype to 'vip123'@'localhost';


CREATE USER 'authuser123'@'localhost' IDENTIFIED BY 'authuser123';
grant select on mydb.user_fans to 'authuser123'@'localhost';
grant select on mydb.user_follow to 'authuser123'@'localhost';
grant select on mydb.comment to 'authuser123'@'localhost';
grant select on mydb.hottopic to 'authuser123'@'localhost';
grant select on mydb.locationhistory to 'authuser123'@'localhost';
grant select on mydb.friendlylink to 'user123'@'localhost';
grant select on mydb.activity to 'user123'@'localhost';
grant select, update, insert on mydb.videofolder to 'authuser123'@'localhost';
grant select, update, insert on mydb.videos to 'authuser123'@'localhost';
grant select, update, insert on mydb.photofolder to 'authuser123'@'localhost';
grant select, update, insert on mydb.photos to 'authuser123'@'localhost';
grant select, update, insert on mydb.message to 'authuser123'@'localhost';
grant select on mydb.vipprivilege to 'authuser123'@'localhost';
grant select on mydb.application to 'authuser123'@'localhost';
grant select, update on mydb.authenticateduser to 'authuser123'@'localhost';
grant select on mydb.authenticated_type to 'authuser123'@'localhost';
grant select, insert, update on mydb.authenticateduser_has_flink to 'authuser123'@'localhost';
grant select, insert, update on mydb.authenuser_hold_activity to 'authuser123'@'localhost';
grant select, insert, update on mydb.activity to 'authuser123'@'localhost';
grant select, insert, update on mydb.friendlylink to 'authuser123'@'localhost';



CREATE USER 'appmanager123' @'localhost' IDENTIFIED BY 'appmanager123';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'appmanager123'@'localhost';
grant select on mydb.user_fans to 'appmanager123'@'localhost';
grant select on mydb.user_follow to 'appmanager123'@'localhost';
grant select on mydb.comment to 'appmanager123'@'localhost';
grant select on mydb.hottopic to 'appmanager123'@'localhost';
grant select on mydb.hottopictype to 'appmanager123'@'localhost';
grant select on mydb.locationhistory to 'appmanager123'@'localhost';
grant select on mydb.Activity to 'appmanager123'@'localhost';
grant select on mydb.FriendlyLink to 'appmanager123'@'localhost';
grant select on mydb.vipprivilege to 'appmanager123'@'localhost';
grant select on mydb.videofolder to 'appmanager123'@'localhost';
grant select on mydb.videos to 'appmanager123'@'localhost';
grant select on mydb.photofolder to 'appmanager123'@'localhost';
grant select on mydb.photos to 'appmanager123'@'localhost';
grant select on mydb.message to 'appmanager123'@'localhost';
grant select, insert,delete, update on mydb.Application to 'appmanager123' @'localhost'; 
grant select, insert, delete, update on mydb.AuthenticatedUser to 'appmanager123' @'localhost'; 
grant select, insert, delete, update on mydb.Authenticated_Type to 'appmanager123' @'localhost'; 

CREATE USER 'advermanager123' @'localhost' IDENTIFIED BY 'advermanager123';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'advermanager123'@'localhost';
grant select on mydb.user_fans to 'advermanager123' @'localhost';
grant select on mydb.user_follow to 'advermanager123' @'localhost';
grant select on mydb.comment to 'advermanager123' @'localhost';
grant select on mydb.hottopic to 'advermanager123' @'localhost';
grant select on mydb.hottopictype to 'advermanager123' @'localhost';
grant select on mydb.locationhistory to 'advermanager123' @'localhost';
grant select on mydb.Activity to 'advermanager123' @'localhost';
grant select on mydb.FriendlyLink to 'advermanager123' @'localhost';
grant select on mydb.videofolder to 'advermanager123' @'localhost';
grant select on mydb.videos to 'advermanager123' @'localhost';
grant select on mydb.photofolder to 'advermanager123' @'localhost';
grant select on mydb.photos to 'advermanager123' @'localhost';
grant select on mydb.message to 'advermanager123' @'localhost';
grant select on mydb.vipprivilege to 'advermanager123' @'localhost';
grant select on mydb.authenticated_type to 'advermanager123' @'localhost';
grant  select, insert,delete, update on Advertise to 'advermanager123' @'localhost'; 
