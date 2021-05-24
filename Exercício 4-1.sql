begin tran

truncate table produtos

commit

insert into 
	Produtos (Nome, Descricao, Valor, Unidade, Quantidade_Estoque, Data_Validade)
		values 
			('banana', 'Pacovan', 10, 'un', 20, '2021-05-31'),
			('maca', 'Maca Pera', 20, 'un', 20, '2021-05-31'),
			('pera', 'Argentina', 30, 'un', 20, '2021-05-31'),
			('uva', 'Sem caroco', 60, 'cacho', 20, '2021-05-31'),
			('goiaba', 'Goiaba da China', 50, 'un', 20, '2021-05-31'),
			('mamao', 'Papaya', 10, 'un', 20, '2021-05-31'),
			('manga', 'Espada', 40, 'un', 20, '2021-05-31'),
			('morango', 'Morangos Silvestres', 50, 'cx', 20, '2021-05-31'),
			('caju', 'Tamanho Grande',20, 'un', 20, '2021-05-31'),
			('melao', 'Amarelo', 40, 'un', 20, '2021-05-31')



select * from Produtos