-- Inserindo Clientes
INSERT INTO Cliente (Pnome, NmeioInicial, Sobrenome, endereco, DataNascimento) VALUES 
('Carlos', 'A', 'Silva', 'Rua das Flores, 123', '1985-06-15'),
('Mariana', 'B', 'Souza', 'Av. Paulista, 1000', '1992-03-22'),
('Fernando', 'C', 'Pereira', 'Rua das Palmeiras, 45', '1980-11-10'),
('Juliana', 'D', 'Mendes', 'Rua Central, 50', '1995-08-05'),
('Roberto', 'E', 'Almeida', 'Av. Brasil, 200', '1982-12-30'),
('Jurandir', 'F', 'Sauro', 'Rua do Rio, 100', '1987-06-30');

-- Inserindo Fornecedores
INSERT INTO Fornecedor (razaoSocial, CNPJ) VALUES
('Heineken Distribuidora', '12345678000195'),
('Bebidas Premium', '98765432000188'),
('Cervejaria Nacional', '11223344000177');

-- Inserindo Produtos
INSERT INTO Produto (categoria, descricao, valor, statusProduto) VALUES
('Cerveja', 'Heineken 600ml', 10.99, 'Disponível'),
('Cerveja', 'Heineken 350ml', 7.50, 'Disponível'),
('Cerveja', 'Kit Heineken 6 Unidades', 60.00, 'Disponível'),
('Refrigerante', 'Coca-Cola 2L', 8.00, 'Disponível'),
('Água', 'Água Mineral 500ml', 2.50, 'Disponível');

-- Relacionando Fornecedores e Produtos
INSERT INTO Fornecedor_Produto (idFornecedor, idProduto) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

-- Inserindo Pedidos
INSERT INTO Pedido (statusDoPedido, descricao, idCliente, frete) VALUES 
('Em andamento', 'Pedido de teste 1', 1, 15.00),
('Processando', 'Pedido de teste 2', 2, 10.00),
('Enviado', 'Pedido de teste 3', 3, 12.50),
('Entregue', 'Pedido de teste 4', 4, 8.00),
('Em andamento', 'Pedido de teste 5', 5, 20.00),
('Processando', 'Pedido de teste 6', 5, 27.00);

-- Relacionando Produtos e Pedidos
INSERT INTO Produto_Pedido (idProduto, idPedido, quantidade) VALUES
(1, 1, '2'),
(2, 1, '1'),
(3, 2, '3'),
(4, 3, '4'),
(5, 4, '5');

-- Inserindo Pagamentos
INSERT INTO Pagamento (tipo, idPedido, valor) VALUES
('Cartão de Crédito', 1, 25.98),
('Pix', 2, 180.00),
('Dinheiro', 3, 50.00),
('Dois Cartões', 4, 90.00),
('Pix', 5, 200.00);

-- Inserindo Entregas
INSERT INTO Entrega (statusEntrega, codigoRastreio, idPedido) VALUES
('A Caminho', 'BR123456789', 1),
('Entregue', 'BR987654321', 2),
('Aguardando Coleta', 'BR567890123', 3),
('A Caminho', 'BR345678901', 4),
('Processando', 'BR876543210', 5);

-- Estoque
INSERT INTO Estoque (localEstoque) VALUES
('Rio de Janeiro - Centro'),
('Rio de Janeiro - Barra'),
('São Paulo - Centro'),
('São Paulo - Zona Norte');

-- PessoaFisica
INSERT INTO PessoaFisica (CPF, idCliente) VALUES
('12345678901', 1),
('23456789012', 2),
('34567890123', 3);

-- PessoaJuridica 
INSERT INTO PessoaJuridica (CNPJ, idCliente) VALUES
('12345678000195', 4),
('23456789000196', 5);

-- Produto-Estoque
INSERT INTO Produto_Estoque (idProduto, idEstoque, quantidade) VALUES
(1, 1, 100),
(1, 2, 150),
(2, 3, 200),
(3, 4, 50);

-- TerceiroVendedor
INSERT INTO TerceiroVendedor (razaoSocial, localTercVendedor, nomeFantasia, CNPJ) VALUES
('Distribuidora ABC Ltda', 'Rio de Janeiro - Centro', 'ABC Distribuidora', '12345678000195'),
('Vendas XYZ Ltda', 'São Paulo - Zona Norte', 'XYZ Vendas', '23456789000196');

-- Produto-TerceiroVendedor
INSERT INTO Produto_TerceiroVendedor (idProduto, idTerceiroVendedor, quantidade) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 1, 20);



