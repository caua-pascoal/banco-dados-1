USE basevendasv2;

-- 1 
-- SELECT c.nome, SUM(v.valor_total) as valor_total
-- FROM cliente c
-- JOIN venda v on v.cliente_id = c.id
-- WHERE v.valor_total > ( SELECT AVG(ve.valor_total) FROM venda ve ) AND
--     v.data_venda like '2006%'
-- GROUP BY c.id;

-- 2
-- SELECT f.nome, COUNT(DISTINCT c.id) as qtd_clientes
-- FROM fornecedor f
-- JOIN produto p on p.fornecedor_id = f.id
-- JOIN produto_vendido pv on pv.produto_id = p.id
-- JOIN venda v on pv.venda_id = v.id
-- JOIN cliente c on v.cliente_id = c.id
-- GROUP BY f.id;

-- 3 
-- SELECT p.principio_ativo
-- FROM produto p
-- JOIN produto_vendido pv on pv.produto_id = p.id
-- GROUP BY p.principio_ativo
-- ORDER BY SUM(pv.quantidade) DESC
-- LIMIT 10;

-- 4
-- SELECT CONCAT(b.nome, ' - ', ci.nome) as bairro_cidade, COUNT(v.id) as qtd_vendas
-- FROM cidade ci
-- JOIN bairro b on b.cidade_id = ci.id
-- JOIN cliente c on c.bairro_id = b.id
-- JOIN venda v on v.cliente_id = c.id
-- JOIN produto_vendido pv on pv.venda_id = v.id
-- JOIN produto p on pv.produto_id = p.id
-- WHERE p.principio_ativo like '% %' AND p.principio_ativo NOT LIKE '% % %'
-- GROUP BY bairro_cidade;

-- 5
-- SELECT ve.nome
-- FROM vendedor ve
-- JOIN cliente c on c.vendedor_id = ve.id
-- JOIN bairro b on b.id = c.bairro_id
-- JOIN cidade ci on ci.id = b.cidade_id
-- JOIN uf on uf.id = ci.uf_id
-- JOIN venda v on v.cliente_id = c.id
-- JOIN produto_vendido pv on pv.venda_id = v.id
-- JOIN produto p on pv.produto_id = p.id
-- WHERE v.data_venda LIKE '2006%'
--     AND ( 
--         uf.sigla = 'MG' OR
--         uf.sigla = 'RJ' OR
--         uf.sigla = 'SP' OR
--         uf.sigla = 'ES' )
-- GROUP BY ve.id
-- ORDER BY SUM( IF ( pv.valor_unitario - p.preco_custo > 0, pv.valor_unitario - p.preco_custo, 0 ) * pv.quantidade ) DESC;

-- 6
-- SELECT MONTH(v.data_venda) as mes, SUM(v.valor_total) as valor_total
-- FROM venda v
-- WHERE v.data_venda like '2006%'
-- GROUP BY mes;

-- 7
-- SELECT c.nome as cliente
-- FROM cliente c 
-- JOIN venda v on v.cliente_id = c.id
-- JOIN produto_vendido pv on pv.venda_id = v.id
-- JOIN produto p on pv.produto_id = p.id
-- WHERE p.preco_custo > ( SELECT AVG(pr.preco_custo) FROM produto pr )
-- GROUP BY c.id
-- HAVING SUM(pv.quantidade) > 50
-- ORDER BY SUM(pv.quantidade) DESC
-- LIMIT 5;

-- 8
-- SELECT ci.nome
-- FROM cidade ci
-- JOIN bairro b on b.cidade_id = ci.id
-- JOIN cliente c on c.bairro_id = b.id
-- JOIN venda v on v.cliente_id = c.id
-- GROUP BY ci.id
-- ORDER BY SUM(v.valor_total) DESC
-- LIMIT 3;

-- 9 
-- SELECT MONTH(v.data_venda) as mes
-- FROM venda v
-- JOIN produto_vendido pv on pv.venda_id = v.id
-- WHERE v.data_venda like '2006%'
-- GROUP BY mes
-- LIMIT 1;

-- 10
-- SELECT f.nome
-- FROM fornecedor f
-- JOIN produto p on p.fornecedor_id = f.id
-- JOIN produto_vendido pv on pv.produto_id = p.id
-- JOIN venda v on v.id = pv.venda_id
-- WHERE v.data_venda like '2006%'
-- GROUP BY f.id
-- ORDER BY SUM(v.valor_total) DESC
-- LIMIT 1;

-- 11
-- DESCRIBE produto;
-- ALTER TABLE produto 
--     ADD CONSTRAINT FOREIGN KEY fk_produto__tipo_produto_id(tipo_produto_id) REFERENCES tipo_produto(id) ON DELETE RESTRICT ON UPDATE CASCADE,
--     ADD CONSTRAINT FOREIGN KEY fk_produto__fornecedor_id(fornecedor_id) REFERENCES fornecedor(id) ON DELETE RESTRICT ON UPDATE CASCADE;

-- 12
-- SELECT f.nome 
-- FROM fornecedor f 
-- WHERE f.id IN (
--     SELECT p.fornecedor_id
--     FROM produto p
--     WHERE p.id IN (
--         SELECT pv.produto_id
--         FROM produto_vendido pv
--         WHERE pv.venda_id IN (
--             SELECT v.id
--             FROM venda v
--             WHERE YEAR(v.data_venda) = '2006'
--         )
--     )
-- );