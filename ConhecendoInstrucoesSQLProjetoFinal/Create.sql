CREATE TAble Alunos (
	IdAluno int PRIMARY key,
    NomeAluno varchar(50),
    DataNascimento date,
    Genero varchar(50),
    Endereco varchar(50),
    TelContato varchar(50),
    Email varchar(50)
);

CREATE TAble Professores (
	IdProfessor int PRIMARY key,
    NomeProfessor varchar(50),
    DataNascimento date,
    Genero varchar(50),
    TelContato varchar(50),
    Email varchar(50)
);

CREATE TAble Disciplinas (
	IdDisciplina int PRIMARY key,
    NomeDisciplina varchar(50),
    Descricao text,
    CargaHoraria time,
    IdProfessor int,
  
  	FOREIGN key (IdProfessor) REFERENCES Professores(IdProfessor)
);

CREATE TAble Turmas (
	IdTurma int PRIMARY key,
    NomeTurma varchar(50),
    AnoLetivo date,
    IdProfessorOrientador int,
  
  	FOREIGN key (IdProfessorOrientador) REFERENCES Professores(IdProfessor)
);

CREATE TAble Turma_Disciplinas (
	IdTurma int,
	IdDisciplinas int,
  
  	FOREIGN key (IdTurma) REFERENCES Turmas(IdTurma),
  	FOREIGN key (IdDisciplinas) REFERENCES Disciplinas(IdDisciplina)
);

CREATE TAble Turma_Alunos (
	IdTurma int,
    IdAlunos int,
  
  	FOREIGN key (IdTurma) REFERENCES Turmas(IdTurma),
  	FOREIGN key (IdAlunos) REFERENCES Alunos(IdAluno)
);

CREATE TAble Notas (
	IdNota int PRIMARY key,
    IdAluno int,
    IdDisciplina int,
   	Nota decimal(2,1),
    DataAvaliacao date,
  
  	FOREIGN key (IdAluno) REFERENCES Alunos(IdAluno),
  	FOREIGN key (IdDisciplina) REFERENCES Disciplina(IdDisciplina)
);