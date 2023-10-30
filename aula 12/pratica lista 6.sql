
/*Lista de Exercícios n° 6*/
Use basevendasv2;
-- 1) Listar o nome dos fornecedores ( apenas 1 de cada ) que tiverem produtos com estoque acima da média 
-- vendidos no ano de 2006.
-- Tabelas identificadas: 

select distinct f.nome from fornecedor f 
join produto p on p.fornecedor_id = f.id
join produto_vendido pv on pv.produto_id = p.id
join venda v on v.id = pv.venda_id
where substring(v.data_venda, 1, 4 ) = '2006'
	AND p.estoque > (select avg(estoque) from produto);
 
-- 2) Listar apenas o nome dos vendedores que acumularam comissão acima de 200,00 em todas as vendas. 
-- Tabelas identificadas: 

select ve.nome from vendedor ve 
JOIN cliente c on c.vendedor_id = ve.id
join venda v on v.cliente_id = c.id
group by ve.id
having total > 200;


-- 3) Monte uma consulta que  mostre quantos fornecedores existem por cidade e uf 
-- ( que deve ser exibido no formato : cidade – uf. Exemplo: NOVA FRIBURGO - RJ )  
-- ordenando do maior para o menor. Obs: Só quero as combinações com mais de um fornecedor. 
-- Tabelas identificadas: 

select concat( c.nome, " - ", uf.sigla ) as "cidade - uf", count(f.id) as quantidade_fornecedores from uf
join cidade c on c.uf_id = uf.id
JOIN fornecedor f on f.cidade_id = c.id
group by uf.sigla, c.nome
having quantidade_fornecedores > 1
order by quantidade_fornecedores;


-- 4) Construa uma consulta que retorne os anos(somente um de cada) em que houve cadastro de clientes.

Select distinct substring(c.data_cadastro,1,4) as ano from cliente c
where c.data_cadastro is not null;

-- 5) Escreva os comandos para:
-- a.	Mostrar a estrutura da tabela produto:

show columns from produto;
describe produto;

-- b.	Excluir a tabela produto (ATENÇÃO! Não é para executar. Senão a base vai ficar capenga):

-- drop table produto;

-- 6) Construa uma consulta que:
-- c.	 retorne todos os clientes cujo nome termine com 'SILVA':

select * from cliente where cliente.nome like '%SILVA';

-- d.	todos os clientes cujo nome começa com 'MARIA'

select * from cliente where cliente.nome like 'MARIA%';