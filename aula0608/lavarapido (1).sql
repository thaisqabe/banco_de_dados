-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Ago-2025 às 17:46
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
-- Banco de dados: `lavarapido`
--
CREATE DATABASE IF NOT EXISTS `lavarapido` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lavarapido`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idatendimento` int(11) NOT NULL,
  `totalgeral` decimal(10,2) NOT NULL,
  `data` date NOT NULL,
  `idcarro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_servico`
--

CREATE TABLE `atendimento_servico` (
  `idatendimentoservico` int(11) NOT NULL,
  `totalserv` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `idatendimento` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `idcarro` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `ano` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idmodelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nasc` date NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `idendereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `num` varchar(10) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `idmodelo` int(11) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `idmarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `idservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idatendimento`),
  ADD KEY `idcarro` (`idcarro`);

--
-- Índices para tabela `atendimento_servico`
--
ALTER TABLE `atendimento_servico`
  ADD PRIMARY KEY (`idatendimentoservico`),
  ADD KEY `idatendimento` (`idatendimento`),
  ADD KEY `idservico` (`idservico`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`idcarro`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idmodelo` (`idmodelo`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idendereco` (`idendereco`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idendereco`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idmarca`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idmodelo`),
  ADD KEY `idmarca` (`idmarca`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`idservico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idatendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atendimento_servico`
--
ALTER TABLE `atendimento_servico`
  MODIFY `idatendimentoservico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `idcarro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idmodelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `idservico` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`idcarro`) REFERENCES `carro` (`idcarro`);

--
-- Limitadores para a tabela `atendimento_servico`
--
ALTER TABLE `atendimento_servico`
  ADD CONSTRAINT `atendimento_servico_ibfk_1` FOREIGN KEY (`idatendimento`) REFERENCES `atendimento` (`idatendimento`),
  ADD CONSTRAINT `atendimento_servico_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`idservico`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `carro_ibfk_2` FOREIGN KEY (`idmodelo`) REFERENCES `modelo` (`idmodelo`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
