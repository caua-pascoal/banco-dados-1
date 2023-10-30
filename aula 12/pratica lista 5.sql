/*Lista de Exercícios n° 5*/
Use basevendasv2;
-- 1)Listar o nome do cliente e a data da venda de todas as vendas com valor acima da média
-- Tabelas identificadas: 

SELECT c.nome, v.data_venda FROM cliente c 
JOIN venda v on v.cliente_id = c.id
WHERE v.valor_total > (SELECT AVG(valor_total) FROM venda);

-- 2) Listar o nome do(s) produto(s) mais caro(s)

SELECT produto.descricao from produto where produto.preco_custo = (select max(preco_custo) from produto);

-- 3) Listar os 10 clientes que mais compraram em valor no ano de 2006. Exibir o nome do cliente e o valor comprado.
-- Tabelas identificadas: 

SELECT c.nome, sum(v.valor_total) as total FROM cliente c 
JOIN venda v on v.cliente_id = c.id
WHERE SUBSTRING(v.data_venda, 1, 4) = '2006'
group BY c.id
order by total DESC
limit 10;

-- 4) Listar os 5 produtos mais vendidos em quantidade no ano de 2006. 
-- Só interessam os produtos que venderam acima de 10 unidades.
-- Exibir o nome dos produtos e a quantidade vendida
-- Tabelas identificadas: 

SELECT p.descricao, sum(pv.quantidade) as quantidade from produto p
join produto_vendido pv on p.id = pv.produto_id
join venda v on pv.venda_id = v.id
WHERE SUBSTRING(v.data_venda, 1, 4) = '2006'
GROUP by p.id
HAVING quantidade > 10
order by quantidade DESC
limit 10;

-- 5) Listar os 10 fornecedores da UF ‘SP’ com mais produtos cadastrados. 
-- Só me interessam os forneedores que possuem mais de 5 produtos cadastrados.
-- Exibir o nome do fornecedor e a quantidade de produtos cadastrados
-- Tabelas identificadas: 

SELECT f.nome, count(p.id) as quantidade from fornecedor f 
join cidade c on c.id = f.cidade_id
join uf on c.uf_id = uf.id
join produto p on p.fornecedor_id = f.id
where uf.sigla = "SP"
group by f.id
having quantidade > 5
order by quantidade desc
limit 10;