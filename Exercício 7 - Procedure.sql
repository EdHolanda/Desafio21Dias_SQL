/*pg1*/
Create Procedure SP_Cadastra_Altera_Cliente_Endereco
	@nome As Varchar(100),
	@cpf As Varchar(14),
	@telefone As Varchar(10),
	@logradouro As Varchar(255),
	@numero As Varchar(10),
	@complemento As Varchar(100),
	@bairro As Varchar(255),
	@cidade As Varchar(100),
	@uf As Varchar(100),
	@cep As Varchar(9)
	
	As

	 If Not Exists (Select C.CPF From Clientes C Where C.CPF = @cpf)
		Begin
			Declare 
			@id_cliente As Int,
			@id_endereco As Int

			Insert Into Clientes (Nome, CPF, Telefone)
			Values(@nome, @cpf, @telefone);

			Set @id_cliente = (Select @@IDENTITY);

			If Not Exists (Select Rua, Numero, CEP, Bairro, Cidade, Estado, Complemento 
							From Enderecos 
/*pg2*/							Where CEP = @cep and Numero = @numero and Bairro = @bairro 
								and Cidade = @cidade and Estado = @uf)
				Begin
					Insert Into Enderecos(Rua, Numero, Complemento, Bairro, Cidade, Estado, CEP)
					Values (@logradouro, @numero, @complemento, @bairro, @cidade, @uf, @cep)
					
					Set @id_endereco = (Select @@IDENTITY)
								
					Insert Into Clientes_Enderecos (IdCliente, IdEndereco) Values(@id_cliente,@id_endereco)
				End

			Else
				Set @id_endereco = (Select ID From Enderecos 
										Where CEP = @cep and Numero = @numero and Bairro = @bairro 
											and Cidade = @cidade and Estado = @uf) 
			
				Insert Into Clientes_Enderecos (IdCliente, IdEndereco) Values(@id_cliente,@id_endereco)
			End

		Else
			Begin
				Set @id_cliente = (Select ID From Clientes Where CPF = @cpf)

				If Not Exists (Select Rua, Numero, CEP, Bairro, Cidade, Estado, Complemento 
								From Enderecos 
								Where CEP = @cep and Numero = @numero and Bairro = @bairro 


/*pg3*/									and Cidade = @cidade and Estado = @uf)
					Begin
						Insert Into Enderecos(Rua, Numero, Complemento, Bairro, Cidade, Estado, CEP)
						Values (@logradouro, @numero, @complemento, @bairro, @cidade, @uf, @cep)
					
						Set @id_endereco = (Select @@IDENTITY)
								
						Insert Into Clientes_Enderecos (IdCliente, IdEndereco) Values(@id_cliente,@id_endereco)
					End;

				Else
					Set @id_endereco = (Select ID From Enderecos 
											Where CEP = @cep and Numero = @numero and Bairro = @bairro 
												and Cidade = @cidade and Estado = @uf) 
			
					Insert Into Clientes_Enderecos (IdCliente, IdEndereco) Values(@id_cliente,@id_endereco)
			End
