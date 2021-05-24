CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[CPF] [varchar](14) NOT NULL,
	[Telefone] [varchar](15) NULL);

CREATE TABLE [dbo].[Produtos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Valor] [varchar](14) NOT NULL,
	[Unidade] [varchar](15) NULL,
	[Quantidade] [varchar](20) NULL);

CREATE TABLE [dbo].[Compras](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[TotalCompra] [float] NULL,
	[FormaPagamento] [varchar](100) NULL);

CREATE TABLE [dbo].[Compras_Produtos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdCompras] [int] NOT NULL,
	[IdProduto] [int] NOT NULL,
	[Quantidade] [float] NOT NULL,
	[Valor] [money] NOT NULL);


insert into Usuarios (Nome, CPF, Telefone) values('Danilo', '78965412321', '99999-7777');

insert into Produtos (Nome, Valor, Unidade, Quantidade) Values ('Camiseta', 50, 'un', 20);

begin tran

	insert into Compras (IdUsuario, TotalCompra, FormaPagamento) values (1, 1000, 'A vista');

	insert into Compras_Produtos (IdCompras, IdProduto, Quantidade, Valor) values (1, 1, 30, 50);

rollback




	
	