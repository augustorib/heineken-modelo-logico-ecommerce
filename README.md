# Projeto Lógico E-commerce

## Objetivos

Este projeto faz parte de um bootcamp e tem como objetivo a criação de um modelo lógico para um sistema de e-commerce, incluindo a elaboração de scripts e consultas para responder a diversas perguntas e gerar informações relevantes.

## Requisitos para Criação de Consultas

As consultas devem abranger os seguintes aspectos:

- **Recuperações Simples**: Utilização do comando `SELECT` para obter dados básicos.
- **Filtros Específicos**: Aplicação de condições com `WHERE` para refinar os resultados.
- **Atributos Derivados**: Criação de expressões que gerem novos atributos baseados nos existentes.
- **Ordenação de Dados**: Organização dos resultados utilizando `ORDER BY`.
- **Filtros em Grupos**: Uso de `HAVING` para aplicar condições após a agregação de dados.
- **Junções entre Tabelas**: Combinação de dados de múltiplas tabelas para obter perspectivas mais complexas.

## Diretrizes

- Não há um número mínimo de consultas a serem realizadas.
- Todos os tópicos mencionados nos requisitos devem ser contemplados nas consultas.
- Elabore perguntas que possam ser respondidas pelas consultas desenvolvidas.
- As cláusulas podem estar presentes em mais de uma consulta, conforme necessário.

## Perguntas Sugeridas para Desenvolvimento de Consultas

1. Quantos pedidos foram feitos por cada cliente?
2. Algum vendedor também é fornecedor?
3. Qual a relação entre produtos, fornecedores e estoques?
4. Quais são os nomes dos fornecedores e os produtos que eles fornecem?
5. Quais clientes realizaram mais de um pedido?
6. Existem clientes que ainda não possuem classificação como PJ ou PF?
7. Qual é o valor total dos pagamentos realizados?
8. Qual é o valor total dos pagamentos por tipo de pagamento?
9. Quais pedidos estão atualmente a caminho?
10. Qual seria o valor com e sem desconto de 10% para pagamentos via Pix?

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- `projeto-fisico-ecommerce.sql`: Contém o script de criação do banco de dados e seu esquema.
- `ecommerce-inserts.sql`: Script para inserção de dados fictícios no banco de dados.
- `querys-teste.sql`: Inclui as consultas que respondem às perguntas listadas anteriormente.

## Como Utilizar

1. **Configuração do Banco de Dados**: Execute o script `projeto-fisico-ecommerce.sql` em seu SGBD para criar o esquema do banco de dados.
2. **Inserção de Dados**: Após a criação do esquema, execute o script `ecommerce-inserts.sql` para popular o banco com dados de exemplo.
3. **Execução das Consultas**: Utilize o script `querys-teste.sql` para executar as consultas e verificar as respostas para as perguntas propostas.

## Tecnologias
- MySQL 8

