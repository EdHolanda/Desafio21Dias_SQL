CREATE TABLE Enderecos (
    ID int identity primary key,
    Rua varchar(50) null,
	Numero varchar(10) null,--Permitir letras e numeros
	Complemento varchar(20) null,
    Bairro varchar(255) null,
	Cidade varchar(255) null,
	Estado varchar(2) null,
	CEP varchar(9) null,
	Data_Cadastro datetime default getdate(),
	Data_Alteracao datetime default getdate()
);