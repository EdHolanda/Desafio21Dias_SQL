Create Trigger TGR_CALCULA_TOTAL_PEDIDO_INSERT_UPDATE
On Desafio21Dias.dbo.Pedidos_Produtos
	For Insert,Update 
	As
		Begin
			Declare
			@valor_total  As Float,
			@id_pedido As Int;
		
			Set @id_pedido =   (Select Inserted.IdPedido From Inserted)

			Set @valor_total = (Select Sum(Pedidos_Produtos.Valor * Pedidos_Produtos.Quantidade) 
									FROM Pedidos_Produtos
									Where Pedidos_Produtos.IdPedido = @id_pedido)
				
		
			Update Pedidos Set TotalPedido = @valor_total Where ID = @id_pedido
		End;

Create Trigger TGR_ALTERA_VALOR_TOTAL_PEDIDO_DELETE
On Desafio21Dias.dbo.Pedidos_Produtos
	For Delete 
	As
		Begin
			Declare
			@valor_total  As Float,
			@id_pedido As Int;
		
			Set @id_pedido =   (Select Deleted.IdPedido From Deleted)
			
			Set @valor_total = (Select Sum(Pedidos_Produtos.Valor * Pedidos_Produtos.Quantidade) 
									FROM Pedidos_Produtos
									Where Pedidos_Produtos.IdPedido = @id_pedido)
	
			Update Pedidos Set TotalPedido = @valor_total Where ID = @id_pedido
		End;


			


 