-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 20 nov. 2018 à 15:24
-- Version du serveur :  5.7.18-log
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mars_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `accompagnement`
--

DROP TABLE IF EXISTS `accompagnement`;
CREATE TABLE IF NOT EXISTS `accompagnement` (
  `id_acc` int(20) NOT NULL AUTO_INCREMENT,
  `nom_acc` varchar(20) NOT NULL,
  `id_client` int(20) NOT NULL,
  PRIMARY KEY (`id_acc`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `login_ad` text NOT NULL,
  `mot_pass_ad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(20) NOT NULL AUTO_INCREMENT,
  `nom_client` text NOT NULL,
  `adresse_client` text NOT NULL,
  `email` text NOT NULL,
  `num_tel_client` int(20) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `adresse_client`, `email`, `num_tel_client`) VALUES
(1, 'xx', 'ariana ', 'dcdc@cdcd.cddc', 0),
(2, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(3, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(4, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(5, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(6, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(7, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(8, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(9, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(10, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(11, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(12, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(13, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(14, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(15, 'wxwxwx', 'qxq', 'dcdc@cdcd.cddc', 0),
(16, 'sasa', 'sasas', 'ara@hhgh.bbb', 12211122),
(17, 'sasa', 'sasas', 'ara@hhgh.bbb', 12211122);

-- --------------------------------------------------------

--
-- Structure de la table `fusee`
--

DROP TABLE IF EXISTS `fusee`;
CREATE TABLE IF NOT EXISTS `fusee` (
  `id_fusee` int(20) NOT NULL AUTO_INCREMENT,
  `nom_fusee` varchar(20) NOT NULL,
  PRIMARY KEY (`id_fusee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id_inscription` int(11) NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `mot_de_passe` text NOT NULL,
  PRIMARY KEY (`id_inscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id_client` int(20) NOT NULL,
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `num_reservation` int(20) NOT NULL AUTO_INCREMENT,
  `Rocket` varchar(30) NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_fusee` int(20) NOT NULL,
  PRIMARY KEY (`num_reservation`),
  KEY `id_client` (`id_client`),
  KEY `id_fusee` (`id_fusee`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`num_reservation`, `Rocket`, `Destination`, `categorie`, `etat`, `id_client`, `id_fusee`) VALUES
(1, 'Rocket BAA', 'Mars', 'Business class2', 'Cryoginisation', 13, 0),
(2, 'Rocket BAA', 'Mars', 'Business class2', 'Cryoginisation', 15, 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accompagnement`
--
ALTER TABLE `accompagnement`
  ADD CONSTRAINT `accompagnement_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `fusee`
--
ALTER TABLE `fusee`
  ADD CONSTRAINT `fusee_ibfk_1` FOREIGN KEY (`id_fusee`) REFERENCES `reservation` (`num_reservation`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_inscription`) REFERENCES `client` (`id_client`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
