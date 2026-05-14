select * From Disciplinas;

SELECT A.Nome_Aluno, N.nota from Notas N join Alunos A on N.ID_Aluno = A.ID_Aluno 
where N.Nota >= 7 and N.ID_Disciplina = (SELECT D.id_disciplina from Disciplinas D where D.Nome_Disciplina = 'Matemática');

SELECT T.Nome_Turma, Count(TD.ID_Disciplina) AS Qnt From Turmas T join Turma_Disciplinas TD on T.ID_Turma = TD.ID_Turma group BY T.Nome_Turma;


SELECT
COUNT(CASE WHEN Media_Notas >= 7 THEN 1 END) AS Qtd_Alunos_Aprovados,
COUNT(*) AS Qtd_Total_Alunos,
ROUND(AVG(CASE WHEN Media_Notas >= 7 THEN 1.0 ELSE 0 END) * 100.0, 2) || '%' AS Porcentagem
FROM(
  SELECT a.ID_Aluno, AVG(n.Nota) AS Media_Notas
  FROM Alunos a
  LEFT JOIN Notas n ON n.ID_Aluno = a.ID_Aluno
  GROUP BY a.ID_Aluno);
  
select D.Nome_Disciplina as Disciplina, ((100.0*count(Case when N.nota >= 7 then 1 end)/count(*)) || '%') as AprovadosPorDisciplina 
from Notas N join Disciplinas D on N.ID_Disciplina = D.ID_Disciplina
GROUP by Disciplina;