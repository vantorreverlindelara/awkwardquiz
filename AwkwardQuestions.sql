CREATE DATABASE  IF NOT EXISTS `AwkwardQuestions` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `AwkwardQuestions`;
# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Database: AwkwardQuestions
# Generation Time: 2017-05-23 13:51:46 +0000
# ************************************************************
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Categorie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Categorie`;

CREATE TABLE `Categorie` (
  `categorie_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Categorie` WRITE;
/*!40000 ALTER TABLE `Categorie` DISABLE KEYS */;

INSERT INTO `Categorie` (`categorie_id`, `categorie`)
VALUES
	(1,'Algemeen'),
	(2,'Ondeugend'),
	(3,'Controversieel');

/*!40000 ALTER TABLE `Categorie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Vragen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Vragen`;

CREATE TABLE `Vragen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` int(2) NOT NULL,
  `vraag` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

LOCK TABLES `Vragen` WRITE;
/*!40000 ALTER TABLE `Vragen` DISABLE KEYS */;

INSERT INTO `Vragen` (`id`, `categorie_id`, `vraag`)
VALUES
	(1,2,'Ik heb nog nooit gefoefeld met twee verschillende mensen in 24u.'),
	(2,2,'Wat is belangrijker? Borsten of billen?'),
	(3,2,'Ik heb me het nog nooit beklaagd dat ik seks met een bepaalde persoon had.'),
	(4,2,'Ik ben ooit naar ergens gegaan met iemand van het ander geslacht om iemand jaloers te maken.'),
	(5,2,'Wat is je favoriete standje?'),
	(6,2,'Ik heb ooit geëxperimenteerd met iemand van hetzelfde geslacht.'),
	(7,2,'Ik heb ooit de verkeerde naam gezegd tijdens de seks.'),
	(8,2,'Ik heb ooit gemastubeerd terwijl ik porno keek.'),
	(9,2,'Ik heb ooit iemand doen klaarkomen tijdens een film, in een taxi of op een vliegtuig.'),
	(10,2,'Raad welk kleur mijn huidige onderbroek is...'),
	(11,2,'Wanneer heb je voor het laatst gemasturbeerd?'),
	(12,2,'Ik heb ooit een sensuele massage gegeven of gekregen.'),
	(13,2,'Ik heb ooit \"seksverslaafde\" opgezocht op Google.'),
	(14,2,'Wat zou je me liever zien dragen voor de rest van mijn leven: een legging of kort rokje.'),
	(15,2,'Niet kunnen zien of niet kunnen aanraken tijdens de seks? '),
	(16,2,'Seks hebben met iemand veel ouder dan jou of nooit seks hebben gedurende je hele leven? '),
	(17,2,'Wat is het ondeugendste dat je ooit deed? '),
	(18,2,'Ik heb ooit orale seks gehad zonder de persoon te kussen.'),
	(19,2,'Ik heb ooit getongzoend in het openbaar.'),
	(20,2,'Seks in complete stilte of dat de ander \"dirty\" praat in een accent die je haat?'),
	(21,2,'Ik heb ooit gefoefeld in een slaapzak.'),
	(22,2,'Ik ben ooit naakt buitengesloten geweest.'),
	(23,2,'Ik heb ooit betaald voor seks.'),
	(24,2,'Ik heb ooit eten van iemands lichaam opgegeten.'),
	(25,2,'Liever voorspel enkel met je mond of je handen doen? '),
	(26,2,'Ben je ooit jaloers geweest door of op mij?'),
	(27,2,'Ik heb iemand ooit moeten vragen of we seks hebben gehad omdat ik niet zeker was.'),
	(28,2,'Ik heb ooit aan een trio meegedaan.'),
	(29,2,'Ik ben ooit bang geweest voor een SOA.'),
	(30,2,'Enkel trio\'s of nooit meer seks in het geheel? '),
	(31,2,'Ik ben ooit wakker geworden naast een volkomen vreemde.'),
	(32,2,'Ik ben ooit naar de dokter geweest omdat er een vreemd object in mij vastzat.'),
	(33,2,'Ik heb ooit seks gehad met iemand, die niet zo aantrekkelijk was, gewoon omdat ik zo graag seks wilde.'),
	(34,2,'Ik heb ooit met iemand van hetzelfde geslacht gekust.'),
	(35,2,'Seks met een meisje die kanten lingerie draagt of een bondage outfit? '),
	(36,2,'Ik heb ooit voorspel gehad / gekust / seks gehad met een goede vriend(in) om te zien hoe het was.'),
	(37,2,'Slaap je in een pyjama, onderbroek of naakt? '),
	(38,2,'Ik heb ooit een friend with benefits gehad.'),
	(39,2,'Ik heb ooit een huishoudelijk object als seksspeeltje gebruikt.'),
	(40,2,'Ik heb ooit gewenst dat mijn vriend een grotere piemel had.'),
	(41,2,'Ik heb ooit een klacht over geluidsoverlast gekregen net na de seks.'),
	(42,2,'Ik heb ooit een striptease gedaan voor iemand.'),
	(43,2,'Seks in de keuken of in de living?'),
	(44,2,'Ik heb ooit een object gebruikt tijdens de seks (bv. vibrator).'),
	(45,2,'Ik heb ooit een lijntje coke gesnoven van iemand anders zijn of haar lichaam.'),
	(46,2,'Slikken of uitspuwen?'),
	(47,2,'Ik heb ooit iets seksueel gedaan waar anderen ons konden zien (maar niet zagen).'),
	(48,2,'Wat is jouw meest gevoelige lichaamsdeel?'),
	(49,2,'Ik heb ooit een lapdance gegeven.'),
	(50,2,'Onderdanige of dominante partner in een relatie?'),
	(51,2,'Ik heb ooit meegedaan aan een rollenspel.'),
	(52,2,'Altijd hetzelfde seksstandje of telkens met een volledig andere persoon seks hebben? '),
	(53,2,'Heb je \"50 Tinten Grijs\" gelezen? Zo ja, werd je er geil van? '),
	(54,2,'Ik heb ooit alle mensen waarmee ik gekust had opgeschreven en ik schrok van het aantal.'),
	(55,2,'What is your most hardcore fantasy?'),
	(56,2,'Ik heb ooit \"gesexted\".'),
	(57,2,'Ik heb ooit seks gehad met iemand die niet dezelfde taal spreekt als mij. '),
	(58,2,'Enkel missionaris of énkel doggy?'),
	(59,2,'Ik heb ooit gewenst dat mijn vriendin grotere borsten had.'),
	(60,2,'Ik heb ooit moeten liegen over mijn \"nummer\" omdat ik niet veroordeeld wilde worden.'),
	(61,2,'Mij oraal bevredigen of dat ik dat doe bij jou?'),
	(62,2,'Haar down there of kaal?'),
	(63,1,'Ik heb ooit bepaalde kleren gedragen om een zuigplek te verbergen.'),
	(64,1,'Wat is je favoriete restaurant?'),
	(65,1,'Ik ben ooit gaan skydiven.'),
	(66,1,'Wereldhaat of wereldhonger beëindigen?'),
	(67,1,'Hoeveel broers en / of zussen heb je? '),
	(68,1,'Ik ben ooit gearresteerd geweest.'),
	(69,1,'Wat is je favoriete film?'),
	(70,1,'Niet meer in bad gaan gedurende een maand of geen internet gedurende een maand? '),
	(71,1,'Hoe heb je je beste vriend(in) leren kennen?'),
	(72,1,'Wat is het laatste boek dat je las? '),
	(73,1,'Wat is je raarste litteken en hoe heb je het gekregen?'),
	(74,1,'Voor wat ben je momenteel aan het sparen?'),
	(75,1,'Geloof je in geesten of leven na de dood?'),
	(76,1,'Wat is een familietraditie die jouw familie heeft?'),
	(77,1,'Ik ben ooit op de radio of televisie geweest.'),
	(78,1,'Ik ben ooit flauwgevallen omdat ik te veel gedronken had. '),
	(79,1,'Ik ben ooit naar een Aziatisch land geweest.'),
	(80,1,'Ik heb ooit zoveel gedronken dat ik mijn hele avond niet meer kon herinneren.'),
	(81,1,'Ik heb ooit karaoke gedaan.'),
	(82,1,'Er is ooit een stukje van mijn tand afgekraakt.'),
	(83,1,'Ik heb ooit geprobeerd mijn eigen haar te knippen.'),
	(84,1,'Wanneer is mijn verjaardag?'),
	(85,1,'Geen zoekmachines of geen sociale media meer gebruiken?'),
	(86,1,'Ik heb ooit een fysieke ruzie gehad met mijn beste vriend(in).'),
	(87,1,'Wat zijn twee van je bucketlist items?'),
	(88,1,'Favoriete liedje op dit moment'),
	(89,1,'Ik heb ooit al gekampeerd met een tent.'),
	(90,1,'Wat is iets dat ik nooit zou raden over jou?'),
	(91,1,'Ik ben ooit zeeziek geweest.'),
	(92,1,'Hartige snack of dessert?'),
	(93,1,'Ik heb ooit iets gebroken.'),
	(94,1,'Ik heb ooit iets gehouden dat iemand vergeten was of liet vallen.'),
	(95,1,'Ik ben ooit verliefd geworden op het eerste zicht.'),
	(96,1,'Lichaam aan de wetenschap gegeven of je organen doneren aan iemand die ze nodig heeft?'),
	(97,1,'Wat is volgens jezelf je beste eigenschap?'),
	(98,1,'Ik heb ooit de morning after pil genomen.'),
	(99,1,'Nachtuil of vroege vogel?'),
	(100,1,'Waar ben je de laatste tijd heel trots op?'),
	(101,1,'Heel snel typen of heel snel lezen?'),
	(102,1,'Geschiedenis weten van elk object dat je aanraakt of tegen dieren kunnen praten?'),
	(103,1,'Deuren niet kunnen openen of deuren niet kunnen sluiten? '),
	(104,1,'Ik ben ooit ontslagen geweest.'),
	(105,1,'Gelukkig voor 8u/dag maar arm of ongelukkig voor 8u/dag maar rijk?'),
	(106,1,'Ik ben ooit naar een professionele sportevenement geweest.'),
	(107,1,'Wat is je favoriete kledingstuk?'),
	(108,1,'Closer met mama of papa?'),
	(109,1,'Ik heb ooit ge(water)skied.'),
	(110,1,'Ik heb mijn haar ooit in een gek kleur gekleurd.'),
	(111,1,'Wat heeft je recent geraakt?'),
	(112,1,'In wat ben je slechter dan 90% van de bevolking? '),
	(113,1,'Ik heb ooit iemand gefopt langs de telefoon.'),
	(114,1,'Met wie ben je in jouw familie het closest?'),
	(115,1,'Was je populair in het middelbaar? '),
	(116,1,'Noem een traditie aan welke jij meedoet.'),
	(117,1,'Ik heb ooit een gekregen cadeau aan iemand anders cadeau gedaan.'),
	(118,1,'Beschrijf jouw perfecte partner.'),
	(119,1,'Roddelen over je of in het geheel nooit over je praten?'),
	(120,1,'Ik heb ooit iets uit hout gemaakt.'),
	(121,1,'Ik ben ooit high geweest.'),
	(122,1,'Ik heb ooit een kreet geslaan toen ik naar een horror keek.'),
	(123,1,'Ik ben ooit uit een club, café of restaurant gezet.'),
	(124,1,'Overal haar of overal kaal?'),
	(125,1,'Kattenliefhebber, hondenliefhebber, beiden of geen?'),
	(126,1,'Op welke prestatie ben je het trotst? '),
	(127,1,'Al je geld en waardevolle dingen verliezen of al je foto\'s?'),
	(128,1,'T-shirt die altijd twee maten te groot is of één maat te klein?'),
	(129,1,'Wat zou je redden uit je brandende woonst?'),
	(130,1,'Wie was je favoriete leerkracht aller tijden?'),
	(131,1,'Wat vind je leuk aan daten en wat niet?'),
	(132,1,'Wat is je favoriete film?'),
	(133,1,'Ik heb ooit in de douche geplast.'),
	(134,1,'Ik heb ooit in een limo gezeten.'),
	(135,1,'Ik heb ooit de hele dag in mijn pyjama doorgebracht zonder dat ik ziek was.'),
	(136,1,'Ik heb ooit vastgezeten in een lift.'),
	(137,1,'Wat heb je altijd al willen proberen?'),
	(138,1,'Ik heb ooit berichtjes verwijderd uit angst dat mijn partner ze zou lezen.'),
	(139,1,'Ik ben ooit in slaap gevallen op \'t werk.'),
	(140,1,'Ik heb ooit een paranormale ervaring gehad.'),
	(141,1,'Wat is het beste cadeau die je ooit gekregen hebt?'),
	(142,1,'Ik heb ooit een boomhut gehad.'),
	(143,1,'Ik ben ooit gearresteerd geweest.'),
	(144,1,'Geloof je in buitenaards leven?'),
	(145,1,'Wat maakt je zenuwachtig?'),
	(146,1,'Waar ben je slecht in?'),
	(147,1,'Ik heb ooit een snelheidsboete gekregen.'),
	(148,1,'Heb je bijnamen?'),
	(149,1,'Ik heb ooit een tatoeage laten zetten.'),
	(150,1,'Naar ergens geteleporteerd worden of gedachten kunnen lezen?'),
	(151,1,'Dieren met je hoofd kunnen controleren of elektronica met je hoofd kunnen?'),
	(152,1,'Was is je vroegste jeugdherinnering?'),
	(153,1,'Ik ben ooit vegetariër of veganist geweest.'),
	(154,1,'Wat is het zotste dat je ooit meegemaakt hebt?'),
	(155,1,'Ik heb ooit een boom geplant.'),
	(156,1,'Je favoriete liedje op dit moment.'),
	(157,1,'Wat zit er nu in je frigo?'),
	(158,1,'Ik heb ooit Crocs gedragen.'),
	(159,1,'Op welke plaats kom je tot rust?'),
	(160,1,'Als je in een andere stad moest leven, waar zou dat dan zijn?'),
	(161,1,'Ik ben ooit onder volledige narcose geweest.'),
	(162,1,'Heb je me liever zonder of met make-up?'),
	(163,1,'Ik heb ooit een slak gegeten.'),
	(164,1,'Wat is je lievelingseten?'),
	(165,1,'Ik heb mijn vriend(in) nog nooit bedrogen.'),
	(166,1,'Opgesloten in een kamer die gedurende een week donker of licht is?'),
	(167,1,'Wat haat je als de ander doet (op een date)?'),
	(168,1,'Ik heb ooit in mijn broek geplast (na mijn kindertijd).'),
	(169,1,'Waar erger je je het meest aan bij jezelf?'),
	(170,3,'Zou marijuana een medische optie moeten zijn?'),
	(171,3,'Moet de doodstraf verboden worden?'),
	(172,3,'Zouden dieren getest mogen worden voor wetenschappelijke of commerciële doeleinden?'),
	(173,3,'Wat is jouw mening over abortus?'),
	(174,3,'Hoe zou je reageren als jouw kind uit de kast komt?'),
	(175,3,'Jouw opinie over veganisme / vegetarisme?'),
	(176,3,'Zou racisme bestraft moeten worden?'),
	(177,3,'Werknemers hebben het recht om niet meer gecontacteerd te worden buiten de werkuren.'),
	(178,3,'Kan je creativiteit aanleren?'),
	(179,3,'Word je als homo of lesbische vrouw geboren?'),
	(180,3,'Een schoolrestaurant zou enkel gezond eten mogen aanbieden.'),
	(181,3,'Plezierjacht zou verboden moeten worden.'),
	(182,3,'Orgaandonatie zou verplicht moeten zijn.'),
	(183,3,'Hoe ontstond de aarde? Door god of door de Big Bang?'),
	(184,3,'Is religie goed voor de mensheid?'),
	(185,3,'Begint leven bij de bevruchting of bij de geboorte?'),
	(186,3,'Zouden rijken meer belasting moeten betalen dan de lagere klasse?'),
	(187,3,'Wapenbezit: voor of tegen?'),
	(188,3,'Zou je liever levend verbranden of door de vrieskou doodgaan?'),
	(189,2,'Ik mezelf ooit gefilmd tijdens de seks.'),
	(190,2,'Ik ben ooit op een Tinderdate geweest'),
	(191,2,'Ik heb ooit anale seks gehad.'),
	(192,3,'Het salaris van topmanagers is te hoog.'),
	(193,3,'Er moet een nationale DNA-databank gemaakt worden.'),
	(194,1,'Welke misvatting hebben veel anderen over jou?'),
	(195,1,'Noem één ding dat je dag altijd goed maakt.'),
	(196,1,'Hoe ziet jouw ideale vakantie eruit?'),
	(197,1,'Wat is de eerste les die je jouw kinderen zou leren?'),
	(198,1,'Beschrijf een rare gewoonte van jezelf waarvoor je je nooit zou verontschuldigen.'),
	(199,1,'Hoeveel serieuze relaties heb je al gehad?'),
	(200,1,'Ben je een optimist, realist of pessimist?');

/*!40000 ALTER TABLE `Vragen` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
