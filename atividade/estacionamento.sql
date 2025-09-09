-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/09/2025 às 05:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento`
--
CREATE DATABASE IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `estacionamento`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `andar`
--

CREATE TABLE `andar` (
  `idlugar` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `andar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `andar`
--

INSERT INTO `andar` (`idlugar`, `capacidade`, `andar`) VALUES
(1, 50, 'Subsolo 1'),
(2, 60, 'Subsolo 2'),
(3, 40, 'Térreo'),
(4, 30, '1º Andar'),
(5, 35, '2º Andar'),
(6, 45, '3º Andar'),
(7, 25, 'Cobertura'),
(8, 55, 'Anexo A'),
(9, 50, 'Anexo B'),
(10, 60, 'Garagem Externa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `dtnasc` date NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `cpf`, `dtnasc`, `nome`) VALUES
(1, '12345678900', '1990-01-15', 'João Silva'),
(3, '45678912300', '2000-03-30', 'Carlos Souza'),
(4, '78912345600', '1995-11-10', 'Ana Lima'),
(5, '32165498700', '1988-09-05', 'Nicole Modesto'),
(6, '65498732100', '1992-04-18', 'Paula Duarte'),
(7, '14725836900', '1983-12-01', 'Fernando Rocha'),
(8, '96385274100', '1999-06-27', 'Juliana Mendes'),
(9, '25836914700', '1975-10-14', 'Ricardo Azevedo'),
(10, '36914725800', '2001-08-09', 'Camila Freitas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estaciona`
--

CREATE TABLE `estaciona` (
  `idestaciona` int(11) NOT NULL,
  `horasaida` time NOT NULL,
  `dtsaida` date NOT NULL,
  `horaentra` time NOT NULL,
  `dtentra` date NOT NULL,
  `idveiculo` int(11) DEFAULT NULL,
  `idlugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estaciona`
--

INSERT INTO `estaciona` (`idestaciona`, `horasaida`, `dtsaida`, `horaentra`, `dtentra`, `idveiculo`, `idlugar`) VALUES
(1, '10:30:00', '2025-09-01', '08:00:00', '2025-09-01', 1, 1),
(3, '15:15:00', '2025-09-01', '13:00:00', '2025-09-01', 3, 3),
(4, '18:45:00', '2025-09-01', '17:00:00', '2025-09-01', 4, 4),
(5, '20:00:00', '2025-09-01', '19:00:00', '2025-09-01', 5, 5),
(6, '22:30:00', '2025-09-01', '21:00:00', '2025-09-01', 6, 6),
(7, '08:00:00', '2025-09-02', '06:30:00', '2025-09-02', 7, 7),
(8, '11:15:00', '2025-09-02', '10:00:00', '2025-09-02', 8, 8),
(9, '14:00:00', '2025-09-02', '12:30:00', '2025-09-02', 9, 9),
(10, '16:45:00', '2025-09-02', '15:00:00', '2025-09-02', 10, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `idmodelo` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `modelo`
--

INSERT INTO `modelo` (`idmodelo`, `modelo`) VALUES
(1, 'Fiat Uno'),
(2, 'Chevrolet Onix'),
(3, 'Volkswagen Gol'),
(4, 'Ford Ka'),
(5, 'Hyundai HB20'),
(6, 'Toyota Corolla'),
(7, 'Honda Civic'),
(8, 'Renault Kwid'),
(9, 'Jeep Renegade'),
(10, 'Nissan March');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `idveiculo` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `cor` varchar(30) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idmodelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`idveiculo`, `placa`, `cor`, `idcliente`, `idmodelo`) VALUES
(1, 'ABC-1234', 'Preto', 1, 1),
(3, 'GHI-9012', 'Prata', 3, 3),
(4, 'JKL-3456', 'Amarelo', 4, 4),
(5, 'MNO-7890', 'Azul', 5, 5),
(6, 'PQR-2345', 'Cinza', 6, 6),
(7, 'STU-6789', 'Verde', 7, 7),
(8, 'VWX-0123', 'Amarelo', 8, 8),
(9, 'YZA-4567', 'Marrom', 9, 9),
(10, 'BCD-8901', 'Roxo', 10, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`idlugar`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices de tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`idestaciona`),
  ADD KEY `idveiculo` (`idveiculo`),
  ADD KEY `idlugar` (`idlugar`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idmodelo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`idveiculo`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idmodelo` (`idmodelo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andar`
--
ALTER TABLE `andar`
  MODIFY `idlugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `estaciona`
--
ALTER TABLE `estaciona`
  MODIFY `idestaciona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idmodelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `idveiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`idlugar`) REFERENCES `andar` (`idlugar`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`idmodelo`) REFERENCES `modelo` (`idmodelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
