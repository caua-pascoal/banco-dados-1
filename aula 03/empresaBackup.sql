-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Mar-2023 às 18:32
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa`
--
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa CHARSET=utf8 COLLATE=utf8_unicode_ci;
USE empresa;
-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` enum('M','F') COLLATE utf8_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `salario` decimal(9,2) NOT NULL DEFAULT 1320.00,
  `departamento` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VENDAS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `sexo`, `data_nascimento`, `salario`, `departamento`) VALUES
(1, 'FULANO', 'M', '1980-10-30', '3500.00', 'VENDAS'),
(2, 'PEDRO', 'M', '1985-11-30', '3500.00', 'VENDAS'),
(3, 'BELTRANO', 'M', '1985-11-20', '4500.00', 'ADMINISTRATIVO'),
(4, 'MARIA', 'F', '1980-07-06', '2000.00', 'RH'),
(5, 'ANA', 'F', '1987-10-03', '2500.00', 'VENDAS'),
(6, 'CICLANO', 'M', '1990-10-20', '3700.00', 'RH'),
(7, 'ALBERTO', 'M', '1985-11-06', '4500.00', 'VENDAS'),
(8, 'MARIANA', 'F', '1980-09-06', '2000.00', 'RH');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_funcionario__nome` (`nome`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
