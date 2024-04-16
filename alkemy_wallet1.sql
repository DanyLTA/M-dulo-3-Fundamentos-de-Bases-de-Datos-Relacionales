use alke_wallet1;

create table USUARIO(
idUsuario varchar(15) not null,
nombre varchar(15),
email varchar(30),
contrasena varchar(20),
saldo int,
primary key(idUsuario)
);

create table MONEDA(
idMoneda INT not null,
nombre varchar(30),
simbolo varchar(5),
primary key(idMoneda)
);

create table TRANSACCION(
idTRansaccion varchar(15) not null,
importe varchar(10),
fechaTransaccion date,
idEmisor varchar(10),
idReceptor varchar(10),
idMoneda varchar(10),
primary key(idTransaccion),
foreign key(idEmisor) references USUARIO(idUsuario),
foreign key(idReceptor) references USUARIO(idUsuario),
foreign key(idMoneda) references MONEDA(idMoneda)
);

INSERT INTO USUARIO (

idUsuario,
nombre,
email,
contrasena,
saldo
)
values
('1','Pedro Soto','psoto@gmail.com','contra1111','350'),
('2','María Perez','mperez@gmail.com','contra2222','450'),
('3','Pía Saez','psaez@gmail.com','contra3333','550'),
('4','Lia Diaz','ldiaz@gmail.com','contra4444','650'),
('5','Celia Cruz','cruz@gmail.com','contra5555','750');

insert into MONEDA (
idMoneda,
nombre,
simbolo
)
values 
('1','Dolar USA','USD'),
('2','Euro','EUR'),
('3','Peso','CLP');

INSERT INTO TRANSACCION (
idTransaccion,
importe,
fechaTransaccion,
idEmisor,
idReceptor,
idMoneda
)
VALUES

('1','120','2024-01-01','1','2','1'),
('2','130','2024-01-02','2','3','2'),
('3','140','2024-01-03','3','4','3'),
('4','150','2024-01-04','4','5','1'),
('5','160','2024-01-05','5','1','2');

/* 1.- Consulta para obtener el nombre de la moneda elegida por un usuario*/
SELECT *
FROM USUARIO u
INNER JOIN TRANSACCION t ON u.idUsuario = t.idEmisor OR u.idUsuario = t.idReceptor
INNER JOIN MONEDA m ON t.idMoneda = m.idMoneda
WHERE u.nombre ='Lia Diaz';

/* Consulta para obtener los ID de usuario */
SELECT *
FROM USUARIO;

/* 2.Consulta para obtener todas las transacciones registradas */
SELECT *
FROM TRANSACCION;

/* 3.Consulta para obtener todas las transacciones realizadas por un usuario especifico */
SELECT *
FROM TRANSACCION
WHERE idEmisor = 2;
/* OR idReceptor = 2; */

/*4.Sentencia DML para modificar el campo email de un usuario especifico */
SELECT *
FROM USUARIO;
UPDATE USUARIO
SET email = 'pia@gmail.com'
WHERE idUsuario = '1';

/* 5.Sentencia para eliminar los datos de una transaccion (eliminado de la fila completa) */
SELECT *
FROM TRANSACCION;

DELETE FROM TRANSACCION
WHERE id_transaccion = '3';

