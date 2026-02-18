-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Out-2025 às 10:42
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_start`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `anos`
--

CREATE TABLE `anos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `anos`
--

INSERT INTO `anos` (`id`, `nome`, `status`) VALUES
(5, '2021-2022', 0),
(6, '2022/2023', 0),
(7, '2023/2024', 0),
(8, '2024/2025', 0),
(10, '2025/2026', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `classes`
--

INSERT INTO `classes` (`id`, `nome`, `codigo`, `status`) VALUES
(136, '10ª Classe', '10ªC', 1),
(137, '11ª Classe', '11ªC', 1),
(138, '12ª Classe', '12ªC', 1),
(139, '13ª Classe', '13ªC', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `status`) VALUES
(35, 'Enfermagem Geral', 1),
(36, 'Análises Clínicas', 1),
(37, 'Técnico de Energia e Instalações Elétricas', 1),
(38, 'Técnico de Informática', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesas`
--

CREATE TABLE `despesas` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emolumentos`
--

CREATE TABLE `emolumentos` (
  `id` int(11) NOT NULL,
  `natureza_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `emolumentos`
--

INSERT INTO `emolumentos` (`id`, `natureza_id`, `nome`, `status`) VALUES
(1, 1, 'Propina de Janeiro', 1),
(2, 1, 'Propina de Fevereiro', 1),
(3, 1, 'Propina de Março', 1),
(4, 1, 'Propina de Abril', 1),
(5, 1, 'Propina de Maio', 1),
(6, 1, 'Propina de Junho', 1),
(7, 1, 'Propina de Julho', 1),
(9, 1, 'Propina de Setembro', 1),
(10, 1, 'Propina de Outubro', 1),
(11, 1, 'Propina de Novembro', 1),
(12, 1, 'Propina de Dezembro', 1),
(13, 5, 'Baptismo de Caloiros', 1),
(14, 2, 'Uniforme de Estágio', 1),
(15, 6, 'Passe', 1),
(16, 2, 'Uniforme Ed.Fisica', 1),
(17, 2, 'Beca de Finalistas', 1),
(18, 2, 'Tshirts - Caloiros', 1),
(19, 1, 'Propina anual', 1),
(20, 7, 'Emolumentos do Estágio', 1),
(21, 8, 'Folhas de Prova', 1),
(22, 4, 'Pacote da Matrícula', 1),
(23, 3, 'Declaração de Frequência', 1),
(24, 4, 'Reconfirmação da Matrícula', 1),
(25, 2, 'Bata', 1),
(26, 8, 'Prova em atraso', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `emolumentos_natureza`
--

CREATE TABLE `emolumentos_natureza` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `emolumentos_natureza`
--

INSERT INTO `emolumentos_natureza` (`id`, `nome`, `status`) VALUES
(1, 'Propina', 1),
(2, 'Uniforme', 1),
(3, 'Documentos', 1),
(4, 'Matriculas e Reconfirmações', 1),
(5, 'Eventos', 1),
(6, 'Credenciais', 1),
(7, 'Emolumentos do Estágio', 1),
(8, 'Provas', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `emolumento_precos`
--

CREATE TABLE `emolumento_precos` (
  `id` int(11) NOT NULL,
  `ano_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `emolumento_natureza_id` int(11) NOT NULL,
  `emolumento_id` int(11) NOT NULL,
  `preco` double NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `emolumento_precos`
--

INSERT INTO `emolumento_precos` (`id`, `ano_id`, `curso_id`, `classe_id`, `emolumento_natureza_id`, `emolumento_id`, `preco`, `status`) VALUES
(2, 5, 35, 136, 1, 1, 16500, 1),
(3, 8, 35, 136, 1, 1, 17000, 1),
(4, 8, 35, 136, 1, 2, 17000, 1),
(5, 8, 35, 136, 1, 3, 17000, 1),
(6, 8, 35, 136, 1, 4, 17000, 1),
(7, 8, 35, 136, 1, 5, 17000, 1),
(8, 8, 35, 136, 1, 6, 17000, 1),
(9, 8, 35, 136, 1, 7, 17000, 1),
(10, 8, 35, 136, 1, 9, 17000, 1),
(11, 8, 35, 136, 1, 10, 17000, 1),
(12, 8, 35, 136, 1, 11, 17000, 1),
(13, 8, 35, 136, 1, 12, 17000, 1),
(14, 8, 35, 137, 1, 1, 20000, 1),
(15, 8, 35, 137, 1, 2, 20000, 1),
(16, 8, 35, 137, 1, 3, 20000, 1),
(17, 8, 35, 137, 1, 4, 20000, 1),
(18, 8, 35, 137, 1, 5, 20000, 1),
(19, 8, 35, 137, 1, 6, 20000, 1),
(20, 8, 35, 137, 1, 7, 20000, 1),
(21, 8, 35, 137, 1, 9, 20000, 1),
(22, 8, 35, 137, 1, 10, 20000, 1),
(23, 8, 35, 137, 1, 9, 20000, 1),
(24, 8, 35, 137, 1, 11, 20000, 1),
(25, 8, 35, 137, 1, 12, 20000, 1),
(26, 8, 35, 138, 1, 1, 24000, 1),
(27, 8, 35, 138, 1, 2, 24000, 1),
(28, 8, 35, 138, 1, 3, 24000, 1),
(29, 8, 35, 138, 1, 4, 24000, 1),
(30, 8, 35, 138, 1, 5, 24000, 1),
(31, 8, 35, 138, 1, 6, 24000, 1),
(32, 8, 35, 138, 1, 7, 24000, 1),
(33, 8, 35, 138, 1, 9, 24000, 1),
(34, 8, 35, 138, 1, 10, 24000, 1),
(35, 8, 35, 138, 1, 12, 24000, 1),
(36, 8, 35, 138, 1, 11, 24000, 1),
(37, 8, 35, 139, 1, 1, 27000, 1),
(38, 8, 35, 139, 1, 2, 27000, 1),
(39, 8, 35, 139, 1, 3, 27000, 1),
(40, 8, 35, 139, 1, 4, 27000, 1),
(41, 8, 35, 139, 1, 5, 27000, 1),
(42, 8, 35, 139, 1, 6, 27000, 1),
(43, 8, 35, 139, 1, 7, 27000, 1),
(44, 8, 35, 139, 1, 9, 27000, 1),
(45, 8, 35, 139, 1, 10, 27000, 1),
(46, 8, 35, 139, 1, 11, 27000, 1),
(47, 8, 35, 139, 1, 12, 27000, 1),
(48, 8, 36, 136, 1, 1, 18000, 1),
(49, 8, 36, 136, 1, 2, 18000, 1),
(50, 8, 36, 136, 1, 3, 18000, 1),
(51, 8, 36, 136, 1, 4, 18000, 1),
(52, 8, 36, 136, 1, 5, 18000, 1),
(53, 8, 36, 136, 1, 6, 18000, 1),
(54, 8, 36, 136, 1, 6, 18000, 1),
(55, 8, 36, 136, 1, 9, 18000, 1),
(56, 8, 36, 136, 1, 10, 18000, 1),
(57, 8, 36, 136, 1, 11, 18000, 1),
(58, 8, 36, 136, 1, 12, 18000, 1),
(59, 8, 36, 137, 1, 9, 21000, 1),
(60, 8, 36, 137, 1, 10, 21000, 1),
(61, 8, 36, 137, 1, 11, 21000, 1),
(62, 8, 36, 137, 1, 12, 21000, 1),
(63, 8, 36, 137, 1, 1, 21000, 1),
(64, 8, 36, 137, 1, 2, 21000, 1),
(65, 8, 36, 137, 1, 3, 21000, 1),
(66, 8, 36, 137, 1, 4, 21000, 1),
(67, 8, 36, 137, 1, 5, 21000, 1),
(68, 8, 36, 137, 1, 6, 21000, 1),
(69, 8, 36, 137, 1, 7, 21000, 1),
(70, 8, 36, 138, 1, 9, 25000, 1),
(71, 8, 36, 138, 1, 10, 25000, 1),
(72, 8, 36, 138, 1, 11, 25000, 1),
(73, 8, 36, 138, 1, 12, 25000, 1),
(74, 8, 36, 138, 1, 1, 25000, 1),
(75, 8, 36, 138, 1, 2, 25000, 1),
(76, 8, 36, 138, 1, 3, 25000, 1),
(77, 8, 36, 138, 1, 4, 25000, 1),
(78, 8, 36, 138, 1, 5, 25000, 1),
(79, 8, 36, 138, 1, 6, 25000, 1),
(80, 8, 36, 138, 1, 7, 25000, 1),
(81, 8, 35, 137, 1, 19, 200000, 1),
(82, 8, 36, 136, 1, 7, 18000, 1),
(83, 8, 35, 139, 7, 20, 1500, 1),
(84, 8, 35, 138, 7, 20, 1500, 1),
(85, 8, 36, 138, 7, 20, 1500, 1),
(86, 8, 35, 136, 2, 16, 9000, 1),
(87, 8, 35, 136, 5, 13, 5000, 1),
(88, 8, 36, 136, 5, 13, 5000, 1),
(89, 8, 36, 137, 5, 13, 2000, 1),
(90, 8, 35, 137, 5, 13, 2000, 1),
(91, 8, 35, 138, 5, 13, 2000, 1),
(92, 8, 36, 138, 5, 13, 2000, 1),
(93, 8, 35, 139, 2, 14, 20000, 1),
(94, 8, 35, 136, 8, 21, 4500, 1),
(95, 8, 36, 136, 8, 21, 4500, 1),
(96, 8, 35, 136, 4, 22, 32500, 1),
(97, 8, 35, 136, 3, 23, 2000, 1),
(98, 8, 35, 137, 3, 23, 2000, 1),
(99, 8, 35, 138, 3, 23, 2000, 1),
(100, 8, 35, 139, 3, 23, 2000, 1),
(101, 8, 36, 136, 3, 23, 2000, 1),
(102, 8, 36, 137, 3, 23, 2000, 1),
(103, 8, 36, 138, 3, 23, 2000, 1),
(104, 8, 36, 137, 4, 24, 5000, 1),
(105, 8, 35, 136, 2, 25, 10000, 1),
(106, 8, 35, 138, 2, 14, 20000, 1),
(107, 8, 35, 138, 2, 25, 10000, 1),
(108, 8, 35, 139, 1, 12, 28500, 1),
(109, 8, 36, 136, 6, 15, 2000, 1),
(110, 8, 35, 136, 6, 15, 2000, 1),
(111, 8, 35, 136, 8, 26, 2000, 1),
(112, 8, 35, 137, 8, 26, 2000, 1),
(113, 8, 35, 138, 8, 26, 2000, 1),
(114, 8, 36, 136, 8, 26, 2000, 1),
(115, 8, 36, 137, 8, 26, 2000, 1),
(116, 8, 36, 138, 8, 26, 2000, 1),
(117, 10, 35, 137, 1, 9, 24000, 1),
(118, 10, 35, 137, 1, 10, 24000, 1),
(119, 10, 35, 137, 1, 11, 24000, 1),
(120, 10, 35, 137, 1, 12, 24000, 1),
(121, 10, 35, 137, 1, 1, 24000, 1),
(122, 10, 35, 136, 1, 1, 21000, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudantes`
--

CREATE TABLE `estudantes` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `identificacao` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` int(11) NOT NULL,
  `data_de_nascimento` datetime NOT NULL,
  `genero` enum('Masculino','Femenino') NOT NULL,
  `estado_civil` enum('Solteiro','Solteira','Casado','Casada','Divorciado','Divorciada','Viuvo','Viuva') NOT NULL,
  `escola_anterior` varchar(255) NOT NULL DEFAULT 'Huambo',
  `residencia` varchar(255) NOT NULL,
  `necessidade_especial` varchar(255) NOT NULL DEFAULT 'Nenhuma',
  `curso_id` int(11) NOT NULL,
  `encarregado` varchar(255) NOT NULL,
  `contacto_encarregado` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `numero_processual` varchar(255) NOT NULL DEFAULT '0',
  `local_emissao_identificacao` varchar(255) DEFAULT NULL,
  `data_emissao_bi` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `naturalidade` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) NOT NULL,
  `nome_pai` varchar(255) DEFAULT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `lingua_opcao` varchar(255) DEFAULT NULL,
  `grau_parentesco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `estudantes`
--

INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(226, 902007, '00992844HO046', 'Agostinho Chipa Chico Chingongo', 943354914, '2004-06-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Canguenda Chingongo', 924464525, '2022-12-13 08:02:50', '2025-03-10 09:19:15', 1, 0, '0', NULL, NULL, 'Angolana', 'Huambo', NULL, '', NULL, NULL, NULL, NULL),
(227, 634829, '010207246HO048', 'Ana Paula Agostinho', 924023061, '2005-05-05 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernada Sofia Píres', 924023061, '2023-05-22 21:31:21', '2025-03-04 12:50:02', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Mãe'),
(228, 526591, '020704928HO053', 'Augusto Cambilingua Wassuca', 930714953, '2006-12-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Felicia Bundo', 930714953, '2023-05-08 19:51:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(229, 59693, '011285162172', 'Avelina Alexandre C.Chiyaya', 926934575, '2006-10-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Judith Piedade Alexandre', 926934575, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(230, 465644, '021017290HO050', 'Benvinda Sara De Oliveira', 935791470, '2005-08-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Albina Júlia', 935791470, '2023-01-28 09:10:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(231, 975268, '020630459HO058', 'Bernardeth Luisa Capingãla ', 936784220, '2004-05-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto Capingãla', 936784220, '2023-05-22 23:48:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(232, 765021, '', 'Celeste Benguela Ngongo', 929103500, '2005-04-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Conceição Wandi', 940477487, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(233, 654855, '02037847HO055', 'Celestino Chongolola', 946661309, '2005-08-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Silva  Cassimbo Chongolola', 928056786, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(234, 94718, '00997804HO046', 'Dionisia Isabel Sassinda', 934825664, '2005-01-09 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Florença Lussate Sassinda', 935805997, '2022-12-13 08:02:51', '2024-12-24 09:08:01', 1, 0, '0', 'Huambo', '2024-09-03', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Belchior Sassinda', 'Victoria Culipossa', 'Ingles', 'Mana'),
(235, 933936, '009751723HO042', 'Domingas Laura De Sousa ', 933413356, '2005-05-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Neves de Sousa       ', 933413356, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(236, 720372, '0000000000000000000', 'Emilia Nambongue Augusto', 939664806, '2004-12-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Caunda Juaquim', 926344717, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(237, 134068, '009903963HO041', 'Estrela Lidia Dongo', 927039356, '2006-07-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Cáala Wima', 927039356, '2023-06-04 19:31:15', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(238, 669715, '020395092HO059', 'Felisberto Finde Sacupalica Culavoca', 946975054, '0000-00-00 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingas Maria Sacupalica', 946975054, '2022-12-14 18:28:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(239, 120696, '0211013869HO055', 'Fernando Tchali Cussumua ', 923854803, '2005-08-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Romeu de Oliveira Cussumua', 923854803, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(240, 251811, '020677962HO056', 'Francisca Vissupe Sikuete', 936773602, '2005-11-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Félix Simoli Sikuete', 936773602, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(241, 251076, '020099160HO052', 'Geraldo Sassoma Caculucusso', 926129496, '2006-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adelino Valério Caculucusso', 926129496, '2023-05-14 07:11:07', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(242, 194064, '8888888888888888888', 'Gildo Victor Chiwale ', 923063969, '2006-04-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jilson H. Chiwale', 923063969, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(243, 768110, '009732389HO042', 'Joaquim Messele Luvelo', 948197382, '2007-09-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Beatriz Nguevela', 948197382, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(244, 425453, '020366588HO057', 'Jorge Furtado Chilala Chissola', 923069645, '2006-08-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mateus Mutota Chissala', 923069645, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(245, 214316, '006852704HO048', 'Laurinda De Anuarity Cambambu', 923624828, '2006-01-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mário Cambambu', 923624828, '2023-05-15 17:54:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(246, 393055, '021554787HO058', 'Leonardo Dovala Chanja', 924894404, '2005-01-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eduardo Arão', 926988830, '2023-05-16 06:28:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(247, 713932, '000000000000', 'Loth Chivava Junior', 943831483, '2002-07-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estevão Malheiro', 943831483, '2023-06-04 19:13:08', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(248, 543914, '009228467HO048', 'Luisa Joana  Mutali', 929168948, '2005-09-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Artur Mutali', 923822509, '2023-05-10 15:21:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(249, 115789, '0205339554HO056', 'Manuel Constantino Lungundua', 923384604, '2005-06-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Domingos  Lungundua', 923384604, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(250, 505221, '021023105HO053', 'Marcelino Paulo Satuva', 942301368, '2005-06-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emílio Satuva', 942301368, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(251, 799061, '009823411LS048', 'Margarida Nachivinda Neves', 923732546, '2005-01-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Brinco Neves', 924377495, '2023-05-21 03:31:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(252, 324585, '021665515MO051', 'Maria Massunga Rose Florent', 929569109, '2006-03-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Tshisola Kambwandji Florent', 929569109, '2023-05-24 00:00:35', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(253, 607594, '021823166HO054', 'Miguel Chimuco Prisão', 934187766, '2006-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Margarida Nauque Luis', 934187766, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(254, 767422, '021004026HO059', 'Paulina Violeta Sauandi', 925658491, '2006-05-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Leonardo Chissingui Cassova Sauandi', 925658491, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(255, 595551, '2222222222', 'Raimundo Sambuquila Benita Luciano', 922009911, '2006-10-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Luciano', 922009911, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(256, 413332, '009689349MO041', 'Sandra André Moisés', 928262265, '2004-03-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Lourenço Correias', 928262265, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(257, 891166, 'ooooooooooooooooooooo', 'João Gil Kavindivindi', 928226427, '2005-05-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ines Chindecasse', 928226427, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(258, 571403, '020953637HO058', 'Ermelinda Calesso Canganjo', 940136227, '2005-09-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Tiago Canganjo', 940136227, '2022-12-13 08:02:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(259, 657621, '000000000000000000', 'Abel Jamba Chiuta ', 924444018, '2003-03-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Chiuta ', 924444018, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(260, 458410, '020885377HO054', 'Aires Sacussanda Mondembe José', 937915328, '2003-08-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulo José ', 941667775, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(261, 954200, '009905HO047', 'Alberto Maurício  Kussumua', 926129496, '2003-01-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcolino Mauricío Kussumua', 926129496, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(262, 191499, '020554764HO054', 'Alexandre Maravilho Claúdio', 927293741, '2004-05-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maravilho Natal Claúdio ', 927293741, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(263, 388001, '021949300BA052', 'Alfredo Chinguima Candiabo Luis', 923833176, '2004-11-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Luis', 923833176, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(264, 46544, '020924077HO057', 'Alzira Boana ', 930369391, '2004-01-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Laurinda Chilombo', 2147483647, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(265, 525445, '021392368HO053', 'Alzira Fortunato Mario', 923457459, '2004-12-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Laura Da Conceição Fortunato', 923457459, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(266, 789969, '020540452HO050', 'António Eusebio Chinendele ', 939585963, '2003-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eusébio Satuala Carvalho', 939585963, '2023-05-20 14:41:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(267, 55552, '0206551585HO057', 'Aurélio Candimba Zeca ', 937781900, '2004-10-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Lúcia Catiolo', 937781900, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(268, 802680, '007105617HO042', 'Bartolomeu Cacongo Sebastião', 922453580, '1999-02-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Euvira Rosária', 922453580, '2023-06-04 21:36:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(269, 682758, '021389274HO051', 'Catarina Bimbi Chissumba ', 999999999, '2003-03-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Angelino Chissumba', 2147483647, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(270, 914578, '008586704HO045', 'Celestina Amélia Armando', 939621141, '2002-03-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celestina amélia Armando', 939621141, '2023-05-10 14:16:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(271, 796705, '02042947476HO058', 'César Luciano Chindambo', 2147483647, '2003-07-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, ' Luciano Chindambo', 0, '2022-12-14 18:47:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(272, 85900, '020106805HO057', 'Domingas Susso Samoma Caculucusso', 926129496, '2003-11-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Aldino Valério caculucusso', 926129496, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(273, 548461, '020690229HO056', 'Donita Nangololo Domingos ', 923790443, '2004-04-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marculino Domingos', 923790443, '2023-05-23 05:45:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(274, 141143, '00000000000', 'Eduardo Canganjo Chincomba', 925283284, '2004-06-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulo Chicombo', 926534180, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(275, 920815, '009569138HO046', 'Estrela Etossi Nassoma Gonjo', 924432091, '2004-04-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cesário Gongo', 946303601, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(276, 842097, '00959142HO048', 'Eulária Joaquim Canganjo', 928188109, '2005-05-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Nunda Canganjo', 928188109, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(277, 128236, '020244874HO056', 'Félix Chamunda Maliti', 921954360, '2002-03-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Hilário Chomunda Maliti', 921954360, '2023-01-24 12:13:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(278, 728623, '00960096HO049', 'Felismina Jamba Canguanda ', 927646217, '2018-08-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Aurélio Canguanda', 927646217, '2023-05-22 23:48:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(279, 194187, '020155885HO052', 'Filipe Eduardo Catumbela ', 924697254, '2002-07-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eduardo Abraão Catumbela', 923970910, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(280, 153768, '0206996312HO054', 'Florinda Cachenhe Mueleueia', 925127623, '2003-10-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José António Mueleueia', 925127623, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(281, 858760, '9999999', 'Idalina Lucamba Sehuma ', 926928355, '2003-08-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ermelinda Nartawa', 926928355, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(282, 636046, '020163173LA054', 'João Caculo Húilala ', 923490005, '2003-06-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Xavier Baptista Húilala ', 923490005, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(283, 199936, '009472057BA047', 'Joaquina Tchilombo  Ngumba', 66666666, '2004-05-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulino Ngumba', 2147483647, '2023-05-22 15:33:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(284, 508358, '020921400HO056', 'Jorge Chicoti Capita ', 0, '2001-02-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Capita ', 949369079, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(285, 578092, '020913980HO050', 'José Maria camilo ', 925962259, '2003-06-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emílio Camilo ', 925962259, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(286, 998136, '-----------------------------', 'Josefina Ngueve Graciano ', 926507264, '2004-01-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cristina Nelumbo', 926507264, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(287, 263717, '-------------------------------', 'Laura Manuela Bento ', 922912714, '2005-05-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Anastácio Bento ', 922912714, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(288, 604420, '----------------', 'Laura Namuco Capuca Ndengue', 923237401, '2004-10-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Domingos Ndengue ', 923237401, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(289, 198856, '021721024LA057', 'Lauriana Meti Lupuwa', 927698858, '2004-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Venancio Lupuwa', 927698858, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(290, 49855, '---------', 'Maria da conceição Marcelino Mendes ', 947295913, '2004-04-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Faustino António Carlos Mendes ', 931899163, '2023-01-29 15:08:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(291, 779075, '021507569HO057', 'Mendonça Viana xavier ', 999999, '2004-02-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mendonça Viana xavier ', 9999, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(292, 628354, '-----------------------', 'Pedro Fonseca Chissingui ', 9566666, '2004-08-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Basílio  Chissingui ', 2147483647, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(293, 257007, '021496053HO059', 'Raquel Tchitula ', 924304049, '2003-02-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'alberto João', 924304049, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(294, 195190, '----------', 'Rosalina Lordes Sicato', 927726874, '2003-07-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Custodio Ernesto Dudes Sicato', 927726874, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(295, 771687, '021503029HO059', 'Sabino Franco Mulambo ', 923785177, '2004-11-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bibiana Damião Mulambo', 923785177, '2022-12-13 08:02:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(296, 767396, '00981455HO042', 'Silvina Nangunji Augusto ', 931628014, '2003-08-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Inácia Jamba', 931628014, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(297, 243863, '--------------------------', 'Victorina Naupe Jamba Semente', 8888888, '2004-01-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cecilia Jamba', 2147483647, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(298, 705683, '0466678HO054', 'Abel Paulo wissi', 926177172, '2002-11-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulina Namulengo', 926177172, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(299, 353880, '007229844H0043', 'Adelaide Fernanda Bento ', 2147483647, '2001-01-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cipriano Bento', 6767675, '2023-05-24 19:13:48', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(300, 227413, '00985266KS047', 'Adelina esperança Novili ', 925741459, '2002-02-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Albissínia Adalberta Chundumula', 925741459, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(301, 202214, '021142040HO055', 'Adriano Sambumba Nonjamba Pinto', 924124189, '2002-11-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Almeida Pinto', 924124189, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(302, 836485, '555', 'Albano Njilenjile Sandumbo', 946893243, '0000-00-00 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Guilherme  Sandumbo', 946893243, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(303, 583072, '009514471HO041', 'António Sassingui Mueleyeya', 938912186, '2002-03-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adão Mueleyeya', 926161476, '2023-05-23 22:40:34', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(304, 6207, '00000000000000000000000000', 'Bernarda Bimbi Cassinda ', 924622738, '2005-02-16 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo - São José', 'Nenhuma', 35, 'Albel Cassinda', 924622738, '2022-12-28 09:06:10', '2025-03-20 14:00:58', 1, 6, '0', 'Huambo', NULL, 'Angolana', 'Caála', 'Caála', 'Huambo', 'Abel Cassinda', 'Nazaré de Fátima', 'L. Inglesa', 'Pai'),
(305, 795122, '00644934BE045', 'Carlota Mulenga Gama Wanga', 933830555, '2000-12-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Wanga', 949788234, '2023-01-24 22:05:59', '2025-01-02 14:51:36', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(306, 640909, '009719113HO044', 'Celestina Essenje Cassumalã', 223234, '2002-04-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Cassumalã', 4534365, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(307, 396279, '020218481HO054', 'Delfina Inacio Chitunda ', 223234, '2001-01-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Inácio Chitunda', 4534365, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(308, 539081, '020403666HO058', 'Elizabeth Chocondando Artur', 935832082, '2001-01-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mateus Artur Handa', 935832082, '2023-05-23 07:45:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(309, 285562, '021534513HO054', 'Emilio Chimuco Mandavela ', 927873399, '2002-05-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Clementino Mandavela', 924449541, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(310, 780427, '009332129KS040', 'Eva Isabel Moisés Virgílio ', 933355449, '2005-05-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Segunda  Virgílio ', 933355449, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(311, 380440, '009594845HO047', 'Feliciano Jamba Cutata', 941629850, '2001-11-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Inocêncio Cutata', 941629850, '2023-06-04 20:00:17', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(312, 656047, '021521363HO051', 'Feliciano Muquinda Camenhe ', 947299449, '1998-03-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Camenhe', 947299449, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(313, 47250, '020822532HO055', 'Florença Tchilunlo Sachilumbo', 927374433, '2002-05-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingas Augosto', 927374433, '2022-12-14 20:19:19', '2024-12-13 10:48:18', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(314, 929231, '008440638HO042', 'Hóracio Capingala Jamba ', 926059410, '2001-06-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abel Jamba ', 926059410, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(315, 536100, '020617203HO054', 'Isaac Chivinja Nguendelamba', 930873054, '2003-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Severino Nguendelamba', 930873054, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(316, 958868, '020576164HO054', 'Isabel Cassova Martins ', 925109586, '2001-11-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Chicuve Martins', 925109586, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(317, 908098, '021007093HO052', 'Jocina Ecuva Kanganjo', 98374758, '2001-06-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Pascoal ', 34556, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(318, 377995, '020911179HO055', 'José Manuel Tadeu ', 941489722, '2004-09-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulino Tadeu ', 2147483647, '2023-06-04 22:15:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(319, 153058, '', 'Josefina Cassinda Ganda ', 933413438, '2003-12-25 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, 'Silva Ganda', 926779354, '2022-12-14 20:19:19', '2025-03-10 12:07:49', 1, 0, '0', 'Huambo', NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Silva Ganda ', 'Arminda Cussinja', 'Língua Inglesa', 'Pai'),
(320, 187421, '0092722146HO045', 'Justino Chicuculo Cassuque', 925315472, '2002-08-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Valeriano Cassuque', 925315472, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(321, 87595, '021553167HO050', 'Laurinda Teresa Chifuanda ', 942169613, '2003-12-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jerónimo Chifuanda', 942169613, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(322, 610602, 'es', 'Luciana  Benvinda Januário ', 926196005, '2003-01-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Januário', 926196005, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(323, 41776, '020029667HO059', 'Luís Longuenda  Chimuco', 947221446, '2002-04-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Daniel Chimuco', 923264610, '2023-05-22 23:04:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(324, 307260, '999999', 'Maria Antonieta Arão ', 2147483647, '2003-05-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Arão ', 2147483647, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(325, 204736, '0099998002HO044', 'Maria Teresa Asafe Romão ', 944341353, '2003-07-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Romão  Tchimbaca Fernando', 2147483647, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(326, 694781, '020219101HO053', 'Natália Inácio Chitunda ', 928516483, '2002-11-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Inácio Chitunda', 928516483, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(327, 830288, 'fghgf', 'Nelson Baptista Mauricio Catito ', 947923217, '2002-05-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alice Maurícia', 947923217, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(328, 726521, '021633253HO055', 'Noé Horário Epalanga ', 925917193, '2003-07-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Horário Epalanga ', 925917193, '2023-01-24 21:11:04', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(329, 85358, '021619872HO050', 'Paulino Caule Domingos ', 935637270, '2000-08-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Avelino Domingos ', 935637270, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(330, 467182, '98765', 'Paulino Fio Nicolau', 936360417, '2003-08-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celestino Nicolau', 929979717, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(331, 989751, '0214229955HO055', 'Quintino Saquenda Sahanda', 935305896, '2002-04-24 00:00:00', 'Masculino', 'Solteiro', 'Fé Apostolica', 'Huambo', 'Nenhuma', 0, 'Gabriel Chivinga ', 935305896, '2022-12-14 20:19:19', '2025-03-21 16:04:49', 1, 6, '0', 'Huambo', '2021-01-27', 'Huambo', 'Huambo', 'Huambo', 'Huambo', 'Gabriel Chivinga Sahanda', 'Albina Nambonda', 'Englsh Readg', 'Pai'),
(332, 248515, '008176529HO049', 'Raquel Chaievala Moma Oseias ', 926549637, '2003-05-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Azinate Chacussola', 926549637, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(333, 231423, '7865yryh6tyt', 'Rubém Lundimbo Dos Santos ', 56667687, '2001-06-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Féliz Dos Santos', 2147483647, '2022-12-14 20:19:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(334, 272587, '021258008HO050', 'Ernesto Tchinguali Mbindji', 676565, '2001-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cristiano Simão Mbindji', 8965567, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(335, 863323, '006094721Ho049', 'Teresa Domingas Cachiyevala', 930233168, '2003-08-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Bernardo  Cachiyevala ', 930233168, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(336, 942407, '020749130HO053', 'Teresa NolombeChimuco Baptista ', 926623778, '2003-11-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Lourenço Sacocongo Baptista ', 926623778, '2023-05-23 16:34:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(337, 458288, '021017167BA058', 'Madalena Nambonga Vindes ', 924338911, '2003-11-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Geremias Freitas Vindes ', 924338911, '2023-05-23 20:02:24', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(338, 494365, '020591373HO051', 'Albino Gando Sawalia', 934669016, '2002-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estevão Aníbal Sawalia  ', 934669016, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(339, 541090, '005719189BE046', 'Abel Candundo Capingala ', 948901938, '1999-08-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estevão Malheiro Capingala', 948901938, '2023-06-04 19:11:36', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(340, 685030, '006253393HO041', 'Adelaide Silingui Samupi ', 931112298, '1998-03-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Leonardo António Samupi', 931112298, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(341, 443865, '021373294HO056', 'Adelino Vissetaca  Tchali', 924823050, '2000-09-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcolino António  Tchali', 924823050, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(342, 5642, '009280049HO042', 'Adriana Lurdes Álvaro Kuyekeya Domingos ', 933414604, '1998-08-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriana Lurdes Álvaro Kuyekeya Domingos ', 933414604, '2023-05-23 07:00:07', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(343, 375393, '00991897HO043', 'Albano Calembe Mendonça Da Costa ', 943190276, '1999-09-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alfredo Mendonça  Da Costa ', 943190276, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(344, 390915, '00495030HO46', 'Álvaro Essuvi David ', 947937086, '1989-06-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Álvaro Essuvi David ', 947937086, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(345, 37608, '02194036HO059', 'António Balombo Dos Santos ', 926728896, '2002-12-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Tiago Dos Santos ', 926728896, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(346, 633555, '76hb', 'Aurélia Cassova Sayanga ', 948269249, '2004-03-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Frederico Macuco Sayanga', 948269249, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(347, 714251, '006429249CC045', 'Bernardo Sambundu  Epandi', 942692855, '1999-01-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Remigio Bernardo Sambunndu', 942692855, '2023-01-19 13:40:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(348, 440192, '000kh bbdn', 'Branca Flora Da Glória Mateia ', 927452094, '2002-01-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Hilario Mateia ', 927452094, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(349, 264830, '011231097', 'Braz Sangato Fundanga Capusso', 924053573, '2003-06-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mario Capusso', 924053573, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(350, 637995, '006050897HO046', 'Catarina Fecaiamale  Jacinto ', 942457617, '1998-11-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, ' Catarina Fecaiamale ', 942457617, '2023-01-21 10:27:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(351, 561844, '005911831HO049', 'Eduarda Yolanda Paulino ', 924886409, '1995-12-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eduarda Yolanda Paulino ', 924886409, '2023-05-22 08:09:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(352, 732809, '007410458HO048', 'Ester Cassinda Emílio', 921456380, '1997-02-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ernesto Emílio ', 921456380, '2022-12-14 20:23:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(353, 357039, '020366659HO055', 'Evaristo Calulemi Chitungo', 941600550, '1999-12-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Evaristo Calulemi Chitungo', 941600550, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(354, 129716, '022126643HO059', 'Felicia Natália Ministro ', 935483687, '2005-12-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estevão Moisés Ministro', 929853972, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(355, 952257, '022126643HO059', 'Felícia Natália Ministro ', 935483687, '2005-12-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estevão Moisés Ministro', 929853972, '2023-05-24 19:21:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(356, 943853, 'weewwq', 'Felicia Chionga Bernardo', 921284474, '2001-07-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Camilo Bernardo ', 921284474, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(357, 149965, '007652623HO043', 'Francisco Cassoma Chicolomuenho ', 927870106, '1998-10-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cezario Chicolomuenho ', 927870106, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(358, 632931, '0998876', 'Gabriel Augusto Capoco', 947955408, '1998-02-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Madalena Navipa ', 947955408, '2023-06-04 21:34:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(359, 618218, '010151929HA046', 'Inácio Catima Chimo José', 945867056, '1998-12-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcelina Chicumbo', 945867056, '2022-12-14 20:19:20', '2024-11-12 13:56:23', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(360, 116973, '009758865HO043', 'Isabel Alexandre Livamba ', 944403508, '2001-03-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alexandre Livamba ', 944403508, '2022-12-28 09:06:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(361, 496788, '006389830HO046', 'Isabel Chilombo', 921282505, '1989-12-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Isabel Chilombo', 921282505, '2023-01-23 10:28:30', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(362, 330046, 'oiuhfha45', 'Joana Suelenla', 941186103, '2000-12-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João da Silva Luacuti', 941186103, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(363, 527543, '020301419HO51', 'Joaquim Nganga Satuala ', 924314532, '1999-12-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos João Satuala ', 924314532, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(364, 919594, '021495828HO058', 'José Guepe Calandula Xavier ', 987767, '2001-12-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Guepe Calandula Xavier ', 854698378, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(365, 28193, 'u896ju', 'Lourenço Ngua Munda ', 923918285, '2004-03-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Lourenço Munda', 923918285, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(366, 353648, '02091678HO52', 'Luciana Calembe Cachandjo', 936797442, '2001-05-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Inocêncio Cachindele Cachandjo', 925666475, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(367, 662194, '00170285BA038', 'Madalena Jacinto Muenecongo Júlio', 945581281, '1989-07-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Madalena Jacinto Muenecongo Júlio', 925666475, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(368, 722223, '02222117KN051', 'Teresa Augusta Hundo ', 934970061, '2003-11-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abílio Cassumba Hundo', 934970061, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(369, 612372, '004781660HO044', 'Manuel Chissuquila ', 926332613, '1991-09-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Chissuquila ', 926332613, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(370, 725222, '009676239BE049', 'Oseias Suares Fátima Satuala ', 924314532, '1996-03-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'omingos João Satuala ', 924314532, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(371, 532646, '020909654HO058', 'Paulina Cassinda Katito', 931250043, '1998-05-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Martinho Katito', 931250043, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(372, 164680, '020557611HO050', 'Rosa Chipuco Adelino', 931046299, '2001-01-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcelina Nayomba ', 931046299, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(374, 416263, '008110111HO043', 'Rufino Luis Miguel ', 934664181, '2004-06-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Miguel ', 934664181, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(375, 585496, '007085420KS045', 'Venâncio Jacinto ', 939187385, '2000-06-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jacinto Matoka ', 939187385, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(376, 109247, '010086983HO048', 'Cornélio Funete Calalica ', 924199095, '2002-09-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Sabino Calalica ', 924199095, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(377, 357308, '008745079HO41', 'Jaqueline Alice Dora Sambanda ', 929520921, '1999-08-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquina Da Conceição ', 929520921, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(378, 97772, 'wwwe', 'Agnaldo Jaime Epalanga ', 925917193, '2005-08-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Amelia Ilda ', 925917193, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(379, 279013, '00912827HO044', 'Alberto Inacio Jacinto', 937818532, '2006-02-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Firmino Jacinto ', 937818532, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(380, 480848, '021508824BE057', 'Alberto Lumbombo Epata ', 930510885, '2002-05-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Artur Epata ', 930510885, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(381, 804736, '021134632Ks5056', 'Almeida Feca Jaime ', 930983382, '2003-06-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Avelino Jaime ', 930983382, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(382, 707140, '00642598HO042', 'Anibal Andrade Samuel Elavoco ', 927661716, '0000-00-00 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Leontina Jamba Henriques', 927661716, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(383, 507289, '010199722HO042', 'Augusta Manuela  Mundombe ', 924181736, '1999-06-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'José Gonçasves ', 927213042, '2023-06-05 18:42:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(384, 878282, '00595923LN043', 'Augusto Domingos Zeca ', 946707140, '1993-06-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'António Zeca ', 946707140, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(385, 370593, 'tttporyuky', 'Celestino Paulino Epalanga ', 924367038, '2004-06-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Aleixo Bernardo Epalanga ', 924367038, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(386, 339829, '00895999hO045', 'Domingas Ganguia Vipanda Yequenha', 923131825, '2007-07-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Alice Beatriz Vipanda ', 923131825, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(387, 138637, '008755294HA041', 'Felix Nangolo Molossongue ', 922890082, '1999-03-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Isaias Molossongue ', 922890082, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(388, 674226, '020036289hO056', 'genoveva Chinauamule Setucula Munjamba ', 925136561, '2006-09-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Ângelo Munjamba ', 925136561, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(389, 1660, 'oiuyi', 'Inácio Zeferino Armando', 943189120, '2003-07-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Zeferino Armando', 943189120, '2022-08-30 17:50:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(390, 408099, 'werwe', 'José Ngombacassi Araujo ', 923058480, '2004-12-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'João Araujo ', 923058480, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(391, 609788, '021610737HO055', 'Jorge Chipindo Cassinda ', 941298352, '2005-05-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Eduardo Nicolau Cassinda ', 941298352, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(392, 959908, '34546', 'Marcolino Chinguli Calueyo ', 924327336, '2006-11-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Luciano Calueyo', 924327336, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(393, 305008, '456765', 'Marcial Dumba Gunga Hungulo ', 928283528, '2005-11-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Lucas  Hungulo ', 928283528, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(394, 347350, '020918851KS052', 'Rosa Nobre Francisco Ernesto', 931749692, '2005-01-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Job Nobre De Carvalho Ernesto', 931749692, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(395, 254222, '0909098', 'Jalentina Jorge Kuayela ', 929252290, '2006-06-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Manuel Jorge ', 929252290, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(396, 271783, '12324445', 'Vasco Hossi Lundovi', 930208413, '1996-04-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Joaquim Queiros Lundovi', 930208413, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(397, 330083, '00864438NE044', 'Victória  Bibiana Da Cruz Bento ', 924929396, '2001-11-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Filipe K.Bento', 924929396, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(398, 755250, '978978', 'Zacarias Cassinda Ndunduma ', 92379210, '2002-05-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Adolfo Ndunduma', 92379210, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(399, 880902, '020858792HO052', 'Henriques Kamenhe Vinene Cassinda ', 928914165, '2002-11-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 38, 'Lázaro Cassinda ', 928914165, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(400, 853686, '020994416HO059', 'Angelino Satchessengo Sacanombo ', 949817263, '1998-10-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Felisberto Sacanombo ', 949817263, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(401, 527373, '008577100cc042', 'Aniceto Jakson Verónica Chipita', 925042100, '2001-07-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'António Chipita ', 925042100, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(402, 756554, '010038906HO048', 'Antonino Nununo Celestino Canganjo', 928145073, '2001-09-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Benedito canganjo', 928145073, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(403, 194182, '020120343HO052', 'Celito Dembo Dos Santos ', 945884364, '2003-10-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Amélia Jambela ', 945884364, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(404, 293192, '020604349hO054', 'Carlos Mulunda ovidio Romão', 940787273, '2001-01-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Juliana Judith', 940787273, '2022-09-06 17:43:54', '2025-01-16 13:23:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(405, 271769, '009467941bE41', 'Avelino Cinco-Reis Nunda ', 927504438, '1999-03-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Mateus Malenga ', 927504438, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(406, 466450, '009458019Ho049', 'Constantino Segunda Andrade ', 946634119, '2002-11-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Constantino  Andrade ', 946634119, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(407, 27486, '00620847hO041', 'Domingos Israel Luacuti ', 926928302, '1995-12-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Leonilde Luwacuti', 926928302, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(408, 403385, '020112944HO053', 'Eduardo Munha Cassinda Vasco ', 921960988, '2002-12-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Daniel Freitas Vascos ', 921960988, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(409, 700850, '020358397HO055', 'Evaristo Mendes Lussenje ', 929520858, '1997-09-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Feliciano Lussenje ', 929520858, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(410, 589359, '020083480Ba56', 'Graciano Pedro Tomás Martins ', 939980175, '2003-09-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Anita Teressa ', 939980175, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(411, 452350, '009659284BE046', 'Jacinto candingo Mossozi Cahuli ', 940903553, '2004-02-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'josé Samba Cahuli', 940903553, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(412, 127172, '345', 'José Predro camosu', 924256794, '2002-12-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Natalia  camosu', 924256794, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(413, 393934, '010099866HO041', 'Lourenço Yekenha sayekele', 44545, '1999-06-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Bonefácio sayekele', 6776, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(414, 693841, '001111732HO031', 'Manuel Wachinanga Capitango ', 923022365, '1989-04-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Manuel Capitango ', 923022365, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(415, 396662, '546654', 'Samuel Matias Caquarta ', 0, '2005-03-03 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Antonia Jamba', 932080993, '2022-09-06 17:43:54', '2024-09-11 15:12:58', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(416, 196471, '005596341Ho042', 'Valentim Cuiluca ', 23435, '1975-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Valentim Cuiluca ', 67876, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(417, 221555, 'uyi687', 'Valeriano Silimuila Sanhangue', 938817747, '2004-09-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'felicia Imaculada ', 938817747, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(418, 393907, '020963633HO059', 'Victor Salgueiro Sacata ', 944726818, '2001-05-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'gerónimo Sacata ', 944726818, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(419, 766861, '4546', 'Walter Ventura Jamba', 936459402, '2001-08-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 37, 'Fernando Bule ', 936459402, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(420, 522540, '007336935HO044', 'Abilio Molossend Albino', 921228116, '1995-05-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abilio Molossend Albino', 921228116, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(421, 269034, '007947312HO044', 'Amélia Chilombo kapusso', 923916997, '2002-08-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alfredo Noé Kapusso', 923916997, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(422, 911213, '010148795HO040', 'António Wassi Dala ', 928505228, '2001-01-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rossalina Wassi', 928505228, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(423, 93257, '021755938HO051', 'Arminda Tchitula pagador', 922974275, '2005-09-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Calvino  pagador', 922974275, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(424, 452258, '999999999', 'Benjamim Fico Eduardo ', 929738629, '2005-12-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Custódio Paulino Eduardo', 929738629, '2023-01-19 13:30:17', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(425, 931214, '233333333333333', 'Bernadeti Elvira Mário Tchissingue ', 939530968, '2005-01-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emy Mário ', 939530968, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(426, 905395, '007799515HO044', 'Carlos Canjolomba Firmino ', 939126722, '1997-05-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eusebio Firmino', 939126722, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(427, 218357, '008621700HO47', 'Estevão Gana ', 934004064, '2000-06-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Roque Keferra', 944596166, '2023-01-28 18:12:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(428, 993093, 'oiikkk', 'Evaristo Calei Dongala ', 944423193, '2001-10-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Dongala ', 944423193, '2022-12-14 18:47:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(429, 136564, '020934990Ho056', 'Felícia Chambula Nguendelamba ', 926319086, '2003-04-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Luis Nguendelamba ', 926319086, '2022-12-14 18:28:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(430, 870258, '020957873Ho054', 'Herculano Pelembi Da Silva ', 928500976, '2006-07-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', '0', 35, '0', 928500976, '2022-12-13 08:02:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(431, 690895, '009948789HO045', 'Feliciana Nandingondo Wambo ', 924064597, '2000-02-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Albano Wambo ', 924064597, '2022-12-14 18:47:56', '2025-01-16 13:22:23', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(432, 998971, '021693981HO050', 'Joana Sara Capitango Araujo', 2147483647, '2000-07-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Araujo ', 89878, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(433, 932776, '009222946HO044', 'Jorgina Paula Moisés ', 922241989, '2002-03-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celestino Estevão ', 922241989, '2023-05-22 10:22:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(434, 864154, '010248218HO048', 'Justo gango Calei ', 65545, '2006-12-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rita Nahossi', 5666555, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(435, 639295, '006876348HA044', 'Lidia Priscila Vicente Lombungo ', 924773809, '1998-12-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Herculano Lombungo ', 924773809, '2022-12-14 18:47:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(436, 769598, '021940906LA050', 'Ludimila Ana Firmino', 942673966, '2004-06-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Filipe Mestre Firmino', 942673966, '2022-12-13 08:02:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(437, 969075, 'tytr67', 'Martinho Dias José ', 923564434, '2003-06-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Elias José ', 923564434, '2022-12-14 18:47:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(438, 483085, '3243', 'Pedro Miguel Keny', 927971117, '2000-04-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Martinho Keny', 927971117, '2022-12-14 18:47:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(439, 104744, '234', 'Princesa Raquel De Almeida ', 931395311, '2004-10-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Miguel Nsilu De Almeida ', 931395311, '2022-12-14 18:47:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(440, 58095, '021233691HO059', 'Severino Pambassangue Capundi ', 933635445, '2003-01-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto Capundi ', 933635445, '2022-12-14 20:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(441, 921229, '021233691H', 'Victor Manuel Fernades Caweye', 922538996, '2003-03-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Vandeleira Fernandes ', 922538996, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(442, 98096, 'ghu', 'Victoria Nassole Chipindo', 927948989, '2003-12-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rosaria Dos Anjos ', 927948989, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(443, 883399, '006623134HA0043', 'Vozeira De Lurdes Calupeteca Heque ', 942262822, '1997-02-09 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Vozeira De Lurdes Calupeteca Heque ', 942262822, '2022-12-14 18:47:57', '2024-09-29 16:51:47', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(444, 495520, '010074900HO046', 'Regina Ninolossi Liende ', 933938374, '2003-09-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Agostinho Liende ', 933938374, '2022-12-14 18:28:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(445, 661719, 'e565', 'Antonia Rebeca Chimbaya ', 944422907, '2002-06-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Inacio Carlos chimbaya ', 944422907, '2022-09-06 17:43:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(446, 839649, '08060655571LA044', 'Rofe Cristovão De Carvalho ', 938686058, '2000-05-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ana Maria Gonçalves ', 938686058, '2022-12-14 18:47:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(447, 265188, 'e455', 'Tiago Aurélio Albel ', 928324124, '2005-03-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Idalina Tiago ', 928324124, '2023-05-22 22:21:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(448, 960221, '008281742CC043', 'Firmina Nanhime Francisco', 941899117, '1996-05-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Angelina Paulina ', 941899117, '2023-01-31 03:48:21', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(449, 532850, '00941756HO049', 'Abel Setamba Sapalo Chinguto', 930434603, '2006-02-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Silva Campos Chitungo', 945560312, '2023-05-22 07:40:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(450, 282637, '020002635HO053', 'Albertina Lumbendo Ngombacassi Felino', 924629361, '2006-12-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Josias Felino', 924629361, '2023-06-05 21:00:31', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(451, 808074, '010073970H046', 'Américo Lucas Cambuta', 924708125, '2000-06-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Avelino Cambuta', 924708225, '2023-06-05 21:00:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(452, 562902, '023426247BA055', 'Ângela Liama Mendes', 924348270, '2006-07-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Isaías Mateus Calondongo Mendes', 924348270, '2023-06-04 19:28:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(453, 751459, '022293229HO058', 'Antónia Otília Chitacumula Jorge', 927357192, '2007-05-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Chicala Jorge', 927357192, '2023-06-05 21:02:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(454, 634539, '020366301HO058', 'António Segunda Dumba', 925874082, '2007-08-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Daniel Dumba', 925874082, '2023-05-24 04:38:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(455, 403388, '023329514HO052', 'Avelino Sambeu ', 924902062, '2006-08-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Victorino Aculuveie', 924902062, '2023-05-22 08:18:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(456, 724078, '009463482HO049', 'Bartolomeu Kufukinlã Severino Antunes', 923624798, '2006-09-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto Antunes', 923624798, '2023-06-05 21:03:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(457, 129448, '023374541HO050', 'Benedito Castro Mateus', 923531714, '2006-07-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Victorino Mateus', 923531714, '2023-06-05 21:04:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(458, 986529, '020246590HO055', 'Bento Chivangulula Baptista Candumbo', 923817956, '2005-09-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Baptista Candumbo', 923817956, '2023-06-05 21:05:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(459, 750844, '020790931HO057', 'Bernardo Quintas Tchacumola', 924629799, '2008-03-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Elias Junga Tchacumola', 924629799, '2022-12-15 05:18:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(460, 618856, '024826075', 'Cândida Nandundo José Serqueira', 924503412, '2007-03-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bernardino Kantes Serqueira', 924503412, '2022-12-15 05:18:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(461, 862018, '020706414HO050', 'Carlos Samuanji Pimpão', 937271831, '2008-09-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Amândio Tchitembo Pimpão', 937271831, '2023-06-05 22:17:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(462, 850076, '3514/2013', 'Celeste Umbombo António Segunda', 937175952, '2006-12-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Ribeiro Coelho', 937175952, '2023-06-05 21:05:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(463, 145887, '3745/2013', 'Claudio Tomás Cacuete Chissende ', 921115449, '2008-09-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adalberto José Chissende ', 921115449, '2023-06-05 21:06:11', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(464, 248704, '020385416HO054', 'Cleidine Jeremias Chilala Chitango ', 934583767, '2005-08-26 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Antónia Ngueve ', 931800458, '2023-06-05 21:06:36', '2025-01-24 14:09:21', 1, 0, '0', 'Huambo', NULL, 'Chicala ', 'Huambo', 'Tchicala Cholohanga Huambo', 'Huambo', 'Jeremias Chombo', 'Antónia Ngueve', 'Ingles', 'Mãe'),
(465, 386361, '1901200', 'Domingas Ngueve Domingos ', 922280460, '2007-01-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Leornardo Domingos ', 922280460, '2023-06-05 21:07:07', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(466, 487284, '021570584HO053', 'Emília Tuacuame Santos ', 923380315, '2006-08-22 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'José Sapalo Santos ', 923380315, '2023-06-05 21:08:10', '2024-09-27 09:16:07', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(467, 92105, '020431691HO056', 'Felícia Cawoli Domingos ', 923790446, '2006-09-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcolino Domingos', 923790446, '2023-06-05 21:11:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(468, 126275, '617/2021', 'Gastão Bernardo Calenga David', 949281034, '2021-07-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'David Chico Muxila', 949281034, '2023-06-05 21:20:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(469, 10566, '010231953HO049', 'Geraldo Alfredo de Jesus Damião', 921835772, '2005-07-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celestino Damião', 921835772, '2023-05-22 19:23:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(470, 213777, '022081930HO057', 'Isabel Njepele Chipuco Henrique', 932957167, '2006-10-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Afonso Henrique', 932957167, '2023-06-05 21:22:24', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(471, 65574, '009985453MO042', 'Jaime Kamau', 934075745, '2008-02-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Kamau', 934075745, '2023-06-05 21:23:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(472, 201806, '020366765HO056', 'José Chivela Ventura', 923586029, '2008-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Ventura José', 923586029, '2023-05-23 21:40:04', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(473, 997848, '021439785CC050', 'José Lutombe Ngueve Secundino', 926342932, '2006-05-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Faustino Secundino', 926342932, '2023-05-22 19:34:30', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(474, 757225, '021179447HO057', 'Leolinda Cawape César', 922342004, '2006-07-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Arão César', 922342004, '2023-05-24 07:05:18', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(475, 820339, '022661193LA054', 'Lukeny Rosa Segunda dos Santos', 931348115, '2005-08-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Honório Cristovão Jaime dos Santos', 931348115, '2022-12-27 10:57:25', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(476, 229634, '3501', 'Malheiro Chongolola Joaquim', 924213572, '2006-08-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Malheiro Joaquim', 924213572, '2023-06-05 23:27:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(477, 17137, '021841686HO055', 'Manuel Tiago Mário', 937816838, '2007-02-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Tiago Mário', 937816838, '2023-06-05 23:27:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(478, 676843, '84', 'Margarida Namussala Nacato Chipa', 99999999, '2006-02-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Chipa', 999999999, '2023-06-05 23:28:18', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(479, 407639, '022056486HO053', 'Moisés Mário de Mário Tchissingui', 939530968, '2006-08-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Franscisco Leonardo Tchissingui', 939530968, '2022-12-27 10:57:25', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(480, 102628, '443', 'Rodrigues Chiwale Bernardo', 943548677, '2007-03-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Azafe Bernardo', 943548677, '2023-06-05 23:29:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(481, 868168, '1885', 'Rodrina Chavonga dos Santos Menezes', 933360763, '2006-05-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Justino Luciano Menezes', 933360763, '2022-12-27 10:57:25', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(482, 609783, '610/2021', 'Rosa Bernadeth Calenga David', 949281044, '2009-05-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'David Chico Muxila', 949281044, '2023-06-05 23:30:15', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(483, 265345, '2094', 'Teresa de Jesus da Costa', 948107314, '2005-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António da Costa', 926017080, '2023-06-05 23:31:21', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(484, 958377, '1076', 'Tiago Venâncio Ngolo', 948107314, '2006-09-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ricardo Hungulo Ngolo', 948107314, '2023-06-05 23:32:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(485, 877132, '020538378LA054', 'Wilson Quissalelo João Domingos', 948287840, '2006-06-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Dina Nelita João', 948287840, '2023-06-05 23:51:46', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(486, 933212, '009606662HO045', 'Zélia Necuva Valentim', 935452741, '2006-02-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Real Valentim', 935452741, '2023-06-05 23:53:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(487, 532323, '021668095HO054 ', 'Abel Cassoma Chitunda ', 935224886, '2005-01-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Chitunda ', 927535400, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(488, 709062, '020159906HO056', 'Adelaide Madalena Cambuta ', 930278135, '2004-06-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Avelino Cambuta ', 924410968, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(489, 521353, '009956339HO040', 'Agostinho Jamba Nito ', 943966282, '2004-08-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Abilio Nito ', 933236941, '2023-06-04 19:33:31', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(490, 133896, '022151148hO054', 'Amaldete Da Conceição Cavenga ', 946635484, '1999-05-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luis Gonçalves ', 922124546, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(491, 453152, '021214415HO055', 'Ambrósio Prata Caquenha ', 946635484, '2004-11-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Victor Caquenha ', 926142597, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(492, 220193, '023153276HO056', 'António Calumbombo Menezes Samuel ', 947927957, '0000-00-00 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ávido Samuel ', 947927957, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(493, 228589, '02174854HO055', 'António Chiquemba Fontes Eduardo ', 938726679, '2002-12-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Armindo Eduardo ', 925869001, '2023-05-20 10:13:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(494, 22224, '00924361HO044', 'António Eduardo Paula Bumba ', 930220954, '2005-11-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Chindemba ', 930220954, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(495, 965946, '008225699LS043', 'António Kussumua Tiago Camuto', 2147483647, '1999-09-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bernardo Camuto', 922405006, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(496, 992791, '022612094HO051', 'Apolinária de Fátima Capuca', 924386292, '2007-04-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emílio Capuca', 924386292, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(497, 88907, '022545160HA055', 'Avelino Faustino Raimundo da Silva', 935721692, '2004-07-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Domingos da Silva', 926124312, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(498, 767357, '021680340HO056', 'Belardina Raquel Nataniel Chipundo', 923264628, '2005-12-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Euclides Elias Chipundo', 923264628, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(499, 251041, '020858902HO050', 'Domingos Cumbuio Chitumba', 948041071, '2004-06-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luciano Chitumba', 2147483647, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(500, 9769, '009688856HO041', 'Eduardo Tulumba Ecuala', 999999999, '2005-08-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto Joaquim Catuta', 2147483647, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(501, 600260, '1865', 'Emília Chilombo Dumbo', 930139642, '2004-05-19 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Luciano Muongo', 942458437, '2022-12-27 10:06:02', '2024-09-27 13:19:35', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(502, 315422, '020312550HO052', 'Ernesto Tomás Calufele', 922392053, '2004-02-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rodrigues Cachinjonjo Calufele', 924513543, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(503, 306566, '021281259HO054', 'Fernanda Domingas Zacarias', 936165373, '2000-03-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingas Eduardo', 932324760, '2022-12-27 10:06:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(504, 49050, '021509541HO053', 'Flora Nanguia Mariano', 947474497, '2002-03-18 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Mário Mariano', 935674687, '2023-05-23 20:31:50', '2024-12-02 06:35:04', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(505, 621100, '021064296HO059', 'Inês Chiconde Sokete Salessa', 999999999, '2004-10-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Daniel Salessa', 923906552, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(506, 270037, '021894134HO055', 'Isaías Sunguanhanga Capingala', 999999999, '2004-05-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando Kundundo', 934135285, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(507, 4210, '021298975HO058', 'Jacob Sambela Vapor Cachipa', 947041795, '2005-04-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Tulumba Capingala', 936678292, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(508, 952532, '12922', 'Jeremias Paulo Juilião', 942263237, '2004-10-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulo Julião', 924701704, '2023-06-05 21:23:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(509, 439655, '021908276HO055', 'João Manuel Livongue', 939582914, '2004-03-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Constantino Manuel Livongue', 939582914, '2023-06-05 21:23:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(510, 33582, '022383319BA050', 'Joaquim Pires', 926046733, '2005-07-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Pires Miguel', 926046733, '2023-06-05 21:24:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(511, 558438, '2151/2016', 'Julina Cahemba Njili Maneca', 933309080, '2005-11-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Anareth Ruth Epalanga', 933309080, '2023-06-05 21:28:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(512, 472660, '009106132HO044', 'Laurinda Ngueve Bernardo', 933786410, '2004-08-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Simão Bernardo', 940455180, '2023-05-23 14:08:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(513, 788199, '009310745HO040', 'Lourdes Jamba Fio', 937380604, '1999-10-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Feliciana Catoma', 937380604, '2023-06-05 21:36:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(514, 282443, '11973', 'Luciana Nana Muhongo', 923414876, '2005-11-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Raquel Capuisa', 923414876, '2023-06-05 21:38:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(515, 733640, '022450794HO052', 'Luciana Ngalo Jimba', 922073711, '2004-07-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Martinho Jimba', 922073711, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(516, 605821, '023194700HO055', 'Luzia Wimbo Chivava', 924357962, '2002-09-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Chivava', 924357962, '2023-06-05 21:40:23', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(517, 819244, '1869', 'Marcelina Pessa Sassengo', 921218467, '2005-07-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Avelino Pessa Sassengo', 921218467, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(518, 266031, '021365650HO059', 'Margarida Ngueve Chico', 99999999, '2005-06-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celestino Chimanha', 999999999, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(519, 135169, '020385717HO054', 'Maria Ester Canjolomba', 945878148, '2003-02-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Horácio Diqueto Canjolomba', 928868847, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(520, 931561, '1977', 'Maurícia Jamba Chilala', 922102588, '2004-06-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Cipriano', 940720062, '2022-12-27 10:06:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(521, 425604, '33858', 'Paula Vissolela Cambuta', 937405666, '2004-08-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'André Cambuta', 937405666, '2023-05-21 02:17:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(522, 394188, '009375035HO047', 'Ruth Nandaca Chicundia', 929283637, '2005-06-03 00:00:00', 'Femenino', 'Solteira', 'IPPC a Luz do Saber', 'Huambo', 'Nenhuma', 35, 'Ana Paula Cautele', 929283637, '2023-05-22 13:14:32', '2025-01-15 12:30:03', 1, 0, '332', 'Huambo', '2024-04-01', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Eurico de Carvalho', 'Gabriela José Chitende', 'S/AGREGAÇÃO', 'Irmã'),
(523, 99893, '7676', 'Valentino Baptista Culavoca', 940098457, '2004-02-14 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Baptista Camananga', 927629151, '2023-05-21 15:17:33', '2024-09-26 12:54:33', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(524, 863197, '020116873HO052', 'Wellwitschia Henjengo Gaspar', 930231117, '2007-07-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel António Gaspar ', 930231117, '2023-05-22 22:31:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(525, 934688, '010131191HO45', 'Aires Domingos Canganjo', 928511204, '2007-04-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adelino J. Epalanga', 928511204, '2023-05-24 04:30:24', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(526, 121730, '1129/2019', 'Anselmo Wanuque Nguize', 925417308, '2006-10-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Nguize Bernardo de Eurico Zomba', 927174941, '2022-12-27 22:27:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(527, 487686, '8102', 'Antonieta Cutala Sambunjo', 924702923, '2002-08-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Justino Sambunjo', 924702923, '2022-12-27 22:27:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(528, 242946, '022456654BE055', 'Armando Chitue Nacato Domingos', 9315555, '2003-03-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estrela Nacato', 9315555, '2022-12-27 22:27:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(529, 505112, '02833386', 'Arminda Nachimo Vihemba Epalanga', 932916547, '2006-01-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eduardo Faustino Epalanga', 932916547, '2022-12-27 22:27:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(530, 651520, '022139280HO059', 'Augusta Chiquemala Jimbi', 925302540, '2004-09-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Jimbi', 925302540, '2022-12-27 22:27:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(531, 742481, '009793468HO044', 'Bibiana Cuenda Manuel Muquinda', 928704621, '2002-07-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Henriques Muquinda', 928704621, '2023-01-23 23:54:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(532, 238926, '009379311HO044', 'Carlos Marcelino Sassussu Catchumbo', 945215487, '2000-03-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Benedita Sassussu Oliveira', 923776644, '2022-12-27 22:27:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(533, 484617, '021305168HO054', 'Celeste Wessi Chinconguele', 930797215, '2003-01-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulo Feliciano', 930797215, '2023-05-23 16:17:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(534, 475509, '3534', 'Celestino Palaya Ngayeta', 927846783, '2003-08-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Salomão Eduardo Katimba', 925663543, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(535, 905229, '3534', 'Celestino Palaya Ngayeta', 927846783, '2003-08-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Salomão Eduardo Katimba', 925663543, '2022-12-27 10:37:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(536, 496746, '010281368HO043', 'Celestino Sacutonga Cambandi Cacumba', 933720770, '2006-10-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Armando Cacumba', 933720770, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(537, 803552, '1951', 'Dinis Cambiambia Ferrreira Alberto', 943200373, '2006-02-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Victorina Chionga', 924675114, '2023-01-22 05:09:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(538, 364067, '020576012HO059', 'Domingas Cecília Catito', 923242282, '2003-12-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abílio Catito', 923242282, '2023-05-23 08:45:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(539, 76213, '020170725HO057', 'Domingas Lídia Vissesse Lumueno', 943113313, '2003-10-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Dina Vissesse', 943113313, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(540, 23095, '5832', 'Domingas Mariquita Mulunda', 931757669, '2007-01-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Sehuma Mulunda', 931757669, '2023-05-24 11:49:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(541, 277960, '022310381HO059', 'Domingas Nahossi Hossi Prata', 942955815, '2005-06-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Samuel Prata', 942955815, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(542, 523688, '020600505BE052', 'Eunice Nduva Daniel Zavara', 927478231, '2003-02-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Laurinda Cuaiela Daniel', 927478231, '2023-05-23 06:01:21', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(543, 476922, '009648919KN049', 'Felícia Francisco Ventura', 931145719, '2002-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Lúcia António Francisco', 931145719, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(544, 250239, '020086843HO055', 'Fernando Cunha Tchivaluco ', 939862153, '2002-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Tchivaluco', 924566121, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(545, 327432, '022417500HO052', 'Gertrudes Mariquita Samalo dos Santos', 943312356, '2003-04-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Estevão Garcia Pinto', 947874677, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(546, 190880, '020523788HO53', 'Gertrudes Nana Nangula Waianga', 940332673, '2004-11-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Júnior Modesto', 935338230, '2023-05-11 02:55:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(547, 431357, '03779', 'Hilária Lussati Calupeteca Daniel', 931619155, '2006-05-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Leonardo Paulino', 931619155, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(548, 731314, '008745737HO042', 'Horácio Ndala Jaime', 949440620, '2003-04-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Sebastião Ndala Jaime', 949440620, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(549, 204462, '021442261HO054', 'João Antunes Mundombe', 943490581, '2006-01-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Apolo Mundombe', 943490581, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(550, 802874, '006792091', 'Joaquim Caluna Cuya', 0, '2003-02-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Cawenji Cuya', 939423904, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(551, 379391, '022175547HO051', 'Jorgina Catumbo Paquissi', 938624256, '2005-06-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando Nené Paquissi', 938624256, '2022-12-27 22:27:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(552, 909023, '021086774HO056', 'José Raúl Dumbo', 939792664, '2002-03-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luciano Muhongo Dumbo', 930139642, '2023-01-24 05:08:17', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(553, 599410, '020363236HO054', 'José Satamba Mbalaka', 931087274, '2005-11-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Delfina Rebeca Sole', 931087274, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(554, 483462, '022244385HO058', 'Júlia  Mande Cassinda ', 923746033, '2007-02-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cipriana Joana Ulica', 923746033, '2023-01-22 05:52:24', '2024-10-29 15:35:24', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(556, 575734, '2925', 'Júlia Salassa Capindali', 921336446, '2006-12-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mário Capindali', 938318096, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(557, 566747, '021390697HO059', 'Marcial Cassenje Chanja', 943196171, '2002-12-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Enoc Changa', 943196171, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(558, 449849, '0008839147HO043', 'Maria Antónieta  De Jesus Lopes                                                                                                                                                                ', 937278351, '2006-03-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José António Lopes ', 937278351, '2023-05-22 22:02:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(559, 538497, '999999999', 'Maria Fernanda Chissenda Canganjo ', 923526266, '2004-12-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Benedito Canganjo ', 923526265, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(560, 946687, '2505', 'Marta Culaca Samessele', 999999999, '2004-08-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Oséias Samessele', 2147483647, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(561, 369975, '021348493HO056', 'Priscila Chambula Cassoma', 936635746, '2003-07-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adélio Cassoma', 923682690, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(562, 649155, '009964532HO046', 'Rosalina Utima Camela', 947299449, '2002-03-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jacob Horácio Canganjo', 947299449, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(563, 390060, '022252245HO054', 'Sofia Essenje Bernardo', 921284474, '2003-10-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Camilo Bernardo', 921284474, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(564, 682061, '231', 'Teresa Ninõle Pascoal', 945027171, '2003-05-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria Napingala', 945027171, '2022-12-27 22:27:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(565, 97091, '005871771HO048', 'Adélia Joana Vitangui Kanepa', 947934902, '1996-09-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adélia Joana Vitangue Kanepa', 947934902, '2023-05-22 20:12:11', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(566, 240490, '006500192BE045', 'Adelina Catumbo Kapihã', 933587651, '1998-07-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernado Kapihã', 924306197, '2022-12-28 08:30:49', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(567, 943093, '020728360HO051', 'Adelina Maria Nungulo', 928585013, '2004-08-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adelino António Nungulo', 928585013, '2022-12-28 08:30:49', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(568, 257335, '010117958BE042', 'Benvinda Cassinda Butão Víctor', 945867056, '2004-07-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Víctor', 945867056, '2022-12-28 08:30:49', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(569, 62090, '5974', 'Clarisse Yungui Diogo Capingala', 923065538, '2007-02-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Caluvita Capingala', 2147483647, '2023-01-24 19:23:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(570, 6175, '19', 'Damião Cassengue Salivongue', 923871403, '2007-04-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Damião Cossengue ', 927329399, '2022-12-28 08:30:49', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(571, 59758, '022433216LA055', 'Deca Mbiavanga Manuel', 925699362, '2005-02-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Julieta Aurélio', 925699362, '2023-05-22 12:18:06', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(572, 231320, '290', 'Dionisia Chila Chivanja Cahango', 946607626, '2008-07-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rodrigues Mbole Cahango', 946607626, '2022-12-28 08:30:49', '2024-10-15 15:11:57', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(573, 441086, '020539857KS058', 'Domingas Kalumbo Sapalaia Kacuete', 945663964, '2003-08-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Quintas', 922450667, '2023-05-23 20:56:59', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(574, 533735, '009410933HO048', 'Fernando Chiquito Mucanda', 929379294, '2000-09-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Samuel Mucanda', 921680579, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(575, 407409, '005774714MO045', 'Guedes Manuel Samanongo', 922821966, '1996-12-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Guedes Manuel Samanongo', 922821966, '2023-05-22 12:42:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(576, 36837, '009658075HO045', 'Helena Livala Cassova Camões', 941577919, '1998-07-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Agostinho Satunga Cavala', 941577919, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(577, 378769, '006362420BE044', 'Imaculada Chohila João Chalale', 939995757, '1998-03-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Imaculada Chohila João Chalale', 939995757, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(578, 530238, '021488357HO055', 'Isabel Chicumbo Dongala', 944423193, '1999-12-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Evaristo Calei Dongala', 949423193, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(579, 708714, '011520016', 'Jacinto Vipata Capitango', 2147483647, '2006-10-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulo Capitango', 930182898, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(580, 39656, '007664392UE040', 'João Maurício Mizele', 945520846, '1999-07-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maurício Mizele', 945520846, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(581, 469590, '022080740CC059', 'Joaquim Pinheiro Calupeteca', 928287831, '2001-08-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bento Tulumba Calupeteca', 928287831, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(582, 596145, '002530516UE032', 'Leornadina Beatriz Zeferino', 939060676, '1987-10-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Leornadina Beatriz Zeferino', 939060676, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(583, 236516, '009811200HO046', 'Luciana Nangamba Pedro', 934002301, '1999-12-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abel Chicola', 924362281, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(584, 387903, '010005055HO043', 'Luciana Ndembele Katimba', 941691850, '2000-05-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Salomão Eduardo Katimba', 925663543, '2023-05-23 09:49:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(585, 707642, '020874200BE051', 'Luisa Jamba Chilombo Ngongo', 943213180, '2004-10-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Delfina Chilombo', 926230645, '2023-01-24 05:26:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(586, 323641, '007405374HO040', 'Luzia Tchilombo Calueio', 939206381, '1998-08-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rosária Nakembe', 939206381, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(587, 153445, '3487/2012', 'Madalena Chalula Ungomba ', 927332835, '2006-08-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Carlos Capussu Severino Ungomba', 927330620, '2023-05-21 08:45:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(588, 85045, '009914552HO045', 'Marcos Salussinga Natal', 927033074, '2000-06-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Natal', 927033074, '2022-12-28 08:30:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(589, 386882, 'Cédula nª014737141', 'Margarida Cachimbi Satende Armando', 946808173, '2007-05-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alexandre Armando', 946808173, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(590, 414079, '020170125HO059', 'Margarida Nonjamba Vissesse Lumueno ', 943113313, '2005-10-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Dina Vissesse', 943113313, '2023-01-24 19:12:32', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(591, 234602, '002523312hO039', 'Maria da Conceição Chipongue ', 933350483, '1987-07-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria da Conceição ', 933350483, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(592, 937696, '999999999', 'Maria da Pureza Chipessela ', 940450389, '2004-04-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'MArcelina Rosa Baca ', 940450389, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(593, 596515, '000764650HO045', 'Maria de Lurdes Galamba ', 934666008, '1995-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bernardo Tomás ', 934666008, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(594, 960354, '028319', 'Maurícia Cassova Calei ', 936474429, '1999-12-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luís Sangueve', 933935760, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(595, 126282, '021647863LA056', 'Mauro João Boaventura Cativa', 944417965, '2002-02-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mariana Melita Boaventura', 924459423, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(596, 629855, '3511/2019', 'Paullino Tchipanguela Armando Huambo', 922502286, '2006-03-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Paulino Huambo', 922502286, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(597, 200750, '020540935HO054', 'Paulo Epalanga Capingala', 924553635, '2000-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adelino Capingala Cambuta', 945025556, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(598, 145188, '009511486HO046', 'Rosalina Santa Mandele Viliengue', 948343948, '2006-03-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mariano Lemos Viliengue', 948343948, '2023-05-23 04:40:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(599, 211111, '020545494BE050', 'Suzana Benedito', 947273872, '2000-07-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Benedito Mário', 947273872, '2022-12-28 08:30:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(600, 157264, '2318', 'Alcina Chitula Chiamba ', 921021184, '2005-10-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Matias Chiamba', 921021184, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(601, 818937, '010184244HO048', 'Alice Vihemba Dala', 944420932, '2004-12-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Florinda Tchissolossi', 921316378, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(602, 182126, '2856', 'Ana Silvina Moutinho Donga', 922604623, '2003-07-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Armando Soma Donga', 944345091, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(603, 602174, '11469', 'Analtina Cecília Bernardo', 99999999, '2004-01-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Analtina Cecília Bernardo', 99999999, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(604, 767319, '008735367BE041', 'Angelina das Dores Serafim Sapalo', 944767687, '2005-08-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Elisa Manuela Serafim Zeca Vieira', 2147483647, '2023-05-10 06:08:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(605, 339673, '022477517BE051', 'Argente Paulo Chilombo Chitumba', 932425371, '2002-12-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Agostinho Eugénio Chitumba', 932425371, '2023-05-20 05:06:45', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(606, 115713, '009157147HO040', 'Augusto Suana Raúl', 945867563, '2001-09-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cândida Raúl', 921340554, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(607, 62574, '009116543HO044', 'Delfina Chassola Manuel', 927095711, '2008-03-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Antunes Manuel', 927095711, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(608, 625334, '515', 'Domingos Jeremias  Chitumba', 947497900, '2006-12-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Daniel Jeremias Chitumba', 923016402, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(609, 727309, '020678122LN058', 'Domingos Valter Calunga', 923822212, '2006-04-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ernesto Valter Ndala', 939766621, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(610, 724366, '009408276HO045', 'Eduvino Santos Sandala', 932136253, '2003-08-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Elias Funete', 937287083, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(611, 371774, '020023806HO058', 'Ernesto Cawele Bongue', 936783410, '2006-03-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Bongue', 936783410, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(612, 730469, '008156737HO045', 'Esaú Hossi Chimuco', 923965515, '1999-06-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ezequiel Zaqueu Hossi Chimuco', 929857868, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(613, 879531, '009997954BA041', 'Faustina Chissango Silvano', 939843921, '2005-07-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Luciano ', 922766013, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(614, 276722, '022770710HO050', 'Félix Sapitango Songo Serafim ', 938272799, '2003-04-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António José ', 938272799, '2023-05-27 18:51:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(615, 52809, '999999', 'Floriano Cahali Chingonguela ', 926815072, '2003-10-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Gabriel dos Santos', 926815072, '2023-06-05 21:11:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(616, 984928, '007316862HO044', 'Florinda Violeta Mungindo', 923341947, '1997-05-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emilio Joaquim ', 923341947, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(617, 69564, '9999', 'Helena Nacuenda Muecália ', 923876226, '2004-01-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ângelo Muecália ', 923876826, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(618, 427182, '021765246HO055', 'José Maria Chivanja', 946977087, '2003-05-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mariana Marcolina Naliongo', 946977087, '2023-05-15 18:30:01', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(619, 951047, '007909523HO041', 'Judith Kassakela Nachati da Costa', 926046082, '2000-12-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Carlos Charles Chindumbo', 947057703, '2023-01-25 08:27:46', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(620, 322373, '022180891HO059', 'Luisa Canjala Natambo Lucas', 930094777, '2003-07-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adelino Kaihado Lucas', 924325310, '2023-06-05 21:39:18', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(621, 877816, '12239/2012', 'Madalena Cassoma Chitepo', 922349092, '2007-06-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Hilário Chilulumo Chitepo', 922349092, '2022-12-28 18:04:48', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(622, 354109, '009891309HO048', 'Maria Cambundu Sachilunga', 937068185, '1998-01-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Matias Dulo Sapalo', 921562208, '2023-06-05 23:28:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(623, 966709, '008666244HO044', 'Modesta Chilombo Satende', 939203402, '1996-11-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Anastácio Satende', 945888080, '2023-05-28 13:14:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(624, 201577, '010000188KS045', 'Moisés Sassongue dos Santos', 922181618, '2003-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Janete Leonor Sassongue', 922181618, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(625, 321517, '022082724BA057', 'Rebeca Kassungo Catraio Tomás', 924719173, '2005-08-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Anacleto Borge Tomás', 924719173, '2023-06-04 18:54:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(626, 666714, '020342583KS056', 'Rebina Kuenda Sassongue Manuel', 922181618, '2005-04-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Janete Leonor Cassongue', 922181618, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(627, 560710, '020911175HO051', 'Roque Handa Tadeu', 948127680, '2003-06-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulino Tadeu ', 923735306, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(628, 12828, '3216', 'Teresa Sandra Chico Kamalata', 948127680, '2006-07-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusta Marelene', 922199633, '2022-12-28 18:00:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(629, 976622, '2833', 'Venância Nassiva Sandumbo', 947381820, '2004-12-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eugénio Herculano Sandumbo', 946891105, '2023-06-05 23:51:28', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(630, 886928, '005010432HO040', 'Gaspar António ', 937349236, '1972-10-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Gaspar Antóno', 942643756, '2022-12-28 17:01:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(631, 337575, '020896899HO054', 'Teresa Tecula Camilo', 944350324, '2002-09-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emílio Camilo', 929515016, '2023-06-04 19:00:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(632, 259169, '022127878HO050', 'Abraão Cavimbi Ekuikui', 941766600, '2005-11-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Pedro Tavares Ekuikui', 938300646, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(633, 313562, '009158698HO040', 'Aida Nangonga Praia', 926260048, '2001-06-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Baptista Praia', 938502745, '2023-06-04 22:14:17', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(634, 908906, '005820701HO045', 'Alexandrina da Conceição Samuenho ', 926260048, '1992-03-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando Bongue ', 926574953, '2023-05-22 07:09:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(635, 689605, '009651276HO044', 'Ana Maria Capitango ', 933997681, '1998-09-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Noemia Balombo ', 933997681, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(636, 502063, '4734', 'Ana Paula Sapalalo', 999999999, '2002-03-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jeremias Paulo Sapalalo', 999999999, '2023-05-21 15:42:49', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(637, 595871, '44159', 'Angelina Kassapi Simão', 924387120, '2004-04-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Simão', 924387120, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(638, 61674, '9336', 'António Lino José Daniel', 926623778, '2004-02-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Gabriel Muquinda', 926623778, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(639, 291781, '009974248BE040', 'Aristides dos Santos Sati Njilakalimi', 922061466, '2003-10-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Chicucuma Njilakalimi', 922061466, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(640, 412922, '021332458HO054', 'Bernarda Jamba Akundo Massanga', 927766889, '2005-09-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José da Cruz', 927766889, '2023-05-23 23:50:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(641, 298349, '022037543LA059', 'Bernardo Paulo Mboko Garcia', 931370466, '2003-07-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Garcia', 926119900, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(642, 456704, '021318933HO054', 'Berta Tchitumba Cassoma Jamba', 931669233, '2006-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mateus Jamba', 931669233, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(643, 969574, '00888973HO040', 'Celeste Nassoma Sachipuia Luvelo ', 934307272, '1999-02-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celeste Nassoma Luvelo', 929265052, '2023-05-22 16:17:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(644, 238008, '022748367BA052', 'Ema Tchokokanda Eugénia Miguel ', 931595738, '2006-10-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luciana Eugénia', 931595738, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(645, 127763, '020345669HO053', 'Ermelinda Susso Cachinjonjo Calufele', 9, '2006-07-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ermelinda Susso', 924513543, '2023-05-04 06:52:34', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(646, 807497, '4206', 'Eugénia Etossi Mandavela', 927794740, '2002-12-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Albano Mandavela', 927794740, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(647, 522427, '021521363HO51', 'Feliciano Muquinda Camenhe ', 927364682, '1998-03-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Camenhe', 931619155, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(648, 83350, '009953755HO040', 'Flora Silepo Cassoma Remido', 929353872, '2007-03-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celina Jivala Cassoma', 929353872, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(649, 819346, '009913092LA044', 'Gonçalo Michel Massoqui Ventura', 923531621, '2004-04-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José João', 927992489, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(650, 485639, '023443465HO052', 'João Pedro Samessele', 930303823, '2003-10-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Daniel Domingos Samessele', 926251063, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(651, 73985, '999999', 'Joaquim Vipita Nachindadi  Canganjo ', 937300471, '2004-03-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Lucas Canganjo ', 937700471, '2023-06-05 21:24:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(652, 382925, '023022207Be058', 'José Sambambi Evaristo', 923540067, '2004-09-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando Evaristo', 923540067, '2023-05-10 06:01:59', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(653, 761220, '9999999', 'Josefa Bayeta Chitupi ', 949816700, '2004-11-04 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Damião Cachindele ', 949816700, '2023-05-23 10:28:42', '2025-03-25 09:04:30', 1, 0, '0', 'Huambo', NULL, 'Angolana', 'Quipeio', 'Ecunha', 'Huambo', 'Lucas Chitupi', 'Luísa Nacayavi', 'L. Inglesa', 'Irmão'),
(654, 703301, '99999999', 'Julieta Navombo Lohenda Chitangueleca ', 933139816, '2008-05-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Martinho Sabino ', 933139816, '2023-05-23 14:14:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(655, 466540, '0092009405HA048', 'Laridia Feliciana Calupeteca Heque ', 940337862, '1999-04-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Idalina Calupeteca ', 940337862, '2023-05-21 02:19:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(656, 320533, '020095502HO058', 'Laurinda Mande Capalandada ', 922486106, '2003-09-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Artur Capalandada', 922486106, '2023-05-23 03:52:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(657, 719082, '99999999', 'Laurindo Monteiro Chissingui', 933880600, '2003-11-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Jorge ', 933880600, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(658, 19014, '021812527HO050', 'Luís Caála Chissumba ', 946677939, '2004-04-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Angelino Chissumba', 944417238, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(659, 117725, '008650923HO041', 'Luísa Namoco Lumbeta', 922648572, '2005-01-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Josefa Ngueve', 937825173, '2023-05-21 10:09:46', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(660, 34678, '6179', 'Manuel João Segunda', 925382052, '2005-09-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Segunda', 925723692, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(661, 717225, '008499865HO042', 'Marcolina Wimbo Tchiwale', 925079977, '1999-03-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Matias Chilela', 925079977, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(662, 113557, '020709089HO059', 'Margarida  Cândida Artur', 945752307, '2004-01-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ilda Cândido Chalula', 928272537, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(663, 573852, '18566', 'Martimiano Mutali Joaquim', 923871403, '2007-12-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Israel Chipando', 923871403, '2023-06-05 23:29:15', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(664, 977070, '009753235HO049', 'Neves Sicote Jonatão', 932729056, '2002-11-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abel Kapitango', 925643105, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(665, 159290, '1238/2012', 'Nsimba Mayingi Pedro Sebastião', 2147483647, '2004-09-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Nzeyi Sebastião', 923976303, '2023-05-23 07:11:08', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(666, 476104, '6.297', 'Rosalina Viqueia Calei', 924062007, '2008-05-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celina Baca', 924062007, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(667, 857719, '5882', 'Sara Nonjamba Ulundo', 926503114, '2005-08-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jovente Sachenhe Ulundo', 926503114, '2022-12-29 02:39:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(668, 279022, '022072551BA059', 'Serafina Kunhola Garcia', 922150292, '2003-04-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Helena Kamemba Pedro Kuyla', 949029188, '2023-01-24 05:48:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(669, 992979, '020448070HA056', 'Teresa Filomena Ndumbo', 930465217, '2003-11-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Victor Chombé Fernando', 930465217, '2023-06-04 19:38:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(670, 834350, '12846', 'Teresa Namba Simão', 922145113, '2003-12-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Moisés Sapesse Simão', 938967218, '2022-12-29 02:39:06', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(671, 660915, '020723115HO050', 'Verónica Cafeca Ginga Vicente', 934743405, '2002-05-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joana Gonçalves José', 928040442, '2023-05-09 20:08:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(672, 190375, '022315746HO058', 'Victorino Bembua Manjolo', 923435960, '2002-06-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Firmino Manjolo', 923434960, '2022-12-29 02:39:06', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(673, 19401, '021770197HO058', 'Albelina Socoloque Jamba', 923830037, '2007-08-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Alberto Costa Jamba', 923830037, '2023-06-05 18:36:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(674, 69641, '819', 'Angelina Cassinda Ângelo', 945464043, '2007-01-02 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, 'Francisco Ângelo', 945464043, '2023-01-24 16:15:03', '2024-08-05 05:04:18', 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(675, 392337, '020770687HO054', 'Afonso Natal Chamunengue Chiwale', 936754457, '2005-06-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Julieta Nambumba Chamunengue', 2147483647, '2023-01-21 05:05:25', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(676, 737977, '009599119HO048', 'Adriano Nassango Chilambo', 99999999, '2004-10-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Luzia Nassango', 926142597, '2023-06-05 18:12:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(677, 344441, '009450854HO040', 'Adelina Imbo Kanassi', 930186891, '2000-08-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Leonor Chilombo Watela', 925143349, '2023-01-21 05:05:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(678, 666419, '021497300HO059', 'Álvaro Calungulungo Pinto', 944600603, '2004-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Almeida Pinto', 933133069, '2023-06-05 18:37:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(679, 194867, '008207943HO044', 'Armindo Pindali Napanda', 926709128, '1996-04-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Celina Nguevela', 926709128, '2023-06-05 18:41:34', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(680, 525053, '010199722HO042', 'Augusta Manuela Mundombe', 931369984, '1999-06-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Feliciana Camala', 931369984, '2023-05-21 16:00:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(681, 946437, '005650757HO044', 'Avelina dos Santos Epalanga ', 943693336, '1994-01-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Avelina dos Santos', 934693336, '2023-01-21 05:05:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(682, 305348, '020985018HO050', 'Avelino Sucuacueche Chico', 937542414, '2004-10-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Teresa Emília Sucuacueche', 924690166, '2023-01-21 05:05:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(683, 500287, '021553052HO052', 'Cândida Mandele Salessa', 999999999, '2001-12-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Daniel Salessa', 923906552, '2023-06-05 18:43:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(684, 879477, '020653457LA058', 'Cipriana Augusto Guilherme', 940142914, '2003-07-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Balbina Chilombo', 923397647, '2023-01-21 05:05:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(686, 333280, '009481139HO049', 'Cleiton Fortunato Enoque Silva', 999999999, '2004-01-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Ethel da Luz Cangongo Enoque', 92090344, '2023-05-29 07:32:38', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(687, 97153, '010061868KS046', 'Élvio Luciano da Silva Caiumbuca Suplício', 935356215, '2003-07-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Paulo Suplício', 925409885, '2023-06-05 18:53:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(688, 830410, '021987692HO053', 'Emília Bença da Costa', 945223644, '2004-07-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Natália Chimopele', 940495469, '2023-06-05 19:05:36', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(689, 223102, '009671302HO049', 'Ermelinda Tchitula Muenengo Ferro', 938664512, '2007-01-27 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Berta Kumbelembe Muenengo', 938664512, '2023-05-23 07:45:45', '2025-03-24 14:24:19', 1, 0, '0', 'Huambo', NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Jorge Victorino Ferro', 'Berta Kumbelembe  Muenecongo', 'L. Inglesa', 'Mãe'),
(690, 407741, '008745346CC041', 'Esperança Miguel Jamba', 927492693, '2003-06-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Joaquina Jamba', 923982089, '2023-06-05 18:58:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(691, 794492, '008650793HO049', 'Evaristo Tiago Domingos ', 922648520, '2004-12-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Salomé Njinga', 929015431, '2023-05-21 10:10:04', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(692, 89929, '4875', 'Francisco Cassinda Vitangui Canepa', 947499302, '2005-04-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Mateus Adelina Kanepa', 946427057, '2023-05-22 20:13:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(693, 620643, '3318', 'Horácio Cassoma Felino', 942448890, '2003-12-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Alexandrina Necuva', 942448990, '2023-01-21 05:05:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(694, 737694, '008605986BO041', 'Idalina Kambuta Ngueve', 939875910, '2003-11-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Pedro José', 939875910, '2023-06-05 20:09:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(695, 337366, '22910', 'Isabel Henda Tchitangueleca', 924162681, '2005-02-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'António Tchitngueleca', 924162681, '2023-05-23 23:52:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(696, 306454, '010252339HO047', 'João Candiero Nachombe Baptista', 931617244, '2006-01-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Joaquim Chimo Baptista', 922427438, '2023-06-05 19:11:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(697, 69552, '1069', 'João Figueiredo Calesso Kamocha', 99999999, '2005-06-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Domiana Kalesso', 99999999, '2023-01-21 05:05:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(698, 360324, '020637225HO050', 'Joaquina Manuela Quintas Samuel', 923540661, '2008-05-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Tomás Cassinda Samuel', 923540661, '2023-05-22 08:47:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(699, 656904, '021264458HO051', 'José da Cruz Kapitango', 923155931, '2007-12-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Flora Linda Vasco', 942627524, '2023-05-23 23:51:44', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(700, 637563, '009801449HO44', 'Manuela Flora Ekavo', 926041593, '2007-02-03 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, 'Abel Ekavo', 926041593, '2023-05-20 00:34:38', '2025-03-12 14:39:17', 1, 0, '0', NULL, NULL, 'Angolana', NULL, NULL, '', NULL, NULL, NULL, NULL),
(701, 694141, '021045001HO054', 'Maria Ekuva Canjamba Chitangeleka', 925690022, '2007-06-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Adelina Nassipitali', 925690022, '2023-05-23 23:50:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(702, 258931, '24', 'Maria Metileana Satchicola', 925690022, '2005-07-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Epafrodito Eduardo', 947888810, '2023-01-21 05:05:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(703, 606, '1496', 'Marta Tchissolossi Katumbo', 946980673, '2004-03-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', '0', 36, '0', 923065437, '2023-06-05 19:23:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(704, 18614, '008703208BE044', 'Laurindo Chipilica Vihemba Vitangui', 939774616, '2004-08-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Pedro Vitangui', 934663408, '2023-06-04 19:07:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(705, 351019, '009258472HO040', 'Martinho Prata ', 922717889, '2000-02-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Salomão Vicente Prata', 938273327, '2023-06-05 19:23:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(706, 235347, '009756561LA042', 'Paulo Avelino da Costa Isaías', 945805908, '2002-03-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Rosa Maria Albino', 929846574, '2023-05-04 13:55:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(707, 746518, '112', 'Serafina Nachiueca Domingos', 929234409, '2004-12-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Domingos Marcolino Chindala', 928265231, '2023-06-05 19:35:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(708, 909490, '2385', 'Sofia Ngueve Hungulo Tiago Wissi', 928324124, '2007-01-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Idalina Tiago', 928324124, '2023-06-05 19:36:11', '2024-09-27 10:14:04', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(709, 223369, '021909393HO053', 'Suzana Catumbo Dino', 924438668, '2007-12-17 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, 'Eurico Bumba', 973689372, '2023-05-23 19:24:39', '2025-03-24 14:37:06', 1, 0, '0', 'Huambo', NULL, 'Angolana', 'Huambo', '', '', '', 'Leonora Ngueve', 'L. Inglesa', NULL),
(710, 259594, '001375902HO039', 'Teresa Etossi Caúle ', 921624636, '1991-01-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Teresa Etossi Cahule', 921624636, '2023-01-24 03:32:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(711, 3428, '009950174HO043', 'Violeta Namalinha Chimuco', 2147483647, '2002-11-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Adelaide Cassoma', 923925808, '2023-01-21 05:05:28', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(712, 425352, '022093747HO053', 'Adelino Gomes Sambuete Figueiredo', 939910055, '2007-05-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Júlio Gomes de Figueiredo', 924661384, '2023-06-05 18:27:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(713, 503591, '010272498HO041', 'Agostinho Chitalala Dialongo Chicola', 992817848, '2005-11-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'José Bernardo', 992817848, '2023-06-05 18:34:49', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(714, 131045, '009752657HO043', 'Alegre Valentim Vicente', 943191202, '2006-09-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Abel Vicente', 943191202, '2023-06-05 18:37:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(715, 961874, '021637824HO054', 'Amélia Nangulo Viegas', 939726233, '2002-02-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Horácio Lucamba', 932091000, '2023-06-05 18:39:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(716, 804218, '1381/2017', 'Ana Maria Ndulo', 948107314, '2002-12-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Arlinda Nayele Katanha', 926017080, '2023-06-05 18:39:36', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(717, 788932, '02346609HO059', 'Arlindo José Mendes Amaral Chivinda', 922269097, '2004-05-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Armando Amaral Chivinda', 949735739, '2023-05-22 10:36:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(718, 574305, '022219922LS056', 'Benilça Samba Benita Luciano', 923036489, '2005-10-27 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, 'Mateus Luciano', 944679175, '2023-05-21 13:16:53', '2025-03-10 12:26:10', 1, 6, '0', 'Huambo', NULL, 'Angolana', 'Saurimo', 'Saurimo', 'Lunda Sul', 'Mateus Guerra Luciano ', 'Beatriz Benita Nunes', 'Língua Inglesa', 'Pai'),
(719, 192482, '010223490HO042', 'Cecília Domingas Tchimu', 947959029, '2005-09-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'João Baptista Tchimu', 939934180, '2023-05-21 20:06:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(720, 636448, '020060415HO055', 'Domingas Janete Ventura', 943277366, '2006-06-28 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Elias Ventura', 921091470, '2023-06-05 18:47:06', '2024-12-10 11:30:07', 1, 0, '0', NULL, '2019-08-12', 'Angolana', 'Tchicala', NULL, '', NULL, NULL, NULL, NULL),
(721, 232159, '6716/2014', 'Domingos Catata Segunda ', 947734233, '2005-03-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Maria Imaculada Viegas', 939057442, '2023-01-21 03:57:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(722, 270187, '022156748HO052', 'Domingos Raimundo Caterça Cacumba', 938266993, '2004-12-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Guilherme Capita', 938266993, '2023-01-21 03:57:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(723, 392429, '007875447HO049', 'Elisa Cambundo Mussinda', 921335836, '1998-09-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Fernando Mussinda', 921335836, '2023-01-21 03:57:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(724, 347396, '021012320HO059', 'Emília Vihemba Cussumua', 923288476, '2007-07-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Rodrigues Feca Cussumua', 923288476, '2023-06-05 18:57:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(725, 739580, '021617215HO055', 'Eugénia Nende Malengue ', 923935778, '2003-11-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Pedro Sacupenha Malengue', 923681901, '2023-06-05 18:58:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(726, 771276, '855', 'Félix Alexandre do Rosário Cacupa', 921211016, '2005-03-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Rosária das Dores Alexandre', 921211016, '2023-06-05 19:00:31', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(727, 680032, '023275950HO051', 'Frederico Pedro da Cruz Sanalende', 942627524, '2007-12-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Flora Linda Esperança da Cruz', 923155931, '2023-05-23 23:51:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(728, 660479, '21338', 'Gabriel Chivinga Sacanangue', 935305896, '2005-10-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Gabriel Chivinga Sahanda', 935305896, '2023-06-05 19:02:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(729, 672892, '008747498HO044', 'Guilhermina Cassinda Severino', 931218842, '2003-07-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Enoque Chivembe Severino', 923867173, '2023-01-21 03:57:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(730, 359815, '021664064HO051', 'Henriqueta Vicente Chingongo Saculenga', 930389728, '2001-10-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Henrique Saculenga', 930848350, '2023-01-21 03:57:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(731, 123056, '020043765HO056', 'Jerónimo Pires Agostinho', 924023061, '2007-05-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Fernanda Sofia Pires', 924023061, '2023-06-05 19:06:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(732, 703491, '021043352HO056', 'João David Dumbo', 942458537, '2004-02-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Domingos Luís Dumbo', 930139642, '2023-06-05 19:12:08', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(733, 689111, '022126887HO057', 'João Máquina Cacuete Chissende', 948141989, '2005-11-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Adalberto José Chissende', 942299068, '2023-05-23 06:15:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(734, 200677, '009859886HO048', 'Joaquina Margarida Francisco ', 946249628, '2004-02-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Lucas Cardona Francisco', 937932659, '2023-05-22 21:47:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(735, 103719, '023229876HO059', 'Justo Colino Alfredo', 945029599, '2005-08-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Emília Tchulo', 945029599, '2023-06-05 19:15:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(736, 65104, '020651997MO053', 'Marcial Alberto dos Santos', 948143159, '2006-04-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Adriano dos Santos', 948143159, '2023-05-23 13:27:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(737, 771936, '021223555HO057', 'Maria do Céu da Cruz', 925701954, '1998-04-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Aires Wanga Ulica', 925701954, '2023-06-05 19:19:20', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(738, 422572, '020484289BE057', 'Maurício Sindikile Cachiombo Chikolomuenho', 924127526, '2000-05-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Sobral Chitangui Chikolomuenho', 2147483647, '2023-06-05 19:33:30', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(739, 569537, '020739113HO057', 'Natália Ngueve Ndjavela ', 924748128, '2005-09-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Felisberto Ndjavela', 924748128, '2023-06-05 19:33:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(740, 551756, '009773290HO046', 'Norton Chieke Cambimbia Numa', 92198945, '2001-06-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Horácio Numa Cambimbia', 933339980, '2023-06-05 19:34:32', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(741, 187640, '999999999', 'Rodrigues Chilongole Pinto', 938573890, '2004-07-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Victor Missão', 938573890, '2023-01-21 03:57:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(742, 210587, '009242956HA046', 'Texeira Avelino Ndulo', 943197357, '1999-12-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Cândida Camuenyo', 923094697, '2023-01-21 03:57:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(743, 424853, '007709468HA049', 'Adilson Manuel Nambi Sabino', 941629399, '2004-12-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Isabel Tuapandula', 948018002, '2023-05-14 00:35:21', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(744, 561830, '010036940HO042', 'Teresa Muinsã João ', 929815119, '2003-11-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'IserquiasJoão ', 931641368, '2023-01-21 03:55:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(745, 226955, '007971719CC044', 'Ernesto Kakenhele Mahongo ', 928575634, '2003-07-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Mahongo', 940807392, '2023-05-10 19:39:01', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(746, 663365, '00000000000', 'Joséfa Cláver Judith Simba Teresa ', 928073330, '2002-08-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Suzana Caaaessa', 928073330, '2023-01-22 03:36:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(747, 702506, '007539966HO045', 'Afonso Cambongolo Sacupima ', 933540913, '2003-04-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Antonio Afonso Sacupima ', 941590913, '2023-05-10 05:04:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(748, 511586, '020757375BA059', 'Maria Dos Anjos Aurélio Tulumba ', 9999999, '2005-01-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Delfina José Aurelio ', 4444444, '2023-05-12 04:19:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(749, 793140, '0000000000', 'Rebeca Ngueve  Samanjata ', 923375998, '2004-09-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Amós Samanjata ', 923375998, '2023-01-23 11:06:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(750, 842100, '020487889LA57', 'Orquidea Domingas Magalhães Vilundo ', 0, '2005-02-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando Bule Ulundo ', 925260008, '2023-01-31 01:26:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(751, 833835, '008270881BA0044', 'Salomé Muenho Félix ', 921623312, '2004-06-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alcina Felix', 924861281, '2023-01-23 11:40:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(752, 390498, '0217701131HO050', 'Agostinho Nunes Cassinda ', 928506046, '2004-01-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abel Cassinda ', 924622738, '2023-01-23 11:52:58', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(753, 534891, '021396412HO056', 'Alfredo Nascimento Miguel ', 933803500, '2002-12-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Monteiro Antonio ', 925080384, '2023-01-23 12:04:34', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(754, 563603, '020630459HO058', 'Bernadeth Luisa capingala ', 936784220, '2004-05-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Albertina Julita Santiago ', 936784220, '2023-01-23 12:15:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(755, 537015, '020161273HO059', 'Estefania Natchiyo Tchicangaluco', 922367689, '1999-12-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jerónimo Mango ', 922367689, '2023-01-23 12:28:45', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(756, 514442, '023016061BA059', 'Rosa Pumu Gime', 931294109, '2004-09-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mauricia Wimbo Jaime ', 931294109, '2023-01-23 13:24:48', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(757, 239075, '008664094BE040', 'Graciana Jovati Pascoal Jinga ', 925547486, '2004-11-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Jinga ', 923832143, '2023-01-23 13:40:32', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(758, 365598, '021258534KS057', 'Domingos Mbinja Cassoma Afonso ', 938493754, '1998-10-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Sabina Wandi ', 935503601, '2023-06-04 18:37:08', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(759, 141857, '008745971HO040', 'Domingas Chilombo Walinga Domingos ', 927566771, '1997-10-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingas Chilombo Walinga Domingos ', 927566771, '2023-01-23 13:56:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(760, 781131, '020931814LS059', 'Valdemira Elizabth Limochi Baptista ', 923476486, '2006-11-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Felicidade Maria ', 923476486, '2023-05-22 13:14:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(761, 559481, '010020135BE042', 'Ana Wemba Ngueve Oliveira ', 926255853, '2005-05-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ismael Ventura Gomes Oliveira ', 926255853, '2023-01-23 14:17:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(762, 746794, '023009412HO059', 'Valeria Tchova Chiuca ', 927769908, '2002-01-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ester Nambule ', 923213059, '2023-01-24 09:01:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(763, 471535, '022010242HO051', 'Rosalina Júlia Chivinda ', 932454447, '2002-08-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Armando Da Costa ', 932454447, '2023-01-24 09:09:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(764, 879512, '020392354HO050', 'Eugénio Helemila Sandumbo ', 922518269, '2001-11-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Eugénio Sandumbo', 946891105, '2023-05-21 11:53:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(765, 938814, '020790457BE052', 'Luciano Sambule Mussili', 927691796, '2005-05-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria Ruth ', 930936195, '2023-05-23 22:38:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(766, 572431, '0000000000', 'Paulino Manuel Ângelo ', 947985076, '2006-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Gervásio Ângelo ', 947985076, '2023-01-25 12:04:06', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(767, 147588, '000000000', 'Maximino Domingos Cassessa Sequesseque ', 928073330, '2005-02-19 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Suzana Chilombo Cassessa', 928073330, '2023-06-05 23:29:35', '2024-09-27 09:24:10', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(768, 359978, '007092337LA044', 'Margarida São Tomé Ernesto ', 931668228, '2001-01-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António de Almeida', 931668228, '2023-01-24 10:08:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(769, 184747, '021790508HO053', 'Luís Ganzagas Chavola', 925744500, '2003-11-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Ezequiel Chavola', 925744500, '2023-05-24 11:48:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(770, 846035, '021560142HO056', 'Rodrigues Calussi Santos', 923380315, '2005-07-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'José Sapolo dos Santos', 923380315, '2023-05-24 06:19:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(771, 988155, '021823270HO053', 'Ana Domingas Cassinda Domingos', 922448653, '2005-03-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Leonel Rebeca', 926925798, '2023-01-28 12:49:34', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(772, 378132, '2414', 'Ana Nalumbo Ngueve Secundino', 936507865, '2004-05-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ilda Vitória Secundino', 926342932, '2023-05-22 19:34:18', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(773, 984750, '023216334HO057', 'José Maria Chiquete ', 944054899, '2006-11-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Januario Albano ', 925135760, '2023-06-05 21:26:30', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(774, 684906, '020154453BE058', 'Manuel Prego Etelvina Salila ', 925721925, '2006-03-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'André Epalanga Isaias ', 925571925, '2023-01-24 13:55:08', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(775, 307164, '020716199MO057', 'Lurdes Ngueve Matos ', 945007270, '2004-08-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Pedro Mario Sanana', 929959549, '2023-06-04 09:53:07', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(776, 761537, '0205847KS051', 'Isabel Chilombo Sapalaya Cakuete ', 945663964, '2001-06-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Quintas', 922450667, '2023-01-24 14:13:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(777, 13362, '009522811HO048', 'Natália Serafina Chipembe Tendembandi ', 938074312, '2000-12-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Celestino Florencio ', 937747216, '2023-01-24 14:22:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(778, 591753, '021498012HO058', 'Jaime Dinis Chikale Maria Sachikapa', 935393392, '2005-09-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abel Kambala Kachama ', 935393392, '2023-06-05 21:22:50', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(779, 313191, '022058607HO052', 'Bonefácio Tchupica Jamba Nené', 924120869, '2007-03-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Venâncio Nené', 924120869, '2023-05-23 00:29:17', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(780, 576328, '007375149HO042', 'Angelina Chitende Eduardo', 936441049, '2002-10-05 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostolica', 'Huambo', 'Nenhuma', 35, 'Faustina Munga Pedro', 927774350, '2023-01-24 14:51:55', '2024-12-17 14:18:37', 1, 0, '379', 'Huambo', '2020-06-24', 'Angolana', 'Mango', 'Mungo', 'Huambo', 'Sousa Eduardo', 'Faustina Munga Pedro', 'Ingles', 'Mãe'),
(781, 423710, '021507233HO56', 'Lourenço Xavier ', 939062403, '2006-06-04 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Lucas Xavier ', 0, '2023-06-05 21:37:42', '2024-09-27 09:08:00', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(782, 383363, '008471669CA048', 'João Sebastião Franque ', 946218700, '2005-07-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'José Sebastião ', 946218700, '2023-01-28 12:50:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(783, 204621, '021632027HO053', 'Augusta Ngandala Joaquim ', 932158201, '2006-11-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Maria Joaquim ', 932158201, '2023-01-28 12:50:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(784, 390555, '021389822HO057', 'Filipe Tchipindo de Assis ', 949867232, '2003-09-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Jovita Domingas ', 949867232, '2023-01-28 12:49:34', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(785, 997020, '000000', 'Amélia Licumbi Chinjumbila ', 938330950, '2005-03-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bernarda Chinjumbila ', 944949812, '2023-01-24 15:30:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(786, 884821, '020964050CA056', 'Marcos Celestino Lubota', 924081140, '2002-10-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Celestino Joaquim Francisco', 933259714, '2023-01-28 12:50:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(787, 113398, '009242956HA046', 'Teixeira Avelino Ndulo', 943197357, '1999-12-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Cândida Camuenyo', 923094697, '2023-01-28 12:50:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(788, 410012, '2341', 'Teresa Ngulo Jerónimo', 945821196, '2002-04-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Jerónimo Calessa', 944921681, '2023-01-28 12:50:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(789, 355326, '999999999', 'Teresa Rebeca Caiuca', 930366459, '2003-09-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Tomás Rufino Caiuca', 932080961, '2023-01-24 19:29:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(791, 231723, '020289995BE054', 'Domingas Catarina Coelho Lemos', 926255853, '2007-01-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcos Candimba Lemos', 926255853, '2023-05-23 08:45:15', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(792, 597626, '009946785HO043', 'Clarice Domingos Vindes Gonçalves', 938283289, '2002-11-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Anastácio Domingos Vindes', 938283289, '2023-05-16 15:35:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(793, 323556, '99999999', 'Hilário Muelehongo Mussinda', 946157466, '1999-06-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Belmira da Conceição Jamba', 934343990, '2023-01-24 23:50:37', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(794, 854791, '020460095HO053', 'Rodrigues Chilongole Pinto', 938573890, '2004-07-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Victor Missão', 938573890, '2023-01-28 12:50:47', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(795, 637125, '020887575HO056', 'Luisa Violeta Capiñgala Cachota ', 924908703, '2005-04-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Hernani Carlos Cachota ', 929135453, '2023-01-26 19:57:28', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(796, 637015, '010015194HO048', 'Ambrósio Candumbo Bongo', 943098669, '1999-05-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Damião Da Silva ', 922214270, '2023-05-04 17:41:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(797, 59971, '00000', 'Nascimento Chipaca Nicolau ', 0, '0000-00-00 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'ççç', 5224, '2023-05-10 05:25:05', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(798, 926018, '0000000000', 'Bibiana Jamba Ndjavela', 2147483647, '0001-01-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '9999999999999', 0, '2023-05-10 06:13:07', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(799, 521932, '02282686840HO054', 'Florinda Kapunda Segunda', 9999999, '1999-07-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Florinda Kapunda', 9999999, '2023-05-21 07:18:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(800, 258892, '005471839HO047', 'Maria Donana Nachunda Sapaco ', 944140182, '1997-07-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cosme Quintino Sapoco ', 944140182, '2023-05-21 07:18:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(801, 559805, '024329337HO050', 'Inocêncio Nunda Candundo ', 931619155, '2007-04-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Paulo ', 931619155, '2023-05-22 09:11:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(802, 736567, '006935268LN047', 'Iracene Tuiambe Paciência Moisés', 937053556, '2001-03-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Matuca Paciência ', 934826068, '2023-05-22 09:11:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(803, 422656, '009649158HO048', 'Arminda Cassinda Cassela ', 927530665, '0023-12-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Moisés Cassela ', 931892369, '2023-05-22 09:11:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(805, 343552, '006117861HO048', 'Laura Nangassole  Nangaiafina ', 923837216, '1999-07-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Laura Nangaiafina', 923837216, '2023-05-22 20:46:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(806, 27805, '023895393HO050', 'Secretario Catito Daniel ', 928501986, '2006-12-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jereimias Chiteculo ', 928501986, '2023-05-22 21:12:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(807, 815979, '010207898HO048', 'Alice pires Agostinho Catombela ', 938723238, '2003-05-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernanda Sofia Pires ', 924023061, '2023-05-22 21:22:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(808, 744129, '020441193HO058', 'Isaias Carlos Sambumba ', 923694475, '2006-05-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria Guimarangue ', 23694475, '2023-05-23 04:14:15', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(809, 672262, '020370429BE054', 'Vasco Sassusso Hepo Valério ', 923694475, '2008-11-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', '0', 35, '0', 923694475, '2023-05-23 04:27:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(810, 975800, '006601669HO041', 'Leonor Mandele Lussati', 923065275, '1993-08-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando José António ', 923065275, '2023-05-23 05:20:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(811, 446246, '0000000000', 'Adelino Vanyhale Eyambi', 931330842, '2005-09-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ester Canjala ', 931330842, '2023-05-23 05:30:38', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(812, 810006, '023215400HO056', 'Domingas Tuayungue Bosco ', 926230645, '2006-06-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Delfina Chilombo ', 926230645, '2023-05-23 05:44:18', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(813, 852519, '020344467HO051', 'Mariana Cassinda Epango', 926621035, '2007-07-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Calisto Epango', 926621035, '2023-05-23 12:31:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(814, 924548, '022151310HO056', 'Albertina Neidy Dos Santos ', 926138745, '2008-03-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Dos Santos ', 926138745, '2023-05-23 13:26:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(815, 312067, '020309431HO059', 'Luis Calopa Domingos Cachiungo ', 923737070, '2006-05-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Tadeu Calei ', 923737070, '2023-05-23 15:10:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(816, 623273, '020741941HO058', 'Berta jambela  Salondeca ', 938083207, '2004-01-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Esperança salondeca', 938197399, '2023-05-23 15:23:08', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(817, 425396, '0000000000', 'Barbara Engracia Paixão Calei', 927924368, '2004-05-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'abel Chissingui Calei', 941807828, '2023-05-23 15:49:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(818, 578774, '010276357HO045', 'Albino José Jamba  Luacuti ', 931268662, '2009-11-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Da Silva ', 923720714, '2023-05-23 16:13:52', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(819, 842954, '3155', 'Eduardo Chipangue Sungo Chimuco', 933592703, '2005-04-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ezequiel Chimuco N. Jamba', 926919186, '2023-05-23 18:50:31', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(820, 509728, '009380948BE044', 'Maria Natividade Nambaca Canganjo', 923776166, '2004-02-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Gabriel Ndulo ', 922637188, '2023-05-24 00:54:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(821, 731799, '0211938543BE050', 'Inâcio Cassova Navemba Tchipilica ', 933709070, '2007-03-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luciano Chindambo', 926139612, '2023-05-24 01:06:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(822, 333803, '022272812HO053', 'Rosa Catapepo Chicola ', 933808040, '2006-02-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Chicola', 921913359, '2023-05-24 01:18:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(823, 965119, '006145574HO041', 'Anita Zeferino Mucuna ', 933850980, '2001-07-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Anita Zeferino Mucuna', 928757862, '2023-05-24 01:26:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(824, 230566, '000000000', 'Generosa Ngueve Chavola Cuvalela ', 948330023, '2005-07-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'inacia Ngueve Cavola ', 948330023, '2023-05-24 01:35:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(825, 464460, '023716708HO057', 'Agostinho Yombi Mahina Mário', 932988589, '2005-10-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Mário', 932988589, '2023-05-24 04:12:02', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(826, 940328, '009770759MO040', 'Elias Segunda Nassambo', 926138745, '2002-05-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano dos Santos', 948143159, '2023-05-24 08:07:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(827, 209595, '023819113HO054', 'Leontina Wimbo Fastudo', 924573997, '2006-06-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', '0', 35, '0', 924573997, '2023-05-24 08:50:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(828, 336240, '021787109HO055', 'Martinho Cambeu Alfredo', 923013761, '2004-03-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Gabriel Alfredo', 939523959, '2023-05-24 10:05:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(829, 24130, '010241324HO041', 'Maria Marcelina Lupili Quessongo', 937347344, '2005-09-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'David Quessongo', 937347344, '2023-05-24 11:30:38', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(830, 740256, '023627218HO057', 'Cristina Vihemba Chivela', 936023393, '2006-09-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Luís Chivela', 936023393, '2023-05-24 11:40:46', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(831, 661165, '022150722BA058', 'Benedita Filomena Munkoka Nestor', 939658724, '2007-07-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Kiala João Nestor', 926464299, '2023-05-24 12:03:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(832, 293686, '020846190CC059', 'Maria Imaculada Ulombo Ngumba', 945943644, '2003-06-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulino Ngumba', 945943644, '2023-05-24 12:11:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(833, 970150, '009130824HO046', 'Maria Margarida Troco', 935206652, '2004-03-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'AntónioTroco', 935206652, '2023-05-24 14:17:54', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(834, 26533, '2098', 'Elias Zunga Songuile', 930181267, '2006-12-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Natália Ngueve', 930181267, '2023-05-24 14:43:58', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(835, 834609, '020723788HO055', 'Adelaide Mbimbi Nanama', 945832630, '2006-03-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Hilária Nanama Daniel', 945669217, '2023-05-24 21:04:07', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(836, 910614, '022395398BE058', 'César Eduardo Ngandala Cassinda', 939575121, '2003-06-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Doriana Ngandala', 941494203, '2023-05-24 21:14:03', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(838, 87816, '003544805ME036', 'Fernando Armindo Feliz', 927450699, '1993-06-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Fernando Armindo Feliz', 922345857, '2023-05-24 21:24:09', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(839, 926282, '023552585HO056', 'Idalina Chilulo Cunjuca', 935791470, '2006-02-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Evaristo Freitas', 935791470, '2023-05-24 21:33:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(840, 958180, '022154829HO054', 'Laurinda Nassico Miguel Chitacumula', 927956209, '2008-05-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Chitacumula', 927956209, '2023-05-24 21:42:23', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(841, 21380, '020242628HO056', 'Eugénia Imaculada Pinto Zacarias', 924875369, '2007-08-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jonas Zacaraias', 923062120, '2023-05-24 21:48:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(842, 898713, '29766/2017', 'António Félix Capama', 927634535, '2007-11-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Casário Félix Capamba', 927634535, '2023-05-24 21:59:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(844, 589369, '020956142HO052', 'Jenerosa Feliciana da Silva', 924709170, '2005-11-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Evaristo da Silva', 924709170, '2023-05-24 22:13:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(846, 734074, '023829207HO054', 'Ana Paula Sachipembe', 930136663, '2003-01-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Dário', 939209052, '2023-05-24 22:37:01', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(847, 310191, '022925965HO058', 'Henriqueta Lussati Cahango', 936398123, '2007-03-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Matias Cahango', 936398123, '2023-05-24 22:50:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(848, 441400, '023904331HO053', 'António Sachilala Sassuque', 921032519, '2006-02-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Marcelino Segunda ', 942527813, '2023-05-24 22:59:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(849, 120271, '023136398HO57', 'Malistina Wulama Augusto', 928695442, '2007-12-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Simão Augusto ', 935189637, '2023-05-24 23:07:59', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(850, 668724, '021318496HO054', 'Verónica Namunda Silicuei ', 932435230, '2004-06-09 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Izindro Numa Silicuei', 924278934, '2023-05-24 23:33:31', '2024-12-11 09:48:14', 1, 0, '0', NULL, NULL, 'Angolana', 'Mungo', 'Mungo', 'Huambo', 'Izindro Numa Silicuei', 'Maria Joaquina', NULL, 'Pai'),
(851, 469323, '022088445HO057', 'Adelina Nhangue Sacutenga', 933159692, '2006-10-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rosalina Kuquehã', 942592498, '2023-05-26 08:16:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(852, 972480, '010007772HO043', 'Fernando Muecalia Capapa', 939302809, '2004-07-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Capapa', 943611558, '2023-05-26 09:22:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(853, 145523, '020098694CE053', 'Ci´cina Napitango Tchimgui Tchalo', 926043346, '2007-08-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Capapa', 943611558, '2023-05-26 09:40:32', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(854, 248170, '010200576HO045', 'Ana Paula Silvano', 935373242, '2004-11-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Silva Silvano', 935373242, '2023-05-26 09:46:23', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(855, 735620, '009304915BE041', 'Ana Nduva Cândido', 930116899, '2005-07-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abel João', 922027717, '2023-05-26 10:04:55', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(856, 493359, '023469472HO055', 'Inês Tchimbanjela Meti Tavatava', 938733456, '2006-01-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Valentim Tavatava', 938733456, '2023-05-26 10:14:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(858, 910525, '022386797BA058', 'Mário Castro Canende', 928532338, '2002-04-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Vasco Castro', 929269943, '2023-05-26 12:59:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(860, 642861, '020098694CE053', 'Cicina Napitango Tchingui Tchalo', 99999999, '2007-03-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Chiambo Tchalo', 926043346, '2023-05-28 02:14:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(861, 856625, '02271492LA051', 'Celeste Delfina Hosse Malanga', 923624798, '2005-08-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto Antunes', 923624798, '2023-05-28 10:20:26', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(862, 283876, '022473033HO050', 'Ernesto Mendes', 949060836, '2002-03-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ernesto Mendes', 949060836, '2023-05-28 10:36:33', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(863, 29672, '021705506HO056', 'Angelina Nanhime Pessela', 938462321, '2005-03-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Leona Victor ', 938462321, '2023-05-28 10:43:56', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(864, 421265, '021608564HO052', 'Emília Chulo Germano ', 931554155, '2003-01-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Rosa Essinda Germano', 924330217, '2023-05-28 11:01:13', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(865, 468819, '022942663HO055', 'Elias Salomão Chingualulo', 926510380, '2003-10-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Armando Alcides Pinheiro', 926510380, '2023-05-28 11:12:17', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(866, 466394, '021911029HO059', 'Deolinda Etumbo Nunda Kayaya', 924777430, '2007-02-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Josefina Nunda', 99999999, '2023-05-28 11:22:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(867, 975359, '009264679HO042', 'José Ramos Bingombingo', 946664274, '2001-08-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'João Chiambo Bingombingo', 924123807, '2023-05-28 11:34:36', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(868, 378478, '7149', 'José Kaweye Kavita', 924151472, '2007-12-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Félix Kavita', 924151472, '2023-05-28 11:49:43', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(869, 88879, '020761647HO055', 'Marta Jamba Sandambuca', 927249570, '2003-02-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ricardo Sandambuca', 927249570, '2023-05-28 12:00:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(870, 540774, '024842190HO051', 'Aurélio Chipilica Calungo', 927249570, '2007-11-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Vasco Catumbela', 927535539, '2023-05-28 12:15:38', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(871, 120105, '022395486BE057', 'Gabriel António E. C. Mandavela', 940677631, '2002-01-23 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Albano Mandavela', 940677631, '2023-05-28 12:30:57', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(872, 109742, '009917712BE045', 'Ntália Cumbelembe Malaquias', 931390736, '1995-10-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Manuel Ângelo Luacati', 931390739, '2023-05-28 12:44:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(873, 327201, '3471', 'José Sassoma Nangoia Domingos', 949169820, '0007-12-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Domingos', 99999999, '2023-05-28 13:08:40', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(874, 883471, '005523806BA47', 'Isabel Graciana Huambo', 937390206, '1989-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Domingos Huambo', 922886830, '2023-05-28 19:04:16', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(875, 512399, '024263950BE055', 'Fernando Nascimento Prata João', 922888056, '2007-08-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Hilária J. C. Prata', 935169879, '2023-05-28 19:38:24', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(876, 353083, '020280306HO053', 'Cecília Catumbo Cawele', 925941001, '2005-12-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Manuel Cawele', 935064138, '2023-05-28 20:12:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(878, 87836, '024265836HO052', 'Francisco Geraldo Adriano', 936478408, '2004-02-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Afonso Adriano', 936478408, '2023-05-28 20:22:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(879, 939333, '021480360HA058', 'Luisa Kuva Se Domingos', 930590112, '2001-08-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Bernardo Domingos', 929958005, '2023-05-28 20:36:18', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(880, 463669, '009271134HO047', 'Efraim César Carvalho ', 924736806, '2003-01-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Valentina Ngonguela', 930220954, '2023-05-28 20:50:14', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(881, 9613, '022164687HO053', 'Helena Tomás Gonçalves Chicolomuenho', 925990103, '2005-01-21 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Anila M. Chicolomuenho', 929023372, '2023-05-28 21:22:47', '2024-12-10 14:19:29', 1, 6, '0', NULL, NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Anibal Marcelino Chicolomuenho', NULL, NULL, NULL),
(882, 470549, '023978450BE050', 'Rodrigues Chitocota Namutumbo Chimalanga', 940339817, '2005-10-19 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Ngombo', 933470504, '2023-05-28 21:47:41', '2024-09-26 14:15:23', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(883, 229541, '009258718HO043', 'Felícia Canjala Chicambi', 929961980, '2000-02-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Evaristo Calunganga', 927912850, '2023-05-28 21:55:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(886, 364374, '020657073HO052', 'Luisa Chimbinda Kuvalela Mota', 946877378, '2006-05-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Luisa Chimbinda Kuvalela Mota ', 946877378, '2023-05-31 05:57:19', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(887, 17018, '024579747BE051', 'Maria Jungulo Catihe Cassinda', 932423770, '2007-03-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria Jungulo Catihe Cassinda', 932423770, '2023-05-31 06:14:59', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(888, 804638, '02204427HO052', 'Maria Nalungo Machado', 933485825, '2006-01-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Maria Nalungo Machado', 933485825, '2023-05-31 06:27:22', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(889, 454710, '021247875HO056', 'Alda Jorgina Nguendelamba ', 926319086, '2007-05-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Alda Jorgina Nguendelamba', 926319086, '2023-05-31 06:38:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(890, 136024, '021091117HO054', 'Juliana Francisca Dumbo', 942458437, '2005-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Juliana Francisca Dumbo', 942458437, '2023-05-31 06:51:39', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(891, 509143, '99999999', 'Laurinda Chimuna Coelho Lemos', 933707344, '2009-12-22 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Laurinda Ch. C.Lemos', 933707344, '2023-05-31 07:01:17', '2024-09-26 12:56:27', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(892, 992232, '021284700HO052', 'Inácia Jamba Chilepa Cavindivindi', 925100100, '2008-09-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Inácia Jmaba Chilipa Cavindivindi', 925100100, '2023-05-31 07:16:42', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(893, 192349, '020935954HO059', 'Adolfo Idalcio Adelino Cavindivindi', 925606024, '2006-10-09 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adolfo Ialeio Adelino Cavindivindi', 925606024, '2023-05-31 07:31:25', '2024-09-26 13:03:00', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(894, 17299, '022492873HO058', 'Adriano Capingala Simbo Hossi', 921958608, '2006-10-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Capingala Simbo Hossi', 921958608, '2023-05-31 07:40:27', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(896, 382779, '021894524HO055', 'Idilia Chimuna Segunda Muenhowossimbo', 940538406, '2003-10-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Idilia Chimuna Segunda Muenhowossimbo', 940538406, '2023-05-31 08:00:29', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(897, 65575, '020848353HO058', 'Delfina Jamba Canganjo', 941494203, '2007-07-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Delfina Jamba Cangajo', 941494203, '2023-05-31 08:11:53', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(898, 74633, '024569929HO050', 'Cândida Chambula Castilho', 929253287, '2005-11-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cândinda Chambula Castilha', 941494203, '2023-05-31 08:20:35', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(899, 506590, '999999', 'Jorge Luis Pequeno', 931252787, '2001-05-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jorge Luis Pequeno', 931252787, '2023-05-31 08:29:00', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(900, 742317, '008925887HO047', 'Augusta Namussole Segunda', 940331590, '2007-09-28 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusta Namussole Segunda', 940331590, '2023-05-31 08:37:11', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(901, 755744, '008929557HO048', 'Carlos Albino Handanga Segunda', 935484909, '2005-11-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusta Namussole Segunda', 940331590, '2023-05-31 08:41:51', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(902, 531320, '009478936HO043', 'Alberto Pinto Chiteculo ', 934504314, '2008-12-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Alberto Pinto Chiteculo', 934504314, '2023-05-31 08:52:38', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(903, 848955, '022165699HO052', 'Victoria Cheiepia Candele', 923069828, '2007-10-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Victoria Cheiepia Candese', 923069828, '2023-05-31 09:02:18', '2024-12-04 09:04:16', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(904, 825166, '022336141HO059', 'Angelino Benedito Cangombe ', 923065088, '2007-02-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Angelino Benedito Cangombe', 923065088, '2023-05-31 09:10:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(905, 334485, '024097579HO055', 'Suzana Nombo Domingos', 927255912, '2003-07-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Suzana Nombo Domingos ', 927255912, '2023-05-31 09:20:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(906, 124455, '020428797HO058', 'José Cris Catumbela', 936989120, '2008-03-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Suzana Nombo Domingos ', 936989120, '2023-05-31 09:27:48', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(907, 332614, '025152324HO057', 'Florença Avelina Jamba Felicidade', 936030726, '2007-08-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', '0', 36, '0', 936030726, '2023-05-31 09:45:12', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(908, 788179, '010046801HO047', 'Joaquim Chianica Satula', 924166395, '2008-07-29 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Joaquim Satula ', 924166395, '2023-05-31 09:54:46', '2024-10-14 09:50:06', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(909, 785931, '025088200HO059', 'Guilherme  Chindecasse Caquinha Capingala', 943515573, '2004-10-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Guilherme Chindecasse Caquinha Capingala', 943515573, '2023-05-31 10:02:10', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(911, 280691, '009818286HO046', 'Henriques Muquinda Ngundila', 999999999, '2005-10-22 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Henriques Muquinda Ngundile', 2147483647, '2023-05-31 10:10:24', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(912, 285478, '009714993HO044', 'Adelina Nguendela Elemba', 936004634, '2003-12-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Avelina Nguendela Elemba', 936004634, '2023-05-31 10:14:41', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(913, 387878, '023228780BE058', 'Severina Namenhe Chiquete', 925135760, '2003-01-18 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Severina Namenhe Chiquete', 925135760, '2023-05-31 10:25:30', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(914, 135513, '024008047MO050', 'Ester Evalina Vilinga ', 930489632, '2002-01-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Ester Evalina Vilinga', 930489632, '2023-05-31 10:32:31', '2024-07-31 03:12:57', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(915, 431352, '023744940HO050', 'Teresa Sinangue Kanjila', 923206544, '2001-12-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Teresa SinangueKanjila', 923206544, '2023-05-31 10:40:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(916, 861893, '009217550BE043', 'Abiulde Margarida', 928797455, '2001-05-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Abiulde  Margarida', 928797455, '2023-05-31 10:48:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(917, 887849, '023440293HO058', 'Salomé Wandi Ekuikui ', 923052098, '2005-10-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Salomé Wandi Ekuikui', 923052098, '2023-05-31 11:00:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(919, 586147, '006964162HO049', 'Armando Capanda Matenda', 939943587, '1997-12-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Armando Capanda Matenda', 939943587, '2023-05-31 11:24:26', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(920, 913366, '020913641CA054', 'Filomena Correia Suculate', 939943587, '2007-06-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Filomena Correia Suculate', 939943587, '2023-05-31 11:32:51', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(921, 534148, '02223999HO059', 'Maria Victoria de Jesus ', 929065637, '2003-05-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria Victoria de Jesus', 929065637, '2023-05-31 11:41:12', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(923, 20955, '020295064CA', 'Francisco Pitra Muila Preso', 945859237, '2008-04-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Francisco Pitra Muila Preso', 945859237, '2023-05-31 12:00:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(925, 852014, '023097757HO058', 'Maria Tavenda Chindemba', 923696200, '2004-03-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Maria Tavenda Chindemba', 923696200, '2023-05-31 12:08:28', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(926, 689898, '99999999', 'Laura Jimbo Candanda ', 933896521, '2002-12-27 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Laura Jimbo Candanda', 933896521, '2023-05-31 12:14:54', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(927, 892061, '010104614', 'Imaculada Sessi Nguendelamba', 943634412, '2001-07-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Imaculada Sessi Nguendelamba', 943634412, '2023-05-31 12:19:54', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(928, 666376, '022087145HO054', 'Isilda Rosalina Rubem Samuto', 926210658, '2007-09-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Isilda Rosalina Rubem Samuto', 926210658, '2023-05-31 12:27:01', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(929, 578185, '021102156HO056', 'Alexandrina Ngueve Cahungo', 923713027, '2005-04-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alexandrina Nguve Canhungo', 926210658, '2023-05-31 12:37:20', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(930, 958151, '9999999999', 'Mariana Bernarda Savihemba Chipinda', 925260008, '2007-10-31 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Mariana Bernarda Savihemba Chipinda', 925260008, '2023-05-31 12:45:59', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(932, 610921, '022396464', 'Edson Adriano Chinopo', 939995358, '2004-07-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Edson Adriano Chinopo', 939995358, '2023-05-31 12:52:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(933, 41333, '024222590HA057', 'Emilia Catumbo Canone', 927600815, '2007-01-25 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Emilia Catumbo Canone', 927600815, '2023-05-31 13:00:03', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(934, 717738, '020351544HO050', 'Cipriano Candumbo Chivangulula Baptista', 923817956, '2005-05-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'João Baptista Candumbo', 2147483647, '2023-06-02 18:37:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(936, 946627, '021008047MO050', 'Ester Evalina Vilinga', 930489632, '2002-01-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Luciano Vilinga', 938851737, '2023-06-02 19:45:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(937, 915837, '0000000000000000', 'Moisés Lohenda Chico Mendes', 921851269, '2007-07-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Cali Mendes', 2147483647, '2023-06-02 20:50:55', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(938, 470919, '010034162HO046', 'Rebeca Lua Camuenho', 923073630, '2001-11-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Laurindo Camuenho', 2147483647, '2023-06-02 20:57:16', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(939, 483478, '000000000000000000', 'Cândida Bongo Abreu', 923748517, '2007-03-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Creusa Benedita Chivole Chocalie', 923069594, '2023-06-02 21:02:19', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(940, 856067, '020736565HO059', 'Adriana Chimuma Nunda', 0, '2007-12-30 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Joaquim Hossi Nunda', 924249954, '2023-06-02 21:09:04', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(941, 72106, '0000000000', 'Helena Vimbuando Ginga Baptista', 943675762, '2006-01-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Feliciana Ginga', 0, '2023-06-02 21:16:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(942, 302675, '008627972HO043', 'André Manuel Vumba Quessongo', 941269415, '2008-08-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Flora Cassoma', 0, '2023-06-02 21:28:32', '2024-10-24 07:40:26', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(943, 446740, '020535189HO059', 'Venância Capuma Bulica Epuca', 949334891, '2002-10-08 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Bento Epuca', 0, '2023-06-02 21:35:06', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(944, 803067, '020431901HO057', 'Delfina Cachenhe de Freitas', 936091120, '2002-05-19 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Domingos de Freitas', 0, '2023-06-02 21:41:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(945, 836316, '021951604HO058', 'Victorino Chingueta Adelino', 922133735, '2004-10-17 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Damião Adelino', 0, '2023-06-02 21:48:00', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(946, 896004, '020350141HO051', 'Catarina Jacinta Chenga Chimuco', 923264610, '2006-06-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Daniel Chimuco', 0, '2023-06-02 21:53:41', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(947, 205899, '000000000000', 'Maria Efigénia Nataniel', 936387363, '2007-08-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Delfim Nataniel', 2147483647, '2023-06-02 22:16:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(948, 727728, '023005726HO058', 'Graciana Piedade Soares Alexandre', 925701131, '2008-07-05 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Bernardo Sacanangui Alexandre ', 2147483647, '2023-06-02 22:26:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(949, 216044, '022079762HO056', ' Valentim Amões Jamba Dunguyonga', 944950473, '2004-05-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000000000000', 2147483647, '2023-06-02 22:36:08', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(950, 134604, '023576008BA054', ' Fernando Palasu Tchivela', 945750655, '2006-03-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Domingos Tchivela', 2147483647, '2023-06-02 22:46:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(951, 140001, '021076318HO051', 'Rebeca Sicondela Agostinho Sandunduma', 922220317, '2007-08-13 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'José Apolo Sandunduma', 2147483647, '2023-06-02 22:53:26', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(952, 112217, '0000000000000', 'Luísa Navissoca da Fonseca', 924443573, '2006-10-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuel Luís da Fonseca', 2147483647, '2023-06-02 23:00:17', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(953, 881, '008307244BA040', 'Venceslau Victor Tavares', 938487190, '1998-12-03 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Victor Manuel Tavares', 2147483647, '2023-06-02 23:20:01', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(954, 904207, '009249241ME046', 'Débora Mazaca Agostinho', 938258910, '2006-02-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Albano de Oliveira', 941683318, '2023-06-02 23:37:25', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(956, 829576, '000000000000', 'Emília Rosa Maria Dala', 924712326, '2006-07-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Felisberto Sergio Dala', 0, '2023-06-03 00:06:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(957, 488812, '020432332HO050', 'Marcelina Nakeleko Ilimbilikilua', 928986594, '2008-01-21 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Leonardo dos Santos Ilimbilikilua', 925933174, '2023-06-03 01:06:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(958, 660108, '00000000000', 'Carla Luzia Molossande Paulino', 946636581, '1986-07-02 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Carla Luzia Molossande Paulino', -1, '2023-06-03 01:40:04', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(959, 538452, '008537286HO047', 'Helena Paula Sapato', 933337264, '1996-07-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Helena Paula Sapato', 0, '2023-06-03 01:46:48', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(960, 110563, '0000000000', 'Frederico Candundo Catota', 926513447, '2007-11-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Gervasio Quintas José', 929963562, '2023-06-03 02:00:27', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(961, 336305, '009264831HO044', 'Jovita Chimuma Chingui', 945855680, '2008-07-07 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Gervásio Chingui', 925507050, '2023-06-03 02:08:59', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(962, 425016, '022924046HO054', 'Madalena Candeia Simão Cateteca', 934708944, '2006-12-06 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Jacinto Cayombola Cateteca', 0, '2023-06-03 02:38:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(963, 956831, '009512284KS042', 'Laurinda Katumbo Calupeteca Cachuco', 934708944, '2007-12-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Eunice Nacata Jorge', 0, '2023-06-03 02:53:55', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(964, 592666, '021673995BE056', 'Valéria Chilombo Chicala', 939445024, '2006-05-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Bervino Chicala', 0, '2023-06-03 02:59:59', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(965, 930791, '020259408BE059', 'José Silva Lopes PAhula', 943242874, '2004-07-26 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Eduardo Pahula', 0, '2023-06-03 03:05:44', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(966, 872030, '022063300HO051', 'Domingos Canumbala Daniel', 935410971, '2005-01-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'José Bongue Daniel', 0, '2023-06-03 05:07:27', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(967, 854632, '024849926HO055', 'Domingas Chissaco Sapalalo', 922197531, '2008-10-04 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Jeremias Paulo Sapalalo', 0, '2023-06-03 05:16:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(968, 843958, '024891973KS055', 'César Niúca Jeremias', 0, '2003-07-14 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Jorge K. Baptista', 926511716, '2023-06-03 05:28:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(969, 996824, '021917171HO058', 'Maria Lussinga António', 929638492, '2005-01-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Gaspar António', 0, '2023-06-03 06:57:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(970, 153869, '021917171HO058', 'Maria Lussinga António', 929638492, '2005-01-20 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Gaspar António', 0, '2023-06-03 06:57:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(971, 29807, '024595350HO058', 'Rosalina Nawamba Gabriel Baptista', 924621145, '2009-03-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Matias Evaldo Baptista', 939581305, '2023-06-03 07:51:39', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(972, 20215, '020074634BE055', 'Esterina Elamba Chilomba Ngongo', 937941296, '2003-03-01 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Delfina Chilombo', 0, '2023-06-03 09:43:18', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(973, 767284, '021072339BE050', 'Afonso Alone Vihemba Samuhini', 937303077, '2003-02-15 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Daniel Leite', 937303074, '2023-06-03 14:52:20', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(974, 280249, '021830266HO050', 'Arlinda de Fátima Guenda Domingos', 928034035, '2003-12-12 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Paulo C. Domingos ', 924027040, '2023-06-03 15:05:47', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(975, 71181, '021055013HO053', 'Laurentina Natália Funete', 924199095, '2005-06-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Conélio Funete', 923811890, '2023-06-04 18:49:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(976, 163240, '101012120552', 'Abel Sachissequela Feca', 2147483647, '2003-10-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jorge Salomão Domingos', 930432743, '2023-06-04 19:54:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(977, 18476, '020379997HO057', 'Lucas Njahúlu Silas Kaviniama', 928471357, '2008-03-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Idalina Chisamba Silas', 928471357, '2023-06-04 20:25:03', '2024-12-11 14:31:00', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(978, 703992, '007547234CC043', 'Sabino Sangogo Benita Franco', 926945427, '1999-01-24 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Sabino Franco', 926945427, '2023-06-04 21:00:06', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(979, 185354, '0250010101010', 'Maurício Candolo Calimbue', 928138457, '2006-01-11 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Paulino Catemo Calimbue', 928138457, '2023-06-04 21:10:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(980, 110130, '007256462BE046', 'Alfeu Domingos Ngombo', 940332076, '1996-06-29 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Ngombo', 933470504, '2023-06-04 22:08:49', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(981, 589174, '023014897HO057', 'Delfina Jambela  Ngala', 940462994, '2003-12-10 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Martino Ngala', 940462994, '2023-06-04 22:26:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(982, 4364, '007760449HO040', 'Ladislau Joél Flávio Wele', 926542944, '2003-05-09 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Laurinda Catumbo Flávio', 926542944, '2023-06-04 22:46:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(983, 629850, '02020202020202', 'Floriana Balombo Cassinda Ndala', 939331937, '2004-05-16 00:00:00', '', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Nicolau', 939331937, '2023-06-05 10:16:08', '2024-12-24 18:03:59', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(984, 100818, '00000', 'Adelino Vanhale Eyambi', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '0000', 0, '2023-10-30 13:50:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(985, 513550, '00000', 'Adilson Manuel Nambi Sabino', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 13:50:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(986, 32272, '00000', 'Alberto Pinto Chiteculo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 13:51:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(988, 848660, '0000', 'Amós David Sapingãla', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 13:52:52', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(990, 688533, '0000', 'Angelina Nachiliva Canganjo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 13:54:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(991, 58769, '0000', 'Ângelo Kalandula Eduardo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 13:54:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(992, 717699, '0000', 'Antonieta sande Cafile Daniel', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 13:55:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(994, 201856, '00000', 'Augusta Navihilo Chimuma Paulino', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 13:56:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(995, 299323, '000', 'Benedita Eiala Cachievala', 0, '2006-05-17 00:00:00', 'Femenino', 'Solteira', 'NB', 'Huambo, Bomba Alta', 'Nenhuma', 36, 'João Bernardo Cachievala', 930233168, '2023-10-30 13:57:00', '2024-12-10 10:18:44', 1, 0, '0', NULL, NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'João Bernardo Cachievala', 'Angelina Cambundo', 'Ingles', 'Pai'),
(997, 845596, '00000', 'Celestina Catanha Jamba', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 13:58:03', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(999, 206407, '0000', 'Deolinda Cafeca Sambalanda', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '0000', 0, '2023-10-30 13:59:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1000, 388012, '00000', 'Deolinda Natóle Nunda Kayaya', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '0000', 0, '2023-10-30 13:59:41', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1001, 512383, '00000', 'Elizabeth Soares Ndele', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:00:36', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1002, 497603, '0000', 'Emanuel Jordão Correia Boano', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:01:25', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1003, 489033, '00000', 'Emília Chulo Germano', 933515546, '2001-01-01 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:02:02', '2025-01-13 07:22:53', 1, 0, '0', NULL, NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'ç', 'Rosa Essinda Germano', NULL, NULL),
(1004, 356591, '00000', 'Enoc de Milagre Zacarias', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:02:39', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1005, 499823, '0000', 'Eugénio Lucamba Eurico Elundula', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:03:09', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1006, 415457, '00000', 'Evalina Nawimbo Hossi', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:03:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1007, 517607, '00000', 'Felino Prata Evaristo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:04:18', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1009, 147918, '000000', 'Florindo Pedro António', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:05:23', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1010, 74912, '00000', 'Helena Cassova Tomás Graciano', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:05:54', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1011, 200095, '0000000', 'Inácio Cassova Navemba Tchipilica', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:06:27', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1012, 857071, '00000', 'Ivandra Leonor Direito Chilala', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:06:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1013, 556084, '000000', 'Jaime Pacheco Nunda Pinto', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:07:31', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1014, 683557, '000000', 'João Cipriano Miguel da Silva', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:08:02', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1015, 290759, '00000', 'José Fernando Felgueiras', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:08:37', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1016, 902941, '00000', 'Laurinda Ngueve Chicomo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '0000', 0, '2023-10-30 14:09:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1017, 127686, '0000', 'Luciano Ndjavela Kamacupa Pedro', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:09:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1018, 79435, '00000', 'Luís Calopa Domingos Cachiungo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '0000000', 0, '2023-10-30 14:10:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1019, 786357, '000000', 'Luzia Paulino Julante', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:10:45', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1020, 956412, '00000', 'Manuel Sangueve Jamba Sapalo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '1111', 11111, '2023-10-30 14:11:31', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1021, 273991, '00000', 'Maria Carolina Dionisia Cassinda', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '11111', 11111, '2023-10-30 14:12:01', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1022, 765620, '000000', 'Maria da Conceição Culivela', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:12:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1023, 659766, '00000', 'Maria de Lurdes Calessu Cateia', 0, '2001-01-01 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostolica', 'Huambo - São José', 'Nenhuma', 36, 'Lino Cateia', 111111, '2023-10-30 14:13:07', '2025-03-21 09:40:37', 1, 0, '0', 'Huambo', NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Lino Cateia', 'Maria Verónica Calesso', 'L. Inglesa', 'Pai'),
(1025, 220603, '00000', 'Maria Simbovala Calyassi', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Outra', 36, '00000', 0, '2023-10-30 14:14:28', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1027, 878243, '00000', 'Maurício Manuel Salula', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:15:27', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1029, 226284, '00000', 'Nunes cassawili Bernabé', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:16:27', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1030, 684916, '00000', 'Rosálina Catumbo Luís', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:17:01', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1031, 146325, '00000', 'Rubém Florindo Cassinda', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:17:32', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1032, 609967, '0000000', 'Rufina Chibombo Capo Natchiqueley', 0, '2001-01-01 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:18:20', '2024-09-25 09:40:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1033, 131870, '00000', 'Samuel Vissoca Eugénio', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:18:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1034, 143762, '000000', 'Serafina Valeta Epalanga Ngembe ', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:20:09', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1035, 190238, '00000', 'Teresa Nandondi Epalanga', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:20:41', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1036, 178914, '00000', 'Tucadila Quissangui Tomás João', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:22:07', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1038, 240851, '000000', 'Afonso Alone Vihemba Samuhini', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:23:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1040, 767864, '00000', 'António Gonçálves Felgueiras', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:26:28', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1042, 412937, '00000', 'Bibiana Cândida Cipriano', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:27:59', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1044, 288951, '000000', 'Carla Luzia Molossande Paulino', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:29:21', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1047, 710482, '000000', 'Damiano Canjolomba Catumba', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:31:21', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1051, 804214, '00000', 'Emília Rosa Maria Dala', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:33:52', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1052, 80804, '00000', 'Ester Evalina Vilinga', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Outra', 36, '00000', 0, '2023-10-30 14:34:52', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1053, 608831, '000000', 'Esterina Elamba Chilombo Ngongo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:35:20', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1055, 245073, '00000', 'Fernando Palusu Tchivela', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:36:25', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1056, 560281, '00000', 'Frederico Candumbo Catota', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:36:54', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1057, 484189, '000000', 'Graciana Piedade Alexandre', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:38:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1058, 421593, '000000', 'Helena Paula Sapato', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:39:54', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1064, 874269, '00000', 'Justina Salassa Tchissende Calufele', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:43:05', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1069, 275135, '00000', 'Luisa Navissoca da Fonseca', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:46:20', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1070, 857633, '0000', 'Madalena Candeia Simão Cateteca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:47:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1073, 677298, '00000', 'Maria Lussinga António', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:49:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1074, 893679, '00000', 'Marta Jamba Sandambuca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:49:57', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1075, 739908, '00000', 'Maurício Candolo Calímbue', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:50:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1076, 452724, '00000', 'Meuvir Wimbo Júlio Canganjo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:51:06', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1077, 331078, '000000', 'Natália Cumbelembe Malaquias', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:51:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1078, 9637, '000000', 'Rebeca Lua Camuenho', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:52:02', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1081, 792419, '00000', 'Valentim Amões Dunguyonga', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:53:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1082, 515559, '00000', 'Valéria Chilombo Chicala', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:54:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1084, 428990, '00000', 'Venceslau Victor Tavares', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '000000', 0, '2023-10-30 14:55:19', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1085, 683480, '00000', 'Victorino C. Adelino', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 14:56:25', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1086, 721287, '020666327HO056', 'Abel Bingobingo Baptista De Sousa', 931121365, '2001-08-03 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Armindo Pindali', 2147483647, '2023-10-30 15:46:58', '2024-09-26 12:57:50', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1087, 676643, '024871005HO056', 'Aida Antónia Culivela', 948188127, '2007-05-29 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Firmino Culivela', 948188127, '2023-10-30 16:32:26', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1088, 788327, '021247875HO056', 'Alda Jorgina Nguendelamba', 926319086, '2007-05-15 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Luis', 926319086, '2023-10-30 16:34:39', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1089, 49440, '0221513MO056', 'Albertina Neidy Dos Santos', 926138745, '2008-03-15 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Dos Santos', 948143159, '2023-10-30 16:36:39', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1092, 2319, 'Não Registado', 'António Félix Capamba', 927634535, '2007-11-29 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cesário Félix Capamba', 927634535, '2023-10-30 16:44:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1093, 874424, '00000', 'Armindo Malaquias Sayengue', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 16:46:22', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1095, 18368, '00000', 'Aurelio Chipilica Calungo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 16:47:48', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1096, 972312, '0000', 'Cicina Napitango Tchingui Tchalo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 16:48:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1099, 913828, '0000', 'Domingas Vimbuando Lungundua', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 16:50:32', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1100, 702701, '0000000', 'Domingos Salulanda Ferrão Bilami', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '', 0, '2023-10-30 16:51:05', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1101, 805050, '00000', 'Eliceria Nereida Bernardo Candengue', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 16:51:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1103, 549206, '0000', 'Ermelinda César Daniel', 9000, '2009-10-13 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'Nenhuma', 35, 'César C. Daniel', 924721299, '2023-10-30 16:54:24', '2025-01-06 08:25:18', 1, 0, '0', 'Huambo', NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'César Severino Pessela Daniel', 'Cristina Ngueve Justo', 'Ingles', 'Pai'),
(1104, 319579, '0220146333HO058', 'Esmael David Sacunuiji Canhengue', 923564434, '0001-11-11 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 16:55:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1107, 703011, '00000', 'Francisco Pitra Muila Preso', 945859237, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Teresa Saco Muila', 0, '2023-10-30 16:58:59', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1109, 817803, '00000', 'Helena Vissapa da Silva Rufino', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Dionísia Nanguluca da Silva', 926319086, '2023-10-30 17:03:06', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1111, 969469, 'não registado', 'Hilária Namukuka José', 0, '0001-11-11 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Adriano Elias José ', 923564434, '2023-10-30 17:05:16', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1112, 423986, '00000', 'Isabel Bala Maqueeleca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto António', 0, '2023-10-30 17:06:07', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1114, 732112, '02151587HO051', 'Joaquina Natchilombo Sandjukila Manuel', 2147483647, '2008-03-06 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Loneke Manuel', 2147483647, '2023-10-30 17:09:59', '2024-08-06 19:01:52', 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1115, 756042, '020845001HO055', 'Jonas Nehova António', 931271420, '2008-07-29 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Muhota', 931271420, '2023-10-30 17:11:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1116, 624553, '020428797HO058', 'José Cris Catombela', 936989120, '2008-03-31 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Filomena Firmino', 936989120, '2023-10-30 17:14:36', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1117, 728354, '00000', 'José Firmino Kapoco', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 17:15:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1120, 549816, '00000', 'Laura Nangassole Nangaiafina', 0, '2001-12-12 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000000', 0, '2023-10-30 17:22:32', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1121, 515005, '000000', 'Laurinda Ch. C. Lemos', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:23:23', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1123, 818691, '024864304HO051', 'Laurindo Cambambo Huambo', 924266574, '0001-11-11 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Maria', 924266574, '2023-10-30 17:29:49', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1124, 234451, '010056672HO041', 'Leonardo Vapor dos Santos Chivinda', 933533702, '2007-08-06 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Chivinda', 933533702, '2023-10-30 17:32:25', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1125, 720676, '010202279HO047', 'Leonora Cassova Kandjeke', 929168948, '2007-06-02 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Efraim Sioca', 929353270, '2023-10-30 17:35:03', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1126, 101386, '941996938', 'Leontina Cassova Bongue', 941996938, '2008-06-04 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Fernando Bongue', 941996938, '2023-10-30 17:38:18', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1127, 135493, '00000', 'Linda Dongua Elias Paulo', 925316282, '2007-07-12 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Nenessa Kalisini Elias', 925316282, '2023-10-30 17:40:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1128, 903591, '00000', 'Luisa Nassoma Ndinguilinha', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:41:37', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1129, 468995, '00000', 'Manuel Emíliano Ulika', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 17:42:08', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1130, 429113, 'Não anexado', 'Margarida Chilepa Cossengue', 0, '2004-02-11 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:44:04', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1131, 53555, '00000', 'Margarida Lolinda Nacjhimuco Eyuva', 0, '2007-04-08 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Outra', 35, 'Armando Eyuva', 929168762, '2023-10-30 17:45:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1133, 665265, '00000', 'Cristina Lussinga Inácio', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:48:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1134, 413329, '0000', 'Teodoro Manuel Chilete Guengo', 0, '2001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 17:49:06', '2025-02-25 07:46:08', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1137, 173874, '00000', 'Adélia Clára Sabalo Fonseca', 0, '2004-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, '00000', 0, '2023-10-30 17:52:28', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1139, 375148, '00000', 'Adelino Manuel Kalundjendji Bule', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 17:53:31', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1146, 720823, '00000', 'António Epalanga Chatuvela', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:57:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1148, 440887, '000000', 'Arleth Maria Feliciano Bule', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:59:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1149, 727660, '00000', 'Aurélio Henda Cunhete', 90000, '2001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 17:59:50', '2024-09-26 13:07:42', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1150, 797414, '00000', 'Cândida Chambula Castilho', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:01:24', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1151, 678794, '00000', 'Cândida Lianga Catumua', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:01:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1154, 207711, '00000', 'Cristina Adriana Maquieleca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:03:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1156, 730527, '00000', 'Delfina Cachenhe de Freitas ', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:04:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1157, 630877, '00000', 'Delfina Cassinda Adelino', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:05:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1159, 289977, '00000', 'Domingos Cassinda Francisco', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:06:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1160, 212664, '0000', 'Eduardo Chipangue Sungo Chimuco', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:06:50', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1161, 459782, '0000', 'Elias Isaac Kalissini Paulo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:07:21', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1163, 739679, '00000', 'Elisa Natiavala Cossengue', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:09:22', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1164, 351238, '00000', 'Feliciana Sambongue', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:09:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1165, 214235, '00000', 'Fernanda Cassindsa Pedro Mateus', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:10:32', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1166, 911704, '0000', 'Fernanda Jambela Inácio', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:11:07', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1167, 70332, '00000', 'Filipe Agostinho Muxito', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000', 0, '2023-10-30 18:11:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1170, 639487, '0000', 'Higino Alberto Calitangui', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:13:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1171, 138038, '00000', 'Idalina Chilulo Cunjuca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:13:55', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(1177, 868387, '00000', 'Laurentina Funete', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:17:09', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1179, 572762, '0000', 'Lucas da Fonseca Rodrigues Bartolomeu', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:18:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1182, 462605, '000000', 'Marcelino Muekália Ndala', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:19:59', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1183, 324134, '020901766BE053', 'Maria Catihe Botão Victor', 930058523, '2005-11-21 00:00:00', 'Femenino', 'Solteira', 'Escola 22 de Novembro', 'Huambo', 'Nenhuma', 0, 'José Victor', 945867056, '2023-10-30 18:20:29', '2025-02-18 14:21:38', 1, 0, '1654', 'Huambo', '2020-08-01', 'Angolana ', 'Huambo', 'Huambo', 'Huambo', 'José Victor', 'Sofia Botão', 'Ingles', 'Pai'),
(1186, 967424, '00000', 'Miquilina Nawissa Chaculinhile Estêvão', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:21:54', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1189, 252669, '00000', 'Abilio Tino Hungulo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:25:57', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1191, 301784, '0000', 'Albina Nakwavela Canhanhu Chimbili', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:27:05', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1193, 715909, '00000', 'Ana Maria José', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:28:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1197, 798957, '00000', 'Benedito Tchiyeva Cassinda', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:30:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1199, 250773, '0000', 'Carlos do Rosário Sambundile Custódio', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:31:55', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1200, 276437, '00000', 'Cecília Catumbo Cawele', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:32:26', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1201, 956706, '00000', 'Clêmencia Natividade Carlos', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:32:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1202, 424595, '022165094HO058', 'Clementina Chilombo Sassapi Joaquim', 943500532, '2004-05-08 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 0, 'Luciano Joaquim', 923769605, '2023-10-30 18:33:26', '2025-03-21 09:36:22', 1, 0, '00000', 'Huambo', '2021-09-07', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Luciano Joaquim', 'Rosalina Maria dos Santos Sassapi', 'Engles', 'Pai'),
(1203, 769405, '000000', 'Constantino Vasco Caterça', 922997733, '2024-09-13 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'JEREMIAS', 0, '2023-10-30 18:34:01', '2024-12-09 10:21:56', 1, 0, '785', 'HUAMBO', '2015-04-28', 'ANGOLANA', 'HUAMBO', 'HUAMBO', 'HUAMBO', 'JEREMIAS', 'ADELIA', 'PORTUGUES', 'PAI'),
(1206, 90275, '00000', 'Dora Balombo Seyala', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:35:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1207, 390681, '000000', 'Edilson Adriano Chinapo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000010000', 0, '2023-10-30 18:36:49', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1208, 370872, '00000', 'Eduardo Sahemba João', 0, '2001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:37:19', '2024-09-26 14:00:12', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1212, 63436, '00000', 'Estevão Neves Chissipo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:39:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1215, 27910, '00000', 'Flora Napanji Chingui', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:41:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1216, 255209, '000000', 'Florinda Jamba Lundemba Tchissonde', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:41:41', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1218, 814453, '000000', 'Gabriela Chingala Ecupa', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:42:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1219, 164077, '00000', 'Graciana Natália Cassoma', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:43:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1220, 210021, '00000', 'Guilherme Chindecasse C. Capiñgala', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:43:43', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1221, 796157, '00000', 'Helena Cassova Tomás Graciano', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:44:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1222, 210350, '00000', 'Henriques Soke Nataniel', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:44:47', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1223, 821315, '00000', 'Inácia Lussinga Joaquim', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:45:24', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1224, 665093, '009769472KS049', 'Isabel Vitória Francisco Martins', 947035980, '2005-09-30 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo, Cambiote', 'Nenhuma', 35, 'Campos Martins', 947720445, '2023-10-30 18:45:58', '2024-12-10 10:58:57', 1, 0, '000', 'Kuanza Sul', NULL, 'Angolana', 'Gabela', 'Gabela', 'Cuanza Sul', 'Campos Martins', 'Rita Francisco', 'Ingles', 'Pai'),
(1225, 620804, '00000', 'João Domingos Massanga Sampaio', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:46:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1226, 30599, '00000', 'Laurinda Bimbe Domingos', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:47:04', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1227, 262156, '000000', 'Luís Gonsalves Gomes', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:47:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1229, 261451, '00000', 'Maria Margarida Troco', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:48:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1234, 441249, '000000', 'Mateus Calupenha Marcelino', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:51:23', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1235, 887177, '000000', 'Moisés Epalanga Eyala Samuel', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:51:52', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1237, 474302, '000000', 'Rosália Cambinja Pereira Malengue', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:53:13', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1238, 309478, '023673686HO050', 'Ruth Sango Jamba', 0, '2007-03-17 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Dr. António Agostinho Neto', 'Huambo', 'Nenhuma', 35, 'Inocêncio Jamba', 949000412, '2023-10-30 18:54:40', '2024-12-06 10:43:14', 1, 0, '0', 'Huambo', '2022-06-20', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Inocêncio Jamba', 'Justina Vassole Manuel', 'Ingelesa', 'Pai'),
(1239, 253224, '000000', 'Adelina Nguendela Elamba', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:56:02', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1240, 512183, '00000', 'Albertina Estefânia Kassekawa Saculanda', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:57:10', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1241, 804450, '00000', 'Alfeu Domingos Ngombo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 18:57:41', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1244, 624862, '00000', 'Angelina Ngundo Tomás', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:59:08', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1245, 985934, '000000', 'António Chinduli Jamba', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 18:59:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1247, 374502, '000000', 'Benvinda Domingas Cachio', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:00:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1248, 93501, '00000', 'Bernadete Namequele Miguel', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 19:01:12', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1249, 964915, '000000', 'Bernarda Chilombo Capandela', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:01:40', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1250, 280629, '000000', 'Cândida Wandi Lomanda', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:02:09', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1252, 219946, '000000', 'Domiana Pedro Daniel', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000000', 0, '2023-10-30 19:03:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1253, 489575, '00000', 'Elias Segunda Massambo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:03:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1254, 547109, '000000', 'Enoc de Milagre Zacarias', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:04:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1255, 102700, '000000', 'Ernesto Mendes', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:04:51', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1256, 511121, '000000', 'Ester Evalina Vilinga', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:05:20', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1259, 853071, '000000', 'Filomena Correia Suculate', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:06:56', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1260, 403679, '00000', 'Florinda Kapunga Segunda', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '00000', 0, '2023-10-30 19:07:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1261, 969228, '00000', 'Gabriel A. Essumba Chissolossi Mandavela', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000000', 0, '2023-10-30 19:08:01', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1263, 261459, '00000', 'Hilário David Mavungo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:09:05', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1264, 578783, '00000', 'Idilia Chimuma S. Muenhowossimbo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:09:34', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1266, 937398, '000000', 'Inácia Etossi Matemba Zacarias', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:10:38', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1269, 159223, '000000', 'Joaquim Pedro Cassinda', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:12:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1272, 578722, '000000', 'José Silva Lopes Pahula', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000000', 0, '2023-10-30 19:13:41', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1273, 946654, '00000', 'Josefina Nassangula Wanga', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:14:07', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1274, 398436, '00000000', 'Judith Lúcia Chongolola', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:14:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1275, 751176, '0000000', 'Laura Jindo Candanda', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:15:06', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1276, 747041, '0000000', 'Laurindo Samba Natália Tito', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '0000000', 0, '2023-10-30 19:15:51', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1277, 726704, '000000', 'Leonor Mandele Lussati', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Outra', 35, '00000', 0, '2023-10-30 19:16:23', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1279, 891836, '0000000', 'Luciana Elumbo Vicomo Cativa', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '000000', 0, '2023-10-30 19:17:26', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1280, 196319, '-----------', 'Luciana Songa Calivela', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------', 0, '2023-10-30 19:18:04', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1281, 822280, '-------------', 'Luciano João Capoeira', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '------------', 0, '2023-10-30 19:18:37', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1282, 227527, '------', 'Luisa Kuva Sete Domingos', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------', 0, '2023-10-30 19:19:12', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1283, 33191, '-------------', 'Manuel Sangueve Jamba SapaIalo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------', 0, '2023-10-30 19:19:49', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1284, 809608, '-----------------', 'Maria da Conceição Hilário', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------', 0, '2023-10-30 19:20:29', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1288, 70864, '008040940HO041', 'Martinha Cafewa Cafito', 924098262, '1998-06-17 00:00:00', 'Femenino', 'Solteira', 'IPPC', 'Huambo', 'Nenhuma', 35, 'Adriano domingos Ináncio', 924098262, '2023-10-30 19:23:02', '2024-12-27 10:08:47', 1, 0, '000', 'Huambo', '2021-04-28', 'Angolana', 'Cachiungo', 'Cachiungo', 'Huambo', 'MANUEL ERNESTO CAFITO', 'Feliciana ', 'Inglesa', 'Irmã'),
(1289, 757310, '--------------------', 'Natália Balanda Abreu', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '--------------------', 0, '2023-10-30 19:23:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1290, 917334, '-----------------------', 'Rebeca Chilunga Chilundulo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------------', 0, '2023-10-30 19:24:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1293, 207717, '------------------------', 'Teresa Flora Sandambungo Manico', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '------------------------', 0, '2023-10-30 19:25:53', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1294, 24953, '-----------------------', 'Valentina Jambela da Fonseca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------------', 0, '2023-10-30 19:26:24', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1295, 700654, '------------------------', 'Verónica Nojamba Chimuma Chilova', 0, '2001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '------------------------', 0, '2023-10-30 19:27:19', '2024-09-26 14:29:38', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1297, 129552, '-------------------------', 'Adelino Chivinda Lucussi', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------------', 0, '2023-10-30 19:29:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1298, 717099, '021857776CC055', 'Alberto Banja Chimuco Baptista', 932797918, '2005-11-27 00:00:00', 'Masculino', 'Solteiro', 'IPPC A Luz do Saber', 'Huambo', 'Nenhuma', 35, 'Maria Nehela', 949318982, '2023-10-30 19:29:45', '2025-01-13 11:16:37', 1, 6, '0211', 'Cuando Cubango', '2021-05-04', 'Angolana', 'Menongue', 'Menongue ', 'Cuando Cubango', 'Lourénço Saco Congo Baptista', 'Maria Nehela', 'Lingua Inglesa', 'Mãe'),
(1301, 749923, '---------------------------', 'Angelina Márcia Francisco Chakussunãma', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------------------', 0, '2023-10-30 19:31:26', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1302, 860837, '--------------------------', 'Anita Zeferina Mucuna', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '--------------------------', 0, '2023-10-30 19:32:02', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1303, 447487, '---------------------', 'Antónia Filipa Job', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------------', 0, '2023-10-30 19:32:31', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1305, 158830, '--------------------------', 'Armindo Félix Cassanga', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '--------------------------', 0, '2023-10-30 19:33:37', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1307, 648423, '-------------------------', 'Domiana Pedro Daniel', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------------', 0, '2023-10-30 19:35:02', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1308, 514969, '-------------------', 'Emília Bernardina Luciano', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------', 0, '2023-10-30 19:36:17', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1309, 957725, '-------------------', 'Emília Mungala Cutala', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------', 0, '2023-10-30 19:36:50', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1310, 532538, '---------------------', 'Estêvão Pombolo Benjamim', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------------', 0, '2023-10-30 19:37:19', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1311, 297788, '----------------', 'Fernando Palasu Tchivela', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------------', 0, '2023-10-30 19:37:49', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1313, 558437, '-----------------------', 'Francisco Mário Nhokolipo Jamba', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------------', 0, '2023-10-30 19:38:49', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1314, 907821, '-------------------', 'Joaquim Mita Sambamba', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------', 0, '2023-10-30 19:39:19', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1315, 321710, '---------------------', 'Juila Nangumba Sacapenda', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------------', 0, '2023-10-30 19:39:53', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1316, 75705, '-----------------------', 'Júlia Nangongolo Verónica Quessongo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------------', 0, '2023-10-30 19:40:24', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1317, 576831, '---------------------', 'Justina Salassa Chissende Calufele', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------------', 0, '2023-10-30 19:41:12', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1319, 21824, '----------------------', 'Manuel Tomás Pascoal', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------------------', 0, '2023-10-30 19:42:07', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1320, 45530, '-----------------------', 'Marcolino Chiquata Napingala Thiangalala', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------------', 0, '2023-10-30 19:42:37', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1321, 82867, '--------------------', 'Margarida Cutriva Curinua Mutaza', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '--------------------', 0, '2023-10-30 19:43:06', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1322, 715558, '-------------------', 'Maria Agostinho', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------', 0, '2023-10-30 19:43:33', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1325, 455166, '-------------------', 'Mariana Domingas Cafeteira', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------', 0, '2023-10-30 19:45:03', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1326, 16489, '----------------------', 'Marta Caluca Jamba', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------------------', 0, '2023-10-30 19:45:35', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1327, 927134, '-----------------------', 'Mateus Canjeque Chilombo Chivando', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-----------------------', 0, '2023-10-30 19:46:03', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1328, 834898, '-------------------', 'Piedoso Cambinda Pongolola André', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------------', 0, '2023-10-30 19:46:31', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1329, 621333, '----------------------', 'Pulino Mbapolo Nuñgulo', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------------------', 0, '2023-10-30 19:46:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1330, 606927, '----------------------', 'Raúl Chilembo Nunda ', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------------------', 0, '2023-10-30 19:47:23', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1332, 398283, '---------', 'Rosa Cuvanja Fonseca', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------', 0, '2023-10-30 19:48:50', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1333, 46420, '-----------------', 'Rosalina Sunguluca Euzébio', 930938521, '2001-01-01 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, 'Feliciana Catoma', 0, '2023-10-30 19:49:17', '2024-10-30 07:02:07', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1334, 311171, '------------------', 'Sabino Catoca da Fonseca', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '------------------', 0, '2023-10-30 19:49:46', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1336, 829680, '---------------', 'Samuel Samanda Sole Sangango', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------', 0, '2023-10-30 19:50:47', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1339, 72826, '----------------', 'Severino Mussombo Martinho Chipando', 0, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------------', 0, '2023-10-30 19:54:45', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1340, 517717, '-------------', 'Silvina Lúcia Chingui', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------', 0, '2023-10-30 19:55:20', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1341, 399741, '---------------', 'Sofina Simuila Sachilemo Dachala', 0, '2001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------', 0, '2023-10-30 19:56:03', '2024-09-27 08:17:32', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1343, 661811, '----------', 'Teresa Chinawalaca Salonoma Alfredo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '----------', 0, '2023-10-30 19:57:12', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1344, 687214, '-----------', 'Valéria Nangumba Kapiñgala', 0, '2001-01-01 00:00:00', 'Femenino', 'Solteira', 'ND', 'Huambo', 'Nenhuma', 35, '-----------', 0, '2023-10-30 19:57:43', '2024-09-27 08:54:17', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1345, 80180, '---------------', 'Vandaderth Priscilia Catito Ekundi', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '---------------', 0, '2023-10-30 19:58:15', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1349, 971306, '-------------', 'Victorino João Justino da Costa', 0, '2006-02-03 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Joaquim Simão da Costa', 927983366, '2023-10-30 20:00:20', '2024-12-06 13:30:39', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'Inglês', NULL),
(1350, 240136, '------------', 'Victorino Jamba da Cruz', 0, '2001-01-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '-------------', 0, '2023-10-30 20:11:14', '2024-09-27 08:57:10', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1351, 92241, '--------', 'Aida Jorgina Nguendelamba', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, '--------', 0, '2023-10-30 20:14:02', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1352, 184231, '009061782HO046', 'Suzana Jamba', 937942030, '1999-11-11 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Suzana Jamba', 937942030, '2023-10-30 22:07:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1353, 364321, '999999999999', 'Emília Rosa Maria Dala', 924712326, '2006-07-16 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Felisberto S.Dala', 924712326, '2023-12-11 20:47:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1355, 909451, '020913254HO057', 'Esperança Massanga Muhunga', 930705855, '2004-07-25 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Ana Esperança Chiambo', 949251148, '2024-02-01 11:49:33', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1356, 217954, '02489248HO055', 'Angelina Wimbo Sandimba', 928158242, '2007-02-06 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Madalena Ruth Sandimba', 928158242, '2024-02-16 13:04:43', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1357, 342501, '022106263HA051', 'Rosalina Kassinda Jamba Felicidade', 936030726, '2003-08-22 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Cândido Rosa Felicidade', 939577746, '2024-03-01 15:39:14', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1358, 457074, '005205146HA044', 'Felicidade Julieta Fato', 921002520, '1991-04-14 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Felicidade Julieta Fato', 934844769, '2024-03-07 12:50:37', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1359, 477030, '008184108BA049', 'Verónica Tchinganguela Culivela João', 930622000, '1995-03-15 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Constantino João', 923688740, '2024-03-12 15:56:11', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1360, 727600, '00000000000000', 'Edilson Chiliangombe Justo', 927384762, '2006-11-29 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Job Bonga Feliano Justo', 927384762, '2024-03-13 08:11:42', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1361, 787449, '020672303HO057', 'Agnaldo Feliciano Sakessongo Justo', 0, '2004-11-01 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 36, 'Alfeu Pika Justo', 0, '2024-03-13 13:57:58', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1362, 861810, '020321239HO059', 'Madalena Domingas Kaloya', 933288426, '1995-10-08 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'José Cipriano', 948966418, '2024-03-13 14:22:44', '2025-01-06 10:06:01', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1363, 289852, '000000000HO00', 'Maria Chilombo Fazenda Evaristo', 932644931, '2006-11-29 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Augusto Fazenda', 930052791, '2024-03-18 09:01:08', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1364, 887338, '000000000HO00', 'Paulino Mbapolo Nuñgulo', 0, '2007-04-27 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'António Nuñgulo', 944177160, '2024-04-09 09:36:03', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1365, 188237, '00000000000', 'Tomás Samungulo  Calepi', 933404466, '2003-04-18 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Alberto Sassoma', 933404466, '2024-04-17 13:16:01', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1366, 619205, '00000000000', 'Francisca Margarida Costa Chindombe', 943223663, '2006-04-05 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Manuela Bernardo', 925618282, '2024-05-06 06:58:09', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1367, 972966, '0000000000', 'Júlia Nangumba Sacapenda', 937613231, '2004-02-04 00:00:00', 'Femenino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Isilde Flora', 922446810, '2024-05-16 13:26:32', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1368, 237134, '0184888HO042', 'Pedro Chupa Watela', 945447740, '2003-06-04 00:00:00', 'Masculino', 'Solteiro', 'ND', 'Huambo', 'Nenhuma', 35, 'Jacinto Watela', 945447740, '2024-07-11 16:14:30', '2024-07-31 03:12:58', 1, 0, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1397, 120331, '010194927HO043', 'José Domingos António', 934823332, '2000-02-26 00:00:00', 'Masculino', 'Solteiro', 'ITS', 'Huambo, São José Kilombo', 'Nenhuma', 35, 'Edith Nangamba Filipe', 924133070, '2024-08-06 20:56:26', '2024-08-06 20:56:26', 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1399, 742448, '009754025H0045', 'Doliana Noloti Huambo', 928847377, '2006-03-24 00:00:00', 'Femenino', 'Solteira', 'Complexo EscolarComparticipado', 'Huambo', 'NS', 36, 'Feliciana Wuambo', 928506190, '2024-09-18 09:12:38', '2024-09-18 09:12:38', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1400, 171776, '027348458H0053', 'CELESTINO CHILULO LUSSATI', 924356819, '2002-11-18 00:00:00', 'Masculino', 'Solteiro', 'C.ROSA', 'HUAMBO', 'NS', 36, 'DOMINGOS LUSSATI GANDAVILA', 923738413, '2024-09-18 09:25:53', '2024-09-18 09:25:53', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1401, 716816, '023924115H0055', 'Bento Ndambole Dembula  Ramos', 923118248, '2007-02-06 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Jomaura', 'Huambo', 'NS', 36, 'Daniel Ramos ', 936107954, '2024-09-18 09:35:44', '2024-10-16 07:13:26', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1402, 256986, '026259035H0052', 'Luisa Wandi Ekuikui', 923052098, '2008-08-08 00:00:00', 'Femenino', 'Solteira', 'Complexo Rscolar Calilongue da Cuca', 'Huambo', 'NS', 36, 'Domingos Bernado Ekuikui', 923052098, '2024-09-18 09:55:47', '2024-09-18 09:55:47', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1403, 605052, '022959254H0055', 'Abrantes Cussama Calei Paulo', 942753557, '2008-12-10 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar SOS', 'Huambo', 'NS', 36, 'Moisés Calelessa Paulo', 924016392, '2024-09-18 10:03:50', '2024-09-18 10:03:50', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1404, 260610, '008674743', 'Agnelo dos Santos', 949488156, '2007-09-08 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Fé apostolica', 'Huambo', 'NS', 36, 'AÁmelia Chinossole Manji', 936370569, '2024-09-18 10:21:28', '2024-09-18 10:21:28', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1405, 281735, '023944471H0054', 'Amelia Agostinho Filipe', 932675907, '2007-05-10 00:00:00', 'Femenino', 'Solteira', 'Rei Livongue', 'Huambo', 'NS', 36, 'Serafim Bumba Luacuty', 2147483647, '2024-09-18 10:33:18', '2025-03-10 09:21:11', 1, 5, '0', NULL, NULL, 'Angolano', 'Huambo', NULL, '', NULL, NULL, NULL, NULL),
(1406, 740676, '02086970H0052', 'Andelson Ferramenta Calunjala', 938106643, '2007-02-06 00:00:00', 'Masculino', 'Solteiro', 'Clegio Comandante Hoji ya Henda', 'HUAMBO', 'NS', 36, 'Celestino Calunjala', 924298930, '2024-09-18 10:45:45', '2024-09-18 10:45:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1407, 763054, '021923206H0051', 'Augusto Dasala Dumbo', 929464424, '2007-05-19 00:00:00', 'Masculino', 'Solteiro', 'mmmm', 'Huambo', 'NS', 36, 'JoseFernando Dumbo', 9, '2024-09-18 10:53:15', '2024-09-18 10:53:15', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1408, 450485, '                   026203784Ky053', 'Benedita Tchanjupamo Sakupihã', 923811248, '2008-04-27 00:00:00', 'Femenino', 'Solteira', 'Paiva Domingos da Silva', 'Huambo', 'NS', 35, 'Maria Imaculada', 925206183, '2024-09-18 11:49:45', '2024-09-18 11:49:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1409, 292696, '022593781H0055', 'Berta Nangasso', 924894404, '2008-01-17 00:00:00', 'Femenino', 'Solteira', 'GGHH', 'HUAMBO', 'NS', 36, 'Eduardo Chanja', 926988830, '2024-09-18 11:56:55', '2024-09-18 11:56:55', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1410, 899025, '565656', 'Candida Domingas Mulunsi Moises', 923853303, '2006-11-09 00:00:00', 'Femenino', 'Solteira', 'JJJ', 'Huambo', 'NS', 36, 'Manuelo Pulino ', 99, '2024-09-18 12:05:07', '2024-09-18 12:05:07', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1412, 660588, '024308504bE053', 'Dinis Capamba Chemba Camongua', 934093939, '2000-07-14 00:00:00', 'Masculino', 'Solteiro', 'Princesa Diana', 'Huambo', 'NS', 36, 'DINIS JOSE NEVES', 938275692, '2024-09-18 13:40:07', '2024-11-15 09:21:13', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1414, 985623, '022277427H0058', 'Flora Wandi Aurelio', 924410918, '2006-06-30 00:00:00', 'Femenino', 'Solteira', 'M', 'HUAMBO', 'NS', 36, 'INÁCIO AURELIO', 924410918, '2024-09-18 13:52:04', '2024-09-18 13:52:04', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1415, 133875, '022372636BE051', 'Frederico Catombela Nalembe Chicomo', 921790289, '2007-11-11 00:00:00', 'Masculino', 'Solteiro', 'k', 'HUAMBO', 'NS', 36, 'ALBERTINO', 935880416, '2024-09-18 13:57:41', '2024-09-18 13:57:41', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1416, 266597, '021053501LN056', 'Formosa Gerusa Txiquembe', 925511480, '2007-04-17 00:00:00', 'Femenino', 'Solteira', 'v ', 'HUAMBO', 'NS', 36, 'PIEDADE TXIQUEMBE', 922257383, '2024-09-18 14:02:54', '2024-10-14 10:45:48', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1417, 211305, '008134544MO040', 'Henriques Daniel Luyinda', 933911343, '2002-06-04 00:00:00', 'Masculino', 'Solteiro', 'm', 'HUAMBO', 'NS', 36, 'PAULO MARITA', 923652717, '2024-09-18 14:09:59', '2024-09-18 14:09:59', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1418, 723383, '020371522HO054', 'Imaculada da Conceição Manuel Epalanga', 935374319, '2008-06-01 00:00:00', 'Femenino', 'Solteira', 'j', 'HUAMBO', 'NS', 36, 'ALEIXO EPALANGA', 924367038, '2024-09-19 07:49:09', '2024-09-19 07:49:09', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1419, 369252, '008546491HO041', 'Janaina Maria Nunda ', 924013798, '2010-01-20 00:00:00', 'Femenino', 'Solteira', 'KL', 'HUAMBO', 'NS', 36, 'DOMINGOS BARROS NUNDA', 924013798, '2024-09-19 07:53:19', '2024-09-19 07:53:19', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1420, 401512, '024912234ho057', 'Januário S. Luacuty', 932675907, '2007-05-10 00:00:00', 'Masculino', 'Solteiro', 'h', 'HUAMBO', 'NS', 36, 'SERAFIM BUMBA LUACUTY', 932675907, '2024-09-19 08:03:22', '2024-09-19 08:03:22', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1421, 358115, '022396032HO055', 'Joaquina Longua Kata ', 939309486, '2005-08-20 00:00:00', 'Femenino', 'Solteira', ' b', 'HUAMBO', 'NS', 36, 'ZEFERINO ARMANDO KATA', 928209102, '2024-09-19 08:08:34', '2024-11-07 15:03:43', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1422, 540329, '025730822BF058', 'Jonatão Caquemba Sangola', 940371176, '2005-12-07 00:00:00', 'Masculino', 'Solteiro', ' v', 'HUAMBO', 'NS', 36, 'Maria Henriqueta mariano', 927405404, '2024-09-19 08:13:07', '2024-09-19 08:13:07', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1423, 634547, '022330334HO052', 'Juliana Silepo Caungulo', 940261663, '2008-08-28 00:00:00', 'Femenino', 'Solteira', 'yh', 'HUAMBO', 'NS', 36, 'Joa Quina Caungulo', 926929467, '2024-09-19 08:25:06', '2024-09-19 08:25:06', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1424, 793010, '022225898HO052', 'Julieta Natewa Antonio Sehuma', 921696635, '2007-06-01 00:00:00', 'Femenino', 'Solteira', 'nhj', 'HUAMBO', 'NS', 36, 'VASCO CAUNGULICA SEHUMA', 936201711, '2024-09-19 08:40:28', '2024-09-19 08:40:28', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1425, 762587, '023107376Ho050', 'Laureta  Nachonga Cawele', 928313652, '2007-06-07 00:00:00', 'Femenino', 'Solteira', 'g', 'HUAMBO', 'NS', 36, 'SUZANA CASSOMA', 928313652, '2024-09-19 08:45:18', '2024-09-19 08:45:18', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1426, 449445, '021757204HO058', 'Laurinda Cafeca Ndala', 924133246, '0000-00-00 00:00:00', 'Femenino', 'Solteira', 'H', 'HUAMBO', 'NS', 36, 'DOMINGOS NDALA', 924133246, '2024-09-19 08:49:34', '2024-09-19 08:49:34', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1427, 667802, '555555555', 'Luzia Tchatava Kalumbo Pedro', 938512193, '2009-05-28 00:00:00', 'Femenino', 'Solteira', 'Bula ', 'Huambo', 'NS', 36, 'Inocencio Pedro', 938512193, '2024-09-19 08:55:22', '2024-09-19 08:55:22', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1428, 147646, '518569', 'Luciana Ngueve Sachicaca', 931263720, '2008-04-07 00:00:00', 'Femenino', 'Solteira', 'daa', 'HUAMBO', 'NS', 36, 'ABEL SATCHICACA', 925787248, '2024-09-19 09:01:21', '2024-09-19 09:01:21', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1429, 586335, '007537989LA044', 'Maria da Conceição .M. Tandavala', 938089681, '2003-05-15 00:00:00', 'Femenino', 'Solteira', 'zssa', 'HUAMBO', 'NS', 36, 'Artur Tandavala', 926231094, '2024-09-19 09:05:29', '2024-09-19 09:05:29', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1430, 939123, '020130706HO054', 'Marta Essoco Ngula Kamoli', 922592353, '2008-07-29 00:00:00', 'Femenino', 'Solteira', 'ghggf', 'Huambo', 'NS', 36, 'GRACINA CHILOMBO CASIMIRO', 927864444, '2024-09-19 09:09:24', '2024-09-19 09:09:24', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1432, 122320, '021961051CC052', 'Maria de Fatima Nandombe Yakevela', 929414565, '2007-07-14 00:00:00', 'Femenino', 'Solteira', 'yhgyhh', 'Huambo', 'NS', 36, 'ADRIANO TUTU YA KOVELA', 922130784, '2024-09-19 09:52:57', '2024-09-19 09:52:57', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1433, 156842, '020378518HO056', 'Mariana Nassole Solundo', 934602910, '2009-04-20 00:00:00', 'Femenino', 'Solteira', 'ddddd', 'Huambo', 'NS', 36, 'Jose Sambanje Domingos', 934602910, '2024-09-19 09:59:43', '2024-09-19 09:59:43', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1434, 450637, '00860128170044', 'Otilia Nacunha Hossi', 926374743, '2002-02-01 00:00:00', 'Femenino', 'Solteira', 'Escola 34', 'Huambo', 'NS', 36, 'Adelina Vilinga ', 926374743, '2024-09-19 10:08:06', '2025-03-18 09:32:32', 1, 6, '0', NULL, NULL, 'Angolana ', 'Huambo', 'Huambo', 'Huambo', 'Augusto Hossi', 'Adelina Nandundo Vilinga', 'L. Inglesa', 'Mãe'),
(1435, 728230, '2222222', 'Paula Longue Cahoco', 926285732, '2007-03-03 00:00:00', 'Femenino', 'Solteira', 'HHGHH', 'HUAMBO', 'NS', 36, 'EVARISTO CAHOCO', 926285732, '2024-09-19 10:12:35', '2024-09-19 10:12:35', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1436, 107619, '022983159HO058', 'Paulo Bança Nangui Amadeu', 932530463, '2009-01-01 00:00:00', 'Femenino', 'Solteira', 'ddddddddd', 'Huambo', 'NS', 36, 'Madalena Nangui', 932530463, '2024-09-19 10:18:12', '2024-10-01 12:21:27', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1437, 313903, '023243384HO050', 'Rosalina Caquinda Epalanga', 924814692, '2007-10-01 00:00:00', 'Femenino', 'Solteira', 'ffffffff', 'Huambo', 'NS', 36, 'Rosa Ngondala Vieira', 942704518, '2024-09-19 10:27:14', '2024-09-19 10:27:14', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1439, 203432, '010285537HO048', 'Sara Cutala Kambueti', 948145646, '2008-06-01 00:00:00', 'Femenino', 'Solteira', 'dddddd', 'Huambo', 'NS', 36, 'LAURINDO KAMBUETI', 945116738, '2024-09-19 10:38:43', '2024-09-19 10:38:43', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1440, 517047, '00974984HO049', 'Luzia Nassende Francisco ', 939230063, '2007-04-04 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'NS', 36, 'Candida Adelaide Dias', 936784220, '2024-09-19 11:07:40', '2025-03-18 09:22:04', 1, 6, '0', 'Huambo', '2004-05-07', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Henrique Francisco', 'Candida Adelaide Dias', 'L. Iglesa', 'Mãe'),
(1441, 861544, '02256835HO056', 'Victoria Albertina Luis', 945324257, '2005-07-18 00:00:00', 'Femenino', 'Solteira', 'GV', 'HUAMBO', 'NS', 36, 'DOMINGOS LUIS', 924544777, '2024-09-19 13:34:34', '2024-09-19 13:34:34', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1442, 236714, '022256835HO056', 'Vitoria Albertina Luis', 924544777, '2005-07-18 00:00:00', 'Femenino', 'Solteira', 'hhhhh', 'Huambo', 'NS', 36, 'Domingos Luis ', 924544777, '2024-09-20 08:22:05', '2024-09-20 08:22:05', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1443, 318665, '255555663', 'Enoc Catombela Cuohamba', 924107583, '2006-03-14 00:00:00', 'Masculino', 'Solteiro', 'hhjjjkkk', 'HUAMBO', 'NS', 36, 'ALFREDO UKUOHAMBA', 924107583, '2024-09-20 08:29:37', '2024-09-20 08:36:48', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1444, 324786, '025907301LA053', 'Luisa Ngueve Pacheco', 933449478, '2008-09-11 00:00:00', 'Femenino', 'Solteira', 'JHHHHHHJ', 'HUAMBO', 'NS', 36, 'DEDALDINO FONTES EDUARDO', 924107583, '2024-09-20 08:40:09', '2024-11-06 13:24:39', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(1445, 769218, '024745464HO055', 'Victor Dumba Kandoti', 948543468, '2009-06-20 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Chiputa', 'HUAMBO - São José', 'NS', 36, 'FRANÇISCO CANDOTI', 948543468, '2024-09-20 08:45:09', '2025-03-18 09:55:06', 1, 5, '0', NULL, NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'FRANCISCO CANDOTI', NULL, NULL, 'Pai'),
(1446, 176088, '009530477HO041', 'Bibiana Delfina Muangala', 935439431, '2002-01-07 00:00:00', 'Femenino', 'Solteira', 'bnnjkjk,k,k', 'HUAMBO', 'NS', 36, 'ELIZABETH HENRIQUES', 944183717, '2024-09-20 08:50:12', '2024-09-20 08:50:12', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1447, 198491, '020393333HO059', 'Isidoro Uyombo Manico Kukula', 943270975, '2005-08-09 00:00:00', 'Masculino', 'Solteiro', 'cvggghhj', 'HUAMBO', 'NS', 36, 'LUISA RAIMUNDO MANICO', 943270975, '2024-09-20 08:54:30', '2024-09-20 08:54:30', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1448, 186355, '021022068HO051', 'Maria Lepoa Bartolomeu', 943270975, '2002-10-21 00:00:00', 'Femenino', 'Solteira', 'ddDDD', 'HUAMBO', 'NS', 36, 'Maria Lepoa Bartolomeu', 943270975, '2024-09-20 08:58:20', '2024-09-20 08:58:20', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1449, 526617, '026024345BE056', 'Fernanda Nassusso Albina Mucanda', 925607372, '2007-11-10 00:00:00', 'Femenino', 'Solteira', 'Colégio Missionário 266, Rev Júlio Francisco Muehombo', 'Huambo', 'SN', 35, 'Aurora Vihemba N. Mucanda', 924329941, '2024-09-20 09:00:20', '2024-09-20 09:00:20', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1450, 193008, '024775835HO056', 'Martins Sambule  Chilongafeca', 935959521, '2008-09-21 00:00:00', 'Masculino', 'Solteiro', 'HHHHHH', 'HUAMBO', 'NS', 36, 'Americo Jacinto Chilongafeca', 935959521, '2024-09-20 09:03:47', '2024-09-20 09:03:47', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1451, 461372, '021905316HO054', 'Beatriz Munga Epalanga', 943238970, '2008-03-08 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar SOS', 'Huambo', 'SN', 35, 'Ana Ecuva Teodoro Salondeca', 949775169, '2024-09-20 09:05:38', '2024-09-20 09:05:38', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1452, 256920, '5555555555', 'Graça Florença Cavata ', 948584624, '2008-03-27 00:00:00', 'Femenino', 'Solteira', 'hhhhhhhh', 'HUAMBO', 'NS', 36, 'ANTONIA FLORENÇA', 938108160, '2024-09-20 09:07:34', '2024-09-20 09:07:34', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1453, 264402, '020489362HO059', 'Adelina Alice Wabembe', 930230249, '2009-09-30 00:00:00', 'Femenino', 'Solteira', 'AAAAAAA', 'HUAMBO', 'NS', 36, 'JOSE ALVES WAMBEMBE', 935959521, '2024-09-20 09:11:28', '2024-09-20 09:11:28', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1454, 619613, '023965328HO052', 'Luciana Maria Catombela Chitungo', 924066229, '2008-10-10 00:00:00', 'Femenino', 'Solteira', 'GGGGGGGG', 'HUAMBO', 'NS', 36, 'JOSE MARIA CHITUNGO', 922844763, '2024-09-20 09:15:56', '2024-09-20 09:15:56', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1455, 138455, '024339245HO052', 'Delfina Chinofila Henrique Bandeira', 934672591, '2009-10-27 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar São Tarcísio', 'Huambo', 'SN', 35, 'Valentina Aida Henrique', 2147483647, '2024-09-20 09:19:47', '2024-09-20 09:19:47', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1456, 491259, '020656336HO052', 'Maria Namuangala Sachilemo Dachala', 941756995, '2009-07-21 00:00:00', 'Femenino', 'Solteira', 'dddddddddd', 'HUAMBO', 'NS', 36, 'JULIO GREGORIO DACHALA', 947505627, '2024-09-20 09:47:45', '2024-09-20 09:54:33', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1457, 191319, '55555555', 'Josefina Naumba Samucungo', 930504738, '2007-09-25 00:00:00', 'Femenino', 'Solteira', 'ggggggggggg', 'HUAMBO', 'NS', 36, 'GUILHERME EPALANGA', 926624387, '2024-09-20 09:52:32', '2024-09-20 09:52:32', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1458, 978636, '022225818HO056', 'Jose Mendes Bumba', 931251383, '2008-04-24 00:00:00', 'Masculino', 'Solteiro', 'SSSSSSSS', 'HUAMBO', 'NS', 36, 'MARTA CANDELE', 931251383, '2024-09-20 09:58:25', '2024-09-20 09:58:25', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1459, 315047, '01022565HO044', 'Judith Ngueve Horácio Nunda', 946218937, '2006-06-14 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar São Tarcísio', 'HUAMBO', 'NS', 36, 'OLIVEIRA NUNDA', 923841629, '2024-09-20 10:01:45', '2024-12-30 09:39:24', 1, 5, '0', 'Huambo', NULL, 'Angolana', 'Tchicala', 'Tchicala Cholohanga', 'Huambo', 'Oliveira Nunda', 'Estrela Malesso', 'Ingles', 'Pai'),
(1460, 674826, '023037889HO059', 'Arminda Lussati Tumba Graça', 932006317, '2006-09-24 00:00:00', 'Femenino', 'Solteira', 'Escola João Baptista Chicombo', 'HUAMBO', 'NS', 36, 'JOSEFA ARTUR', 924984033, '2024-09-20 10:07:36', '2025-03-10 08:00:24', 1, 5, '0', NULL, NULL, 'Angolana', 'Huambo', NULL, 'Huambo', 'Soite Graça', 'Rosalina Tumba', 'Língua Inglesa', 'Tia'),
(1461, 477165, '022225498HO055', 'Evaristo Chingupe Candele', 931251383, '2008-02-17 00:00:00', 'Masculino', 'Solteiro', 'DDDDDDDDDD', 'HUAMBO', 'NS', 36, 'GRACIANA NANHIME', 931251383, '2024-09-20 10:11:57', '2024-09-20 10:11:57', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1462, 891867, '025283320BO58', 'Benvinda Maria Luis', 924046179, '2007-09-27 00:00:00', 'Femenino', 'Solteira', 'SSSSSSSSSSSSSS', 'HUAMBO', 'NS', 36, 'AMTONIO ', 923258934, '2024-09-20 10:14:53', '2024-09-20 10:14:53', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1463, 923107, '023769780HO052', 'Claudina da Glória Agostinho Sabalo', 929653615, '2007-08-08 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar SOS Huambo', 'Huambo', 'SN', 35, 'Glória Agostinho', 922359486, '2024-09-20 10:18:51', '2024-09-20 10:18:51', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1464, 526633, '020653482HO059', 'Maria Salome Verissimo', 928998014, '2000-07-11 00:00:00', 'Femenino', 'Solteira', 'aaaaaaaaaaaa', 'HUAMBO', 'NS', 36, 'Maria Salome Verissimo', 931301284, '2024-09-20 10:18:52', '2024-09-20 10:18:52', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1465, 784546, '026036289BE058', 'Fátima Nanjala Pedro da Silva', 941374719, '2009-08-09 00:00:00', 'Femenino', 'Solteira', 'Colégio 10 de Dezembro/ Chitembo', 'Huambo', 'SN', 35, 'Mário Carlos da Silva', 941374719, '2024-09-20 10:22:19', '2024-09-20 10:22:19', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1466, 794008, '026093266HO59', 'Antonio Filipe Lutambi', 948461749, '2003-11-10 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAAAA', 'HUAMBO', 'NS', 36, 'MARIA MARIO', 921962029, '2024-09-20 10:23:15', '2024-09-20 10:23:15', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1467, 258608, '010095275HO048', 'Josefa Chilombo Chatula', 924440542, '2007-06-23 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAAAAAAAAA', 'Huambo', 'NS', 35, 'ADELINO JAMBA', 924440542, '2024-09-20 10:28:38', '2025-03-07 14:24:32', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1468, 611700, '024945254HO58', 'Evaristo Macua Paulo', 940286122, '2006-09-07 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAA', 'HUAMBO', 'NS', 36, 'Daniel PAULO', 927051714, '2024-09-20 10:33:35', '2024-11-05 07:31:02', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1469, 292527, '009759941CA042', 'Doroteia Rosa Capocola', 947971567, '2003-08-20 00:00:00', 'Femenino', 'Solteira', 'VVVVVVVVVVV', 'HUAMBO', 'NS', 36, 'FERNANDO', 947971567, '2024-09-20 10:45:26', '2024-09-20 10:46:04', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1473, 866100, '024339245HO052', 'Delfina Chinofila Henrique Banderira', 934672591, '2009-10-27 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Missionário São Tarcísio', 'Huambo ', 'SN', 35, 'Valentina Aida Henrique', 934672591, '2024-09-23 07:21:37', '2024-09-23 07:21:37', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1474, 520872, '026036289BE058', 'Fátima Nanjala Pedro da Silva', 941374719, '2008-08-09 00:00:00', 'Femenino', 'Solteira', 'Colégio 10 de Dezembro/CVhitembo', 'Huambo', 'SN', 35, 'Mário Carlos da Silva', 941374719, '2024-09-23 07:27:40', '2024-09-23 07:27:40', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1475, 826232, '026270165HO055', 'Artur Calume Segunda', 921089192, '2008-05-22 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Calilongue da Cuca', 'Huambo ', 'SN', 35, 'Emílio Segunda', 938848370, '2024-09-23 07:31:30', '2024-09-23 07:31:30', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1476, 857711, '020494997HO53', 'Elisa Lucussu Chipaco', 934008885, '2002-06-01 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Bula ', 'HUAMBO', 'NS', 35, 'Laurindo Mbali Chivala', 936714225, '2024-09-23 08:11:54', '2025-03-18 14:40:38', 1, 5, '0', NULL, NULL, 'Angolana ', 'Chicala', 'Chicala Cholohanga', 'Huambo', 'João Chipaco', 'Josefina Jamba', 'Ingles', 'Irmão'),
(1477, 835222, '026286690HO50', 'Bonefacio Chimbunda Cambuios', 928704691, '2006-05-23 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAAAAA', 'HUAMBO', 'NS', 35, 'Alexandre', 925809502, '2024-09-23 09:10:19', '2024-09-23 09:10:19', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1478, 116945, '022951594HO050', 'Luís Martins Ndunba', 932530463, '2005-03-05 00:00:00', 'Masculino', 'Solteiro', 'SDSSSSSSSSS', 'HUAMBO', 'NS', 35, 'Madalena', 932530463, '2024-09-23 09:16:10', '2024-09-23 09:16:10', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1479, 291253, '020366316HO055', 'Maurício Neto Sanendele', 933930526, '2008-08-02 00:00:00', 'Masculino', 'Solteiro', 'Domingos Paiva da Silva', 'Huambo', 'SN', 35, 'Eva Florinda Neto', 933930526, '2024-09-23 10:20:10', '2024-09-23 10:20:10', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1480, 974469, '026060288BE058', 'Daniel Sachipassi Bundo Sachingolo', 926626968, '2008-07-18 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar 22 de Novembro', 'Huambo', 'SN', 35, 'Angelina Sachingolo', 926626968, '2024-09-23 10:29:26', '2024-09-23 10:29:26', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1481, 943802, '026060296BE058', 'Natália Vihemba Sachingolo Sangombe', 926626968, '2009-01-12 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar 22 de Novembro', 'Huambo', 'SN', 35, 'Angelina Sachingolo', 926626968, '2024-09-23 10:32:59', '2024-09-23 10:32:59', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1483, 367771, '021071734HO053', 'Miraldina De Carvalho Correia', 944800086, '2008-10-02 00:00:00', 'Femenino', 'Solteira', 'EPE II Ciclo Paiva Domingos', 'Huambo ', 'SN', 35, 'Fernando Henrique Capusso', 944800086, '2024-09-23 10:43:38', '2024-09-23 10:43:38', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1484, 949170, '020367142HO055', 'Fidelino Tchissende Epalanga Mbalaka', 936168261, '2008-10-14 00:00:00', 'Masculino', 'Solteiro', 'Escola António Agostinho Neto', 'Huambo', 'SN', 35, 'Delfina Rebeca Sole', 929279408, '2024-09-23 10:58:46', '2024-09-23 10:58:46', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1485, 511851, '021504463HO056', 'Maria Zita Aurélio', 948089839, '2008-07-20 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAAA', 'Huambo', 'NS', 35, 'Samuel Aurlio', 931819405, '2024-09-23 11:02:45', '2024-09-23 11:02:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1486, 854533, '025857567HO056', 'Hilário Mbuayo Tchitembo', 945236411, '2009-05-29 00:00:00', 'Masculino', 'Solteiro', 'Complexo escolar nº 114 Kapa Chilombo Huambo', 'Huambo', 'SN', 35, 'Victorina Djamba Mbuyo', 945236411, '2024-09-23 11:06:57', '2024-09-23 11:06:57', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1487, 327272, '021021536HO054', 'Marcolino Tchitocumula Sapalo', 927070975, '2005-03-18 00:00:00', 'Masculino', 'Solteiro', 'FFFFFFFFFFFFFF', 'HUAMBO', 'NS', 35, 'JACOB SAPALO', 945452399, '2024-09-23 11:07:34', '2024-09-23 11:07:34', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1488, 805870, '022085460LS054', 'Joseta Deolinda  Moreira Samulelo', 921192474, '2009-03-15 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar AJM', 'Huambo', 'SN', 35, 'Isabel Chinhinguico Moreira', 921192474, '2024-09-23 11:11:09', '2024-09-23 11:11:09', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1489, 241529, '020789147BEO52', 'Feliciano Canombo Saculieleca', 931221730, '2005-08-10 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAAAA', 'HUAMBO', 'NS', 35, 'RAFAEL ', 928503517, '2024-09-23 11:12:52', '2024-09-23 11:12:52', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1490, 700316, '022085626LS058', 'Josefa Maura Moreira Samulelo', 921192474, '2009-03-15 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar AJM', 'Huambo', 'SN', 35, 'Isabel Chinhinguica Moreira', 921192474, '2024-09-23 11:14:48', '2024-09-23 11:14:48', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1491, 511891, '009729868LSO45', 'Domingas Nachilulo Comboio', 930768275, '2005-09-10 00:00:00', 'Femenino', 'Solteira', 'GGGGGGGGG', 'HUAMBO', 'NS', 35, 'RAFAEL ', 930768275, '2024-09-23 11:17:06', '2024-10-09 10:46:54', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1492, 492102, '020365448HO052', 'Teresa Franco Pedro Manzumba', 930139480, '2010-12-11 00:00:00', 'Femenino', 'Solteira', 'Escola Fé Apostólica', 'Huambo ', 'SN', 35, 'Débora Domingas Pedro', 938047643, '2024-09-23 11:20:03', '2024-09-23 11:20:03', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1493, 555552, '23559', 'Adelino da Costa Soares', 937772633, '2005-05-28 00:00:00', 'Masculino', 'Solteiro', 'HHHHHHHHHHHHHHH', 'HUAMBO', 'NS', 35, 'Adelaide ', 937772633, '2024-09-23 11:20:29', '2024-09-23 11:20:29', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1494, 196943, '025795479HO053', 'Serafim Nunes Hengombe  Muvale', 921441851, '2009-03-03 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Domingos Paiva', 'Huambo', 'SN', 35, 'Domingos Campos', 921441851, '2024-09-23 11:23:27', '2024-09-23 11:23:27', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1495, 301875, '44444444', 'Josina Nachingui Mango', 944557850, '2005-05-01 00:00:00', 'Femenino', 'Solteira', 'GGGGGGGGGGGGG', 'HUAMBO', 'NS', 35, 'RAIMUNDO ', 944557850, '2024-09-23 11:24:05', '2024-10-04 08:41:48', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1496, 536492, '02431252HO59', 'Anastácio Chitangue Vilinga', 945874292, '2005-12-09 00:00:00', 'Masculino', 'Solteiro', 'GGGGGGGGGGGGGGGG', 'HUAMBO', 'NS', 35, 'PASCOAL VILINGA', 945874292, '2024-09-23 11:27:33', '2024-09-23 11:27:33', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1497, 641485, '0000000000', 'Anita Lucumbi Gervásio', 929748672, '2009-03-21 00:00:00', 'Femenino', 'Solteira', 'SE', 'Huambo', 'SN', 35, 'Manuel Chipa Tomás', 929748672, '2024-09-23 11:31:21', '2024-09-23 11:31:21', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1498, 553133, '010267893H0043', 'Victória Cunateque. Satacaya', 938922308, '2005-05-03 00:00:00', 'Femenino', 'Solteira', 'KKKKKKKK', 'HUAMBO', 'NS', 35, 'LUTERANA', 938922308, '2024-09-23 11:32:28', '2024-10-07 12:45:12', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1499, 210896, '00000000', 'Adriana Filomena Oliveira Sehelo', 925269531, '2009-07-04 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Jomaura', 'Huambo', 'SN', 35, 'José Oliveira Sehelo', 925269531, '2024-09-23 11:34:41', '2024-09-23 11:34:41', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1500, 375269, '022819953HO059', 'Manuel Sicato Livongue', 948089923, '2005-09-23 00:00:00', 'Masculino', 'Solteiro', 'LLLLLLLLLLL', 'HUAMBO', 'NS', 35, 'CONSTATINO', 923823535, '2024-09-23 11:37:47', '2024-09-23 11:37:47', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1501, 101635, '009725286BE043', 'Jerónima Elavoco Wanga', 934535395, '2005-03-30 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Missionário do São Tarcísio', 'Huambo', 'SN', 35, 'José Wanga', 949788234, '2024-09-23 11:39:15', '2024-09-23 11:39:15', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1502, 667351, '020498270KS057', 'Evaristo Paulo António Canganjo', 936487151, '2008-05-17 00:00:00', 'Masculino', 'Solteiro', 'Colégio Kwame N´krumah do Libolo em Calulo', 'Huambo', 'SN', 35, 'Amerdita Arão', 936487151, '2024-09-23 11:43:13', '2024-09-23 11:43:13', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1503, 319944, '023480053HO054', 'Afonsa Ngombe Calei', 0, '2006-04-23 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostolica', 'HUAMBO', 'NS', 35, 'Domingos Calei', 935940427, '2024-09-23 11:43:28', '2025-01-24 15:21:55', 1, 5, '0', 'Huambo', '2022-05-10', 'Angolana', 'Cachiungo', 'Cachiungo', 'Huambo', 'Domingos Calei', 'Marta Linda Ngombe', 'Ingles', 'Pai'),
(1504, 759763, '020806288HO058', 'Emília Luísa Cachota', 923235733, '2008-10-20 00:00:00', 'Femenino', 'Solteira', 'Complexo Ecolar nº 35 São José de Cluny', 'Huambo', 'SN', 35, 'Hernani Carlos Cachota', 923235733, '2024-09-23 11:47:13', '2024-09-23 11:47:13', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1505, 790658, '024772959HO055', 'Mateus Dongala Simão', 940758100, '2006-09-27 00:00:00', 'Masculino', 'Solteiro', 'MMMMMMMMM', 'HUAMBO', 'NS', 35, 'EDUARDO SIÃO', 923597324, '2024-09-23 11:47:41', '2024-09-23 11:47:41', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1506, 524030, '020072820HO57', 'Madalena Jamba  Flipe', 927232447, '2006-02-01 00:00:00', 'Femenino', 'Solteira', 'FFFFFFFFFFF', 'HUAMBO', 'NS', 35, 'FRANCISCA', 927232447, '2024-09-23 11:56:30', '2024-09-23 11:56:30', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1507, 467357, '009822387LN041', 'Ester Lucas Alberto ', 924545522, '2004-04-27 00:00:00', 'Femenino', 'Solteira', 'GGGGGGGGGGG', 'HUAMBO', 'NS', 35, 'CLARA ', 940781038, '2024-09-23 12:04:38', '2024-09-23 12:04:38', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1508, 203867, '025288634HO053', 'Wilson Valério Tchingala', 945079607, '2008-11-11 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Abel Tchingala', 945079607, '2024-09-23 12:16:14', '2024-09-23 12:16:14', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1509, 983135, '025880633HO056', 'Tiago Cahombo Ruben', 946143248, '2008-12-30 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Eduardo Ruben', 946143248, '2024-09-23 12:35:35', '2024-09-23 12:35:35', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1510, 873306, '021197026HO052', 'Maria Isaura Ngueve Sacalumbo', 927875876, '2008-06-16 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar nº14 Teresiano', 'Huambo', 'SN', 35, 'Rodé Wambembe de Castro', 927875876, '2024-09-23 12:41:29', '2024-09-23 12:41:29', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1511, 538808, '00000000', 'Débora Nachivinda Sachipuia', 927718105, '2008-08-19 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Luciano Sachipuia', 927718105, '2024-09-23 12:46:53', '2024-09-23 12:46:53', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1512, 562858, '0000000', 'Amós Chicunho Buta Kambundo', 944774288, '2008-02-12 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Soba Chipualala', 'Huambo', 'SN', 35, 'Amós Kambundo', 944774288, '2024-09-23 12:50:21', '2024-09-23 12:50:21', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1513, 671296, '020597636HO059', 'Agostinho Verde Funete', 924199095, '2008-08-14 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Cornélio Funete', 924199093, '2024-09-23 12:54:01', '2024-09-23 12:54:01', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1514, 556335, '020367953HO052', 'Adelina Nachala Pessela Nganjo', 935972967, '2008-05-07 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Luciano Nalussinga', 935972967, '2024-09-23 12:57:42', '2024-09-23 12:57:42', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1515, 724597, '94678440056', 'Josefina Noloti Segunda', 949775407, '2004-01-12 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAA', 'HUAMBO', 'NS', 35, 'HIGINA SEGUNDA', 949775407, '2024-09-23 12:58:43', '2024-09-23 12:58:43', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1516, 495528, '0022323909HO056', 'Graciano Ekolelo Sanjanja', 928603587, '2008-02-18 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Carmelita Miguel', 928603587, '2024-09-23 13:01:50', '2024-09-23 13:01:50', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1517, 573569, '02583671HO058', 'Gabriel da Silva Amaral', 936185525, '2004-10-30 00:00:00', 'Masculino', 'Solteiro', 'KKKKKKKKK', 'HUAMBO', 'NS', 35, 'FREDERICO', 936185525, '2024-09-23 13:03:41', '2024-09-23 13:03:41', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1518, 632107, '025690695HO053', 'Maria de Fátima Luzia Candonga', 927227826, '2008-09-07 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Valentino Candonga', 927227826, '2024-09-23 13:04:31', '2024-09-23 13:04:31', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1519, 284717, '025932994HO57', 'Manuel Chitumba Mateus', 933335251, '2004-01-13 00:00:00', 'Masculino', 'Solteiro', 'HHHHHHHH', 'HUAMBO', 'NS', 35, 'FLORINDA', 933335251, '2024-09-23 13:07:29', '2024-09-23 13:07:29', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1520, 348915, '000000000', 'Lino Samanjata Dombo', 934169385, '2009-04-01 00:00:00', 'Masculino', 'Solteiro', 'Instituto Técnico MC Capaca', 'Huambo', 'SN', 35, 'Inocêncio Dombo', 94829576, '2024-09-23 13:08:56', '2024-09-23 13:08:56', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1521, 641212, '02256383HO053', 'Frederico Mussili Mussungo', 940715949, '2004-02-19 00:00:00', 'Masculino', 'Solteiro', 'GGGGGGGGGGGG', 'HUAMBO', 'NS', 35, 'HERCULANO', 932226725, '2024-09-23 13:12:06', '2024-09-23 13:12:06', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1522, 972771, '020366854HO056', 'Justino C. Moises', 929355132, '2004-02-08 00:00:00', 'Masculino', 'Solteiro', 'DDDDDDD', 'HUAMBO', 'NS', 35, 'VENTURA', 922518115, '2024-09-23 13:17:44', '2024-09-23 13:17:44', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1523, 352953, '024289937BE052', 'Maria Chicondo Loth Sanguia', 942551899, '2009-06-20 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Priscila Loth', 942551899, '2024-09-23 13:18:01', '2024-09-23 13:18:01', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1524, 677470, '5555', 'Domingos Siquela Quinta', 924969347, '2004-09-03 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'COSTANTINO', 931233325, '2024-09-23 13:22:49', '2024-09-23 13:22:49', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1525, 320401, '010247493HO041', 'Jemilia Mpandesala Mangala Canganjo', 940228543, '2010-02-28 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Evaristo Catombela-Caála', 'Huambo-Bomba Baixa', 'SN', 35, 'Maria da Coma', 940228543, '2024-09-23 13:26:40', '2024-09-23 13:26:40', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1526, 567284, '009697245LS041', 'Keque Domingos Candido', 934180183, '2004-05-02 00:00:00', 'Masculino', 'Solteiro', 'DDDDDDDDDDD', 'HUAMBO', 'NS', 35, 'YAMBO ', 934180183, '2024-09-23 13:26:45', '2024-09-23 13:26:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1527, 309443, '025185110HO052', 'Angelina Fucula Kawanga', 943942048, '2008-10-20 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Calilongue', 'Huambo', 'SN', 35, 'António Kawanga', 943942048, '2024-09-23 13:30:29', '2024-09-23 13:30:29', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1528, 863645, '765261', 'Juliana Maria Chiambi', 928893373, '2006-03-06 00:00:00', 'Femenino', 'Solteira', 'JJJJJJJJJJ', 'HUAMBO', 'NS', 35, 'SAMUEL CHIAMBI', 923814430, '2024-09-23 13:31:17', '2024-09-23 13:31:17', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1529, 369112, '2482', 'Joana Eduardo Kavala Malufu', 926203036, '2008-01-31 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Eduardo Malufu', 926203036, '2024-09-23 13:33:51', '2024-09-23 13:33:51', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1530, 553218, '009727239BEO44', 'Domingas Cassinda Sipitali', 925978404, '2005-03-09 00:00:00', 'Femenino', 'Solteira', 'SSSSSSSSSS', 'HUAMBO', 'NS', 35, 'FRANCISCA LUSSINGA', 929693372, '2024-09-23 13:36:56', '2025-02-12 16:42:46', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1531, 458516, '021128040HO059', 'Abilio Tomas David', 929424543, '2005-10-03 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAAA', 'HUAMBO', 'NS', 35, 'JULIO DAVID', 929424543, '2024-09-23 13:41:24', '2024-09-23 13:45:29', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1532, 882213, '00871444MO045', 'Laurinda Nachimbi Chikete', 936351625, '2005-09-05 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAA', 'HUAMBO', 'NS', 35, 'Maria Jacob', 936351625, '2024-09-23 13:50:33', '2024-09-23 13:50:33', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1534, 692906, '0000000', 'Luciano Cacumba Gravata', 935464147, '2005-01-26 00:00:00', 'Masculino', 'Solteiro', 'SSSSSSSSSSS', 'HUAMBO', 'NS', 35, 'ADRIANO', 935464147, '2024-09-23 13:54:38', '2024-09-23 13:54:38', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1535, 835895, '000000000', 'Belina Ngueve Loneque', 922243867, '2008-08-17 00:00:00', 'Femenino', 'Solteira', 'Colégio Maria da Silva Neto', 'Huambo', 'SN', 35, 'Santinho Loneque', 922243867, '2024-09-23 13:55:55', '2024-09-23 13:55:55', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1536, 453328, '023521894HO057', 'Higino Luacuti Ngussi', 935957244, '2009-04-16 00:00:00', 'Masculino', 'Solteiro', 'Colégio Comandante Hoji Ya Henda', 'Huambo', 'SN', 35, 'João Ngussi', 935957244, '2024-09-23 13:58:58', '2024-09-23 13:58:58', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1537, 871205, '026069494HO058', 'António Sucumba Huambo', 922502286, '2009-07-21 00:00:00', 'Masculino', 'Solteiro', 'Colégio Dr. Agostinho Neto', 'Huambo', 'SN', 35, 'Manuel Paulino Huambo', 922502286, '2024-09-23 14:02:23', '2024-09-23 14:02:23', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1538, 682858, '020358529HO059', 'Albertina Ribeiro Crespunga', 924194621, '2009-01-10 00:00:00', 'Femenino', 'Solteira', 'Complexo nº 177 São João Calábria', 'Huambo', 'SN', 35, 'Carlos Crespunga', 934412122, '2024-09-23 14:07:12', '2024-12-13 09:56:54', 1, 6, '0', NULL, NULL, 'Angolana', 'Tchicala', 'Tchicala Tcholohanga', 'Huambo', 'Carlos Manuel Horácio Ribeiro Crespunga', 'Edith Madalena Cassova', 'Ingles', 'Pai'),
(1539, 905007, '020989885HO051', 'Afonsa Nassapalo Wongo Benedito', 929345340, '2008-03-08 00:00:00', 'Femenino', 'Solteira', 'Colégio Dr. António Agostinho Neto', 'Huambo', 'SN', 35, 'José Benedito', 929345340, '2024-09-23 14:11:00', '2024-09-23 14:11:00', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1540, 921661, '020366227HO055', 'Idalina Lussinga Domingos Satchivinda', 921885086, '2008-11-17 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Dangereux-Huambo', 'Huambo', 'SN', 35, 'Madalena Domingos', 921885086, '2024-09-23 14:14:29', '2024-09-23 14:14:29', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1541, 328045, '12459/2017', 'Flora Navihemba Diogo', 929335867, '2008-04-28 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Dangereux - Huambo', 'Huambo-Cidade Baixa', 'SN', 35, 'Antónia Juliana Chingandu', 944547137, '2024-09-23 14:21:22', '2024-09-23 14:21:22', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1542, 541976, '1110', 'Pedro Katemba Namuele Vinateca', 924852110, '2009-04-11 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Pedro Katemba Joaquim', 924852110, '2024-09-23 14:27:09', '2024-09-23 14:27:09', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1543, 667422, '020781153HO058', 'Judith Cafeka João', 924217843, '2009-01-21 00:00:00', 'Femenino', 'Solteira', 'Colégio nº 6 Aurélio Miti 22 de Novembro', 'Huambo', 'SN', 35, 'Matias João', 924217843, '2024-09-23 14:30:47', '2024-09-23 14:30:47', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1544, 926396, '025743124HO056', 'Daniel Fio Chitumba Paulo', 923678197, '2008-06-01 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Missionário do são Tarcísio', 'Huambo', 'SN', 35, 'Augusta Sapalo', 923678897, '2024-09-23 14:35:33', '2024-09-23 14:35:33', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1545, 801553, '5555555555', 'Margarida Vinene Calunga ', 925975356, '2005-05-12 00:00:00', 'Femenino', 'Solteira', 'DDDDDDDDDDD', 'HUAMBO', 'NS', 35, 'CELESTE', 925975356, '2024-09-24 08:32:28', '2024-11-06 11:28:42', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1546, 847713, '024750862HO059', 'Amelia Canjala Canganjo', 943458034, '2006-05-14 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAAAAA', 'HUAMBO ', 'NS', 35, 'INACIO JOSÉ', 934081786, '2024-09-24 08:36:05', '2024-09-24 08:36:05', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1547, 683799, '021911449BE055', 'Angelina Nunda Calembe', 934597285, '2006-01-06 00:00:00', 'Femenino', 'Solteira', 'HHHHHHHHH', 'HUAMBO', 'NS', 35, 'CONSTANTINO', 921640046, '2024-09-24 08:40:46', '2024-09-24 08:40:46', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1548, 395726, '020120739HO058', 'Belmiro Domingos Chiteculo', 943237013, '0000-00-00 00:00:00', 'Masculino', 'Solteiro', 'HHHHHHHHH', 'HUAMBO', 'NS', 35, 'MARIA BATALHA', 943237013, '2024-09-24 08:44:20', '2024-09-24 08:44:20', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1549, 318731, '021406282HO055', 'Cost m. M. Manuel ', 932880846, '2006-03-11 00:00:00', 'Masculino', 'Solteiro', 'KKKKKKKK', 'HUAMBO', 'NS', 35, 'EVARISTO MANUEL', 932880846, '2024-09-24 08:48:22', '2024-09-24 08:48:22', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1550, 424340, '024198267HO052', 'Ermelinda Emilia Sopite', 922266213, '2006-07-16 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAA', 'HUAMBO', 'NS', 35, 'ANA ALZIRA ', 931308174, '2024-09-24 08:52:27', '2024-09-24 08:52:27', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1551, 773065, '020156479HO056', 'Graciana Chambula Nunda', 929398089, '2006-04-21 00:00:00', 'Femenino', 'Solteira', 'FFFFFFFF', 'HUAMBO', 'NS', 35, 'FAUSTINO ', 929398089, '2024-09-24 08:57:06', '2024-09-24 08:57:06', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1553, 626097, '025971633HO51', 'João Paulo Nelson', 936198572, '2006-05-23 00:00:00', 'Masculino', 'Solteiro', 'JJJJJJJJJJJJJ', 'HUAMBO', 'NS', 35, 'FELICIANA', 936198572, '2024-09-24 09:07:37', '2024-09-24 09:07:37', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1554, 314364, '02048827CC055', 'Moises Tchipipa Cambinda', 944600789, '2006-02-09 00:00:00', 'Masculino', 'Solteiro', 'FFFFFFFFFFF', 'HUAMBO', 'NS', 35, 'AUGUSTINHA', 944600789, '2024-09-24 09:13:04', '2024-09-24 09:13:04', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1555, 408197, '020129725CC', 'Regina Ngueve Katchandele', 934456364, '2006-11-15 00:00:00', 'Femenino', 'Solteira', 'GGGGGGG', 'HUAMBO', 'NS', 35, 'JOÃO', 926779133, '2024-09-24 09:19:11', '2024-09-24 09:19:11', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1556, 783621, '00000000', 'Adriano Cheguevara Gonde Diogo', 923755824, '2009-04-22 00:00:00', 'Masculino', 'Solteiro', 'Colégio Comandante Bula', 'Huambo', 'SN', 35, 'Ângela Manuela Gonde Diogo', 923755824, '2024-09-24 09:19:19', '2024-09-24 09:19:19', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1557, 940075, '4444', 'Paulina Cassova Fela ', 930086734, '2006-11-28 00:00:00', 'Femenino', 'Solteira', 'kkkkk', 'HUAMBO', 'NS', 35, 'PAULINA', 930086734, '2024-09-24 09:21:57', '2024-09-24 09:21:57', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1558, 441548, '44', 'Samuel Chijica Capenda', 947578749, '2006-05-29 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAA', 'HUAMBO', 'NS', 35, 'SAMUEL', 947578749, '2024-09-24 09:25:35', '2024-09-24 09:25:35', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1559, 258523, '52', 'Domingas Nepomba Sacanhe', 924401529, '2006-06-12 00:00:00', 'Femenino', 'Solteira', 'LLLLLLLL', 'HUAMBO', 'NS', 35, 'VALENTIM', 926320208, '2024-09-24 09:29:51', '2024-09-24 09:29:51', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1560, 642273, '020963611HO053', 'Anita Balombo Júlio', 928095032, '2000-03-26 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar da Chiva no Huambo', 'Huambo', 'SN', 35, 'Alberto Frederico Júlio', 943244613, '2024-09-24 09:30:18', '2024-09-24 09:30:18', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1561, 989812, '44', 'Teresa Vinene Benedito', 939125056, '2006-06-16 00:00:00', 'Femenino', 'Solteira', 'AAAAAA', 'HUAMBO', 'NS', 35, 'JUSTINA', 939125056, '2024-09-24 09:32:37', '2024-09-24 09:32:37', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1562, 800461, '020700348HO053', 'Abraão Sachilemo Sassango', 928577565, '2007-05-22 00:00:00', 'Masculino', 'Solteiro', 'Colégio Escolar da Chiva no Huambo', 'Huambo', 'SN', 35, 'Adriano da Conceição', 933605626, '2024-09-24 09:33:38', '2024-09-24 09:33:38', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1563, 582673, '44', 'Fernanda Pedro Eurico', 933411138, '2006-02-22 00:00:00', 'Femenino', 'Solteira', 'GGGGGGGGGG', 'HUAMBO', 'NS', 35, 'RIBEIRO', 923215430, '2024-09-24 09:36:34', '2024-09-24 09:36:34', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1564, 332074, '025857516HO055', 'Alexandre Chiquepa Mbuayo Tchitembo', 945236411, '2006-10-30 00:00:00', 'Masculino', 'Solteiro', 'Escola nº 114 Kapa Chilombo Huambo', 'Huambo', 'SN', 35, 'Victorina Mbuayo', 945236411, '2024-09-24 09:37:27', '2024-09-24 09:37:27', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1565, 349064, '444', 'Alberta Cassova Chinjovela', 943240561, '2004-08-15 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'NATALIA', 926918343, '2024-09-24 09:40:48', '2024-09-24 09:40:48', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1566, 249902, '023829364HO056', 'Amélia Chipeio Candundo', 923462480, '2007-01-24 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Jomaura', 'Huambo', 'SN', 35, 'Valentina Candundo', 923462480, '2024-09-24 09:42:09', '2024-09-24 09:42:09', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1567, 298229, '44', 'Paulino Sacuacuenhe Capoco', 949470274, '2004-08-15 00:00:00', 'Masculino', 'Solteiro', 'AAAAAA', 'HUAMBO', 'NS', 35, 'MADALENA', 949470274, '2024-09-24 09:43:48', '2024-09-24 09:43:48', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1568, 448936, '44', 'Agostinha Cassova Luis', 931115904, '2004-11-13 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'SABINA', 939705521, '2024-09-24 09:46:39', '2024-09-24 09:46:39', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1569, 434344, '022216979HO051', 'Anastácio Jamba Baptista', 933057799, '2007-10-20 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Calilongue da Cuca', 'Huambo', 'SN', 35, 'Manuel Baptista', 922790142, '2024-09-24 09:48:31', '2024-09-24 09:48:31', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1570, 175048, '44444', 'Ruth Adelaide Epalanga', 926314358, '2004-10-12 00:00:00', 'Femenino', 'Solteira', 'AAAAA', 'HUAMBO', 'NS', 35, 'ADELAIDE', 946660923, '2024-09-24 09:49:51', '2024-09-24 09:49:51', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1571, 536757, '000000000', 'Augusta Maria Chitumba', 933077576, '2007-03-06 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar nº 14 Teresiano', 'Huambo', 'SN', 35, 'Sabino Chipuo', 933077576, '2024-09-24 09:55:35', '2024-09-24 09:55:35', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1572, 455425, '44', 'Lidia Francisca Mundo', 942626781, '2008-04-05 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'JOSÉ', 942626781, '2024-09-24 09:56:09', '2024-09-24 09:56:09', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1573, 930199, '111', 'António Cayumbuca Namelena', 944515098, '2006-03-19 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'GONÇALVES ', 927402138, '2024-09-24 09:59:41', '2024-09-24 09:59:41', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1574, 134855, '024054556HA056', 'Aurélio Kapoco Sanjandala', 923443336, '2007-12-07 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Missionário São Tarcísio', 'Huambo ', 'SN', 35, 'Artur Sanjandala', 923443336, '2024-09-24 10:02:28', '2024-09-24 10:02:28', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1575, 760896, '026313668HO051', 'Angelina Beatriz Chicondia', 934100435, '2007-05-07 00:00:00', 'Femenino', 'Solteira', 'Colégio Dr. Agostinho Neto', 'HUAMBO', 'NS', 35, 'Luciana Leonora', 944952599, '2024-09-24 10:04:15', '2024-12-06 15:29:22', 1, 5, '0', 'Huambo', '2024-08-23', 'Angolana', 'Chicala', 'Chicala Cholohanga', 'Huambo', 'Horácio António Chicondia', 'Luciana Leonora', 'Inglesa', 'Mãe'),
(1576, 739142, '024124627HO055', 'Cristina Chinhañgala Chitumba', 931331930, '2007-12-03 00:00:00', 'Femenino', 'Solteira', 'Colégio Maria da Silva Neto', 'Huambo', 'SN', 35, 'Avelino Chitumba', 931331930, '2024-09-24 10:06:28', '2024-09-24 10:06:28', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1578, 578830, '020277703MO055', 'Daniel José Marcos ', 923026782, '2007-02-14 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Jomaura', 'Huambo', 'SN', 35, 'Arminda Luembi', 923026782, '2024-09-24 10:10:09', '2024-09-24 10:10:09', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1579, 715052, '5555555555', 'Maria Ngueve  Seyala Saiala', 938101614, '2004-10-30 00:00:00', 'Femenino', 'Solteira', 'HHHHHHHH', 'HUAMBO', 'NS', 35, 'MANUEL', 940910991, '2024-09-24 10:11:43', '2024-09-24 10:12:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1580, 776663, '020702437BE051', 'Domingos Lucas Chitula Ngungo', 927593884, '2007-02-04 00:00:00', 'Masculino', 'Solteiro', 'Escola Fé Apostólica São José', 'Huambo', 'SN', 35, 'Manuel Ngungo', 927593884, '2024-09-24 10:13:17', '2024-09-24 10:13:17', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1581, 548662, '022033542HO052', 'Elvira Naquessongo Ndielo', 941599529, '2007-02-18 00:00:00', 'Femenino', 'Solteira', 'Escola Aurélio Miti 22 de Novembro', 'Huambo', 'SN', 35, 'José Ndielo', 941599529, '2024-09-24 10:17:45', '2024-09-24 10:17:45', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1582, 839075, '021457871ZE059', 'Emiliano Jamba', 928975711, '2006-11-23 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Firmino Saliwemo', 926012347, '2024-09-24 10:20:50', '2024-09-24 10:20:50', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1583, 713303, '777777777', 'Victoria Ngueve Isaac', 924141361, '2004-03-14 00:00:00', 'Femenino', 'Solteira', 'AAAAAAA', 'HUAMBO', 'NS', 35, 'VICTORINA', 924141361, '2024-09-24 10:21:32', '2024-09-24 10:21:32', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1584, 593363, '000000000', 'Evalina Catembo Cipriano', 925310133, '2006-08-28 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar SOS Huambo', 'Huambo', 'SN', 35, 'Paulo Cipriano', 927049847, '2024-09-24 10:24:07', '2024-09-24 10:24:07', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1585, 986407, '024397688HO057', 'Flora Chamile Lunjula Matias ', 928426189, '2007-10-04 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar 4 de Abril da Caála', 'Huambo', 'SN', 35, 'Adérito Chilitangui', 928426189, '2024-09-24 10:27:42', '2024-11-05 14:05:35', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1586, 504067, '4444', 'Mariana Bernarda Chipindo Nangombe ', 924715982, '2009-02-19 00:00:00', 'Femenino', 'Solteira', 'AAAAAA', 'HUAMBO - Santa Iria', 'NS', 36, 'Ana Maria Chipindo', 936993211, '2024-09-24 10:28:33', '2025-03-18 09:08:41', 1, 6, '0', NULL, NULL, 'Angonana', 'Huambo', 'Huambo', 'Huambo', 'António Ricardo Nangombe', 'Ana Maria Chipindo', 'L. Inglesa', 'Mãe'),
(1587, 947184, '009738847HO041', 'Gabriel José Fonseca', 923088286, '2006-04-10 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Missionário São Tarcisio', 'Huambo', 'SN', 35, 'Gabriel Pinto', 923088286, '2024-09-24 10:32:30', '2024-09-24 10:32:30', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1588, 460116, '444', 'Valeria Salomé Fayenda', 0, '2006-02-09 00:00:00', 'Femenino', 'Solteira', 'AAAA', 'Huambo - Cambiote', 'NS', 36, 'Alexandre Fayenda Lumbo', 934513297, '2024-09-24 10:36:31', '2025-03-20 09:35:29', 1, 5, '0', NULL, NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Alexandre Fayenda Lumbo', 'Maria Salomé', 'L. Inglesa', 'Pai'),
(1589, 597091, '6555555', 'Leopodina Camia Quimico', 932257933, '2007-06-16 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAA', 'HUAMBO', 'NS', 35, 'JOÃO', 932257933, '2024-09-24 11:03:39', '2024-09-24 11:03:39', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1590, 991109, '5555', 'Leopodina Câmia Sawimbo Químico', 932257931, '2007-06-19 00:00:00', 'Femenino', 'Solteira', 'DDDDDDDD', 'HUAMBO', 'NS', 35, 'JOÃO', 932257931, '2024-09-24 11:08:48', '2024-10-14 14:53:18', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1591, 680779, '4444', 'Emiliano Chingalule Ferro', 930147840, '2006-11-06 00:00:00', 'Masculino', 'Solteiro', 'AAAA', 'HUAMBO', 'NS', 35, 'MARIA', 925027846, '2024-09-24 11:11:44', '2024-09-24 11:11:44', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1592, 302263, '44444', 'Americo Tchissingue Dongonga', 922040853, '2007-12-15 00:00:00', 'Masculino', 'Solteiro', 'AAAA', 'HUAMBO', 'NS', 35, 'FLORINDA SAMBA', 930135107, '2024-09-24 11:15:29', '2024-09-24 11:15:29', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1594, 194456, '555', 'Maria Emilia Frederico Victorino', 933411138, '2006-08-08 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAA', 'HUAMBO', 'NS', 35, 'Ribeiro', 923215430, '2024-09-24 11:22:45', '2024-10-15 15:02:05', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1595, 628125, '777', 'Miguel Gonçalves Alfredo Canivete', 929961125, '2007-03-15 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAA', 'HUAMBO', 'NS', 35, 'EUGENIA', 929961125, '2024-09-24 11:25:57', '2024-09-24 11:25:57', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1596, 416216, '5555', 'Isidoro Uyombo Manico Kukula', 943270975, '2005-08-09 00:00:00', 'Masculino', 'Solteiro', 'LLLLLLLL', 'HUAMBO', 'NS', 35, 'LUISA', 943270975, '2024-09-24 11:31:48', '2024-09-24 11:31:48', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1597, 982511, '4444', 'Natalia Kamia Cambanda', 925347082, '2008-08-30 00:00:00', 'Femenino', 'Solteira', 'AAAAAAA', 'HUAMBO', 'NS', 35, 'PEDRO', 925347082, '2024-09-24 11:35:36', '2024-09-24 11:35:36', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1598, 604398, '4444', 'Domingos Atónio Mucanda', 943173240, '2007-12-01 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAAAAA', 'HUAMBO', 'NS', 35, 'Domingos', 943173240, '2024-09-24 11:39:45', '2024-09-24 11:39:45', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1599, 899245, '021933941HO050', 'Graciano Chiteculo Sapalo', 945473544, '2006-04-14 00:00:00', 'Masculino', 'Solteiro', 'Colégio Dr. António Agostinho Neto', 'Huambo', 'SN', 35, 'Herculano Sapalo', 934319719, '2024-09-24 11:44:09', '2024-09-24 11:44:09', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1600, 365721, '4444444', 'Domingos António Mucanda', 943173240, '2007-12-01 00:00:00', 'Masculino', 'Solteiro', 'HHHHHH', 'HUAMBO', 'NS', 35, 'DD', 943173240, '2024-09-24 11:44:48', '2024-09-24 11:44:48', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1601, 849861, '4144', 'Fernando Chipuli Siquito', 943239287, '2009-04-18 00:00:00', 'Masculino', 'Solteiro', 'LLLLLLLL', 'HUAMBO', 'NS', 35, 'SALOME', 933357393, '2024-09-24 11:47:50', '2024-09-24 11:47:50', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1602, 530171, '44', 'Luciano Pelo Benedito', 924851311, '2005-07-09 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAA', 'HUAMBO', 'NS', 35, 'FRANCISCO', 924851311, '2024-09-24 11:50:38', '2024-09-24 11:50:38', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1603, 563734, '1126/2023', 'Idália Canguya Canganjo Daniel', 931439422, '2007-03-08 00:00:00', 'Femenino', 'Solteira', 'Colégio AJM', 'Huambo', 'SN', 35, 'Idália Canguya Canganjo Daniel', 931439422, '2024-09-24 11:52:32', '2024-09-24 11:52:32', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1604, 894148, '555555555', 'Belchior Justino Kambundo', 944774288, '2006-02-04 00:00:00', 'Masculino', 'Solteiro', 'AAAAAA', 'HUAMBO', 'NS', 35, 'FILOMENA', 4114, '2024-09-24 11:55:11', '2024-09-24 11:55:11', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1605, 988607, '010290799MO043', 'Isaac Vicente Lopes Maquinixi', 942790739, '2006-01-15 00:00:00', 'Masculino', 'Solteiro', 'Colégio nº 214', 'Huambo', 'SN', 35, 'Domingos Maquinixi', 942790739, '2024-09-24 11:57:56', '2024-09-24 11:57:56', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1606, 900225, '55', 'Ana Chipuco Gregorio', 938492611, '2007-08-07 00:00:00', 'Femenino', 'Solteira', 'AAAAAA', 'HUAMBO', 'NS', 35, 'ISABEL', 85855, '2024-09-24 11:58:06', '2024-09-24 11:58:06', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1607, 542725, '5555555', 'Erica Patricia Francisco', 933916196, '2005-08-07 00:00:00', 'Femenino', 'Solteira', 'FFFFFFF', 'HUAMBO', 'NS', 35, 'FELISBERTO', 921717004, '2024-09-24 12:01:39', '2024-09-24 12:01:39', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1608, 652282, '008845197HO042', 'Isabel Camuma Sassoma Ucuahamba', 939060043, '2007-01-12 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Polivalente do Cuando', 'Huambo', 'SN', 35, 'Fernando Huambo', 939060043, '2024-09-24 12:02:39', '2024-09-24 12:02:39', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1609, 168820, '55555', 'Ana Maria Domingos', 924684837, '2006-07-05 00:00:00', 'Femenino', 'Solteira', 'HHHHHHH', 'HUAMBO', 'NS', 35, 'Chipuco', 66, '2024-09-24 12:05:21', '2024-09-24 12:05:21', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1610, 851705, '444444444', 'Odeth Fernanda Estevão', 923052098, '2007-04-01 00:00:00', 'Femenino', 'Solteira', 'GGGGGGGG', 'HUAMBO', 'NS', 35, 'JORGE', 922551606, '2024-09-24 12:09:43', '2024-11-06 13:31:56', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1611, 813815, '555555555', 'Avelino Epongo Sambundo', 949498942, '2007-02-12 00:00:00', 'Masculino', 'Solteiro', 'AAAAA', 'HUAMBO', 'NS', 35, 'Florentino', 929465871, '2024-09-24 12:14:13', '2024-09-24 12:14:13', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1612, 175022, '024755969HO059', 'Jaime Daniel Camongua', 926118450, '2006-12-09 00:00:00', 'Masculino', 'Solteiro', 'Colégio de Ndunduma do Cachiungo', 'Huambo', 'SN', 35, 'Horácio Camongua ', 926118450, '2024-09-24 12:15:57', '2024-09-24 12:15:57', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `estudantes` (`id`, `numero`, `identificacao`, `nome`, `telefone`, `data_de_nascimento`, `genero`, `estado_civil`, `escola_anterior`, `residencia`, `necessidade_especial`, `curso_id`, `encarregado`, `contacto_encarregado`, `createdAt`, `updatedAt`, `status`, `user_id`, `numero_processual`, `local_emissao_identificacao`, `data_emissao_bi`, `nacionalidade`, `naturalidade`, `municipio`, `provincia`, `nome_pai`, `nome_mae`, `lingua_opcao`, `grau_parentesco`) VALUES
(1613, 550555, '6666666', 'Benoriel Chitonga Sambundo', 949499842, '2007-08-08 00:00:00', 'Masculino', 'Solteiro', 'AHHH', 'HUAMBO', 'NS', 35, 'FLORENTINO', 55, '2024-09-24 12:17:16', '2024-09-24 12:17:16', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1614, 987044, '55555', 'Luciano João Kapoeira', 942532030, '2007-04-20 00:00:00', 'Masculino', 'Solteiro', 'AAAAAA', 'HUAMBO', 'NS', 35, 'LUCIANO', 941899487, '2024-09-24 12:20:38', '2024-09-24 12:20:38', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1615, 664382, '021236624HO050', 'Josefina Chilombo Tchimbanguela ', 930674297, '2007-05-19 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Missionário São Tarcísio', 'Huambo', 'SM', 35, 'Tersa de Lurdes Wambo', 930674297, '2024-09-24 12:20:39', '2024-09-24 12:20:39', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1616, 214853, '022962319CE052', 'josefina Ngueve Ekumbi João', 940333255, '2006-10-23 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar da Chiva', 'Huambo', 'SN', 35, 'Maria Madalena', 939244462, '2024-09-24 12:24:33', '2024-09-24 12:24:33', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1618, 649922, '4444444', 'Mateus Sindako Nunulo', 921119242, '2007-04-10 00:00:00', 'Masculino', 'Solteiro', 'LLLLL', 'HUAMBO', 'NS', 35, 'DOMINGOS', 555, '2024-09-24 12:30:32', '2024-09-24 12:30:32', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1619, 101330, '555555', 'Veronica Cassova Nangayafina', 927883518, '2004-11-08 00:00:00', 'Femenino', 'Solteira', 'KKKKKKK', 'HUAMBO', 'NS', 35, 'CARDOSO', 947629860, '2024-09-24 12:34:04', '2024-09-24 12:34:04', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1620, 383689, '1055/2014', 'Laurinda Jinga Canganjo Undembe', 921862547, '2007-01-09 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Armando Wendembe', 921862547, '2024-09-24 12:40:21', '2024-09-24 12:40:21', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1621, 998702, '025249796KS054', 'Lourdes da Conceição Miquinho Gonçalves', 929961125, '2006-10-29 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar da Ganja', 'Huambo ', 'SN', 35, 'Eugénia Cecília', 929961125, '2024-09-24 12:43:45', '2024-09-24 12:43:45', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1622, 332427, '0000000000000', 'Marcos Kacope Lumbungulo', 933139816, '2006-07-10 00:00:00', 'Masculino', 'Solteiro', 'Colégio Comandante Hoji ya Henda', 'Huambo', 'SN', 35, 'Florindo Lumbungulo', 933139816, '2024-09-24 12:47:12', '2024-09-24 12:47:12', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1623, 470634, '021496401HO059', 'Margarida Joaquina Cavindivindi Luís ', 921317041, '2006-10-06 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo - Bomba Baixa', 'SN', 35, 'Baptista Sachingando', 921317041, '2024-09-24 12:51:07', '2025-03-20 08:51:18', 1, 6, '0', 'Huambo', NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Geraldo Luís', 'Victorina Nassoma Cavindivindi', 'L. Inglesa', 'Prima'),
(1624, 442331, '007110140CA041', 'Maria da Conceição Mendes Coelho', 941776517, '2007-02-14 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar SOS Huambo', 'Huambo', 'SN', 35, 'Madalena Mendes ', 941776517, '2024-09-24 12:54:41', '2024-09-24 12:54:41', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1625, 921759, '020597072HO055', 'Maria Dendo Caterça', 930171315, '2006-09-23 00:00:00', 'Femenino', 'Solteira', 'Colégio nº 77 Essaque', 'Huambo', 'SN', 35, 'Antonino Caterça', 927953700, '2024-09-24 12:58:12', '2025-03-21 09:13:26', 1, 6, '0', 'Huambo', NULL, 'Angolana', 'Chicala', 'Chicala Cholohanga', 'Huambo', 'Domingos Caterça', 'Ângela Nanjeque', NULL, 'Irmão'),
(1626, 765292, '025952929HO058', 'Maria Emília Sachicaca', 925787248, '2007-09-15 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar nº 134 Santa Cruz Canhe', 'Huambo', 'SN', 35, 'Abel Sachicaca', 925787248, '2024-09-24 13:12:10', '2024-09-24 13:12:10', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1627, 393385, '4670/2015', 'Maria Ferramenta Amaral', 936932775, '2007-07-24 00:00:00', 'Femenino', 'Solteira', '--------', 'Huambo', 'SN', 35, 'Rita Camangala', 936932775, '2024-09-24 13:16:10', '2024-09-24 13:16:10', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1628, 540154, '023951527HO056', 'Mariano Chipaca  Capitango', 940082826, '2007-04-20 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Missionário São Tarcísio', 'Huambo', 'SN', 35, 'Cândida Lussati', 940082826, '2024-09-24 13:19:12', '2024-09-24 13:19:12', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1629, 253975, '555555', 'Gervasio Sõi Freitas', 922615874, '2004-03-04 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'Candido FREITAS', 941519095, '2024-09-24 13:22:04', '2024-09-24 13:22:04', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1630, 817538, '021333616HO054', 'Maurícia João Massanga ', 943320982, '2007-05-08 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Judith Muachilonga', 924615451, '2024-09-24 13:22:40', '2024-09-24 13:22:40', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1631, 222150, '222', 'Jovita Culinhoga Furtuna', 933804873, '2001-07-17 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'JERONIMO', 938306964, '2024-09-24 13:25:53', '2024-09-24 13:25:53', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1632, 463129, '022258670HO051', 'Melita Cassinda Francisca Canivete', 948092325, '2007-09-14 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Benício Canivete', 948092325, '2024-09-24 13:26:18', '2024-09-24 13:26:18', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1633, 500977, '5555', 'Maria Luisa Vicente', 945324257, '1994-10-24 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAA', 'HUAMBO', 'NS', 35, 'SOFIA  VICENT', 929192968, '2024-09-24 13:29:37', '2024-09-24 13:29:37', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1634, 855910, '024568513BE056', 'Nascimento Calumbanjo Cassinda Seino', 942006975, '2007-09-13 00:00:00', 'Masculino', 'Solteiro', 'Colégio Soma Ndombe AND nº 51', 'Huambo', 'SN', 35, 'Soma Nalombe', 942006975, '2024-09-24 13:29:37', '2024-09-24 13:29:37', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1635, 959140, '3363', 'Raimundo Chitaca  Cawele', 928313652, '2004-08-25 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAA', 'HUAMBO', 'NS', 35, 'SUZANA', 55, '2024-09-24 13:33:08', '2024-09-24 13:33:08', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1636, 754822, '024023545HO054', 'Palmira Chicueca Cacuarta ', 923632239, '2006-09-29 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar da Chiva Huambo', 'Huambo', 'SN', 35, 'Matias Cacuarta ', 923632239, '2024-09-24 13:33:37', '2024-09-24 13:33:37', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1637, 885755, '021495762HO057', 'Paula Chipuco Pessela ', 948840552, '2007-08-23 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar da Chiva no Huambo', 'Huambo', 'SN', 35, 'Filipe Pessela', 948840552, '2024-09-24 13:36:55', '2024-09-24 13:36:55', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1638, 784270, '0000', 'Rosalina Nambangolo António', 921959867, '1997-10-17 00:00:00', 'Femenino', 'Casada', 'AAAAAAA', 'HUAMBO', 'NS', 35, 'FRANCISCO', 555, '2024-09-24 13:37:17', '2024-09-24 13:37:17', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1639, 628601, '009844503HO045', 'Pedro Cossengue  Cahango', 923903723, '2006-04-15 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Domingos Cahango', 923903723, '2024-09-24 13:40:18', '2024-09-24 13:40:18', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1640, 618317, '2222', 'Eularia Nambambi Chiteculo', 948834873, '2004-01-19 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAA', 'HUAMBO', 'NS', 35, 'GRACIANA', 927864444, '2024-09-24 13:41:40', '2024-09-24 13:41:40', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1641, 857514, '022222411HA055', 'Rosalina Lussati Quinta Vaz', 946562530, '2006-04-23 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar da Chiva Huambo', 'Huambo', 'SN', 35, 'Felix Vaz', 946562530, '2024-09-24 13:43:47', '2024-09-24 13:43:47', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1642, 656965, '0100533408BA045', 'Teresa Katchindjonjo Tchinguenji', 921964574, '2004-12-21 00:00:00', 'Femenino', 'Solteira', 'FFFFFFFF', 'HUAMBO, Bomba Baixa', 'NS', 35, 'MartaTeresa Tchinguenji', 927694989, '2024-09-24 13:45:34', '2024-12-10 11:44:32', 1, 5, '0', 'Benguela', '2019-02-26', 'Angolana', 'Benguela', 'Benguela', 'Benguela', 'Bernardo Augusto Tchinguenji', 'Amélia Tchocomessa Molossande', 'Ingles', 'Irmã'),
(1643, 236735, '009771232HO048', 'Rufina Antónia Catanha Sassimbo', 923258934, '2007-08-15 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Bula no Huambo', 'Huambo', 'SN', 35, 'António Sassimbo', 923258934, '2024-09-24 13:47:16', '2024-09-24 13:47:16', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1644, 957432, '2222', 'Mario Chimangata Ventura', 931375771, '2004-05-08 00:00:00', 'Masculino', 'Solteiro', 'LLLLLLLLLL', 'HUAMBO', 'NS ', 35, 'VICTORIA', 943277060, '2024-09-24 13:48:55', '2024-09-24 13:48:55', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1645, 318111, '00000000000', 'Tarcísia Cachipe Tomás Samucungo', 926624387, '2006-12-18 00:00:00', 'Femenino', 'Solteira', 'Colégio Dr. António Agostinho Neto', 'Huambo', 'SN', 35, 'Guilherme Samucunjo', 926624387, '2024-09-24 13:50:06', '2024-09-24 13:50:06', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1647, 490544, '00000000', 'Timótio Lucamba Sakahambo Kupangela', 927957559, '2007-10-04 00:00:00', 'Masculino', 'Solteiro', 'Colégio Escolar Fé Apostólica São José', 'Huambo', 'SN', 35, 'Vasco Nascimento', 927957559, '2024-09-24 13:54:15', '2024-09-24 13:54:15', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1648, 206966, '44444', 'Felicia Eyala Livulu', 923028475, '2004-09-08 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAA', 'HUAMBO', 'NS', 35, 'FAUSTINO ', 66, '2024-09-24 13:56:10', '2024-09-24 13:56:10', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1649, 358127, '00000000', 'Verónica Nachitota Cateta Chissaluquila', 0, '2007-03-18 00:00:00', 'Femenino', 'Solteira', '17 de Setembro Cuito-Bié', 'Huambo', 'SN', 35, 'Francisco Chissaluquila', 926910439, '2024-09-24 13:58:21', '2024-09-24 13:58:21', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1651, 188375, '6474/2015', 'Wilson Fernando Pedro Carlos ', 937974771, '2007-09-17 00:00:00', 'Masculino', 'Solteiro', 'Colégio Escolar Da Chiva', 'Huambo', 'SN', 35, 'Francisco Carlos', 937974771, '2024-09-24 14:01:49', '2024-09-24 14:01:49', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1652, 634507, '3333', 'Olimpia Kambiha Kakunha', 943980215, '1994-01-01 00:00:00', 'Femenino', 'Solteira', 'MMMMMM', 'HUAMBO', 'NS', 35, 'OLIMPIA', 555, '2024-09-24 14:03:12', '2024-09-24 14:03:12', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1653, 847166, '222', 'Ernesto Chimuco Ngunga', 933490780, '2003-03-03 00:00:00', 'Masculino', 'Solteiro', 'MMMMMMMM', 'HUAMBO', 'NS', 35, 'SAMUEL', 55, '2024-09-24 14:06:22', '2024-09-24 14:06:22', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1654, 405694, '5555', 'Francisca Cheiepia  Sapalo', 937941470, '2003-06-22 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'Huambo', 'NS', 35, 'ANGELINA', 5455, '2024-09-24 14:10:03', '2024-09-24 14:10:03', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1655, 371522, '555', 'Feliciana Jamba Chicola', 944495137, '1997-02-04 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'FELICIANO', 5, '2024-09-24 14:12:40', '2024-09-24 14:12:40', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1656, 193563, '6666', 'Henriqueta Nachova Carvalho', 935676281, '1992-06-20 00:00:00', 'Femenino', 'Solteira', 'DDDDDDD', 'HUAMBO', 'NS', 35, 'JOSÉ', 926865453, '2024-09-24 14:16:12', '2024-09-24 14:16:12', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1657, 607166, '222', 'Paulo Soito Kumboyo', 945691159, '2003-08-28 00:00:00', 'Masculino', 'Solteiro', 'HHHHHHHH', 'HUAMBO', 'NS', 35, 'CELESTINO', 94569, '2024-09-24 14:19:31', '2024-09-24 14:19:31', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1659, 823010, '1111111111', 'Florinda Jamba L. Tchissonde', 938950378, '2005-04-20 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Betânia', 'HUAMBO', 'NS', 36, 'Propria', 926521085, '2024-09-25 09:30:48', '2024-12-17 06:46:46', 1, 5, '0', 'ND', NULL, 'Angolana', 'Benguela', 'Benguela', 'Benguela', 'Feliciano Ngonga', 'Luzia Chilombo', 'Lingua  Englesa', 'Propria'),
(1660, 271407, '2222222222', 'Feliciana Ngueve F. Sambongue', 939230813, '2008-09-09 00:00:00', 'Femenino', 'Solteira', 'AAAAAAA', 'HUAMBO', 'NS', 36, 'JOSE', 930022386, '2024-09-25 11:18:32', '2024-09-25 11:18:32', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1661, 545015, '000000000', 'Laurinda Ngueve Evaristo Sehuma', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteira', 'N', 'Huambo ', 'SN', 35, '00000', 0, '2024-09-26 13:51:35', '2024-09-26 13:51:35', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1662, 727717, '0000000', 'Graciana Piedade Soares Alexandre', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteira', '00', 'Huambo', 'SN', 35, '00', 0, '2024-09-26 14:06:42', '2024-09-26 14:06:42', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1663, 948378, '000000000', 'Teodora Balombo Seiala', 0, '0022-01-01 00:00:00', 'Femenino', 'Solteira', 'S', 'Huambo', 'SN', 35, 'S', 0, '2024-09-26 14:28:54', '2024-09-26 14:28:54', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1664, 397909, '00000000', 'Luísa Chissoloci Sawimbo', 0, '0001-01-01 00:00:00', 'Femenino', 'Solteira', '00', 'Huambo', 'SN', 35, '000', 0, '2024-09-27 08:01:51', '2024-09-27 08:01:51', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1665, 883656, '111111111111', 'Ermelinda Nimba Njongo', 944454872, '2003-01-13 00:00:00', 'Femenino', 'Solteira', 'NNNNNN', 'HUAMBO', 'NS', 35, 'PEDRO', 944454872, '2024-09-27 09:13:41', '2024-09-27 09:13:41', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1666, 282072, '7777777', 'Teresa Filomena Ndumbo', 940790720, '2003-11-01 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 36, 'CORNELIO', 934748153, '2024-09-27 10:19:09', '2024-09-27 10:19:09', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1667, 384490, '44444444', 'Clementino Cassanga Sampaio', 923830115, '2001-12-13 00:00:00', 'Masculino', 'Solteiro', 'AAAAAAAAA', 'HUAMBO', 'NS', 36, 'ADELIA ', 85, '2024-09-27 11:01:22', '2024-09-27 11:01:22', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1668, 170574, '1111', ' Analtina  Aurora Chitacumula Jorge', 927336192, '2009-11-03 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 36, 'ALBERTINA ', 4444, '2024-09-27 12:52:03', '2024-12-04 07:54:06', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1669, 248168, '024116383HO057', 'Eugenio de Oliveira Feliciano', 940258602, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'SE', 'Huambo', 'SN', 36, 'JULIO FELICIANO', 925079428, '2024-09-30 13:54:28', '2024-09-30 13:54:28', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1670, 731024, '020304131BO050', 'Madalena Carlos Chitata', 946363174, '2007-03-30 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Mabuia', 'Huambo', 'SN', 36, 'Fernando Gombacassi', 946363174, '2024-10-01 07:53:16', '2024-10-01 07:53:16', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1671, 278340, '000000', 'Feliciana Mandele Sakawewe', 924495866, '2006-06-26 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Comparticipado AJM', 'Huambo', 'SN', 35, 'Conceição Jorge', 924495866, '2024-10-01 07:57:27', '2024-10-01 07:57:27', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1672, 153511, '366/2019', 'Helena Pedro Diulo', 924495866, '2009-09-24 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Comparticipado AJM', 'Huambo', 'SN', 35, 'Conceição Jorge', 924495866, '2024-10-01 08:02:13', '2024-10-01 08:02:13', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1673, 209030, '000000000', 'Vitorino Upili Chinguto', 929704621, '2006-06-03 00:00:00', 'Masculino', 'Solteiro', 'Colégio nº 5 Sambo', 'Huambo', 'SN', 35, 'Emiliano Bernardo', 929704621, '2024-10-01 08:05:11', '2024-10-01 08:05:11', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1674, 568263, '0000000', 'Angelina Jamba Eyala Kamenhe', 942458654, '2008-08-23 00:00:00', 'Femenino', 'Solteira', 'Colégio nº1288 Cambujei', 'Huambo', 'SN', 35, 'Paulino Fonseca', 942458654, '2024-10-01 08:13:00', '2024-10-01 08:13:00', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1675, 857132, '00000000', 'Fonseca Mbangu Neyala Kamenhe', 942458654, '2006-08-15 00:00:00', 'Masculino', 'Solteiro', 'colégio nº1288 Cambujei', 'Huambo', 'SN', 35, 'Paulino Fonseca', 942458654, '2024-10-01 08:25:46', '2024-10-01 08:25:46', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1676, 454596, '000000000', 'Adelia Kussinga Lourenço Figueredo', 941323352, '2007-09-07 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Jomaura', 'Huambo', 'SN', 35, 'Jertrudes ', 941323352, '2024-10-01 09:18:42', '2024-10-01 09:18:42', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1677, 344879, '024330323HO053', 'Mário Chissanga', 932886566, '2004-05-03 00:00:00', 'Masculino', 'Solteiro', 'Colegio Comandante Hoji Ya Henda', 'Huambo', 'SN', 35, 'Helena Florindo', 932886566, '2024-10-01 09:37:41', '2024-10-01 09:37:41', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1678, 825968, '007169600HO049', 'Augusto Paulino Laurentino', 922895194, '1997-11-25 00:00:00', 'Masculino', 'Solteiro', 'Colégio do Bom Pastor', 'Huambo', 'SN', 35, 'Felicia Justino', 930247257, '2024-10-01 09:41:07', '2024-10-01 09:41:07', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1679, 772321, '020160574HO055', 'Guilherme Fernando Viti', 930502628, '2006-12-17 00:00:00', 'Masculino', 'Solteiro', 'Colégio Comandante Hoje Ya Henda', 'Huambo', 'SN', 35, 'Odilia Wimbo', 930502628, '2024-10-01 09:45:56', '2024-10-01 09:45:56', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1680, 472750, '010073948HO048', 'Adriana Domingas Guvoca', 931397887, '2003-12-23 00:00:00', 'Femenino', 'Solteira', 'Ensino Secundário da Chiva no Huambo', 'Huambo ', 'SN', 35, 'Quelina Guvoca', 941756918, '2024-10-01 09:50:52', '2024-10-01 09:50:52', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1681, 263157, '022411924LS058', 'Ipanga Alberto Jeremias Luís', 938089997, '2004-03-23 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar nº 40 Pedro Manuel', 'Huambo', 'SN', 35, 'Maria Celeste', 938089997, '2024-10-01 09:55:20', '2024-10-01 09:55:20', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1682, 769928, '022336686HO057', 'Afonso Domingos  Cassinda', 924622738, '2007-12-25 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Fé Apostólica do São José', 'Huambo', 'SN', 35, 'Abel Cassinda', 924622738, '2024-10-01 10:15:05', '2024-10-01 10:15:05', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1683, 471591, '00000000', 'Antónia Constantina Sanjambela', 924483215, '2006-11-22 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Missionário São Tarcísio ', 'Huambo', 'SN', 35, 'Antónia Gomes', 924483215, '2024-10-01 10:20:24', '2024-10-01 10:20:24', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1684, 832679, '00000000', 'Cecília Chilombo Bulu', 945465203, '2009-02-17 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Missionária São Tarcísio', 'Huambo', 'SN', 35, 'Sofia Candolo', 945465203, '2024-10-01 10:24:00', '2024-10-01 10:24:00', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1685, 645705, '0000000000', 'Albertina Vihemba Silvano', 935373242, '2010-03-18 00:00:00', 'Femenino', 'Solteira', 'Colégio Hoje Ya Henda', 'Huambo', 'SN', 36, 'Silva Silvana', 935373242, '2024-10-01 10:37:22', '2024-10-01 10:37:22', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1687, 829798, '020044375HO050', 'Cristina Nangombe Ngola', 936325206, '2004-11-28 00:00:00', 'Femenino', 'Solteira', 'Colégio Hoje Ya Henda', 'Huambo', 'SN', 36, 'Cristina Joaquim', 926075601, '2024-10-01 11:00:02', '2024-10-01 11:00:02', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1688, 540716, '444444444', 'Elias Machado Augusto', 945763021, '2006-11-01 00:00:00', 'Masculino', 'Solteiro', 'AAAA', 'HUAMBO', 'NS', 36, 'EDUARDO', 936487491, '2024-10-01 11:13:18', '2024-10-01 11:13:18', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1689, 505657, '44444444', 'Luisa Tchimuma Victórino', 932933932, '2005-11-22 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAA', 'HUAMBO', 'NS', 35, 'ARMANDO', 932217554, '2024-10-01 11:17:25', '2024-10-17 07:33:50', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1690, 654986, '020010478HO055', 'Severino Chivela Sanungulu Cinco Reis', 942528828, '2005-10-29 00:00:00', 'Masculino', 'Solteiro', 'SE', 'Huambo', 'SN', 36, 'Lourenço Cinco Reis', 942528828, '2024-10-01 11:21:03', '2024-10-01 11:21:03', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1691, 277200, '4444444444', 'Zacarias Sachilombo Nunda', 937531854, '2008-08-26 00:00:00', 'Masculino', 'Solteiro', 'AAAA', 'HUAMBO', 'NS', 36, 'CASTRO', 8, '2024-10-01 11:23:38', '2025-03-26 07:43:48', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1692, 538375, '55555', 'Maria Rosa Sitongua', 940392596, '2024-03-18 00:00:00', 'Femenino', 'Solteira', 'AAAAAAAAAA', 'HUAMBO', 'NS', 35, 'MARTINHA', 4, '2024-10-01 11:26:35', '2024-10-01 11:26:35', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1693, 661706, '0000000', 'Auxilio Calala', 933726554, '2010-05-03 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Calilongue da Cuca', 'Huambo', 'SN', 36, 'Avelino Calala', 933726554, '2024-10-02 07:19:24', '2024-10-02 07:19:24', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1694, 123974, '02394447HO054', 'Amelia Agostinho Filipe', 932675907, '2007-05-10 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Rei Livongue', 'HUAMBO', 'NS', 36, 'Serafim', 932675907, '2024-10-03 10:35:47', '2025-03-10 09:19:56', 1, 5, '0', 'Huambo', NULL, 'Angolana', 'Huambo', NULL, '', 'Filipe Agostinho', 'Evalina Catanha Calei', 'Língua Inglesa', NULL),
(1695, 352091, '0000000', 'Victória Njala Sangueve', 931414041, '2004-08-17 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'Leontina Cahenjengo', 931414041, '2024-10-03 12:58:33', '2025-03-24 12:05:03', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1696, 900985, '024427890HO058', 'Marlene Kiala Ulica Miguel', 946358824, '2008-09-14 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 36, 'Eusébio Njila', 946358824, '2024-10-03 13:02:26', '2024-10-03 13:02:26', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1697, 887646, '024426393HO052', 'José Fernando Ulica Miguel', 948968735, '2007-12-25 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 36, 'Serafin Sandongo', 948968735, '2024-10-03 13:07:39', '2024-10-03 13:07:39', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1698, 562120, '024286469HO053', 'Ermelinda Melvir Mbule Canguende', 944323085, '2004-12-22 00:00:00', 'Femenino', 'Solteira', 'Colégio Ndunduma I do Cachiungo', 'Huambo', 'SN', 36, 'Teodoro Mbule', 944323085, '2024-10-03 13:11:03', '2024-10-03 13:11:03', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1699, 760696, '40/2015', 'João Baptista Ucuacusseca Mota', 924973245, '2007-10-10 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Fé Apostólica ', 'Huambo', 'SN', 35, 'Augusta Ucuacusseca', 924973245, '2024-10-03 13:59:55', '2024-10-03 13:59:55', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1700, 346271, '000000000', 'Evandra Vidal', 9999999, '0001-01-01 00:00:00', 'Femenino', 'Solteira', '5456', '58745', '5466', 36, '545', 65496, '2024-10-04 10:44:17', '2024-10-04 10:44:17', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1701, 439503, '0100000000', 'Maria da Conceição Ucuessunga Muatchilunda', 930507150, '2008-10-25 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Bula', 'Huambo-Bomba Alta', 'SN', 36, 'Maria da Conceição Fernando', 930507150, '2024-10-07 12:19:58', '2024-10-07 12:19:58', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1702, 450426, '022087598HO059', 'Eliseu Cachambalele Cassoma', 926029050, '2008-05-06 00:00:00', 'Masculino', 'Solteiro', 'Fé Apostólica', 'Huambo', 'SN', 35, 'Felisberto Cassoma', 934752839, '2024-10-08 10:21:36', '2024-10-08 10:21:36', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1703, 390470, '009119517HO044', 'Rufina Nanjila Manuel', 921283162, '2003-07-16 00:00:00', 'Femenino', 'Solteira', 'SE', 'Huambo', 'SN', 36, 'Antunes Manuel', 927095711, '2024-10-08 10:24:33', '2024-10-08 10:24:33', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1704, 606921, '00000', 'José Heta Samuechalo', 924701995, '2006-10-29 00:00:00', 'Masculino', 'Solteiro', 'Fé Apostólica', 'Huambo', 'SN', 35, 'Mateus Samuechalo', 924701995, '2024-10-08 10:31:22', '2024-10-08 10:31:22', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1705, 761519, '020170589HO057', 'Rosa Evalina Vissesse Dala Cola', 943113313, '2009-06-06 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar São Tarcísio', 'Huambo', 'SN', 36, 'Dina Vissesse', 943113313, '2024-10-08 10:37:15', '2024-10-08 10:37:15', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1706, 901025, '0000000', 'Cristina Ngueve David', 921180479, '2005-09-27 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar SOS', 'Huambo', 'SN', 35, 'David Belchior', 923878732, '2024-10-08 10:46:48', '2024-10-08 10:46:48', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1707, 212295, '024151008HO057', 'Floriana Tande Cangola Camosso', 938554170, '2007-11-05 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo', 'SN', 35, 'António Camosso', 932902744, '2024-10-08 11:08:25', '2024-10-08 11:08:25', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1708, 400787, '025138734HO055', 'Esperança Maravilha Chitunda Keny', 928605906, '2007-06-28 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar nº 14 Teresiano', 'Huambo', 'SN', 35, 'Antunes Keny', 928605906, '2024-10-08 11:24:09', '2024-10-08 11:24:09', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1709, 780412, '0000000', 'Laura Viqueia Chilombo Chissende', 938661189, '2007-07-27 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar da Chiva', 'Huambo', 'SN', 36, 'Adalberto Chissende', 938661189, '2024-10-08 11:41:49', '2024-10-08 11:41:49', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1710, 499525, '025678535BE050', 'Rosa Cambovo Henda José', 939284589, '2008-01-15 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Cmdte', 'Huambo', 'SN', 36, 'Raimundo José', 926510919, '2024-10-08 11:46:25', '2024-10-08 11:46:25', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1711, 754013, '026024557LA056', 'Benjamim Fonseca Fonseca Ndala', 930500612, '2007-02-16 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar nº 5138 Cassaca II', 'Huambo', 'SN', 36, 'Alcides Fonseca', 930500612, '2024-10-08 11:49:53', '2024-10-08 11:49:53', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1712, 227024, '0000000', 'Ezela Mussole Catongo Satende', 945888080, '2005-12-10 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Comparticipado', 'Huambo', 'SN', 36, 'Anastácio Satende', 945888080, '2024-10-08 11:57:59', '2024-10-08 11:57:59', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1713, 427962, '000000', 'Mariana Estefania Júlio Mbemba', 926127051, '2006-08-12 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos da Silva', 'Huambo - Santa Iria', 'SN', 36, 'Floriana dos Santos', 926127051, '2024-10-08 12:05:10', '2025-03-20 09:08:16', 1, 6, '0', '', NULL, 'Angolana', 'Lubango', 'Huíla', 'Huambo', 'Timóteo Mbema', 'Dionisia Joaquina ', 'L. Inglesa', 'Tia'),
(1714, 117304, '022155927HO059', 'Samuel Chissingui Mussungo', 937964286, '2006-05-26 00:00:00', 'Masculino', 'Solteiro', 'Colégio Maria da Silva Neto Cachiiungo', 'Huambo-Bomba Baixa', 'SN', 36, 'Herculano Mussungo', 932226725, '2024-10-09 13:56:54', '2024-10-09 13:56:54', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1715, 566338, '010046801HO047', 'Joaquim Chianica Satula', 924166395, '2008-06-29 00:00:00', 'Masculino', 'Solteiro', 'Colégio da Brigada Canina', 'Cambiote', 'Nenhuma', 35, 'Ricardo Satula', 933780591, '2024-10-14 09:38:26', '2024-10-14 09:38:26', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1716, 284813, '222222222', 'Benedita Tchanjupamo Ferramenta Sakupihã', 923811248, '0002-02-01 00:00:00', 'Femenino', 'Solteira', 'YYYYYYYYY', 'HUAMBO', 'NS', 36, 'MMM', 923811248, '2024-10-14 11:13:22', '2024-10-14 11:13:22', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1718, 943187, '0000000000', 'Claudina da Glória Agustinho Sapalo', 922359486, '2006-08-08 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar SOS', 'Huambo-Bomba Baixa', 'SN', 36, 'Glória Agostinho', 922359486, '2024-10-14 14:49:19', '2024-10-14 14:49:19', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1719, 870790, '00000', 'Doliana  Essenje dos Santos', 942977367, '2001-01-01 00:00:00', 'Femenino', 'Solteira', 'Colégio Escolar JGM', 'Huambo-Kilombo', 'SN', 36, 'Xavier dos Santos', 942977367, '2024-10-16 08:19:10', '2025-03-10 11:34:51', 1, 6, '0', 'Huambo', NULL, 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Xavier Sacumba Manuel dos Santos', 'Feliciana Nahumba Samuetchalo', 'Língua Inglesa', 'Pai'),
(1720, 391166, '007933102BE045', 'Rosalina Cassova  Lussinga Muonguende Canjamba ', 943190296, '1996-09-13 00:00:00', 'Femenino', 'Casada', 'Colégio Capaca', 'Huambo-Kilombo', 'SN', 36, 'Estevão Cassesse Canjamba', 942819666, '2024-10-18 08:28:39', '2024-10-18 08:28:39', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1721, 268860, '00000000000', 'Ana Canjala Tchindjengue', 930166636, '2007-05-27 00:00:00', 'Femenino', 'Solteira', 'Escola 22 de Novembro', 'Huambo-São José', 'SN', 35, 'Leonildo José Chindjengue', 945186709, '2024-10-22 07:11:26', '2024-10-22 07:11:26', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1722, 286722, '000000000', 'Adriano Cambundo Calopes', 924126079, '2002-08-21 00:00:00', 'Masculino', 'Solteiro', 'SE', 'Huambo-Kilombo', 'SN', 35, 'Emília de Lourdes Pindali', 940531171, '2024-10-22 14:24:52', '2024-10-22 14:24:52', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1723, 764688, '0000000000', 'Costa Muhanenu Manuel', 941548370, '2006-11-03 00:00:00', 'Masculino', 'Solteiro', 'Escola AAILG', 'Huambo', 'SN', 35, 'Evaristo Manuel', 932880846, '2024-10-24 12:58:27', '2024-10-24 12:58:27', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1724, 501598, '22222222222', 'Victorino Pedro Calueio', 939206381, '2007-07-05 00:00:00', 'Masculino', 'Solteiro', 'llllllll', 'Huambo', 'NS', 36, 'ROSARIA', 939206381, '2024-10-29 09:24:19', '2024-10-29 09:24:19', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1726, 138343, '000000000', 'Larissa Marinela Francisco Domingos', 931414041, '0001-01-01 00:00:00', 'Femenino', 'Solteira', 'SE', 'Huambo-São José', 'SN', 35, 'José Matias Domingos ', 931414041, '2024-11-05 09:43:29', '2024-11-05 09:43:29', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1728, 844392, '024816845HO058', 'Samuel Milton Hossi Capalo', 925097466, '2008-10-12 00:00:00', 'Masculino', 'Solteiro', 'Colégio do Bom Pastor', 'Huambo', 'Nada Consta', 36, 'António Nené Capalo', 925097466, '2024-11-08 07:20:42', '2024-11-08 07:20:42', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1729, 461803, '0000000000000', 'Helena Namassoji Pedro Salvador', 931596207, '2006-09-06 00:00:00', 'Femenino', 'Solteira', 'Colégio AJM', 'Huambo-São José Canjaia', 'SN', 35, 'Zacarias Salvador', 925055755, '2024-11-08 07:33:00', '2024-11-08 07:33:00', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1730, 920176, '022569456HO054', 'Beatriz Nambongue Guevela  Luvelo', 936976281, '2009-07-24 00:00:00', 'Femenino', 'Solteira', 'Complexo Missionário São Tarciso', 'Huambo', 'N/C', 36, 'Arlete Celina Nhany', 0, '2024-11-08 12:34:44', '2024-11-08 12:34:44', 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1731, 237475, '00000000', 'Emília Alexandrina Chalule', 941599654, '2004-06-24 00:00:00', 'Femenino', 'Solteira', 'SE', 'Huambo-Bomba Baixa', 'SN', 36, 'Luzia Valentino', 941599654, '2024-11-08 14:26:55', '2024-11-08 14:26:55', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1732, 641988, '000000000', 'Victorino Upili Chinguto Sapalo', 921439765, '2006-06-02 00:00:00', 'Masculino', 'Solteiro', 'Escola nº 5 do Sambo', 'Huambo-São José Canjaia', 'SN', 35, 'Emiliano Chicola', 921439765, '2024-11-08 15:07:47', '2024-11-08 15:07:47', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1733, 265743, '009246581LN041', 'Adelina Cuaiela Mbalama', 938962898, '2003-07-19 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Domingos Vaz', 'Huambo-Cambiote', 'SN', 35, 'Maurício Mbalama Gabriel ', 943529491, '2024-11-12 07:10:25', '2025-03-17 07:57:21', 1, 6, '0', 'Lunda Norte', '2023-05-09', 'Angolana', 'Iongo', 'Xa-muteba', 'Lunda Norte', 'Maurício  Mbalama Gabriel', 'Ilda Sónia Avelino', 'L. Inglesa', 'Pai'),
(1734, 897148, '009676239BE049', 'Oseias Soares Fatima ', 938722620, '1996-03-05 00:00:00', 'Masculino', 'Solteiro', 'cccccc', 'Huambro', 'NS', 35, 'DOMINGOS', 943736517, '2024-11-15 12:33:40', '2024-11-15 12:33:40', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1735, 212339, '020301419HO051', 'Joaquim Nganga Satuala ', 938722620, '1999-12-22 00:00:00', 'Masculino', 'Solteiro', 'ccc', 'HUAMBO', 'NS', 35, 'DOMINGOS', 943736517, '2024-11-15 12:39:15', '2024-11-15 12:39:15', 1, 5, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1736, 755168, '0000000000000', 'Alcina Cassova Jessé Chicola', 926017011, '2009-08-24 00:00:00', 'Femenino', 'Solteira', 'Paiva Domingos da Silva', 'Huambo-São José Kilombo', 'SN', 36, 'Hilário Adriano Chicola', 926017011, '2024-11-18 07:44:55', '2024-11-18 07:44:55', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1737, 606096, '00000000', 'Estevão Malheiro Capiñgala Ngongolo', 927666032, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'Colégio AJ', 'Huambo-Bomba Baixa', 'SN', 36, 'Frederico Kanguaya Malheiro', 927666032, '2024-11-18 14:36:42', '2024-11-18 14:36:42', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1738, 538683, '0000000', 'Maria Jaquiline Daniel', 945038606, '0001-01-01 00:00:00', 'Femenino', 'Solteira', 'IMA', 'Huambo', 'SN', 36, 'Florinda Chemba Chassocale', 923954746, '2024-11-18 15:00:10', '2024-11-18 15:00:10', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1739, 986935, '000000000', 'Custódio Leonardo Felisberto Chilala', 924733916, '2007-04-20 00:00:00', 'Masculino', 'Solteiro', 'São Tarcisio', 'Huambo', 'SN', 35, 'Zeferino Lussath', 924733916, '2024-11-19 10:20:17', '2024-11-19 10:20:17', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1740, 908110, '000000000', 'Daniel de Nactividade Mandavela', 926521085, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'SE', 'Huambo', 'SN', 35, 'Rubém Mandavela', 926521085, '2024-11-21 11:00:33', '2024-11-21 11:00:33', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1741, 809363, '000000000000', 'Adelia Lussenje Lourenço Figueredo', 941323352, '0001-01-01 00:00:00', 'Femenino', 'Solteira', 'SE', 'Huambo', 'SN', 35, 'Gertrudes Mariquita', 941323352, '2024-11-25 07:41:43', '2024-11-25 07:41:43', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1742, 338116, '00000000', 'Daniel Munjanga Guineque', 929139992, '0001-01-01 00:00:00', 'Masculino', 'Solteiro', 'SE', 'Huambo', 'SN', 35, 'Paulo Guineque', 929139992, '2024-11-27 13:00:11', '2024-11-27 13:00:11', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1743, 459624, '023096958HO051', 'Bibiana Chombela Capuca Ndengue', 923237401, '2009-01-19 00:00:00', 'Femenino', 'Solteira', 'Paiva Domingos da silva', 'Huambo', 'SN', 36, 'José Domingos Ndengue', 923237401, '2024-12-02 09:09:55', '2024-12-02 09:09:55', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1744, 409788, '000000000', 'António Adriano Ndongua Mário', 943733538, '2008-11-02 00:00:00', 'Masculino', 'Solteiro', 'SE', 'Huambo', 'SN', 36, 'Francisco Paulo Mário', 943733538, '2024-12-02 13:47:30', '2024-12-02 13:47:30', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1745, 985656, '02557787740059', 'Penina da Graça Ramos Canhanga', 930759445, '2006-09-29 00:00:00', 'Femenino', 'Solteira', 'Fé Apostólica', 'Huambo', 'SN', 36, 'José Miguel', 930759445, '2024-12-03 11:46:02', '2024-12-03 11:46:02', 1, 6, '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(1746, 927287, '687/2024', 'Gervásia Luísa Abias Guilherme', 0, '2009-09-27 00:00:00', 'Femenino', 'Solteira', 'Complexo Escolar Paiva Domingos Da Silva', 'Huambo, Bom Pastor', 'Nenhuma', 36, 'Gervásio Lussati Guilherme', 924886161, '2024-12-06 16:05:59', '2024-12-06 16:07:03', 0, 1, '00', 'Huambo', '2024-05-24', 'Angolana ', 'Huambp', 'Huambo', 'Huambo', 'Gervásio Lussati Guilherme', 'Juliana Ngueve Abias', 'Português', 'Pai'),
(1747, 543359, '0204065614Ao52', 'Albertina Maria Matulu Bali', 939616969, '2003-03-06 00:00:00', 'Femenino', 'Solteira', 'ND', 'HUAMBO', 'NS', 35, 'MOISES BALI', 933316724, '2024-12-09 10:10:13', '2024-12-09 10:10:13', 0, 1, '918', 'HUILA ', '2019-12-19', 'ANGOLANA', 'LUBANGO', 'HUILA', 'LUBANGO', 'MOISES', 'LEITE', 'PORTUGUES', 'PAI'),
(1748, 510057, '020263693HO59', 'Lauriana Tchilongole Pinto', 0, '2003-07-09 00:00:00', 'Femenino', 'Solteira', 'Colégio Público Nº2 Graciano Mande-Ucuma', 'Huambo, Bomba Baixa', 'Nenhuma', 0, 'Benita Ngueve Tchilongole', 99999999, '2024-12-10 10:16:14', '2024-12-10 10:16:14', 0, 1, '000', 'Huambo', '2019-11-05', 'Angolana', 'Ucuma', 'Ucuma', 'Huambo', 'Joaquim Carlos Pinto', 'Benita Ngueve Tchilongole', 'Ingles', 'Mãe'),
(1749, 908054, '020263693HO059', 'Lauriana Tchilongole Pinto', 947607379, '2003-07-09 00:00:00', 'Femenino', 'Solteira', 'NN', 'Huambo, Bomba Baixa', 'Nenhuma', 35, 'Benedita Ngueve Tchilongole', 2147483647, '2024-12-10 11:19:26', '2024-12-10 11:20:19', 0, 1, '0000', 'Huambo', '2019-11-05', 'Angolana', 'Ucuma', 'Ucuma', 'Huambo', 'Joaquim Carlos Pinto', 'Benita Ngueve Tchilongole', 'Inglesa', 'Pai'),
(1750, 257120, '018022210', 'Feliciana Tcheiepia Maquina', 923262322, '2007-05-27 00:00:00', 'Femenino', 'Solteira', 'MCCapaca', 'Bomba Alta', 'nada Consta', 35, 'Cristina Chinjumbila Miranda', 923830759, '2024-12-13 14:44:40', '2024-12-13 14:44:40', 0, 1, '000000000', 'HBo', '2023-06-14', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Afonso Dumba Maquina', 'Cristina Chinjumbila Maquina', 'Inglês', 'Mãe'),
(1751, 531711, '010057003HO044', 'Ana Maria Bongo Soáres', 931595652, '2008-10-10 00:00:00', 'Femenino', 'Solteira', 'Colégio Comandante Bula', 'Huambo São João', 'Nenhuma', 36, 'Ilda Guida Soáres', 931595652, '2024-12-18 12:26:40', '2024-12-18 12:26:40', 0, 1, '309', 'Huambo', '2019-02-27', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Daniel Virgilio Soáres', 'Ilda Guida Bimbi Soáres', 'Português', 'Mãe'),
(1752, 398270, '21921921', 'Mateus Chimanjata Dos Santos', 944012068, '2006-06-09 00:00:00', 'Masculino', 'Solteiro', 'Dr. Agostinho Neto', 'Huambo, São José', 'Nenhuma', 35, 'Florinda Jamba', 944012068, '2025-01-16 13:16:50', '2025-01-16 13:16:50', 0, 1, '00123', 'Huambo', '2018-06-09', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'António Dos Santos', 'Florinda Jamba', 'Inglês', 'Mãe'),
(1753, 318736, '009', 'João Cardoso Miranda Silvano', 931244377, '2008-01-09 00:00:00', 'Masculino', 'Solteiro', 'Complexo Escolar Nº 1 Augusto Ngangula', 'Huambo, Bomba Alta', 'Nenhuma', 35, 'Francisca Vissoca Miranda', 931244377, '2025-01-24 15:38:29', '2025-01-24 15:38:29', 0, 1, '095', 'Huambo', '2009-08-09', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Romeu Silvano', 'Francisca Vissoca Miranda', 'Português', 'Mãe'),
(1754, 700343, '020321260HO056', 'Madalena Navelo Katongo', 928343688, '2007-02-16 00:00:00', 'Femenino', 'Solteira', 'Escola Emanuel Resplandecente do Huambo', 'Huambo-Bomba', 'Nenhuma', 35, 'Armando Elias Katongo', 974782351, '2025-02-18 07:31:11', '2025-02-18 07:31:11', 0, 1, '1236', 'Huambo', '2019-11-25', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Armando Elias Katongo', 'Laurinda Cawoli Canhongo', 'Ingles', 'Pai'),
(1756, 545789, '020370510HO056', 'Paulino César Chissingui', 938981296, '2006-04-11 00:00:00', 'Masculino', 'Solteiro', 'Emanuel Resplandecente - Huambo', 'Huambo-Bomba Alta', 'Nenhuma', 35, 'António Chissingui', 938981296, '2025-02-19 10:13:24', '2025-02-19 10:13:24', 0, 1, '1214', 'Huambo', '2024-12-04', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'António Chissingui', 'Ivone Cassova Quintino', 'Inglês', 'Pai'),
(1757, 255382, 'SN', 'Moises Capiñgala Ussombo', 973486821, '2005-11-13 00:00:00', 'Masculino', 'Solteiro', 'ND', 'ND', 'ND', 35, 'ND', 0, '2025-02-19 15:26:28', '2025-02-19 15:26:28', 0, 1, '0005', 'SN', '2025-02-21', 'Angolana', 'Cuanza-Sul', 'Sumbe', 'Cuanza-Sul', 'ND', 'ND', 'ND', 'ND'),
(1758, 235975, '024976537HA055', 'Maria Imaculada Cacusso Lourenço', 933602983, '2006-06-27 00:00:00', 'Femenino', 'Solteira', 'Caminhos do Futuro', 'Huambo', 'Nenhuma', 35, 'Valentim Lourenço', 929402380, '2025-02-28 08:26:48', '2025-02-28 08:26:48', 0, 1, '1245', 'Huambo', '2023-06-14', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Abilio C. Lourenço', 'Maravilha T. Cacusso', 'Inglês', 'Avô'),
(1759, 549255, '124568545285', 'Maria Catihe Butão Victor', 928536496, '2006-11-21 00:00:00', 'Femenino', 'Solteira', 'Escola 22 de Novembro', 'Bomba Alta', 'Nenhuma', 35, 'José Victor', 945867056, '2025-03-10 11:01:38', '2025-03-10 11:01:38', 0, 1, '4554', 'Bié', '2021-04-05', 'Angolana', 'Bié', 'Chinguar', 'Bié', 'José Victor', 'Sofia Butão', 'Inglês', 'Pai'),
(1760, 247359, '022986397HO052', 'Rosalina Rita Chico', 931370996, '2000-05-07 00:00:00', 'Femenino', 'Solteira', 'Escola do Ensino Especial', 'Bairro do São João', 'Nenhuma', 36, 'Manuel Essuvi Chico', 923228551, '2025-03-10 14:44:59', '2025-03-10 14:44:59', 0, 1, '12457', 'Huambo', '2022-01-05', 'Angolana', 'Huambo', 'Huambo', 'Huambo', 'Manuel Essuvi Chico', 'Gertrudes Sandalawa', 'Inglês', 'Pai');

-- --------------------------------------------------------

--
-- Estrutura da tabela `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `licenseKey` varchar(255) NOT NULL,
  `expirationDate` datetime NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `licenses`
--

INSERT INTO `licenses` (`id`, `licenseKey`, `expirationDate`, `code`) VALUES
(1, 'LICENSE-1726044063008-nvmq1gzu99', '2025-09-11 08:41:03', 'laidy');

-- --------------------------------------------------------

--
-- Estrutura da tabela `matriculas`
--

CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL,
  `ano_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL,
  `estudante_id` int(11) NOT NULL,
  `periodo_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `estado` enum('Estudando','Cancelada','Transita','Não Transita','Recurso') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `matriculas`
--

INSERT INTO `matriculas` (`id`, `ano_id`, `curso_id`, `sala_id`, `estudante_id`, `periodo_id`, `classe_id`, `user_id`, `estado`, `createdAt`, `updatedAt`) VALUES
(1, 10, 35, 17, 226, 1, 136, 1, 'Estudando', '2025-10-31 06:12:15', '2025-10-31 06:12:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `title`, `text`, `createdAt`, `updatedAt`) VALUES
(1, 'Novo início de sessão', 'O utilizador José Domingos António, iniciou sessão no SGI', '2025-10-31 04:10:51', '2025-10-31 04:10:51'),
(2, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 3 estudantes.', '2025-10-31 04:57:24', '2025-10-31 04:57:24'),
(3, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 4 estudantes.', '2025-10-31 05:01:41', '2025-10-31 05:01:41'),
(4, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 3 estudantes.', '2025-10-31 05:04:26', '2025-10-31 05:04:26'),
(5, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 2 estudantes.', '2025-10-31 05:05:51', '2025-10-31 05:05:51'),
(6, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 2 estudantes.', '2025-10-31 05:09:07', '2025-10-31 05:09:07'),
(7, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 2 estudantes.', '2025-10-31 05:12:19', '2025-10-31 05:12:19'),
(8, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 3 estudantes.', '2025-10-31 05:20:49', '2025-10-31 05:20:49'),
(9, 'Matrículas em Lote', 'O utilizador José Domingos António matriculou 1 estudantes.', '2025-10-31 06:12:15', '2025-10-31 06:12:15'),
(10, 'Pagamento Efectuado', 'O utilizador José Domingos António, Efectuou um pagamento', '2025-10-31 06:17:55', '2025-10-31 06:17:55'),
(11, 'Pagamento Efectuado', 'O utilizador José Domingos António, Efectuou um pagamento', '2025-10-31 06:25:07', '2025-10-31 06:25:07'),
(12, 'Pagamento Efectuado', 'O utilizador José Domingos António, Efectuou um pagamento', '2025-10-31 06:28:25', '2025-10-31 06:28:25'),
(13, 'Novo início de sessão', 'O utilizador José Domingos António, iniciou sessão no SGI', '2025-10-31 09:20:01', '2025-10-31 09:20:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL,
  `ano_id` int(11) NOT NULL,
  `estudante_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `ano_id`, `estudante_id`, `user_id`, `createdAt`, `updatedAt`) VALUES
(1, 10, 226, 1, '2025-10-31 06:17:55', '2025-10-31 06:17:55'),
(2, 10, 226, 1, '2025-10-31 06:25:07', '2025-10-31 06:25:07'),
(3, 10, 226, 1, '2025-10-31 06:28:24', '2025-10-31 06:28:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos_itens`
--

CREATE TABLE `pagamentos_itens` (
  `id` int(11) NOT NULL,
  `metodo_pagamento` enum('Depósito','TPA','Transferência Bancária','Internet Banking') NOT NULL,
  `pagamento_id` int(11) NOT NULL,
  `emolumento_id` int(11) NOT NULL,
  `preco_id` int(11) NOT NULL,
  `desconto` double NOT NULL,
  `multa` double NOT NULL,
  `ano_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pagamentos_itens`
--

INSERT INTO `pagamentos_itens` (`id`, `metodo_pagamento`, `pagamento_id`, `emolumento_id`, `preco_id`, `desconto`, `multa`, `ano_id`) VALUES
(1, 'TPA', 1, 1, 122, 0, 0, 10),
(2, 'TPA', 2, 1, 122, 0, 0, 10),
(3, 'TPA', 3, 1, 122, 0, 0, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodos`
--

CREATE TABLE `periodos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `periodos`
--

INSERT INTO `periodos` (`id`, `nome`, `status`) VALUES
(1, 'Manhã', 1),
(2, 'Tarde', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `salas`
--

CREATE TABLE `salas` (
  `id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `periodo_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `numero_sala` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `salas`
--

INSERT INTO `salas` (`id`, `curso_id`, `classe_id`, `periodo_id`, `nome`, `numero_sala`, `status`) VALUES
(17, 35, 136, 1, '10E.1', 0, 1),
(18, 35, 137, 1, '11E.1', 0, 1),
(19, 35, 136, 1, '10E.2', 0, 1),
(20, 35, 136, 2, '10E.3', 0, 1),
(21, 35, 136, 2, '10E.4', 0, 1),
(22, 35, 136, 1, '10E.3', 0, 1),
(23, 35, 136, 1, '10E.0', 0, 1),
(24, 35, 136, 1, '10.1', 0, 1),
(25, 35, 136, 1, '10.2', 0, 1),
(26, 35, 136, 1, '10.3', 0, 1),
(27, 36, 136, 1, '10A.1', 0, 1),
(30, 36, 138, 2, '12A.1', 0, 1),
(31, 36, 137, 1, '11A.1', 0, 1),
(32, 36, 137, 2, '11A.2', 0, 1),
(33, 36, 136, 2, '10A.2', 0, 1),
(34, 35, 139, 2, '13E.1', 0, 1),
(35, 35, 137, 1, '11E.2', 0, 1),
(36, 35, 138, 2, '12E.1', 0, 1),
(37, 35, 138, 2, '12E.2', 0, 1),
(38, 35, 138, 2, '12E.3', 0, 1),
(39, 35, 138, 2, '12E.4', 0, 1),
(40, 35, 137, 2, '11E.4', 0, 1),
(41, 35, 137, 2, '11E.5', 0, 1),
(42, 35, 137, 1, '11E.3', 0, 1),
(43, 35, 139, 2, '13E.2', 0, 1),
(44, 35, 139, 2, '13E.3', 0, 1),
(45, 35, 136, 1, '10.E.1', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'avatar.svg',
  `nome` varchar(255) NOT NULL,
  `telefone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nivel` enum('IT','Administrador','Secretaria','Tesouraria','Professor','D.Pedagógico','D.Geral','PCA') NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `foto`, `nome`, `telefone`, `email`, `nivel`, `senha`, `status`, `updatedAt`) VALUES
(1, 'avatar.svg', 'José Domingos António', 926521085, 'ajosedomingos231@gmail.com', 'IT', 'angola', 1, '2025-10-31 09:20:01'),
(4, 'avatar.svg', 'Rubem Mandavela Chingui', 926521085, 'rubemmandavela@gmail.com', 'Administrador', '1980', 0, '2025-03-26 08:13:25'),
(5, 'avatar.svg', 'Neusa Quelina Castro', 943371389, 'castroneusacastro@gmail.com', 'Tesouraria', 'deusfejo', 0, '2025-03-24 11:29:13'),
(6, 'avatar.svg', 'Zeferino Stélvio Celestino', 945467406, 'celestinostelvio8@gmail.com', 'Tesouraria', '1294s', 1, '2025-03-26 08:13:39'),
(8, 'avatar.svg', 'Rodrigues Sousa Da Silva', 947013572, '94701357a@gmail.com', 'Secretaria', '947013572', 1, '2025-03-26 09:31:31'),
(9, 'avatar.svg', 'Benedito Castro', 923531714, '923531714@gmail.com', 'Administrador', '923531714', 1, '2025-03-24 17:05:12');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `anos`
--
ALTER TABLE `anos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `emolumentos`
--
ALTER TABLE `emolumentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `natureza_id` (`natureza_id`);

--
-- Índices para tabela `emolumentos_natureza`
--
ALTER TABLE `emolumentos_natureza`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `emolumento_precos`
--
ALTER TABLE `emolumento_precos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ano_id` (`ano_id`),
  ADD KEY `curso_id` (`curso_id`),
  ADD KEY `classe_id` (`classe_id`),
  ADD KEY `emolumento_natureza_id` (`emolumento_natureza_id`),
  ADD KEY `emolumento_id` (`emolumento_id`);

--
-- Índices para tabela `estudantes`
--
ALTER TABLE `estudantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Índices para tabela `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `licenseKey` (`licenseKey`),
  ADD UNIQUE KEY `licenseKey_2` (`licenseKey`);

--
-- Índices para tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ano_id` (`ano_id`),
  ADD KEY `curso_id` (`curso_id`),
  ADD KEY `sala_id` (`sala_id`),
  ADD KEY `estudante_id` (`estudante_id`),
  ADD KEY `periodo_id` (`periodo_id`),
  ADD KEY `classe_id` (`classe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ano_id` (`ano_id`),
  ADD KEY `estudante_id` (`estudante_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `pagamentos_itens`
--
ALTER TABLE `pagamentos_itens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `pagamento_id` (`pagamento_id`),
  ADD KEY `emolumento_id` (`emolumento_id`),
  ADD KEY `preco_id` (`preco_id`),
  ADD KEY `ano_id` (`ano_id`);

--
-- Índices para tabela `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `curso_id` (`curso_id`),
  ADD KEY `classe_id` (`classe_id`),
  ADD KEY `periodo_id` (`periodo_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anos`
--
ALTER TABLE `anos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emolumentos`
--
ALTER TABLE `emolumentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `emolumentos_natureza`
--
ALTER TABLE `emolumentos_natureza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `emolumento_precos`
--
ALTER TABLE `emolumento_precos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de tabela `estudantes`
--
ALTER TABLE `estudantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1761;

--
-- AUTO_INCREMENT de tabela `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pagamentos_itens`
--
ALTER TABLE `pagamentos_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`ano_id`) REFERENCES `anos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamentos_ibfk_2` FOREIGN KEY (`estudante_id`) REFERENCES `estudantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamentos_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagamentos_itens`
--
ALTER TABLE `pagamentos_itens`
  ADD CONSTRAINT `pagamentos_itens_ibfk_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamentos_itens_ibfk_2` FOREIGN KEY (`emolumento_id`) REFERENCES `emolumentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamentos_itens_ibfk_3` FOREIGN KEY (`preco_id`) REFERENCES `emolumento_precos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamentos_itens_ibfk_4` FOREIGN KEY (`ano_id`) REFERENCES `anos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
