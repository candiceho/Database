-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydbtest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydbtest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydbtest` DEFAULT CHARACTER SET utf8 ;
USE `mydbtest` ;

-- -----------------------------------------------------
-- Table `mydbtest`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`User` (
  `U_ID` INT NOT NULL AUTO_INCREMENT,
  `U_NickName` VARCHAR(30) NOT NULL,
  `U_login` VARCHAR(45) NOT NULL,
  `U_Email` VARCHAR(45) NOT NULL,
  `U_Password` VARCHAR(45) NOT NULL,
  `U_FirstName` VARCHAR(45) NOT NULL,
  `U_LastName` VARCHAR(45) NOT NULL,
  `U_Gender` VARCHAR(45) NOT NULL,
  `U_RegisterTime` DATETIME NOT NULL,
  `U_Mg_Count` INT NULL,
  `U_Follow_Count` INT NULL,
  `U_Fans_Count` INT NULL,
  `U_Webside` VARCHAR(45) NULL,
  `U_Phone` VARCHAR(45) NULL,
  `U_Info` VARCHAR(60) NULL,
  PRIMARY KEY (`U_ID`),
  UNIQUE INDEX `U_Email_UNIQUE` (`U_Email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`HotTopicType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`HotTopicType` (
  `HotTopicType_ID` INT NOT NULL AUTO_INCREMENT,
  `HotTopicType_Name` VARCHAR(45) NOT NULL,
  `HotTopicType_info` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`HotTopicType_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`HotTopic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`HotTopic` (
  `HotTopic_ID` INT NOT NULL AUTO_INCREMENT,
  `HotTopic_Title` VARCHAR(45) NOT NULL,
  `HotTopic_Info` VARCHAR(45) NULL,
  `HotTopic_Rank` INT NULL,
  `HotTopicType_ID` INT NOT NULL,
  PRIMARY KEY (`HotTopic_ID`),
  INDEX `FK_HotTopic_Type_idx` (`HotTopicType_ID` ASC),
  CONSTRAINT `FK_HotTopic_Type`
    FOREIGN KEY (`HotTopicType_ID`)
    REFERENCES `mydbtest`.`HotTopicType` (`HotTopicType_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Message` (
  `Mg_ID` INT NOT NULL AUTO_INCREMENT,
  `Mg_Content` VARCHAR(200) NOT NULL,
  `Mg_commentNum` INT NULL,
  `Mg_DateTime` DATETIME NOT NULL,
  `U_ID` INT NOT NULL,
  `Mg_Image` VARCHAR(45) NULL,
  `Mg_Video` VARCHAR(45) NULL,
  `HotTopic_ID` INT NULL,
  PRIMARY KEY (`Mg_ID`),
  INDEX `Mg_U_FK1_idx` (`U_ID` ASC),
  INDEX `FK_Message_HotTopic_idx` (`HotTopic_ID` ASC),
  CONSTRAINT `FK_Mg_User`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Message_HotTopic`
    FOREIGN KEY (`HotTopic_ID`)
    REFERENCES `mydbtest`.`HotTopic` (`HotTopic_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`OrderType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`OrderType` (
  `OrderType_ID` INT NOT NULL AUTO_INCREMENT,
  `OrderType_Name` VARCHAR(45) NULL,
  `OrderType_Price` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderType_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Privilege` (
  `Privilege_ID` INT NOT NULL AUTO_INCREMENT,
  `Privilege_info` VARCHAR(100) NULL,
  PRIMARY KEY (`Privilege_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`VIP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`VIP` (
  `Vip_ID` INT NOT NULL AUTO_INCREMENT,
  `Privilege_ID` INT NOT NULL,
  `Vip_Lv` VARCHAR(45) NOT NULL,
  `VIP_DueDate` DATE NOT NULL,
  PRIMARY KEY (`Vip_ID`),
  INDEX `FK_Vip_Privilege_idx` (`Privilege_ID` ASC),
  CONSTRAINT `FK_Vip_Privilege`
    FOREIGN KEY (`Privilege_ID`)
    REFERENCES `mydbtest`.`Privilege` (`Privilege_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Manager` (
  `Manager_ID` INT NOT NULL AUTO_INCREMENT,
  `Manager_FirstName` VARCHAR(45) NOT NULL,
  `Manager_LastName` VARCHAR(45) NOT NULL,
  `Manager_State` VARCHAR(20) NULL,
  `Manager_City` VARCHAR(20) NULL,
  `Manager_Street` VARCHAR(45) NULL,
  `Manager_login` VARCHAR(45) NOT NULL,
  `Manager_Password` VARCHAR(45) NOT NULL,
  `Manager_Email` VARCHAR(45) NOT NULL,
  `Manager_Gender` VARCHAR(10) NOT NULL,
  `Manager_Phone` VARCHAR(45) NOT NULL,
  `Manager_Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Manager_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`OrderManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`OrderManager` (
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Manager_ID`),
  CONSTRAINT `FK_OrderManager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`Manager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Orders` (
  `Order_ID` INT NOT NULL AUTO_INCREMENT,
  `Order_Date` DATE NOT NULL,
  `OrderType_ID` INT NOT NULL,
  `U_ID` INT NOT NULL,
  `Order_CardType` VARCHAR(45) NULL,
  `Order_CardNumber` INT NULL,
  `Vip_ID` INT NOT NULL,
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `Fk1_idx` (`U_ID` ASC),
  INDEX `Fk2_idx` (`OrderType_ID` ASC),
  INDEX `fk_Order_VIP1_idx` (`Vip_ID` ASC),
  INDEX `FK_Order_Manager_idx` (`Manager_ID` ASC),
  CONSTRAINT `FK1_Orders_U`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk2_OrderType`
    FOREIGN KEY (`OrderType_ID`)
    REFERENCES `mydbtest`.`OrderType` (`OrderType_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_VIP1`
    FOREIGN KEY (`Vip_ID`)
    REFERENCES `mydbtest`.`VIP` (`Vip_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Orders_Manager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`OrderManager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Authenticated_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Authenticated_Type` (
  `AuthType_ID` INT NOT NULL,
  `AuthType_Name` VARCHAR(45) NOT NULL,
  `AuthType_Info` VARCHAR(150) NULL,
  PRIMARY KEY (`AuthType_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`ApplicationManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`ApplicationManager` (
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Manager_ID`),
  CONSTRAINT `Fk_Application`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`Manager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Application` (
  `Application_ID` INT NOT NULL AUTO_INCREMENT,
  `Application_Date` DATE NOT NULL,
  `U_ID` INT NOT NULL,
  `AuthType_ID` INT NOT NULL,
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Application_ID`),
  INDEX `FK1_Application_idx` (`U_ID` ASC),
  INDEX `FK2_AutheType_idx` (`AuthType_ID` ASC),
  INDEX `FK_Application_Manager_idx` (`Manager_ID` ASC),
  CONSTRAINT `FK1_Application`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_AutheType`
    FOREIGN KEY (`AuthType_ID`)
    REFERENCES `mydbtest`.`Authenticated_Type` (`AuthType_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Application_Manager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`ApplicationManager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





-- -----------------------------------------------------
-- Table `mydbtest`.`Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Activity` (
  `Activity_ID` INT NOT NULL AUTO_INCREMENT,
  `Activity_Title` VARCHAR(45) NOT NULL,
  `Activity_State` VARCHAR(45) NOT NULL,
  `Activity_City` VARCHAR(45) NOT NULL,
  `Activity_Street` VARCHAR(45) NOT NULL,
  `Activity_StartDate` DATETIME NOT NULL,
  PRIMARY KEY (`Activity_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`AuthenUser_hold_Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`AuthenUser_hold_Activity` (
  `AuthenUser_ID` INT NOT NULL,
  `Activity_ID` INT NOT NULL,
  INDEX `fk_Authenticated User_has_Activity_Activity1_idx` (`Activity_ID` ASC),
  INDEX `fk_Authenticated User_has_Activity_Authenticated User1_idx` (`AuthenUser_ID` ASC),
  PRIMARY KEY (`AuthenUser_ID`, `Activity_ID`),
  CONSTRAINT `fk_Authenticated User_has_Activity_Authenticated User1`
    FOREIGN KEY (`AuthenUser_ID`)
    REFERENCES `mydbtest`.`AuthenticatedUser` (`AuthenUser_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Authenticated User_has_Activity_Activity1`
    FOREIGN KEY (`Activity_ID`)
    REFERENCES `mydbtest`.`Activity` (`Activity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Comment` (
  `Comment_ID` INT NOT NULL AUTO_INCREMENT,
  `Comment_Content` VARCHAR(150) NOT NULL,
  `Comment_DateTime` DATETIME NOT NULL,
  `Mg_ID` INT NOT NULL,
  `U_ID` INT NOT NULL,
  PRIMARY KEY (`Comment_ID`),
  INDEX `FK_Mg_Comment_idx` (`Mg_ID` ASC),
  INDEX `FK_U_Comment_idx` (`U_ID` ASC),
  CONSTRAINT `FK_Mg_Comment`
    FOREIGN KEY (`Mg_ID`)
    REFERENCES `mydbtest`.`Message` (`Mg_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_U_Comment`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`FrendelyLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`FrendelyLink` (
  `FLink_ID` INT NOT NULL,
  `FLink_Title` VARCHAR(45) NOT NULL,
  `FLink_ULR` VARCHAR(45) NOT NULL,
  `FLink_Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FLink_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`AuthenticatedUser_has_ FLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`AuthenticatedUser_has_ FLink` (
  `FLink_ID` INT NOT NULL AUTO_INCREMENT,
  `AuthenUser_ID` INT NOT NULL,
  `StartDate` DATE NOT NULL,
  `FLink_Status` VARCHAR(45) NULL,
  PRIMARY KEY (`FLink_ID`, `AuthenUser_ID`),
  INDEX `fk_FLink_has_Authenticated User_Authenticated User1_idx` (`AuthenUser_ID` ASC),
  INDEX `fk_FLink_has_Authenticated User_FLink1_idx` (`FLink_ID` ASC),
  CONSTRAINT `fk_FLink_has_Authenticated User_FLink1`
    FOREIGN KEY (`FLink_ID`)
    REFERENCES `mydbtest`.`FrendelyLink` (`FLink_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FLink_has_Authenticated User_Authenticated User1`
    FOREIGN KEY (`AuthenUser_ID`)
    REFERENCES `mydbtest`.`AuthenticatedUser` (`AuthenUser_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`MessageManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`MessageManager` (
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Manager_ID`),
  CONSTRAINT `FK_MessageManager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`Manager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`DelMessage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`DelMessage` (
  `DelMessage_ID` INT NOT NULL AUTO_INCREMENT,
  `DelMessage_DateTime` DATETIME NOT NULL,
  `DelMessage_Reason` VARCHAR(120) NOT NULL,
  `Manager_ID` INT NOT NULL,
  `Mg_ID` INT NOT NULL,
  PRIMARY KEY (`DelMessage_ID`),
  INDEX `FK1_DelCommentID_idx` (`Mg_ID` ASC),
  INDEX `FK2_DelCommentManager_idx` (`Manager_ID` ASC),
  CONSTRAINT `FK1_DelCommentID`
    FOREIGN KEY (`Mg_ID`)
    REFERENCES `mydbtest`.`Message` (`Mg_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_DelCommentManager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`MessageManager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`PhotoFolder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`PhotoFolder` (
  `PhotoFolder_ID` INT NOT NULL AUTO_INCREMENT,
  `PhotoFolder_Title` VARCHAR(45) NULL,
  `PhotoFolder_Info` VARCHAR(200) NULL,
  `PhotoFolder_Number` INT NOT NULL,
  `U_ID` INT NOT NULL,
  PRIMARY KEY (`PhotoFolder_ID`),
  INDEX `FK_PhotoFolder_User_idx` (`U_ID` ASC),
  CONSTRAINT `FK_PhotoFolder_User`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Photos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Photos` (
  `Photos_ID` INT NOT NULL AUTO_INCREMENT,
  `PhotoFolder_ID` INT NOT NULL,
  `Photos_Description` VARCHAR(45) NULL,
  `Photos_State` VARCHAR(20) NULL,
  `Photos_City` VARCHAR(20) NULL,
  `Mg_ID` INT NOT NULL,
  PRIMARY KEY (`Photos_ID`),
  INDEX `FK_Mg_Photos_idx` (`Mg_ID` ASC),
  INDEX `FK_PhoteFold_Photos_idx` (`PhotoFolder_ID` ASC),
  CONSTRAINT `FK_Mg_Photos`
    FOREIGN KEY (`Mg_ID`)
    REFERENCES `mydbtest`.`Message` (`Mg_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PhoteFold_Photos`
    FOREIGN KEY (`PhotoFolder_ID`)
    REFERENCES `mydbtest`.`PhotoFolder` (`PhotoFolder_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`VideoFolder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`VideoFolder` (
  `VideoFolder_ID` INT NOT NULL AUTO_INCREMENT,
  `VideoFolder_Title` VARCHAR(45) NULL,
  `VideoFolder_Info` VARCHAR(200) NULL,
  `VideoFolder_Number` INT NOT NULL,
  `U_ID` INT NOT NULL,
  PRIMARY KEY (`VideoFolder_ID`),
  INDEX `FK_VideoFolder_User_idx` (`U_ID` ASC),
  CONSTRAINT `FK_VideoFolder_User`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Videos` (
  `Videos_ID` INT NOT NULL AUTO_INCREMENT,
  `VideosFolder_ID` INT NOT NULL,
  `Videos_Description` VARCHAR(45) NULL,
  `Videos_State` VARCHAR(20) NULL,
  `Videos_City` VARCHAR(20) NULL,
  `Mg_Id` INT NOT NULL,
  PRIMARY KEY (`Videos_ID`),
  INDEX `FK_Videos_VideoFolder_idx` (`VideosFolder_ID` ASC),
  INDEX `FK_Videos_Mg_idx` (`Mg_Id` ASC),
  CONSTRAINT `FK_Videos_VideoFolder`
    FOREIGN KEY (`VideosFolder_ID`)
    REFERENCES `mydbtest`.`VideoFolder` (`VideoFolder_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Videos_Mg`
    FOREIGN KEY (`Mg_Id`)
    REFERENCES `mydbtest`.`Message` (`Mg_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`AdvertiseManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`AdvertiseManager` (
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Manager_ID`),
  CONSTRAINT `PK_AdvertiseManager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`Manager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`AccountManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`AccountManager` (
  `Manager_ID` INT NOT NULL,
  PRIMARY KEY (`Manager_ID`),
  CONSTRAINT `FK_AccountManager`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`Manager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Advertise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Advertise` (
  `Advertise_ID` INT NOT NULL AUTO_INCREMENT,
  `Advertise_Type` VARCHAR(45) NULL,
  `Advertise_Info` VARCHAR(45) NULL,
  `Manager_ID` INT NULL,
  `Advertise_Company` VARCHAR(45) NULL,
  `Advertise_Price` DECIMAL(2) NULL,
  PRIMARY KEY (`Advertise_ID`),
  INDEX `FK_Advertise_idx` (`Manager_ID` ASC),
  CONSTRAINT `FK_Advertise`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`AdvertiseManager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Account`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`AccountManager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`User_Fans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`User_Fans` (
  `U_ID` INT NOT NULL,
  `U_Fans_ID` INT NOT NULL,
  PRIMARY KEY (`U_ID`, `U_Fans_ID`),
  INDEX `FK_User2_idx` (`U_Fans_ID` ASC),
  CONSTRAINT `FK_User1`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_User2`
    FOREIGN KEY (`U_Fans_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`User_Follow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`User_Follow` (
  `U_ID` INT NOT NULL,
  `U_Follow_ID` INT NOT NULL,
  PRIMARY KEY (`U_ID`, `U_Follow_ID`),
  INDEX `FK_User4_idx` (`U_Follow_ID` ASC),
  CONSTRAINT `FK_User3`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_User4`
    FOREIGN KEY (`U_Follow_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`LocationHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`LocationHistory` (
  `LocationHistory_ID` INT NOT NULL AUTO_INCREMENT,
  `LocationHistory_DateTime` DATETIME NOT NULL,
  `LocationHistory_State` VARCHAR(20) NOT NULL,
  `LocationHistor_City` VARCHAR(20) NOT NULL,
  `LocationHistor_IP` VARCHAR(80) NOT NULL,
  `LocationHistor_MacAddress` VARCHAR(80) NOT NULL,
  `U_ID` INT NOT NULL,
  PRIMARY KEY (`LocationHistory_ID`),
  INDEX `FK_LocationHistory_User_idx` (`U_ID` ASC),
  CONSTRAINT `FK_LocationHistory_User`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`User` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`hottopictype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`hottopictype` (
  `HotTopicType_ID` INT(11) NOT NULL,
  `HotTopicType_info` VARCHAR(45) NULL DEFAULT NULL,
  `TopicMaganger_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`HotTopicType_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydbtest`.`hottopic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`hottopic` (
  `HotTopic_ID` INT(11) NOT NULL,
  `HotTopic_Title` VARCHAR(45) NOT NULL,
  `HotTopic_Info` VARCHAR(45) NULL DEFAULT NULL,
  `HotTopic_Rand` INT(11) NULL DEFAULT NULL,
  `HotTopicType_ID` INT(11) NOT NULL,
  `Manager_ID` INT(11) NOT NULL,
  `PhotoFolder_ID` INT(11) NOT NULL,
  PRIMARY KEY (`HotTopic_ID`),
  INDEX `FK_HotTopic_Type_idx` (`HotTopicType_ID` ASC),
  CONSTRAINT `FK_HotTopic_Type`
    FOREIGN KEY (`HotTopicType_ID`)
    REFERENCES `mydbtest`.`hottopictype` (`HotTopicType_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydbtest`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`user` (
  `U_ID` INT(11) NOT NULL,
  `U_NickName` VARCHAR(30) NOT NULL,
  `U_login` VARCHAR(45) NOT NULL,
  `U_Email` VARCHAR(45) NOT NULL,
  `U_Password` VARCHAR(45) NOT NULL,
  `U_Name` VARCHAR(45) NOT NULL,
  `U_Gender` VARCHAR(45) NOT NULL,
  `U_RegisterTime` DATE NOT NULL,
  `U_Mg_Count` INT(11) NULL DEFAULT NULL,
  `U_Follow_Count` INT(11) NULL DEFAULT NULL,
  `U_Fans_Count` INT(11) NULL DEFAULT NULL,
  `U_Webside` VARCHAR(45) NULL DEFAULT NULL,
  `U_Phone` VARCHAR(45) NULL DEFAULT NULL,
  `U_Info` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`U_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydbtest`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`message` (
  `Mg_ID` INT(11) NOT NULL,
  `Mg_Content` VARCHAR(120) NOT NULL,
  `Mg_commentNum` INT(11) NULL DEFAULT NULL,
  `Mg_Date` DATE NOT NULL,
  `U_ID` INT(11) NOT NULL,
  `Mg_Image` VARCHAR(45) NULL DEFAULT NULL,
  `Mg_Video` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Mg_ID`),
  INDEX `Mg_U_FK1_idx` (`U_ID` ASC),
  CONSTRAINT `Mg_U_FK1`
    FOREIGN KEY (`U_ID`)
    REFERENCES `mydbtest`.`user` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydbtest`.`relation_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`relation_type` (
  `RelationType_ID` INT(11) NOT NULL,
  `RelationType_Description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`RelationType_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydbtest`.`user_relationship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`user_relationship` (
  `RelationSHIP_ID` INT(11) NOT NULL,
  `User_ID` INT(11) NOT NULL,
  `RelationUser_ID` INT(11) NOT NULL,
  `RelationType_ID` INT(11) NOT NULL,
  PRIMARY KEY (`RelationSHIP_ID`),
  INDEX `fk_User_Relationship_Relation Type1_idx` (`RelationType_ID` ASC),
  CONSTRAINT `Fk1`
    FOREIGN KEY (`RelationSHIP_ID`)
    REFERENCES `mydbtest`.`user` (`U_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Relationship_Relation Type1`
    FOREIGN KEY (`RelationType_ID`)
    REFERENCES `mydbtest`.`relation_type` (`RelationType_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydbtest`.`ManagerDirector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`ManagerDirector` (
  `Manager_ID` INT NOT NULL,
  UNIQUE INDEX `Manager_ID_UNIQUE` (`Manager_ID` ASC),
  CONSTRAINT `FK_ManagerDirector`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `mydbtest`.`Manager` (`Manager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`Visitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`Visitor` (
  `Visitor_ID` INT NOT NULL AUTO_INCREMENT,
  `Visitor_IP` VARCHAR(45) NOT NULL,
  `Visitor_DateTime` DATETIME NOT NULL,
  PRIMARY KEY (`Visitor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydbtest`.`AuthenticatedUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbtest`.`AuthenticatedUser` (
  `AuthenUser_ID` INT NOT NULL AUTO_INCREMENT,
  `AuthenUser_Name` VARCHAR(45) NOT NULL,
  `AuthenUser_Discription` VARCHAR(180) NOT NULL,
  `AuthenUser_Phone` VARCHAR(45) NOT NULL,
  `Application_ID` INT NOT NULL,
  PRIMARY KEY (`AuthenUser_ID`),
  INDEX `FK_Application_idx` (`Application_ID` ASC),
  CONSTRAINT `FK_Application1`
    FOREIGN KEY (`Application_ID`)
    REFERENCES `mydbtest`.`Application` (`Application_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
