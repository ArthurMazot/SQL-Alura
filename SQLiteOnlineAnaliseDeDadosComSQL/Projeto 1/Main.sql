SELECT count(*) as NumeroClientes from clientes;
SELECT count(IV.produto_id) as QntVendas2022 from vendas V join itens_venda IV on V.id_venda = IV.venda_id where strftime('%Y', data_venda) = '2022';



SELECT C.nome_categoria, count(P.id_produto) as QntVendida
FROM itens_venda IV
JOIN vendas V ON V.id_venda = IV.venda_id
JOIN produtos P ON P.id_produto = IV.produto_id
JOIN categorias C ON C.id_categoria = P.categoria_id
WHERE strftime('%Y', V.data_venda) = '2022'
GROUP by C.nome_categoria
order by Count(*) DESC LIMIT 5;



SELECT MIN(strftime('%Y', data_venda)) AS Ano FROM vendas;



SELECT F.nome, Count(P.id_produto) as TotalVendas from itens_venda IV
JOIN vendas V ON V.id_venda = IV.venda_id
JOIN produtos P ON P.id_produto = IV.produto_id
join fornecedores F on F.id_fornecedor = P.fornecedor_id
where strftime('%Y', V.data_venda) = '2020'
GROUP by F.nome
order by count(P.id_produto) DESC LIMIT 1;



SELECT F.nome, strftime('%Y', v.data_venda) as Ano, Count(P.id_produto) as TotalVendas from itens_venda IV
JOIN vendas V ON V.id_venda = IV.venda_id
JOIN produtos P ON P.id_produto = IV.produto_id
join fornecedores F on F.id_fornecedor = P.fornecedor_id
where F.nome = 'HorizonDistributors' and strftime('%Y', V.data_venda) = '2020';



SELECT C.nome_categoria, count(P.id_produto) as QntVendida
FROM itens_venda IV
JOIN vendas V ON V.id_venda = IV.venda_id
JOIN produtos P ON P.id_produto = IV.produto_id
JOIN categorias C ON C.id_categoria = P.categoria_id
GROUP by C.nome_categoria
order by Count(*) DESC LIMIT 2;



SELECT "Ano/Mes", 
SUM(CASE WHEN NomeCategoria=='Eletrônicos' THEN QntVendida ELSE 0 END) AS Eletrônicos,
SUM(CASE WHEN NomeCategoria=='Vestuário' THEN QntVendida ELSE 0 END) AS Vestuário
from(
    SELECT C.nome_categoria AS NomeCategoria, count(*) as QntVendida, strftime('%Y/%m', V.data_venda) AS "Ano/Mes"
    FROM itens_venda IV
    JOIN vendas V ON V.id_venda = IV.venda_id
    JOIN produtos P ON P.id_produto = IV.produto_id
    JOIN categorias C ON C.id_categoria = P.categoria_id
    where C.nome_categoria in ('Eletrônicos', 'Vestuário')
    GROUP by "Ano/Mes", NomeCategoria
    order by "Ano/Mes", NomeCategoria
    )
GROUP by "Ano/Mes";



WITH Total_Vendas AS (
SELECT COUNT(*) as Total_Vendas_2022
From itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
WHERE strftime('%Y', v.data_venda) = '2022'
)
SELECT Nome_Categoria, Qtd_Vendas, ROUND(100.0*Qtd_Vendas/tv.Total_Vendas_2022, 2) || '%' AS Porcentagem
FROM(
  SELECT c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
  from itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN categorias c ON c.id_categoria = p.categoria_id
  WHERE strftime('%Y', v.data_venda) = '2022'
  GROUP BY Nome_Categoria
  ORDER BY Qtd_Vendas DESC
  ), Total_Vendas tv;
  
  
  
WITH Total_Vendas AS (
  SELECT COUNT(*) as Total_Vendas_2022
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  WHERE strftime('%Y', v.data_venda) = '2022'
),
Vendas_Por_Categoria AS (
  SELECT 
    c.nome_categoria AS Nome_Categoria, 
    COUNT(iv.produto_id) AS Qtd_Vendas
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN categorias c ON c.id_categoria = p.categoria_id
  WHERE strftime('%Y', v.data_venda) = '2022'
  GROUP BY Nome_Categoria
),
Melhor_Pior_Categorias AS (
  SELECT 
    MIN(Qtd_Vendas) AS Pior_Vendas, 
    MAX(Qtd_Vendas) AS Melhor_Vendas
  FROM Vendas_Por_Categoria
)
SELECT 
  Nome_Categoria, 
  Qtd_Vendas, 
  ROUND(100.0*Qtd_Vendas/tv.Total_Vendas_2022, 2) || '%' AS Porcentagem,
  ROUND(100.0*(Qtd_Vendas - Melhor_Vendas) / Melhor_Vendas, 2) || '%' AS Porcentagem_Mais_Que_Melhor
FROM Vendas_Por_Categoria
CROSS JOIN Total_Vendas tv
CROSS JOIN Melhor_Pior_Categorias;