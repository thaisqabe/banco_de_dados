-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Maio-2025 às 17:37
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `etecmcm2`
--
CREATE DATABASE IF NOT EXISTS `etecmcm2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `etecmcm2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_cat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_cat`) VALUES
(1, 'Laticínios'),
(2, 'Higiene'),
(3, 'Limpeza'),
(4, 'Enlatados'),
(5, 'Frios'),
(6, 'Açougue'),
(8, 'Eletrônicos'),
(9, 'Padaria'),
(10, 'Perfumaria'),
(11, 'Bebidas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `preco`, `quant`, `marca`, `id_categoria`) VALUES
(1, 'Escova de dentes', '12.00', 100, 'Colgate', 2),
(2, 'Sabão em pó', '30.50', 50, 'OMO', 3),
(3, 'Detergente', '3.55', 10, 'Ypê', 3),
(4, 'Iogurte', '19.99', 40, 'Itambé', 1),
(5, 'Manteiga', '30.50', 80, 'Batavo', 1),
(6, 'Creme dental', '29.99', 80, 'Sorriso', 2),
(7, 'Milho verde', '19.50', 100, 'Quero', 4),
(8, 'Ervilha', '15.50', 90, 'Quero', 4),
(9, 'Presunto', '14.98', 90, 'Perdigão', 5),
(10, 'Mortadela', '10.90', 74, 'Sadia', 5),
(11, 'Costela bovina', '40.99', 30, 'Friboi', 6),
(12, 'Asa de Frango', '45.70', 45, 'Swift', 6),
(13, 'Celular', '1200.89', 15, 'Samsung', 8),
(14, 'Fone de ouvido', '70.67', 37, 'Motorola', 8),
(15, 'Pão francês', '3.77', 50, 'Superpan', 9),
(16, 'Sanduíche', '15.99', 20, 'Superpan', 9),
(17, 'EGEO', '200.89', 20, 'Oboticário', 10),
(18, 'Lily', '1000.89', 10, 'Oboticário', 10),
(19, 'Refrigerante', '16.50', 100, 'Coca-cola', 11),
(20, 'Suco de uva', '20.50', 100, 'Maratá', 11);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
