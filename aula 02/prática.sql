SHOW DATABASES;

DROP DATABASE IF EXISTS empresa;

-- Geração de tabelas --
CREATE DATABASE IF NOT EXISTS empresa CHARSET = utf8 COLLATE = utf8_unicode_ci;

DROP DATABASE IF EXISTS sidec_bom_dia;

-- determina a database a ser usada
USE empresa;

-- if not existis é muito importante
CREATE TABLE IF NOT EXISTS funcionario (
    id int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(40),
    sexo enum('F', 'M'),
    salario decimal(9, 2),
    INDEX idx_funcionario_nome(nome)
) ENGINE = innodb;

-- show columns from funcionario
DESCRIBE funcionario;

DROP TABLE IF EXISTS funcionario;

-- outra abordagem para primary key
CREATE TABLE IF NOT EXISTS funcionario (
    id int AUTO_INCREMENT,
    nome varchar(40),
    sexo enum('F', 'M'),
    salario decimal(9, 2),
    PRIMARY KEY (id),
    UNIQUE INDEX idx_funcionario_nome(nome)
) ENGINE = innodb;

ALTER TABLE
    funcionario
ADD
    COLUMN datanascimento date
AFTER
    sexo,
ADD
    COLUMN departamento varchar(30) DEFAULT 'vendas'
AFTER
    salario;

ALTER TABLE
    funcionario CHANGE COLUMN datanascimento data_nascimento date NOT NULL;

SHOW COLUMNS
FROM
    funcionario;

RENAME TABLE funcionario TO empregados;

RENAME TABLE empregados TO funcionario;

SHOW INDEX
FROM
    funcionario;

ALTER TABLE
    funcionario DROP INDEX idx_funcionario_nome;

ALTER TABLE
    funcionario
ADD
    INDEX idx_funcionario__nome(nome);

ALTER TABLE
    funcionario ENGINE = MYISAM;

SHOW INDEX
FROM
    funcionario;

-- Inserção de dados --
INSERT INTO
    funcionario (
        nome,
        sexo,
        data_nascimento,
        salario,
        departamento
    )
VALUES
    ('cauã', 'M', '2003-11-09', '2300', 'back-end');

-- só adicionar vírgula e continuar adicionando
-- ('cauã', 'M', '2003-11-09', '2300', 'back-end'),
-- ('cauã', 'M', '2003-11-09', '2300', 'back-end'),
-- ('cauã', 'M', '2003-11-09', '2300', 'back-end');
--
-- sem explicitar as colunas (RESUMIDA)
-- obrigado a incluir todas as colunas na ordem da tabela (inclusive id)
INSERT INTO
    funcionario
VALUES
    (
        100,
        'cauã',
        'M',
        '2003-11-09',
        '2300',
        'back-end'
    );

SELECT
    *
FROM
    funcionario;

SELECT
    id,
    nome,
    sexo,
    salario
FROM
    funcionario;