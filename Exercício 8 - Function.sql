Create Function dbo.FN_Classifica_Cliente() Returns Table

	As
		Return
		(Select 
				C.ID As Idcliente,
				IsNull(Count(P.ID),0) As [Número de Pedidos],
				Case 
					When Count(P.ID) >= 3 Then 'VIP'
					When Count(P.ID) Between 1 and 2 Then 'Master'
					Else 'Comum'
				End As Classificacao
			
			From
				Pedidos P
				Right Join Clientes C On P.IdCliente = C.ID

			Group By
				C.ID)


				
				
Select C.Nome As Cliente, C.CPF, FN.* 
	From 
		FN_Classifica_Cliente() As FN 
		Inner Join Clientes C On FN.IdCliente = C.ID
			
	
		
	

