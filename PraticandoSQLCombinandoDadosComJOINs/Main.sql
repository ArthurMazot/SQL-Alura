SELECT C.nomecolaborador, D.nomedepartamento from TabelaColaboradores C inner join TabelaDepartamento D on C.id_departamento = D.id_departamento;
SELECT C.id_cliente, C.nome, T.telefone from TabelaClientes C LEFT join TabelaTelefones T on C.id_cliente = T.id_cliente;
select CO.NomeColaborador, CL.nome as NomeCliente from TabelaColaboradores CO left join TabelaClientes CL on CO.id_colaborador = CL.id_colaborador;
SELECT C.Nome as NomeCliente, E.Tipo as TipoEmprestimo, E.Valor from TabelaClientes C Full join TabelaEmprestimo E on C.id_cliente = E.id_cliente;

SELECT C.Nome as NomeCliente, E.Tipo as TipoEmprestimo, E.Valor AS ValorEmprestimo, P.DataPagamento, P.Valor as ValorPago
from TabelaClientes C INNER join TabelaEmprestimo E on C.id_cliente = E.id_cliente
INNER JOIN TabelaPagamentos P on E.id_emprestimo = P.id_emprestimo;

SELECT C.nome as Ciente, SUM(E.valor) as TotalEmprestimos from TabelaClientes C INNER join TabelaEmprestimo E on C.id_cliente = E.id_cliente 
Group by C.nome HAVING SUM(E.Valor) > 10000;

SELECT E.tipo as TipoEmprestimo, E.Valor, 
Case when Status = 1 then 'Ativo' else 'Inativo'
end as Status From TabelaEmprestimo E;

SELECT C.Nome as NomeCliente, C.cidade, CO.nomecolaborador, D.nomedepartamento 
from TabelaClientes C inner join TabelaColaboradores CO on C.id_colaborador = CO.id_colaborador 
inner join TabelaDepartamento D on CO.id_departamento = D.id_departamento where C.Cidade = 'São Paulo';

SELECT C.nome as NomeCliente, E.Valor as ValorEmprestimo From TabelaClientes C inner join TabelaEmprestimo E on C.id_cliente = E.id_cliente 
where E.Valor > (SELECT AVG(Valor) from TabelaEmprestimo);

SELECT C.nomecolaborador, D.nomedepartamento, C.emailcolaborador as Email 
from TabelaColaboradores C FULL join TabelaDepartamento D on C.id_departamento = D.id_departamento;