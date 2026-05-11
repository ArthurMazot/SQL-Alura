select ('Média em História: ' || cast(round(avg(nota),2) as TEXT)) 
from Notas inner join Disciplinas on Notas.ID_Disciplina = Disciplinas.ID_Disciplina 
WHERE Nome_Disciplina = 'História';

SELECT * from Alunos where nome_aluno LIKE 'A%';
SELECT * from Alunos WHERE cast(STRFTIME('%m', data_nascimento) as TEXT) = '02';
SELECT *, (DATE('now') - data_nascimento) As Idade from Alunos;

SELECT A.nome_aluno, D.nome_disciplina, N.nota,
case
When N.nota >= 6 then 'Aprovado'
else 'Reprovado' end as Resultado
from Alunos as A 
INNER join Notas as N on A.ID_Aluno = N.ID_Aluno
INNER join Disciplinas as D on D.ID_Disciplina = N.ID_Disciplina;