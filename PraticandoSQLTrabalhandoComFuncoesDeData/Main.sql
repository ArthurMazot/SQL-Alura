SELECT CURRENT_TIMESTAMP;
SELECT nome, strftime('%Y-%m-%d',datanascimento) as DataFormatada from TabelaClientes;
select id_emprestimo, JULIANDAY(date(datainicio, '+' || prazo || ' DAY')) - JULIANDAY(datainicio) AS DiasTotais from TabelaEmprestimo;
SELECT nome, strftime('%Y', datanascimento) as AnoNascimento from TabelaClientes;
SELECT * from TabelaEmprestimo where datainicio BETWEEN '2023-01-01' and '2023-03-31';
SELECT id_emprestimo, datainicio, date(datainicio, '+' || prazo || ' DAY') as DataVecimento from TabelaEmprestimo;
SELECT * from TabelaPagamentos order by datapagamento ASC;
SELECT Nome, (strftime('%Y', 'now') - strftime('%Y', datanascimento) - (strftime('%m', 'now') < strftime('%m', DataNascimento))) as Idade from TabelaClientes;

SELECT id_emprestimo, 
case 
when (DATE(datainicio, '+' || prazo || ' DAY') < DATE('now')) then 'Vencido'
else 'Válido' end
as StatusEmprestimo 
from TabelaEmprestimo;

SELECT id_emprestimo, datainicio, DATE(datainicio, '+30 DAYS') as ProximoPagamento from TabelaEmprestimo;