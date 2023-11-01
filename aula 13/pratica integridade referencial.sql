DROP DATABASE biblioteca2023;

CREATE DATABASE IF NOT EXISTS biblioteca2023;

USE biblioteca2023;

CREATE TABLE IF NOT EXISTS cidade (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS aluno (
    matricula int(11) AUTO_INCREMENT PRIMARY KEY,
    cidade_id int(11),
    nome varchar(40),
    data_nascimento date,
    CONSTRAINT FOREIGN KEY fk_cidade__cidade_id(cidade_id) REFERENCES cidade(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS funcionario (
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    nome varchar(30)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS editora (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS assunto (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS pais (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS autor (
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    pais_id int(11),
    nome varchar(30),
    data_nascimento date,
    CONSTRAINT FOREIGN KEY fk_pais__pais_id(pais_id) REFERENCES pais(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS livro (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    editora_id int(11),
    assunto_id int(11),
    titulo varchar(60),
    ano_publicacao char(4),
    CONSTRAINT FOREIGN KEY fk_editora__editora_id(editora_id) REFERENCES editora(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY fk_assunto__assunto_id(assunto_id) REFERENCES assunto(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS livro_autor (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    livro_id int(11),
    autor_id int(11),
    CONSTRAINT FOREIGN KEY fk_livro_autor__livro_id(livro_id) REFERENCES livro(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY fk_livro__autor_id(autor_id) REFERENCES autor(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS exemplar (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    livro_id int(11),
    `status` enum('INDISPONIVEL', 'DISPONIVEL', 'EMPRESTADO'),
    CONSTRAINT FOREIGN KEY fk_livro__livro_id(livro_id) REFERENCES livro(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS emprestimo (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    exemplar_id int(11),
    aluno_matricula int(11),
    funcionario_id int(11),
    data_emprestimo datetime,
    data_devolucao datetime,
    CONSTRAINT FOREIGN KEY fk_aluno__aluno_matricula(aluno_matricula) REFERENCES aluno(matricula) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY fk_exemplar__exemplar_id(exemplar_id) REFERENCES exemplar(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY fk_funcionario__funcionario_id(funcionario_id) REFERENCES funcionario(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = INNODB;

show tables;



