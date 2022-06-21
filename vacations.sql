CREATE DATABASE vacation;

USE vacation;

-- table1 users- 

CREATE TABLE users (
    id INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    userName VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255),
    PRIMARY KEY (id)
);


INSERT INTO users (firstName,lastName,userName,password,role)
VALUES
    ('david','gallula','admin','abcd1234','admin');
    

-- table2 vacations

CREATE TABLE vacations (
    id INT AUTO_INCREMENT NOT NULL,
    description VARCHAR(255) NOT NULL,
    img VARCHAR(255),
    location VARCHAR(255) NOT NULL,
    startTime DATE NOT NULL,
    endTime DATE NOT NULL,
    price INT NOT NULL,
    followers INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO vacations (description,img,location,startTime,endTime,price,followers)
VALUES
      ('Week-end at rome','C:\Users\dgall\OneDrive\Pictures\vacations\img\Rome.jpg','Rome','2022-03-08','2022-03-12',1000,0);



-- table3 followedVacations

CREATE TABLE followedVacations (
    id INT AUTO_INCREMENT NOT NULL,
    userID INT NOT NULL,
    vacationID INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(userID) REFERENCES users(id),
    FOREIGN KEY(vacationID) REFERENCES vacations(id)
);

INSERT INTO followedVacations (userID,vacationID)
VALUES
    (1,1) ;

-- table4 followersNumbers 

CREATE TABLE followersNumbers (
    id INT AUTO_INCREMENT NOT NULL,
    followers int ,
    userID INT NOT NULL,
    vacationID INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(userID) REFERENCES users(id),
    FOREIGN KEY(vacationID) REFERENCES vacations(id)
);


INSERT INTO followersNumbers (followers,userID,vacationID)
VALUES
    (1000,1,1) ;


SELECT * FROM users;		

SELECT * FROM vacations;

SELECT * FROM followedVacations;

SELECT * FROM followersNumbers;

