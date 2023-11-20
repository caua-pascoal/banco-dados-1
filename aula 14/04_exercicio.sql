Use basevendasv2;

-- 1) Considerando estoque normal a partir de 20, estoque crítico menor que 20 e estoque zerado com valor igual a zero, 
-- listar id, descrição, estoque e a situacao do estoque de todos os produtos utilizando case.

-- select id, descricao, estoque,
--    case 
--         WHEN estoque >= 20 THEN 'normal'
--         When estoque < 20 THEN 'crítico'
--     END as situcacao_estoque
-- FROM produto;

-- 2) Considerando estoque normal a partir de 20 e estoque crítico menor que 20 
-- listar id, descrição, estoque e a situacao do estoque de todos os produtos utilizando IF ternário.

-- select id, descricao, estoque,
--    if (estoque >= 20, 'normal', 'crítico' ) as situacao_estoque
-- FROM produto;


-- 3) Considere as seguintes informações sobre as regiões do país
-- SUL --> 'PR', 'RS', 'SC'
-- SUDESTE --> 'SP', 'RJ', 'ES', 'MG'
-- Centro-Oeste --> 'MT', 'MS', 'GO'
-- Nordeste --> 'BA', 'AL', 'SE', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA'
-- Norte --> 'AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC'
-- Liste o nome do fornecedor, o nome da cidade, a sigla da UF e a região de todos os fornecedores

-- select f.nome, c.nome, uf.sigla,
--     case
--         wheN uf.sigla in ('PR', 'RS', 'SC') THEN 'SUL'
--         wheN uf.sigla in ('SP', 'RJ', 'ES', 'MG') THEN 'SUDESTE'
--         wheN uf.sigla in ('MT', 'MS', 'GO') THEN 'CENTRO-OESTE'
--         wheN uf.sigla in ('BA', 'AL', 'SE', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA') THEN 'NORDESTE'
--         wheN uf.sigla in ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC') THEN 'NORTE'
--     END as regiao
--     from fornecedor f
-- join cidade c on c.id = f.cidade_id
-- join uf on uf.id = c.uf_id;



-- 4) Listar o nome do fornecedor, a descrição do produto, o estoque e o preço de custo dos produtos 
-- incluindo os fornecedores que não possuem produtos relacionados. Use case para ordenar. 
-- Se o nome do produto for nulo, ordene pelo fornecedor. Caso contrário, ordene pelo estoque.

-- select f.nome, p.descricao, p.estoque, p.preco_custo
-- from produto p
-- LEFT join fornecedor f on p.fornecedor_id = f.id 
-- order by (if(p.descricao is not null, p.estoque, f.nome));

-- 5)Sem utilizar a função date_format,listar as datas completas(no formato dia/mes/ano) e 
-- a descrição do dia da semana dos dias em que houve vendas para clientes com o nome iniciado por A,C e H em 2006. 
-- Ordenar pela data da venda. Dica: use funções de data, case e subconsulta.

-- select DISTINCT CONCAT( day(data_venda), '/', month(data_venda), '/', year(data_venda) ) as data,
--     case 
--         WHEN weekday(data_venda) = 0 THEN 'Segunda'
--         WHEN weekday(data_venda) = 1 THEN 'Terça'
--         WHEN weekday(data_venda) = 2 THEN 'Quarta'
--         WHEN weekday(data_venda) = 3 THEN 'Quinta'
--         WHEN weekday(data_venda) = 4 THEN 'Sexta'
--         WHEN weekday(data_venda) = 5 THEN 'Sábado'
--         WHEN weekday(data_venda) = 6 THEN 'Domingo'
--         end
-- from venda 
-- where cliente_id IN (select id from cliente where substring(nome,1,1) in ('A','C','H')) and data_venda like '2006%'
-- order by data;

-- 6) Utilizando a função date_format,listar as datas completas(no formato dd/mm/yyyy) e a descrição do dia da semana dos dias em que houve vendas para clientes com o nome iniciado por A,C e H em 2006. Ordenar pela data da venda. Dica: use funções de data, case e subconsulta.

-- select DISTINCT date_format(data_venda, '%d/%c/%Y') as data, date_format(data_venda, '%W')
-- from venda 
-- where cliente_id IN (select id from cliente where substring(nome,1,1) in ('A','C','H')) and data_venda like '2006%'
-- order by data;