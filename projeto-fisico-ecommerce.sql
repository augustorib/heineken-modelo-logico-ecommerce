

-- -----------------------------------------------------
-- heineken-ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heineken-ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `heineken-ecommerce` ;

-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Pnome VARCHAR(10) NOT NULL,
  NmeioInicial VARCHAR(3) NULL,
  Sobrenome VARCHAR(20) NULL COMMENT 'Adicionar constraint de unicidade para (nome completo) unique (Nome, M, Sobrenome)',
  endereco VARCHAR(45) NULL,
  DataNascimento DATE NOT NULL,
  constraint unique_nome_completo Unique (Pnome, NmeioInicial, Sobrenome)
);


-- -----------------------------------------------------
-- Table Pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pedido (
  idPedido INT NOT NULL  PRIMARY KEY  AUTO_INCREMENT,
  statusDoPedido ENUM("Em andamento", "Processando", "Enviado", "Entregue") NOT NULL,
  descricao VARCHAR(45) NULL,
  idCliente INT NOT NULL,
  frete FLOAT NULL,
  CONSTRAINT fk_Pedido_Cliente1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table Produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Produto (
  idProduto INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  categoria VARCHAR(45) NULL,
  descricao VARCHAR(45) NULL,
  valor FLOAT NOT NULL,
  statusProduto ENUM("Disponível", "Indisponível") NULL DEFAULT 'Disponível'
  );


-- -----------------------------------------------------
-- Table Fornecedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fornecedor (
  idFornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  razaoSocial VARCHAR(45) NOT NULL,
  CNPJ VARCHAR(16) NOT NULL,
  constraint unique_razaoSocial UNIQUE (razaoSocial), 
  constraint unique_CNPJ UNIQUE (CNPJ) 
);


-- -----------------------------------------------------
-- Table Fornecedor_Produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fornecedor_Produto (
  idFornecedor INT NOT NULL,
  idProduto INT NOT NULL,
  PRIMARY KEY (idFornecedor, idProduto),
  CONSTRAINT fk_Fornecedor_has_Produto_Fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor (idFornecedor) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Fornecedor_has_Produto_Produto FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) ON DELETE NO ACTION ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table Estoque
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Estoque (
  idEstoque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  localEstoque VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table Produto_Estoque
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Produto_Estoque (
  idProduto INT NOT NULL,
  idEstoque INT NOT NULL,
  quantidade INT NULL,
  PRIMARY KEY (idProduto, idEstoque),
  CONSTRAINT fk_Produto_has_Estoque_Produto1 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Produto_has_Estoque_Estoque1 FOREIGN KEY (idEstoque) REFERENCES Estoque (idEstoque) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table Produto_Pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Produto_Pedido (
  idProduto INT NOT NULL,
  idPedido INT NOT NULL,
  quantidade VARCHAR(45) NOT NULL,
  PRIMARY KEY (idProduto, idPedido),
  CONSTRAINT fk_Produto_has_Pedido_Produto1 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Produto_has_Pedido_Pedido1 FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table Terceiro - Vendedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TerceiroVendedor (
  idTerceiroVendedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  razaoSocial VARCHAR(45) NOT NULL,
  localTercVendedor VARCHAR(45) NULL,
  nomeFantasia VARCHAR(45) NOT NULL,
  CNPJ VARCHAR(16) NULL,
  constraint unique_razaoSocial_tercVendedor UNIQUE(razaoSocial),
  constraint unique_CNPJ_tercVendedor UNIQUE(CNPJ)
);


-- -----------------------------------------------------
-- Table Produto_TerceiroVendedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Produto_TerceiroVendedor (
  idProduto INT NOT NULL,
  idTerceiroVendedor INT NOT NULL,
  quantidade VARCHAR(45) NULL,
  PRIMARY KEY (idProduto, idTerceiroVendedor),
  CONSTRAINT fk_Produto_has_TerceiroVendedor_Produto1 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Produto_has_TerceiroVendedor_TerceiroVendedor1 FOREIGN KEY (idTerceiroVendedor) REFERENCES TerceiroVendedor (idTerceiroVendedor) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table PessoaFisica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PessoaFisica (
  idPessoaFisica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CPF CHAR(11) NOT NULL,
  idCliente INT NOT NULL,
  CONSTRAINT unique_CPF UNIQUE (CPF),
  CONSTRAINT fk_PessoaFisica_Cliente1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON DELETE NO ACTION ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table PessoaJuridica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PessoaJuridica (
  idPessoaJuridica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CNPJ VARCHAR(16) NOT NULL,
  IdCliente INT NOT NULL,
  Constraint unique_CNPJ_PJ UNIQUE (CNPJ),
  CONSTRAINT fk_PessoaJuridica_Cliente1 FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON DELETE NO ACTION ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table Pagamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pagamento (
  idPagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM("Dinheiro", "Pix", "Cartão de Crédito", "Dois Cartões") NULL,
  idPedido INT NOT NULL,
  valor FLOAT NOT NULL,
  CONSTRAINT fk_Pagamento_Pedido1 FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table Entrega
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Entrega (
  idEntrega INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  statusEntrega VARCHAR(45) NULL,
  codigoRastreio VARCHAR(45) NULL,
  idPedido INT NOT NULL,
  CONSTRAINT fk_Entrega_Pedido1 FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido) ON DELETE NO ACTION ON UPDATE NO ACTION
);

