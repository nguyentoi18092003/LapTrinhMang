-- DU LIEU BAN LAY HAY INSERT NO CHI LA TUONG TRUNG THOI, MN LAY DUNG GIU LIEU THEO LUONG VA LOGIC NHE!
use gamedb;
-- ----------- Admin Tùng
-- Tran dang đấu 
select count(*) as "Tran dang dau" from room  r
where r.status like "Đang chơi";
-- Nguoi choi online
select count(*) as "Nguoi choi online " from player p
where p.status like "Online";
-- Tổng số người chơi
select count(*) as "Tổng số người chơi" from player p;

-- Tìm kiếm thông tin người chơi
select username, status from player p
where username like "%us%" ;

-- Thông tin chi tiết của user
SELECT 
    p.timeJoin AS "Thoi gian tham gia",
    p.totalPoints AS "Tong diem",
    SUM(s.totalWins) AS "Tong so tran thang", 
    SUM(s.totalDraws) AS "Tong so tran hoa", 
    SUM(s.totalLoss) AS "Tong so tran thua" 
FROM player p 
JOIN scoreboard s 
ON p.playerId = s.playerId 
WHERE p.playerId = 1 
GROUP BY 
    p.timeJoin,
	p.totalPoints ;
-- Bang xep hang
SELECT 
    p.totalPoints AS "Tong diem",
    p.drawRate AS "Ti le thang",-- xu li BE xong gan vo luu trong DB
    SUM(s.totalWins) AS "Tong so tran thang", 
    SUM(s.totalDraws) AS "Tong so tran hoa", 
    SUM(s.totalLoss) AS "Tong so tran thua" 
FROM player p 
JOIN scoreboard s 
ON p.playerId = s.playerId 
GROUP BY p.totalPoints , p.drawRate 
ORDER BY p.drawRate DESC;
    
-- Client Thưởng 
-- Dang nhap
SELECT EXISTS (
    SELECT 1
    FROM player p
    WHERE p.username = 'your_username' 
    AND p.passwordd = 'your_password'
) AS player;-- check xem co dung username, password khong
-- Dang ki
SELECT EXISTS (
    SELECT 1
    FROM player p
    WHERE p.username = 'your_username' 
) AS player;-- check xem da ton tai username nay chua, neu chua thi insert vao
INSERT INTO Player (playerId, username, passwordd, winRate, drawRate, lossRate, totalPoints, status, timeJoin) VALUES
(21, 'user21', 'pass1', 0.6, 0.2, 0.2, 50, 'Online', '2023-10-01 10:00:00');
-- Ten: chinh la username da co khi dang nhaop
-- Level 
select p.totalPoints from player p
where p.username like "user1"; -- Co diem xu li BE ra level
-- Danh sach nguoi choi truc tuyen
select count(*) as "Nguoi choi online " from player p
where p.status like "Online";

-- Thong tin chi tiet
-- Thông tin chi tiết của user
SELECT 
    p.totalPoints AS "Tong diem",
    SUM(s.totalWins) AS "Tong so tran thang", 
    SUM(s.totalDraws) AS "Tong so tran hoa", 
    SUM(s.totalLoss) AS "Tong so tran thua" 
     -- Tong thi xu li trong BE = thang + thua + hoa
FROM player p 
JOIN scoreboard s 
ON p.playerId = s.playerId 
WHERE p.playerId = 1 
GROUP BY 
	p.totalPoints ;
--  Choi ngau nhien: Tim cac phong type ngau nhien va chua co du nguoi choi (status Cho)
select roomID as "Phong ngau nhien" from room r
where r.roomType like "Ghép ngẫu nhiên" and r.status like "Chờ";

-- Tim phong 
select roomID as "Cac phong hien co" from room r
where r.status like "Chờ" ;-- Tim cac phong dang cho, con dang choi roi se khong vao duoc

-- Tao phong
INSERT INTO Room (roomId, roomType, status) VALUES
(11, 'Tạo phòng', 'Chờ');
INSERT INTO Player_Room (playerId, roomId, joinedAt) VALUES
(10, 1, '2023-10-01 10:00:00');-- Khi tao xong nguoi do cx tu dong co trong phong do

-- Tim theo ten
select username, status from player p
where username like "%us%" ;

-- Danh sach ban be dang cho dươc chap nhan
select * from addfriend a
join player p on a.playerId=p.playerId;
-- khi accep chap nhan ket ban them 1 ban ghi do vao danh sach ban be va xoa ban ghi duoc chap nhan ra khoi danh sach duoc cho
INSERT INTO PlayerFriend (friendId, playerId) VALUES
(11, 10);
DELETE FROM addfriend a WHERE a.addFriendId='11';

-- Tim ban be 
select * from  playerfriend ;

-- client Thắng
-- Gửi lời mời
select * from  playerfriend ;
-- Khi ngươi con lai chap nhan
INSERT INTO Player_Room (playerId, roomId, joinedAt) VALUES
(10, 1, '2023-10-01 10:00:00');-- Khi accep  xong nguoi do cx tu dong co trong phong do
-- Tao ra 1 tran dau gom 2 nguoi trong phong do va khi Ket thuc tran dau luu kêt qua cua phong do vao 1 ban ghi match
INSERT INTO Matchh (matchId, roundNumber, player1Choice, player2Choice, result, roundTime, roomId, beginTime) 
VALUES 
(1, 1, 'Kéo', 'Búa', '2', '2023-10-01 10:05:00', 1, '2023-10-01 10:00:00');
-- Luu them 2 cua 2 nguoi choi trong phong room khi nay thành ban ghi Player_Match 
INSERT INTO Player_Match (playerId, matchId) VALUES
(1, 1),
(2, 2)

-- select * from matchh;
-- select * from player;
-- select * from player_match;
-- select * from player_room;
-- select * from playerfriend;
-- select * from room;
-- select * from scoreboard;
-- select * from addfriend;

