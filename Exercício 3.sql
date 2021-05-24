select distinct
		X.*,
		SUM([Quantidade Total])  over (partition by Registro) as [Quantidade Total Geral],
		SUM([Valor Total Vendido]) over (partition by Registro) as [Valor Total Geral Vendido]
	from (
		select 
				1 as Registro,
				PR.Nome as [Produto],
				SUM(distinct PP.Quantidade) as [Quantidade Total],
				SUM(distinct PP.Valor * PP.Quantidade) as [Valor Total Vendido]
				

			from 
				Pedidos P
			
			inner join Pedidos_Produtos PP on (P.ID = PP.IdPedido)
				inner join Produtos PR on (PP.IdProduto = PR.ID)
				inner join Enderecos E on (P.IdEnderecoEntrega = E.ID)

			--where
			--	E.Bairro = 'Jaguaribe'
	
			group by
				PR.Nome, E.Bairro
			
		) as X
	

