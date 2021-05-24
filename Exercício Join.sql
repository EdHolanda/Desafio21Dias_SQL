select *  from clientes

select * from produtos

select * from pedidos

select * from Pedidos_Produtos

select * from Enderecos



select
		p.ID as Pedido, c.Nome as Cliente, pr.Nome as Produto, ppr.Quantidade, ppr.Valor, p.TotalPedido, p.DataPedido, e.*
	from
		Pedidos p
		inner join Clientes c on (p.IdCliente = c.ID)
		inner join Pedidos_Produtos ppr on (p.ID = ppr.IdPedido)
		inner join Produtos pr on (ppr.IdProduto = pr.ID)
		inner join Enderecos e on (p.IdEnderecoEntrega = e.ID)

	where
		c.ID = 1


