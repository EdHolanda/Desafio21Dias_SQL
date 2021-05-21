CREATE TABLE Itens_de_Pedidos (
    ID int identity primary key,
    IdPedido int not null,
	IdProduto int not null,
	Unidade varchar(10) null,
	Quantidade float not null,
    Valor money null,
);