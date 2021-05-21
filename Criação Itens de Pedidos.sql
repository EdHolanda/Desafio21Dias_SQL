CREATE TABLE Pedidos (
    ID int identity primary key,
    IditensPedidos int not null,
	IdCliente int not null,
	IdEnderecoEntrega int null,
);


CREATE TABLE Itens_de_Pedidos (
    ID int identity primary key,
    IdPedido int not null,
	IdProduto int not null,
	Unidade varchar(10) not null,
	Quantidade float not null,
    Valor money not null,
);