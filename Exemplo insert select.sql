insert into Produtos_Novos (Nome, Descricao, Valor, Unidade, Quantidade_Estoque, Data_Validade)

 (select Nome, Descricao, Valor, Unidade, Quantidade_Estoque, Data_Validade from Produtos) 