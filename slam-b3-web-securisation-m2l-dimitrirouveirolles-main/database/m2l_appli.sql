-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 12 mars 2021 à 09:07
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
-- Base de données :  `m2l-appli`
--
CREATE DATABASE IF NOT EXISTS m2l_appli DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'user-mdl'@'%' IDENTIFIED BY 'mdp-mdl';
GRANT ALL PRIVILEGES ON m2l_appli.* TO 'user-mdl'@'%';
USE m2l_appli;


-- --------------------------------------------------------

--
-- Structure de la table `association`
--

DROP TABLE IF EXISTS `association`;
CREATE TABLE IF NOT EXISTS `association` (
  `idAssociation` int(3) NOT NULL,
  `libelleAssociation` varchar(30) DEFAULT NULL,
  `imageAssociation` varchar(40) NOT NULL,
  `descriptionAssociation` text NOT NULL,
  PRIMARY KEY (`idAssociation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `association`
--

INSERT INTO `association` (`idAssociation`, `libelleAssociation`, `imageAssociation`, `descriptionAssociation`) VALUES
(1, 'ligue de plongée', 'plongee.png', 'plouf plouf'),
(2, 'ligue de ping-pong', 'ping-pong.jpg', 'poc poc');

-- --------------------------------------------------------

--
-- Structure de la table `civilite`
--

DROP TABLE IF EXISTS `civilite`;
CREATE TABLE IF NOT EXISTS `civilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `civilite`
--

INSERT INTO `civilite` (`id`, `libelle`) VALUES
(1, 'monsieur'),
(2, 'madame'),
(3, 'non renseigné');

-- --------------------------------------------------------

--
-- Structure de la table `galerieavatar`
--

DROP TABLE IF EXISTS `galerieavatar`;
CREATE TABLE IF NOT EXISTS `galerieavatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lienImage` varchar(100) DEFAULT NULL,
  `ageMin` int(11) DEFAULT NULL,
  `ageMax` int(11) DEFAULT NULL,
  `id_civilite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_galerieAvatar_id_civilite` (`id_civilite`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `galerieavatar`
--

INSERT INTO `galerieavatar` (`id`, `lienImage`, `ageMin`, `ageMax`, `id_civilite`) VALUES
(1, 'galerie_avatars/hommes/junior/HJ1.png', 0, 24, 1),
(2, 'galerie_avatars/hommes/junior/HJ2.png', 0, 24, 1),
(3, 'galerie_avatars/hommes/junior/HJ3.png', 0, 24, 1),
(4, 'galerie_avatars/hommes/junior/HJ4.png', 0, 24, 1),
(5, 'galerie_avatars/hommes/medium/HM1.png', 25, 49, 1),
(6, 'galerie_avatars/hommes/medium/HM2.png', 25, 49, 1),
(7, 'galerie_avatars/hommes/medium/HM3.png', 25, 49, 1),
(8, 'galerie_avatars/hommes/medium/HM4.png', 25, 49, 1),
(9, 'galerie_avatars/hommes/senior/HS1.png', 50, 140, 1),
(10, 'galerie_avatars/hommes/senior/HS2.png', 50, 140, 1),
(11, 'galerie_avatars/hommes/senior/HS3.png', 50, 140, 1),
(12, 'galerie_avatars/hommes/senior/HS4.png', 50, 140, 1),
(13, 'galerie_avatars/femmes/junior/FJ1.png', 0, 24, 2),
(14, 'galerie_avatars/femmes/junior/FJ2.png', 0, 24, 2),
(15, 'galerie_avatars/femmes/junior/FJ3.png', 0, 24, 2),
(16, 'galerie_avatars/femmes/junior/FJ4.png', 0, 24, 2),
(17, 'galerie_avatars/femmes/medium/FM1.png', 25, 49, 2),
(18, 'galerie_avatars/femmes/medium/FM2.png', 25, 49, 2),
(19, 'galerie_avatars/femmes/medium/FM3.png', 25, 49, 2),
(20, 'galerie_avatars/femmes/medium/FM4.png', 25, 49, 2),
(21, 'galerie_avatars/femmes/senior/FS1.png', 50, 140, 2),
(22, 'galerie_avatars/femmes/senior/FS2.png', 50, 140, 2),
(23, 'galerie_avatars/femmes/senior/FS3.png', 50, 140, 2),
(24, 'galerie_avatars/femmes/senior/FS4.png', 50, 140, 2);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `libelle`) VALUES
(132, 'Afghanistan'),
(133, 'Albanie'),
(134, 'Antarctique'),
(135, 'Algérie'),
(136, 'Samoa Américaines'),
(137, 'Andorre'),
(138, 'Angola'),
(139, 'Antigua-et-Barbuda'),
(140, 'Azerbaïdjan'),
(141, 'Argentine'),
(142, 'Australie'),
(143, 'Autriche'),
(144, 'Bahamas'),
(145, 'Bahreïn'),
(146, 'Bangladesh'),
(147, 'Arménie'),
(148, 'Barbade'),
(149, 'Belgique'),
(150, 'Bermudes'),
(151, 'Bhoutan'),
(152, 'Bolivie'),
(153, 'Bosnie-Herzégovine'),
(154, 'Botswana'),
(155, 'Île Bouvet'),
(156, 'Brésil'),
(157, 'Belize'),
(158, 'Territoire Britannique de'),
(159, 'Îles Salomon'),
(160, 'Îles Vierges Britanniques'),
(161, 'Brunéi Darussalam'),
(162, 'Bulgarie'),
(163, 'Myanmar'),
(164, 'Burundi'),
(165, 'Bélarus'),
(166, 'Cambodge'),
(167, 'Cameroun'),
(168, 'Canada'),
(169, 'Cap-vert'),
(170, 'Îles Caïmanes'),
(171, 'République Centrafricaine'),
(172, 'Sri Lanka'),
(173, 'Tchad'),
(174, 'Chili'),
(175, 'Chine'),
(176, 'Taïwan'),
(177, 'Île Christmas'),
(178, 'Îles Cocos (Keeling)'),
(179, 'Colombie'),
(180, 'Comores'),
(181, 'Mayotte'),
(182, 'République du Congo'),
(183, 'République Démocratique d'),
(184, 'Îles Cook'),
(185, 'Costa Rica'),
(186, 'Croatie'),
(187, 'Cuba'),
(188, 'Chypre'),
(189, 'République Tchèque'),
(190, 'Bénin'),
(191, 'Danemark'),
(192, 'Dominique'),
(193, 'République Dominicaine'),
(194, 'Équateur'),
(195, 'El Salvador'),
(196, 'Guinée Équatoriale'),
(197, 'Éthiopie'),
(198, 'Érythrée'),
(199, 'Estonie'),
(200, 'Îles Féroé'),
(201, 'Îles (malvinas) Falkland'),
(202, 'Géorgie du Sud et les Île'),
(203, 'Fidji'),
(204, 'Finlande'),
(205, 'Îles Åland'),
(206, 'France'),
(207, 'Guyane Française'),
(208, 'Polynésie Française'),
(209, 'Terres Australes Français'),
(210, 'Djibouti'),
(211, 'Gabon'),
(212, 'Géorgie'),
(213, 'Gambie'),
(214, 'Territoire Palestinien Oc'),
(215, 'Allemagne'),
(216, 'Ghana'),
(217, 'Gibraltar'),
(218, 'Kiribati'),
(219, 'Grèce'),
(220, 'Groenland'),
(221, 'Grenade'),
(222, 'Guadeloupe'),
(223, 'Guam'),
(224, 'Guatemala'),
(225, 'Guinée'),
(226, 'Guyana'),
(227, 'Haïti'),
(228, 'Îles Heard et Mcdonald'),
(229, 'Saint-Siège (état de la C'),
(230, 'Honduras'),
(231, 'Hong-Kong'),
(232, 'Hongrie'),
(233, 'Islande'),
(234, 'Inde'),
(235, 'Indonésie'),
(236, 'République Islamique d Ir'),
(237, 'Iraq'),
(238, 'Irlande'),
(239, 'Israël'),
(240, 'Italie'),
(241, 'Côte d Ivoire'),
(242, 'Jamaïque'),
(243, 'Japon'),
(244, 'Kazakhstan'),
(245, 'Jordanie'),
(246, 'Kenya'),
(247, 'République Populaire Démo'),
(248, 'République de Corée'),
(249, 'Koweït'),
(250, 'Kirghizistan'),
(251, 'République Démocratique P'),
(252, 'Liban'),
(253, 'Lesotho'),
(254, 'Lettonie'),
(255, 'Libéria'),
(256, 'Jamahiriya Arabe Libyenne'),
(257, 'Liechtenstein'),
(258, 'Lituanie'),
(259, 'Luxembourg'),
(260, 'Macao'),
(261, 'Madagascar'),
(262, 'Malawi'),
(263, 'Malaisie'),
(264, 'Maldives'),
(265, 'Mali'),
(266, 'Malte'),
(267, 'Martinique'),
(268, 'Mauritanie'),
(269, 'Maurice'),
(270, 'Mexique'),
(271, 'Monaco'),
(272, 'Mongolie'),
(273, 'République de Moldova'),
(274, 'Montserrat'),
(275, 'Maroc'),
(276, 'Mozambique'),
(277, 'Oman'),
(278, 'Namibie'),
(279, 'Nauru'),
(280, 'Népal'),
(281, 'Pays-Bas'),
(282, 'Antilles Néerlandaises'),
(283, 'Aruba'),
(284, 'Nouvelle-Calédonie'),
(285, 'Vanuatu'),
(286, 'Nouvelle-Zélande'),
(287, 'Nicaragua'),
(288, 'Niger'),
(289, 'Nigéria'),
(290, 'Niué'),
(291, 'Île Norfolk'),
(292, 'Norvège'),
(293, 'Îles Mariannes du Nord'),
(294, 'Îles Mineures Éloignées d'),
(295, 'États Fédérés de Micronés'),
(296, 'Îles Marshall'),
(297, 'Palaos'),
(298, 'Pakistan'),
(299, 'Panama'),
(300, 'Papouasie-Nouvelle-Guinée'),
(301, 'Paraguay'),
(302, 'Pérou'),
(303, 'Philippines'),
(304, 'Pitcairn'),
(305, 'Pologne'),
(306, 'Portugal'),
(307, 'Guinée-Bissau'),
(308, 'Timor-Leste'),
(309, 'Porto Rico'),
(310, 'Qatar'),
(311, 'Réunion'),
(312, 'Roumanie'),
(313, 'Fédération de Russie'),
(314, 'Rwanda'),
(315, 'Sainte-Hélène'),
(316, 'Saint-Kitts-et-Nevis'),
(317, 'Anguilla'),
(318, 'Sainte-Lucie'),
(319, 'Saint-Pierre-et-Miquelon'),
(320, 'Saint-Vincent-et-les Gren'),
(321, 'Saint-Marin'),
(322, 'Sao Tomé-et-Principe'),
(323, 'Arabie Saoudite'),
(324, 'Sénégal'),
(325, 'Seychelles'),
(326, 'Sierra Leone'),
(327, 'Singapour'),
(328, 'Slovaquie'),
(329, 'Viet Nam'),
(330, 'Slovénie'),
(331, 'Somalie'),
(332, 'Afrique du Sud'),
(333, 'Zimbabwe'),
(334, 'Espagne'),
(335, 'Sahara Occidental'),
(336, 'Soudan'),
(337, 'Suriname'),
(338, 'Svalbard etÎle Jan Mayen'),
(339, 'Swaziland'),
(340, 'Suède'),
(341, 'Suisse'),
(342, 'République Arabe Syrienne'),
(343, 'Tadjikistan'),
(344, 'Thaïlande'),
(345, 'Togo'),
(346, 'Tokelau'),
(347, 'Tonga'),
(348, 'Trinité-et-Tobago'),
(349, 'Émirats Arabes Unis'),
(350, 'Tunisie'),
(351, 'Turquie'),
(352, 'Turkménistan'),
(353, 'Îles Turks et Caïques'),
(354, 'Tuvalu'),
(355, 'Ouganda'),
(356, 'Ukraine'),
(357, 'Ex-République Yougoslave '),
(358, 'Égypte'),
(359, 'Royaume-Uni'),
(360, 'Île de Man'),
(361, 'République-Unie de Tanzan'),
(362, 'États-Unis'),
(363, 'Îles Vierges des États-Un'),
(364, 'Burkina Faso'),
(365, 'Uruguay'),
(366, 'Ouzbékistan'),
(367, 'Venezuela'),
(368, 'Wallis et Futuna'),
(369, 'Samoa'),
(370, 'Yémen'),
(371, 'Serbie-et-Monténégro'),
(372, 'Zambie');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `idAssociation` int(3) NOT NULL,
  `idStatut` int(3) NOT NULL,
  `libelleStatut` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idAssociation`,`idStatut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`idAssociation`, `idStatut`, `libelleStatut`) VALUES
(1, 1, 'Membre du bureau'),
(1, 2, 'Adhérent'),
(1, 3, 'Abonné'),
(2, 1, 'Membre du bureau'),
(2, 2, 'Adhérent');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `pseudo` varchar(30) NOT NULL,
  `civilite` int(11) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `idAssociation` int(3) DEFAULT NULL,
  `idStatut` int(3) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `adresseMail` varchar(50) DEFAULT NULL,
  `motPasse` varchar(30) DEFAULT NULL,
  `id_pays` int(11) DEFAULT NULL,
  `id_galerieAvatar` int(11) DEFAULT NULL,
  `adresse` text,
  `newsletter` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`pseudo`),
  KEY `utilisateurFKassoStatut` (`idAssociation`,`idStatut`),
  KEY `FK_Utilisateur_id_pays` (`id_pays`),
  KEY `FK_Utilisateur_id_galerieAvatar` (`id_galerieAvatar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--
INSERT INTO `utilisateur` (`pseudo`, `civilite`, `nom`, `prenom`, `idAssociation`, `idStatut`, `dateNaissance`, `adresseMail`, `motPasse`, `id_pays`, `id_galerieAvatar`, `adresse`, `newsletter`) VALUES
('akuz', 3, 'Kuzbidon', 'Alex', 1, 1, '2004-01-01', 'alex@test.sio', 'Azerty1234', 128, 2, NULL, 1),
('bacon', 1, 'Bon', 'Jean', 1, 2, '1955-10-02', 'bacon@test.sio', 'SIOsio88', 206, 11, NULL, 0),
('pichi', 1, 'Ichinelle', 'Paul', 1, 3, '1999-09-05', 'pichi14@test.sio', 's3cr3tPWD', NULL, 9, NULL, 1),
('stop', 3, 'Neymar', 'Jean', 2, 1, '2003-06-09', 'jneymar@test.sio', '123456789', 206, 5, NULL, 0);


--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `galerieavatar`
--
ALTER TABLE `galerieavatar`
  ADD CONSTRAINT `FK_galerieAvatar_id_civilite` FOREIGN KEY (`id_civilite`) REFERENCES `civilite` (`id`);

--
-- Contraintes pour la table `statut`
--
ALTER TABLE `statut`
  ADD CONSTRAINT `statut_ibfk_1` FOREIGN KEY (`idAssociation`) REFERENCES `association` (`idAssociation`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateurFKassoStatut` FOREIGN KEY (`idAssociation`,`idStatut`) REFERENCES `statut` (`idAssociation`, `idStatut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
