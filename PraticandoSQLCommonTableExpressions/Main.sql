WITH EmprestimosPendentes AS (
    SELECT Valor FROM TabelaEmprestimo WHERE Status = 0)
SELECT SUM(Valor) AS TotalEmprestimosPendentes FROM EmprestimosPendentes;

WITH ScoreAlto as (
  SELECT id_cliente, pontuacao from TabelaScoreCredito where pontuacao > 700)
SELECT C.id_cliente, C.nome, S.pontuacao from TabelaClientes C join ScoreAlto S on C.id_cliente = S.id_cliente;

with TotalSalario as (
  SELECT id_departamento, SUM(salario) AS TotalSalarios from TabelaColaboradores 
  GROUP by id_departamento)
  SELECT * from TotalSalario;
  
WITH TotalClientesEstado as (
  select Estado, Count(*) from TabelaClientes GROUP by Estado)
  SELECT * from TotalClientesEstado;
  
with MediaIdade as (
  select AVG(DATE('Now') - datanascimento) as Media from TabelaClientes),
IdadeCliente as (
  SELECT Nome, (DATE('Now') - datanascimento) as idade from TabelaClientes)
SELECT Nome, idade from IdadeCliente cross join MediaIdade where idade < Media;
 
with MaisContas as (
  SELECT id_cliente from TabelaClienteConta GROUP by id_cliente HAVING count(id_conta) >= 2),
ListaEmprestimo as (
  SELECT id_emprestimo, id_cliente, Sum(Valor) as Valor from TabelaEmprestimo GROUP by id_cliente)
SELECT E.id_emprestimo, E.id_cliente, E.valor from ListaEmprestimo E join  MaisContas C on E.id_cliente = C.id_cliente;

WITH PagamentosPorEmprestimo AS (
    SELECT id_emprestimo, SUM(Valor) AS TotalPagamentos FROM TabelaPagamentos GROUP BY id_emprestimo),
EmprestimosComPagamentosAltos AS (
  	SELECT id_emprestimo, TotalPagamentos FROM PagamentosPorEmprestimo WHERE TotalPagamentos >= 1000)
SELECT id_emprestimo, TotalPagamentos FROM EmprestimosComPagamentosAltos;

with SalarioDepartamento as (
  SELECT id_departamento, AVG(salario) as Salarios from TabelaColaboradores GROUP by id_departamento),
MediaDepartamento as (
  SELECT id_departamento, salarios from SalarioDepartamento where salarios > 4500)
SELECT * from MediaDepartamento;

with ClientesPendentes as (
  SELECT E.id_cliente from TabelaPagamentos P join TabelaEmprestimo E on P.id_emprestimo = E.id_emprestimo where P.status = 'Pendente'),
ClientesBaixaPontuacao as (
  select C.nome from ClientesPendentes CP join TabelaScoreCredito SC on CP.id_cliente = SC.id_cliente 
  join TabelaClientes C on CP.id_cliente = C.id_cliente where SC.Pontuacao < 500)
SELECT Nome from ClientesBaixaPontuacao;

with ContasApos2023 as (
  SELECT COUNT(*) as TotalContas from TabelaConta where strftime('%Y', dataabertura) >= '2023'),
MediaContasApos2023 as (
  SELECT AVG(Saldo) AS MediaSaldo from TabelaConta where strftime('%Y', dataabertura) >= '2023')
SELECT * from ContasApos2023 join MediaContasApos2023;