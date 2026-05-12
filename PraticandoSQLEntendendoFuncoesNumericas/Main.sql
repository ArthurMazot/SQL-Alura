select mes, ano, quantidade*precounitario as Receita, quantidade*custounitario as Despesas from TabelaVendasMensais;
select mes, ano, quantidade*(precounitario - custounitario) AS LucroBruto from TabelaVendasMensais;
SELECT mes, ano, ROUND(100.0*((precounitario - custounitario))/precounitario ,1) AS 'Margem Lucro Bruto (%)' from TabelaVendasMensais;
select mes, ano, ROUND(quantidade*(precounitario - 1.3*custounitario), 2) AS LucroLiquido from TabelaVendasMensais;
select id_pedido, quantidadevendida, CEIL(quantidadevendida/8.0) As QntCaixas from TabelaPedidos;
select id_pedido, quantidadevendida, precounitario, desconto, FLOOR(quantidadevendida*precounitario*(1-desconto)) AS PrecoTotal from TabelaPedidos;
SELECT mes, ano, ABS(vendasmensais - mediavendas5anos) as DiferencaAbsolutaVendas from TabelaMetasVendasMensais;
select ano, vendasbase, FLOOR(power(1+taxacrescimento, 5)*vendasbase) as VendasProjecao5Anos from TabelaEstimativaCrescimento;

select id_pedido, cidadecliente, ROUND(SQRT(POWER(latitude - (-23.588161), 2) + POWER(longitude - (-46.632344), 2))*111.19, 1) as Distancia, 
case 
when ROUND(SQRT(POWER(latitude - (-23.588161), 2) + POWER(longitude - (-46.632344), 2))*111.19, 1) < 60 then 'Entrega Gratuita'
else 'Cobrar Entrega'
end as statusEntrega from TabelaPedidos;

SELECT id_pedido, cidadecliente, ROUND(SQRT(POWER(latitude - (-23.588161), 2) + POWER(longitude - (-46.632344), 2))*111.19, 1) AS Distancia, 
case 
when ROUND(SQRT(POWER(latitude - (-23.588161), 2) + POWER(longitude - (-46.632344), 2))*111.19, 1) < 60 then 0 
else 50.0*CEIL(quantidadevendida/8.0)
end AS Frete from TabelaPedidos;