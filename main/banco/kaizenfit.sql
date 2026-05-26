-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2026 at 11:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaizenfit`
--

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `data_comentario` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dieta`
--

CREATE TABLE `dieta` (
  `id_dieta` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `objetivo` varchar(100) DEFAULT NULL,
  `calorias_diarias` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evolucaofisica`
--

CREATE TABLE `evolucaofisica` (
  `id_evolucao` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `imc` decimal(5,2) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `data_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercicio`
--

CREATE TABLE `exercicio` (
  `id_exercicio` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `grupo_muscular` varchar(100) DEFAULT NULL,
  `duracao_minutos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metausuario`
--

CREATE TABLE `metausuario` (
  `id_meta` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notificacao`
--

CREATE TABLE `notificacao` (
  `id_notificacao` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `data_envio` datetime DEFAULT current_timestamp(),
  `lida` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planoexercicio`
--

CREATE TABLE `planoexercicio` (
  `id_planoexercicio` int(11) NOT NULL,
  `id_planotreino` int(11) DEFAULT NULL,
  `id_exercicio` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `repeticoes` int(11) DEFAULT NULL,
  `descanso` int(11) DEFAULT NULL,
  `carga` decimal(5,2) DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planotreino`
--

CREATE TABLE `planotreino` (
  `id_planotreino` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `nivel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postcomunidade`
--

CREATE TABLE `postcomunidade` (
  `id_post` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `conteudo` text DEFAULT NULL,
  `data_publicacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profissional`
--

CREATE TABLE `profissional` (
  `id_profissional` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `registro_profissional` varchar(100) DEFAULT NULL,
  `biografia` text DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refeicao`
--

CREATE TABLE `refeicao` (
  `id_refeicao` int(11) NOT NULL,
  `id_dieta` int(11) DEFAULT NULL,
  `nome_refeicao` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `horario` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  `objetivo_pessoal` text DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `dieta`
--
ALTER TABLE `dieta`
  ADD PRIMARY KEY (`id_dieta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `evolucaofisica`
--
ALTER TABLE `evolucaofisica`
  ADD PRIMARY KEY (`id_evolucao`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `exercicio`
--
ALTER TABLE `exercicio`
  ADD PRIMARY KEY (`id_exercicio`);

--
-- Indexes for table `metausuario`
--
ALTER TABLE `metausuario`
  ADD PRIMARY KEY (`id_meta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `notificacao`
--
ALTER TABLE `notificacao`
  ADD PRIMARY KEY (`id_notificacao`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `planoexercicio`
--
ALTER TABLE `planoexercicio`
  ADD PRIMARY KEY (`id_planoexercicio`),
  ADD KEY `id_planotreino` (`id_planotreino`),
  ADD KEY `id_exercicio` (`id_exercicio`);

--
-- Indexes for table `planotreino`
--
ALTER TABLE `planotreino`
  ADD PRIMARY KEY (`id_planotreino`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `postcomunidade`
--
ALTER TABLE `postcomunidade`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `profissional`
--
ALTER TABLE `profissional`
  ADD PRIMARY KEY (`id_profissional`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `refeicao`
--
ALTER TABLE `refeicao`
  ADD PRIMARY KEY (`id_refeicao`),
  ADD KEY `id_dieta` (`id_dieta`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dieta`
--
ALTER TABLE `dieta`
  MODIFY `id_dieta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evolucaofisica`
--
ALTER TABLE `evolucaofisica`
  MODIFY `id_evolucao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercicio`
--
ALTER TABLE `exercicio`
  MODIFY `id_exercicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metausuario`
--
ALTER TABLE `metausuario`
  MODIFY `id_meta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notificacao`
--
ALTER TABLE `notificacao`
  MODIFY `id_notificacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planoexercicio`
--
ALTER TABLE `planoexercicio`
  MODIFY `id_planoexercicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planotreino`
--
ALTER TABLE `planotreino`
  MODIFY `id_planotreino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postcomunidade`
--
ALTER TABLE `postcomunidade`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profissional`
--
ALTER TABLE `profissional`
  MODIFY `id_profissional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refeicao`
--
ALTER TABLE `refeicao`
  MODIFY `id_refeicao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `postcomunidade` (`id_post`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `dieta`
--
ALTER TABLE `dieta`
  ADD CONSTRAINT `dieta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `evolucaofisica`
--
ALTER TABLE `evolucaofisica`
  ADD CONSTRAINT `evolucaofisica_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `metausuario`
--
ALTER TABLE `metausuario`
  ADD CONSTRAINT `metausuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `notificacao`
--
ALTER TABLE `notificacao`
  ADD CONSTRAINT `notificacao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `planoexercicio`
--
ALTER TABLE `planoexercicio`
  ADD CONSTRAINT `planoexercicio_ibfk_1` FOREIGN KEY (`id_planotreino`) REFERENCES `planotreino` (`id_planotreino`) ON DELETE CASCADE,
  ADD CONSTRAINT `planoexercicio_ibfk_2` FOREIGN KEY (`id_exercicio`) REFERENCES `exercicio` (`id_exercicio`);

--
-- Constraints for table `planotreino`
--
ALTER TABLE `planotreino`
  ADD CONSTRAINT `planotreino_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `postcomunidade`
--
ALTER TABLE `postcomunidade`
  ADD CONSTRAINT `postcomunidade_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `profissional`
--
ALTER TABLE `profissional`
  ADD CONSTRAINT `profissional_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `refeicao`
--
ALTER TABLE `refeicao`
  ADD CONSTRAINT `refeicao_ibfk_1` FOREIGN KEY (`id_dieta`) REFERENCES `dieta` (`id_dieta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
