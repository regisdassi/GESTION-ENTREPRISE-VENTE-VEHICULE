-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 24 mai 2022 à 11:46
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_vente_vehicule`
--

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `num_agent` int(11) NOT NULL AUTO_INCREMENT,
  `nom_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`num_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `bon_de_commande`
--

DROP TABLE IF EXISTS `bon_de_commande`;
CREATE TABLE IF NOT EXISTS `bon_de_commande` (
  `num_bon` int(11) NOT NULL AUTO_INCREMENT,
  `agent_num` int(11) NOT NULL,
  `client_num` int(11) NOT NULL,
  `date_bon` date NOT NULL,
  PRIMARY KEY (`num_bon`),
  KEY `agent_num` (`agent_num`),
  KEY `client_num` (`client_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `num_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` text NOT NULL,
  `code_client` varchar(255) NOT NULL,
  PRIMARY KEY (`num_client`),
  KEY `code_client` (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `echeance`
--

DROP TABLE IF EXISTS `echeance`;
CREATE TABLE IF NOT EXISTS `echeance` (
  `num_ech` int(11) NOT NULL AUTO_INCREMENT,
  `bon_num` int(11) NOT NULL,
  `date_ech` date NOT NULL,
  `Montant` int(11) NOT NULL,
  `date_reg` date NOT NULL,
  `mode_reg` text NOT NULL,
  PRIMARY KEY (`num_ech`),
  KEY `bon_num` (`bon_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `num_int` int(11) NOT NULL AUTO_INCREMENT,
  `bon_num` int(11) NOT NULL,
  `veh_num` int(11) NOT NULL,
  `desc_int` text NOT NULL,
  `date_int` date NOT NULL,
  PRIMARY KEY (`num_int`),
  KEY `bon_num` (`bon_num`),
  KEY `veh_num` (`veh_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `liste_options_veh`
--

DROP TABLE IF EXISTS `liste_options_veh`;
CREATE TABLE IF NOT EXISTS `liste_options_veh` (
  `bon_num` int(11) NOT NULL,
  `veh_num` int(11) NOT NULL,
  `option_code` varchar(255) NOT NULL,
  KEY `bon_num` (`bon_num`),
  KEY `veh_num` (`veh_num`),
  KEY `option_code` (`option_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `liste_panne`
--

DROP TABLE IF EXISTS `liste_panne`;
CREATE TABLE IF NOT EXISTS `liste_panne` (
  `int_num` int(11) NOT NULL,
  `panne_code` varchar(255) NOT NULL,
  KEY `int_num` (`int_num`),
  KEY `panne_code` (`panne_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `code_marque` varchar(255) NOT NULL,
  `lib_marque` text NOT NULL,
  PRIMARY KEY (`code_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `numero_ordre`
--

DROP TABLE IF EXISTS `numero_ordre`;
CREATE TABLE IF NOT EXISTS `numero_ordre` (
  `num_veh` int(11) NOT NULL,
  PRIMARY KEY (`num_veh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `option_vehicule`
--

DROP TABLE IF EXISTS `option_vehicule`;
CREATE TABLE IF NOT EXISTS `option_vehicule` (
  `code_option` varchar(255) NOT NULL,
  `lib_option` text NOT NULL,
  PRIMARY KEY (`code_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `panne`
--

DROP TABLE IF EXISTS `panne`;
CREATE TABLE IF NOT EXISTS `panne` (
  `code_panne` varchar(255) NOT NULL,
  `lib_panne` text NOT NULL,
  PRIMARY KEY (`code_panne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

DROP TABLE IF EXISTS `piece`;
CREATE TABLE IF NOT EXISTS `piece` (
  `code_piece` varchar(255) NOT NULL,
  `lib_piece` text NOT NULL,
  PRIMARY KEY (`code_piece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prix_option_veh`
--

DROP TABLE IF EXISTS `prix_option_veh`;
CREATE TABLE IF NOT EXISTS `prix_option_veh` (
  `option_code` varchar(255) NOT NULL,
  `type_veh_code` varchar(255) NOT NULL,
  `prix_option` int(11) NOT NULL,
  KEY `option_code` (`option_code`),
  KEY `type_veh_code` (`type_veh_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

DROP TABLE IF EXISTS `reparation`;
CREATE TABLE IF NOT EXISTS `reparation` (
  `int_num` int(11) NOT NULL,
  `piece_code` varchar(255) NOT NULL,
  `qte_piece` int(11) NOT NULL,
  KEY `int_num` (`int_num`),
  KEY `piece_code` (`piece_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_client`
--

DROP TABLE IF EXISTS `type_client`;
CREATE TABLE IF NOT EXISTS `type_client` (
  `cod_type_client` varchar(255) NOT NULL,
  `lib_type` text NOT NULL,
  PRIMARY KEY (`cod_type_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_vehicule`
--

DROP TABLE IF EXISTS `type_vehicule`;
CREATE TABLE IF NOT EXISTS `type_vehicule` (
  `code_type_veh` varchar(255) NOT NULL,
  `lib_type_veh` text NOT NULL,
  `prix_de_base` int(11) NOT NULL,
  PRIMARY KEY (`code_type_veh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `num_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom_utilisateur` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `est_actif` tinyint(1) NOT NULL,
  `est_supprime` tinyint(1) NOT NULL,
  `cree_le` date NOT NULL,
  `mise_a_jour_le` date NOT NULL,
  `role` text NOT NULL,
  PRIMARY KEY (`num_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `bon_num` int(11) NOT NULL,
  `veh_num` int(11) NOT NULL,
  `marque_code` varchar(255) NOT NULL,
  `type_veh_code` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  KEY `bon_num` (`bon_num`),
  KEY `veh_num` (`veh_num`),
  KEY `marque_code` (`marque_code`),
  KEY `type_veh_code` (`type_veh_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bon_de_commande`
--
ALTER TABLE `bon_de_commande`
  ADD CONSTRAINT `bon_de_commande_ibfk_1` FOREIGN KEY (`agent_num`) REFERENCES `agent` (`num_agent`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bon_de_commande_ibfk_2` FOREIGN KEY (`client_num`) REFERENCES `client` (`num_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `type_client` (`cod_type_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `echeance`
--
ALTER TABLE `echeance`
  ADD CONSTRAINT `echeance_ibfk_1` FOREIGN KEY (`bon_num`) REFERENCES `bon_de_commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`bon_num`) REFERENCES `bon_de_commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`veh_num`) REFERENCES `numero_ordre` (`num_veh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liste_options_veh`
--
ALTER TABLE `liste_options_veh`
  ADD CONSTRAINT `liste_options_veh_ibfk_1` FOREIGN KEY (`bon_num`) REFERENCES `bon_de_commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liste_options_veh_ibfk_2` FOREIGN KEY (`veh_num`) REFERENCES `numero_ordre` (`num_veh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liste_options_veh_ibfk_3` FOREIGN KEY (`option_code`) REFERENCES `option_vehicule` (`code_option`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liste_panne`
--
ALTER TABLE `liste_panne`
  ADD CONSTRAINT `liste_panne_ibfk_1` FOREIGN KEY (`int_num`) REFERENCES `intervention` (`num_int`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liste_panne_ibfk_2` FOREIGN KEY (`panne_code`) REFERENCES `panne` (`code_panne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `prix_option_veh`
--
ALTER TABLE `prix_option_veh`
  ADD CONSTRAINT `prix_option_veh_ibfk_1` FOREIGN KEY (`option_code`) REFERENCES `option_vehicule` (`code_option`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prix_option_veh_ibfk_2` FOREIGN KEY (`type_veh_code`) REFERENCES `type_vehicule` (`code_type_veh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_1` FOREIGN KEY (`int_num`) REFERENCES `intervention` (`num_int`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparation_ibfk_2` FOREIGN KEY (`piece_code`) REFERENCES `piece` (`code_piece`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`bon_num`) REFERENCES `bon_de_commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`veh_num`) REFERENCES `numero_ordre` (`num_veh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_3` FOREIGN KEY (`marque_code`) REFERENCES `marque` (`code_marque`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_4` FOREIGN KEY (`type_veh_code`) REFERENCES `type_vehicule` (`code_type_veh`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
