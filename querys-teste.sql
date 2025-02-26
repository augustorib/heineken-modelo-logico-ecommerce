-- 1) Quantos pedidos foram feitos por cada cliente?
SELECT 
	concat(C.Pnome, " ",NmeioInicial ) Cliente , count(P.idPedido) as QuantidadePedidos
FROM 
	CLIENTE C
    JOIN PEDIDO P ON P.idCliente = C.idCliente
GROUP BY 
	concat(C.Pnome, " ", NmeioInicial );
    

-- 2) Algum vendedor também é fornecedor?
SELECT 
	V.razaoSocial, V.Nomefantasia, V.localTercVendedor
FROM
	TerceiroVendedor V 
    JOIN Fornecedor F ON V.CNPJ = F.CNPJ;

-- 3) Relação de produtos fornecedores e estoques
SELECT
	F.*, E.*
FROM
	Fornecedor F 
    JOIN Fornecedor_Produto FP ON F.idFornecedor = FP.idFornecedor
    JOIN Produto P ON P.idproduto = FP.idProduto
    JOIN Produto_Estoque PE ON PE.idProduto = P.idProduto
    JOIN Estoque E ON E.idEstoque = PE.idEstoque;

-- 4) Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
	F.razaoSocial, P.Descricao
FROM 
	Fornecedor F
    NATURAL JOIN Fornecedor_Produto FP 
    NATURAL JOIN Produto P
ORDER BY 
	F.razaoSocial;


-- 5) Retornar clientes que tiveram mais de um pedido
SELECT 
	C.Pnome , count(P.idPedido) as QuantidadePedidos
FROM 
	CLIENTE C
    JOIN PEDIDO P ON P.idCliente = C.idCliente
GROUP BY 
	C.Pnome
Having
	count(P.idPedido) > 1;
    
    
-- 6) Encontrar clientes  que ainda não possuem especialização de PJ ou PF
SELECT 
	*
FROM
	Cliente C 
    left JOIN PessoaFisica PF ON PF.idCliente = C.idCliente
    left JOIN PessoaJuridica PJ ON PJ. idCliente = C.idCliente
WHERE
	PF.idPessoaFisica is null and 
    PJ.idPessoaJuridica is null;
    
-- 7) Verificar o valor total de pagamentos
SELECT 
	CONCAT("R$ ", ROUND(SUM(P.Valor),2)) AS TOTAL
FROM 
	PAGAMENTO P;

-- 8) Verificar o valor total de pagamentos por tipo
SELECT 
	P.Tipo , CONCAT("R$ ", ROUND(SUM(P.Valor),2)) AS TOTAL
FROM 
	PAGAMENTO P
GROUP BY
    P.tipo;
    
-- 9) Mostrar pedidos que estejam a caminho
SELECT
	P.Descricao
FROM
	Pedido P
    JOIN (select * from Entrega E where E.statusEntrega = "A Caminho") PedidosACaminho ON P.idPedido = PedidosACaminho.idPedido;
    
-- 10) Calcular desconto 10% no pagamento PIX mostrar valor com e sem desconto
SELECT
	P.Tipo,
	CONCAT("R$ ", P.valor) as Valor,
    "Não tem desconto" as Desconto
FROM 
	Pagamento P
where
	P.TIPO <> "Pix"
    
UNION

SELECT
	P.Tipo,
	case when P.tipo = "Pix" THEN CONCAT("R$ ",ROUND((P.valor * 0.9),2)) ELSE P.valor END AS Valor,
    "Tem desconto" as Desconto
FROM 
	Pagamento P
where
	P.TIPO = "Pix";

	
