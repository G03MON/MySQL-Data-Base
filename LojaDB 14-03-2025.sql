CREATE DATABASE Loja;

USE Loja;

CREATE TABLE Clientes(
    ID INT(4) AUTO_INCREMENT,
    Nome VARCHAR(150),
    Endereço VARCHAR(150),
    Cidade VARCHAR(150),
    CEP VARCHAR(50),
    PRIMARY KEY (ID)
   );
   
CREATE TABLE Pedidos(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Data_Pedido TIMESTAMP,
    Item VARCHAR(150),
    Valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)    
); 

INSERT INTO Clientes(ID, Nome, Endereço, Cidade, CEP) VALUES (null, "Carlos Fonseca", "Rua Um, 199", "São Paulo", "0520210");
INSERT INTO Clientes(ID, Nome, Endereço, Cidade, CEP) VALUES (null, "Maria Aparecida", "Rua Dois, 299", "São Paulo", "0520211");
INSERT INTO Clientes(ID, Nome, Endereço, Cidade, CEP) VALUES (null, "Yudi Yamatongo", "Rua Três, 399", "São Paulo", "0520212");

INSERT INTO Pedido(ID, ID_Cliente, Data_Pedido, Item, Valor) VALUES (null, "1", "1999-04-12 23:22:35", "GabineteR3X", "600,00");
INSERT INTO Pedido(ID, ID_Cliente, Data_Pedido, Item, Valor) VALUES (null, "2", "1999-04-12 23:22:35", "MemóriaRAM8GB", "85,70");
INSERT INTO Pedido(ID, ID_Cliente, Data_Pedido, Item, Valor) VALUES (null, "3", "1999-04-12 23:22:35", "PlacaMãe300", "800,30");

SELECT * FROM Clientes;

SELECT * FROM Pedidos;

UPDATE Pedidos
SET Data_Pedido = '1999-04-32 23:22:35'
WHERE ID = 1;

UPDATE Pedidos
SET Data_Pedido = '1975-06-32 22:00:35'
WHERE ID = 2;

UPDATE Pedidos
SET Data_Pedido = '2001-05-32 21:03:35'
WHERE ID = 3;

DROP TABLE Pedidos

DROP TABLE Clientes
