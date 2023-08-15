SET NOCOUNT ON
GO
USE master
GO
if exists (select * from sysdatabases where name='loginDB')
		drop database loginDB
GO

CREATE DATABASE loginDB
GO
use loginDB
GO
Create Table Users
(name nvarchar(50) primary key,
 pass nvarchar(50) not null,
 role int
)
GO

INSERT INTO Users VALUES ('admin','1234',1)
INSERT INTO Users VALUES ('hoa','123',2)
INSERT INTO Users VALUES ('la','12',3)
GO

select * from Users
GO
