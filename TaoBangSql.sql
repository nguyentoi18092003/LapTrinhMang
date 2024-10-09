DROP DATABASE gameDB;
CREATE DATABASE gameDB;

USE gameDB;
create table Player(
playerId int primary key unique not null,
username varchar(20) NOT NULL UNIQUE,
passwordd  varchar(15) NOT NULL,
winRate decimal DEFAULT 0.00,
drawRate decimal DEFAULT 0.00,
lossRate decimal DEFAULT 0.00,
totalPoints int DEFAULT 0,
status varchar(15)  DEFAULT 'Offline',
timeJoin datetime NOT NULL
);
 create table Scoreboard(
 scoreId int PRIMARY KEY UNIQUE NOT NULL,
 totalPoint int DEFAULT 0,
 totalWins int DEFAULT 0,
 totalDraws int DEFAULT 0,
 totalLoss int DEFAULT 0,
 ranking int DEFAULT 0,
 playerId int NOT NULL,
foreign key (playerId) REFERENCES Player(playerId )
 );
 create table Room(
  roomId int PRIMARY KEY NOT NULL,
  roomType varchar(15) NOT NULL,
  status varchar(15) DEFAULT 'Waiting'
  
  );
  create table Matchh(
  matchId int PRIMARY KEY UNIQUE NOT NULL,
  roundNumber int NOT NULL DEFAULT 1,
  player1Choice varchar(15) NOT NULL,
  player2Choice varchar(15) NOT NULL,
  result varchar(15),
  roundTime datetime NOT NULL,
  roomId int NOT NULL,
  beginTime datetime NOT NULL,
  foreign key (roomId) references Room(roomId)
  );
  
   create table Player_Match(
   playerId int NOT NULL,
   matchId int NOT NULL,
   PRIMARY KEY (playerId, matchId),
   foreign key (playerId) references  Player(playerId),
   foreign key (matchId) references Matchh(matchId)
   );
create table PlayerFriend(
friendId int PRIMARY KEY UNIQUE NOT NULL,
playerId int NOT NULL,
foreign key(playerId) references Player(playerId)
);
 create table Player_Room(
 playerId int NOT NULL,
 roomId int NOT NULL,
 joinedAt timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (playerId, roomId),   
 foreign key (playerId) references Player(playerId),
 foreign key (roomId) references Room(roomID)
 
 );
 create table AddFriend (
 addFriendId int PRIMARY KEY UNIQUE NOT NULL,
 playerId int NOT NULL,
 foreign key(playerId) references Player(playerId)
 )
select * from matchh;
select * from player;
select * from player_match;
select * from player_room;
select * from playerfriend;
select * from room;
select * from scoreboard;