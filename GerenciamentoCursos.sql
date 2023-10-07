CREATE DATABASE GerenciamentoC;

USE GerenciamentoC;

DROP DATABASE GerenciamentoC;

CREATE TABLE Cursos(
CursoId INT PRIMARY KEY AUTO_INCREMENT,
NomeCurso VARCHAR(45) NOT NULL,
Professor VARCHAR(255) NOT NULL,
DataInicio DATE NOT NULL,
DataFim DATE NOT NULL
);

INSERT INTO Cursos(NomeCurso, Professor, DataInicio, DataFim) VALUES ('Administração', 'Thalita', '2022-06-22', '2022-07-22');
INSERT INTO Cursos(NomeCurso, Professor, DataInicio, DataFim) VALUES ('Direito', 'Maria', '2023-08-21', '2023-07-22');
INSERT INTO Cursos(NomeCurso, Professor, DataInicio, DataFim) VALUES ('Medicina', 'João', '2018-06-23', '2018-07-22');
INSERT INTO Cursos(NomeCurso, Professor, DataInicio, DataFim) VALUES ('Logística', 'Pedro', '2020-07-24', '2020-07-22');
INSERT INTO Cursos(NomeCurso, Professor, DataInicio, DataFim) VALUES ('Engenharia', 'Joana', '2021-09-25', '2021-07-22');

DROP TABLE Cursos;

CREATE TABLE Alunos(
Matricula INT PRIMARY KEY AUTO_INCREMENT,
NomeAluno VARCHAR(255) NOT NULL,
DataNascimento DATE NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Telefone VARCHAR(25) NOT NULL,
IdCurso INT NOT NULL,
FOREIGN KEY (IdCurso) REFERENCES Cursos (CursoId)
);

INSERT INTO Alunos(NomeAluno, DataNascimento, Endereco, Telefone, IdCurso) VALUES ('Júlia', '2001-06-12', 'Rua Sérgio, 3 Periperi', '(71) 9 8501-3844', 1);
INSERT INTO Alunos(NomeAluno, DataNascimento, Endereco, Telefone, IdCurso) VALUES ('Cecília', '2001-06-12', 'Rua da Urbis, 5 Castelo Branco', '(71) 9 8553-7494', 2);
INSERT INTO Alunos(NomeAluno, DataNascimento, Endereco, Telefone, IdCurso) VALUES ('Mateus', '2001-06-12', 'Rua Felipe Fernandez, 6 Nordeste de Amaralina', '(71) 9 8845-2964', 3);
INSERT INTO Alunos(NomeAluno, DataNascimento, Endereco, Telefone, IdCurso) VALUES ('Pedro', '2001-06-12', 'Rua da Glória, 7 Retiro', '(71) 9 8775-8626', 4);
INSERT INTO Alunos(NomeAluno, DataNascimento, Endereco, Telefone, IdCurso) VALUES ('João', '2001-06-12', 'Rua José Vilaverde, 8 Cajazeiras', '(71) 9 8775-8626', 5);

DROP TABLE Alunos;

CREATE TABLE Inscricoes(
InscricoesId INT PRIMARY KEY AUTO_INCREMENT,
IdCurso INT NOT NULL,
FOREIGN KEY (IdCurso) REFERENCES Cursos(CursoId),
MatriculaAluno INT NOT NULL,
FOREIGN KEY (MatriculaAluno) REFERENCES Alunos (Matricula)
);

INSERT INTO Inscricoes (IdCurso, MatriculaAluno) VALUES (1, 1);
INSERT INTO Inscricoes (IdCurso, MatriculaAluno) VALUES (2, 2);
INSERT INTO Inscricoes (IdCurso, MatriculaAluno) VALUES (3, 3);
INSERT INTO Inscricoes (IdCurso, MatriculaAluno) VALUES (4, 4);
INSERT INTO Inscricoes (IdCurso, MatriculaAluno) VALUES (5, 5);

DROP TABLE Inscricoes;

SELECT A.nomealuno AS 'Nome Aluno',
C.nomecurso AS 'Nome Curso'
FROM Alunos A
INNER JOIN Inscricoes ON A.Matricula = Inscricoes.MatriculaAluno
INNER JOIN Cursos C ON Inscricoes.Idcurso = C.cursoid;


SELECT*FROM Cursos;
SELECT*FROM Alunos;
SELECT*FROM inscricoes;