SELECT D.nomedepartamento, (SELECT AVG(C.salario) from TabelaColaboradores C where C.id_departamento = D.id_departamento) as SalarioMedio From TabelaDepartamento D;
SELECT C.nome, E.Valor From TabelaClientes C inner join TabelaEmprestimo E on C.id_cliente = E.id_cliente where E.Valor > (SELECT AVG(Valor) from TabelaEmprestimo);

select C.cidade, count(*) as TotalEmprestimosAtivos from TabelaClientes C inner join TabelaEmprestimo E on C.id_cliente = E.id_cliente 
where E.Status = 1 Group by C.cidade;

SELECT C.nome, C.email, E.valor from TabelaClientes C inner join TabelaEmprestimo E on C.id_cliente = E.id_cliente 
where EXISTS (SELECT 1 From TabelaPagamentos P where P.id_emprestimo = E.id_emprestimo and status = 'Pago');

SELECT C.nome, SC.Pontuacao From TabelaClientes C INNER JOIN TabelaScoreCredito SC on C.id_cliente = SC.id_cliente 
WHERE SC.Pontuacao > (SELECT AVG(pontuacao) from TabelaScoreCredito);

select D.NomeDepartamento, (SELECT MAX(salario) from TabelaColaboradores E where D.id_departamento = E.id_departamento) AS MaiorSalario from TabelaDepartamento D;
SELECT C.nome from TabelaClientes C where EXISTS ( select 1 FROM TabelaEmprestimo E WHERE E.id_cliente = c.id_cliente and status = 1);

SELECT E.Tipo, (SELECT AVG(P.Valor) from TabelaPagamentos P where P.id_emprestimo = E.id_emprestimo AND status = 'Pago') AS MediaPagamentos from TabelaEmprestimo E;

SELECT C.nome, 
(SELECT Co.numeroconta from TabelaConta Co where Co.id_conta = CC.id_conta) As NumeroConta,
(SELECT Co.tipoconta from TabelaConta Co WHERE Co.id_conta = CC.id_conta) as TipoConta,
(SELECT Co.saldo from TabelaConta Co WHERE Co.id_conta = CC.id_conta) as Saldo
From TabelaClientes C inner join TabelaClienteConta CC on C.id_cliente = CC.id_cliente;

SELECT C.cidade, (SELECT SUM(E.valor) from TabelaEmprestimo E where C.id_cliente = E.id_cliente) as ValorTotalEmprestimo from TabelaClientes C GROUP By C.cidade;