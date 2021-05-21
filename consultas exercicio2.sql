select 
		Nome as [Cliente], 
		Telefone,
		Rua + ', ' + Numero + ', ' + Complemento + ', ' + Bairro + ', ' + Cidade + '-' + Estado as [Endereço], 
		CEP

	from 
		Clientes C
		inner join Clientes_Enderecos CE on (C.ID = CE.IdCliente)
		inner join Enderecos E on (CE.IdEndereco = E.ID)




select 
		E.Rua + ', ' + E.Numero + ', ' + E.Complemento + ', ' + E.Bairro + ', ' + E.Cidade + '-' + E.Estado as [Endereço], 
		E.CEP,
		C.Nome as [Cliente], 
		C.Telefone

	from 
		Enderecos E
		inner join Clientes_Enderecos CE on (CE.IdEndereco = E.ID)
		inner join Clientes C on (C.ID = CE.IdCliente)