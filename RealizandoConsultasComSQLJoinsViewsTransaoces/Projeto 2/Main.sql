select P.Nome_Professor, T.Nome_Turma From Professores P INNER join Turmas T on P.ID_Professor = T.ID_Professor_Orientador;

SELECT A.nome_aluno, N.nota From Alunos A INNER join Notas N on A.ID_Aluno = N.ID_Aluno 
inner join Disciplinas D on N.ID_Disciplina = D.ID_Disciplina 
where D.Nome_Disciplina = 'Matemática' order by N.Nota DESC LIMIT 1;

SELECT T.Nome_Turma, count(TA.id_Aluno) as TotalAlunos from Turmas T join Turma_Alunos TA on T.ID_Turma = TA.ID_Turma GROUP by T.Nome_Turma;

SELECT nome_aluno, nome_disciplina from Alunos A 
join Turma_Alunos TA on A.ID_Aluno = TA.ID_Aluno 
join Turma_Disciplinas TD on TA.ID_Turma = TD.ID_Turma
join Disciplinas D on D.ID_Disciplina = TD.ID_Disciplina;

create view AlunosDisplinaNota AS
SELECT nome_aluno, nome_disciplina, nota from Alunos A 
join Notas N on A.ID_Aluno = N.ID_Aluno 
join Disciplinas D on N.ID_Disciplina = D.ID_Disciplina;