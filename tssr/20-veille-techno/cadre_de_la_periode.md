[TOC]

### pour DP ?

#### Gestion Utilisateurs 
##### Arrivée d'un nouveau ollaborateur
Reception de la fiche d’entrée
Creation des comptes AD 
Creation du compte Office 365 avec adresse mail
Création du compte AX
Installation du poste de travail
Paramétrage d’Office
Installation d’AX si besoin
Préparation des liens Explorer vers le serveur de fichiers
Vérification que les GPO s’applique, notamment sur l’installation des imprimantes
Vérifier que les imprimantes sont correctement installée
Installation de logiciel spécifique, si besoin (SolidWorks, Adobe Suite, Kadri, Zeendoc)


## Le service informatique

Le service informatique fait partie de la fonction SUPPORTS. Cinq employé lui sont attachés : un responsable, un alternant développeur, une contrôleuse de gestion avec une formation à l'informatique de gestion (base de données) et moi-même, développeur PHP/Python et alternant technicien supérieur systèmes et réseaux. Nous avons également un technicien de notre prestataire historique en régie une matinée par semaine.


## Le réseau informatique
Le service informatique a un rôle central au sein des activités de l'entreprise.  

Le groupe SELF SIGNAL est présent sur un seul site à Cesson-Sévigné mais dispose également d'une antenne export indépendante au Sénégal. Il nous arrive d'apporter notre support technique à cette antenne, notamment dans la préparation d'ordinateur qui pilote une certaine machine-outil, mais cela reste anecdotique.

L'ensemble du parc de l'entreprise se compose de :

- 3 serveurs physiques
- x serveurs virtuels
- 1 baie de disques (?)
- 2 serveur de sauvegarde Beemo
- x switchs physiques 
- 12 terminaux mobile type "scannettes" Zebra
- 6 imprimantes thermiques (pour étiquettes)
- 6 imprimantes réseaux Xerox
- 75 téléphones mobiles en location auprès d'Orange Business
- 50 téléphones DACT, et 6 standards téléphoniques

Les serveurs sont hébergés sur site, dans une petite salle serveur climatisée et fermée à clé. 

En terme d'OS, nous sommes sur du Windows Server 2016 pour les serveurs virtuels, du Windows 10 pour les postes de travail. Nous avons quelques postes fixes et portables sous Windows 11. Il nous reste encore 3 postes sous Windows 7 pour des raisons de compatibilité avec certains logiciels métiers. Nous avons 5 postes sous Debian 8 qui servent à piloter des machines-outils. Certaines machines ont une interface custom, comme un stockeur rotatif avec une tablette sous un Windows ME modifié. Ces postes-là sont gérés par les installateurs. En cas de problème, c'est leur support technique que l'ont appelle.


## 3. Cadre de travail (?)
### 3.1 Assistance aux utilisateurs

Parmi les tâches qui me sont assigné, j'ai en charge l'assistance aux utilisateurs, quelque soit le problème.

Il peut m'arriver de devoir dépanner un photocopieur (copieur multifonction) qui fonctionne mal. Généralement, je lis le message d'erreur affiché sur l'écran de la machine et je suis les recommandations du système. Si ça n'a pas d'effet, j'appelle le SAV de Xerox qui me guidera par téléphone. Parfois, il s'agit de remplacer une pièce déféctueuse auquel cas je mets un papier sur la machine pour informer qu'elle est en panne, j'informe toute l'entreprise par mail que le copieur est en panne, et leur indique qu'ils peuvent imprimer sur d'autres Xerox du parc. Si une autre de ses fonctions fonctionne malgré tout (ex. scan) je laisse la machine allumée, sinon je l'éteins.

### Gestion des groupes et des utilisateurs

**Une nouvelle collaboratrice arrive prochainement au Bureau d'Etude, il faut lui préparer son poste.**
Le processus débute par l'envoi d'un formulaire Excel "**Fiche d'entrée**" que j'ai créé à l'attention des RH.

Ce questionnaire a pour but de collecter des **informations sur le poste** et d'identifier les **besoins matériels correspondants**. Il permet de déterminer si l'achat d'un nouveau PC, d'écrans ou d'autres équipements est nécessaire ou si du matériel déjà en stock peut être réutilisé. Il permet également de savoir si nous disposons des licences nécessaires pour certains logiciels (Office365, Adobe Suite, SolidWorks, etc.).

Pour les besoins matériels, je m'occupe personnellement de passer les commandes sur LDLC.pro en concertation avec le RSI et la Comptabilité.

En ce qui concerne les licences, nous travaillons avec notre prestataire de services habituel ou nous passons directement par les plateformes de gestion des logiciels concernés.

**_Préparation_**

Dans le cas présent, il s'agit d'une collaboratrice qui sera Responsable de projet affectée au service Bureau d’Etudes. Ses besoins se limitent à un accès à notre ERP Microsoft Dynamics AX ("AX"), et un compte Office365 avec création d'une boîte mail. Il s'agira également de lui fournir un téléphone fixe (DACT) avec une ligne interne et externe (SDA) ainsi qu’un téléphone mobile qui support le double-SIM.

**Point matériel**

- Nous avons un PC en stock qui était dans le même service.
- Nous n’avons pas de DACT en stock, il faudra en demander un au téléphoniste
- Nous avons un mobile Android neuf en stock mais il faudra commander une carte SIM auprès de
notre fournisseur (c’est le RSI qui s’en occupe).
Achats
- Achat de 2 écrans 24" sur LDLC.pro

**Création des comptes**

- Création d'un compte AD dans l'Unité Organisationnelle qui convient
- Création d'un compte Office 365
- Création d'un compte dans AX (fait par le RSI car la procédure est complexe et non documentée)

**Téléphonie**

- Appel auprès de notre téléphoniste pour qu'il passe installer un DACT car nous n'en avons pas en
stock. Il règlera également son SDA.
- Pour le téléphone mobile, le RSI passe la commande de carte SIM. Nous attendons de la recevoir
pour préparer le téléphone (installation et paramétrage d’Outlook).

**Installation du poste**

- Installation d'Office365 à la place d'Office 2016
- Paramétrage d'Office365 pour la future utilisatrice
- Installation d'un agent GLPI (actuellement en test principalement dans un but d'inventaire)
- Ajout des raccourcis vers Outlook, AX sur le Bureau et vers le serveur de fichiers dans l'Explorateur
de fichiers.

**Installation physique**

- Nettoyage du bureau (rangement + coup d'éponge)
- Installation du poste avec clavier et souris, ainsi que 2 écrans en HDMI et VGA.
- Branchement sur le réseau. En cas de non-connexion, on vérifie en premier lieu si la prise sur
laquelle le PC est branché est bien brassée.

**Vérifications**

- Contrôle de l’ouverture session Windows avec l’utilisateur (AD ok ?)
- Contrôle Outlook en réception et envoi d’e-mail
- Contrôle de l’accès à AX (dépend de l‘ajout de l’utilisateur AD dans AX)
- Contrôle de l’installation imprimantes et accès réseau (relancer GPO si besoin ? prise murale brassée ?)
- Contrôle de l’accès au serveur de fichiers et des permissions ACL sur celui-ci 

**Noter infos dans KeepassXC et annuaire**

- Toutes les infos type login et mot de passe sont consignées dans une base de données KeepassXC.
- Noter les informations de contact (mail, tel interne, ligne externe) dans l'annuaire de l'entreprise
(un fichier Excel)
- Diffuser ces informations de contact à toute l'entreprise via mail et Steeple (notre intranet).

### Supervision du parc informatique
Achat du matériel sur LDLC.pro
Inventaire
Installation de GLPI


### Gestion du matériel
Notre parc informatique est composé de matériel acheté au cas par cas, principalement sur le site ldlc.pro sur lequel nous avons un compte client depuis 2006. 

La politique en place est que nous essayons avant tout de recycler le matériel existant, quitte à ajouter des composants type RAM ou disque SSD. Cela devient de moins en moins possible au vu de la demande élévé en ressource de Windows 10. Par ailleurs le passage à Windows 11 sera bientôt inévitable puisque Windows 10 ne sera plus maintenu en octobre 2025.

Nous n'avons pas de politique claire d'inventaire au nivau du materiel informatique. Nous avons une suite logicielle proposée par notre antivirus Panda Endpoint qui permet d'avoir un inventaire complet mais seulement des machines qui ont l'agent Panda installé et ayant une licence active, ce qui n'est pas le cas de tous les postes du parc. Pour y remédier j'ai décidé d'installer GLPI sur un serveur Debian afin de mieux gérer le parc. A des fiins de tester, je n'ai déployé l'agent qu'au cas par cas car je n'étais pas convaincu de son utilité. 

Aujourd'hui GLPI reste la meilleure solution en la matière, et à moins que je ne développe ma propre solution, nous allons bientôt déployer les agents à tout l'AD via une GPO.

-----reformule


Notre parc informatique est actuellement constitué de matériel acheté de manière individuelle, principalement via notre compte client sur le site ldlc.pro, que nous utilisons depuis 2006.

Notre politique actuelle consiste à privilégier le recyclage du matériel existant en ajoutant éventuellement des composants tels que de la RAM ou un disque SSD. Cependant, cette approche devient de plus en plus difficile en raison des exigences croissantes de Windows 10 en termes de ressources. De plus, le passage à Windows 11 sera inévitable à l'approche de la fin de maintenance de Windows 10 en octobre 2025.

Nous n'avons pas encore mis en place de politique claire d'inventaire pour notre matériel informatique. Bien que notre antivirus Panda Endpoint propose une suite logicielle permettant d'obtenir un inventaire complet, celle-ci ne s'applique qu'aux machines ayant l'agent Panda installé et une licence active, ce qui n'est pas le cas de tous les postes de notre parc. Pour remédier à cette situation, j'ai décidé d'installer GLPI sur un serveur Debian afin de mieux gérer notre parc informatique. Pour le moment, j'ai déployé l'agent GLPI de manière sélective, car je n'étais pas convaincu de son utilité.

À ce jour, GLPI demeure la meilleure solution disponible, et à moins que je développe ma propre solution, nous prévoyons bientôt de déployer l'agent GLPI sur l'ensemble de notre Active Directory via une GPO (stratégie de groupe).

### Installation serveur web Apache sur Debian, avec PHP, MySQL et GLPI
**Mise en place d’un serveur web Debian pour PHP, MySQL et GLPI**

L’entreprise dispose d’un serveur web qui héberge des applications PHP faites maison et accessibles uniquement depuis le réseau local. Ce serveur est installé sur une machine virtuelle Windows Server 2012, le serveur web est géré par Wamp Server (Apache, PHP, MySQL). Cette VM héberge également d'autres services qui n'ont aucun rapport avec nos applications web.

Dans le but de renforcer la sécurité de notre infrastructure, j'ai proposé de déployer un nouveau serveur exclusivement dédié à nos applications web.
Etant familier des environnements Linux, j’ai choisi de créer un serveur web Debian avec PHP 7.4, MariaDB.

J'ai également profité de cette installation pour ajouter GLPI 10, un outil de gestion de parc informatique.

Après avoir suivi une formation sur GLPI à l'ENI, j'ai réalisé que cet outil serait utile pour la gestion de l'inventaire de l’entreprise.

- Création d’une VM Debian en local sur mon PC de travail (en bridge avec IP fixe).
- Paramétrage du serveur web Apache,
- Installation et paramétrage de PHP 7.4 et MariaDB
- Installation des pilotes MS SQL Server permettant d’accéder aux bases de données de l’ERP via nos applications web.
- Installation du Framework PHP Symfony accompagné du gestionnaire de paquets Composer
- Installation de Git pour la gestion des versions de code
- Importation des dépôts GitLab correspondants à nos applications via git
- Installation et paramétrage de GLPI afin de tester la remontée d’informations d’inventaire via des agents GLPI déployés sur certaines machines.
- Installation & paramétrage de SSH-Serveur

Après la préparation du serveur web, nous avons mis en production la VM en clonant l'image dans VMware Workstation et en l'important dans l'un de nos ESXi. Nous avons préféré confier cette tâche à notre prestataire, étant donné l'importance critique pour l'entreprise de la gestion des ressources sur les ESXi.

En tant que responsable de la maintenance du serveur Debian, j'assure les mises à jour et le bon fonctionnement du système. D'ici la fin de l'été 2023, nous prévoyons une migration complète des applications PHP actuellement en production.

Etant par ailleurs développeur PHP, j’ai pu installer le serveur Apache en totale autonomie. Notre prestataire de service s’est chargé de l’importation du serveur Debian dans l’ESXi. Il a également réservé son adresse IP dans notre DHCP en l’ajoutant à la liste d’exclusion.

--

### Mise en conformité avec la norme ISO9001

Debut 2021 nous avons entamé la mise en conformité en vu d'obtenir la certification ISO 9001. La norme ISO 9001 est un standard international qui définit les exigences pour la mise en place d'un système de gestion de la qualité efficace au sein des organisations.

Sa mise en place pour le service informatique de l'Entreprise implique l'adoption de bonnes pratiques de gestion de la qualité, telles que l'établissement de processus documentés, la définition de procédures claires pour les activités informatiques, la surveillance de la performance, l'identification et la gestion des risques, l'amélioration continue des processus, et éventuellement la réalisation d'audits internes et externes pour évaluer la conformité aux exigences de la norme.

En tant que Technicien système et réseaux, j'ai assisté le RSI dans la mise en place de documentation de certains processus (ex. établissement d'une fiche d'entrée de nouveau collaborateur). Achats

Nous avons également revu la façon dont les partages réseaux étaient effectués, notamment les permissions ACL. Celle-ci étaient attribué par utilisateurs. Nous avons créé des Groupes dans l'AD de façon à gérer les permissions ACL par groupe et non plus par utilisateurs. 

----- reformule

Au début de l'année 2021, nous avons entrepris de nous conformer aux exigences de la norme ISO 9001 en vue d'obtenir la certification correspondante. La norme ISO 9001 est un standard international qui définit les critères pour établir un système de gestion de la qualité efficace au sein des organisations.

Pour le service informatique de notre entreprise, la mise en place de cette norme implique l'adoption de bonnes pratiques de gestion de la qualité. Cela comprend notamment l'établissement de processus documentés, la création de procédures claires pour les activités informatiques, la surveillance de la performance, l'identification et la gestion des risques, l'amélioration continue des processus, ainsi que la possibilité de réaliser des audits internes et externes pour évaluer la conformité aux exigences de la norme.

En tant que Technicien système et réseaux, j'ai apporté mon soutien au Responsable des Systèmes d'Information (RSI) lors de la mise en place de la documentation de certains processus, tels que l'établissement d'une fiche d'entrée pour les nouveaux collaborateurs. De plus, nous avons revu la manière dont les partages réseau étaient effectués, en particulier les autorisations d'accès (ACL). Auparavant, celles-ci étaient attribuées par utilisateur. Nous avons alors créé des groupes dans l'Active Directory (AD) afin de gérer les autorisations d'accès par groupe plutôt que par utilisateur.


### Suivi/Gestion Audit cybersécurité

Au printemps 2022, nous avons décider de passer un audit en cybersécurité à cause des menaces grandissante en terme de cryptolockage. Plusieurs entreprises de notre milieu ont déjà été victime de cyberrançon et nous ne sommes clairement pas prêt à affronter cette menace.

Je me suis occupé de démarcher des entreprises faisant des audits en cybersécurité, j'ai organisé des rendez-vous avec certaines en distancielle pour quelle nous présente leur savoir-faire.

Grâce à une aide extraordinaire (Breizh Fab) nous avons choisi un acteur local, réputé dans son expertise, à savoir la societe Accéis basée à Rennes.

J'ai assité à toutes les réunions de préparation à l'audit, puis j'ai été le référent sur place pour l'auditrice. J'ai notamment aidé celle-ci à mettre en place son équipement et fourni les accès nécessaires.

L'audit en lui même s'est déroulé sur 2 jours pendant lesquel l'auditrice, ayant déjà un accès à notre réseau, a essayé de monté en permission. S'en ai suivi une réunion où elle nous a réstitué ses conclusion "à chaud". Dans les jours qui suivirent, elle nous a remis un rapport détaillé avec ses recommandations. S'en est suivi une dernière réunion avec un technicien d'Acceis qui nous a expliqué la suite des démarches à prendre pour sécuriser notre réseau. 

Nous avons mis en place ces recommandations avec l'aide de notre prestataire, qui a également fait partie du projet. Parmi les problèmes pointé nous avions la faiblesse de nos mots de passe, l'inconsistence des droits d'accès et la non-ségmentation du réseau. 

Nous sommes actuellement à 80% de complétion d'application de ces recommandations. Il reste notamment un gros chantier : la ségmentation du réseau. Nous avons des machines-outils qui sont sur le réseau mais dont la configuration nous échappe. Il faut prévoir de faire venir un techn icien agréé et cela prend du temps.



------ reformule


Au printemps 2022, notre entreprise a pris la décision de faire réaliser un audit en cybersécurité en raison de la menace croissante du cryptolockage.

Après avoir contacté plusieurs entreprises spécialisées, nous avons choisi Accéis, une société réputée basée à Rennes. 

J'ai été impliqué dans toutes les étapes du processus, depuis les entretiens avec des sociétés d'audit pour présenter leur expertise jusqu'à l'audit lui-même. J'ai accompagné l'auditrice avant et pendant son audit, facilitant l'installation de son équipement et lui fournissant les accès nécessaires. 

L'audit s'est déroulé sur deux jours, au cours desquels l'auditrice a tenté de monter en privilèges en ayant déjà accès à notre réseau. Nous avons ensuite tenu une réunion pour discuter de ses conclusions préliminaires, avant la remise d'un rapport détaillé avec des recommandations. 

En collaboration avec Accéis, nous avons entrepris de mettre en œuvre ces recommandations, en nous concentrant sur des problèmes tels que la sécurité des mots de passe, les droits d'accès incohérents et la segmentation du réseau ainsi que la mise en place d'un plan de récupération après incident.

 Bien que nous ayons réalisé environ 80% des recommandations, il reste encore un défi majeur à relever : la segmentation du réseau, qui nécessite l'intervention d'un technicien agréé et demande du temps pour être pleinement réalisée, et finaliser le plan de récupération en cas d'incident.


## Mise en place GLPI
dl archive sur GLPI
dezippe dans /var/www/html 
chown
chmod
site ok
changer mdp par defaut et go 

## Dev script auto
python cegid 
python rapport ax 




## gestion office365
## mise en place serveur debian
## mise en place glpi
## gestion des pannes (assistance)
Dans la mesure de mes compétences
Avec COMETE
Par exemple, 
imprimante non détectée
Zeendoc ne fonctionne plus bug concernant les 2 mêmes utilisatrices sans que l’on sache pourquoi. Il suffit de relancer PDF Creator pour qu’il reinstalle l’imprimante virtuelle liée à Zeendoc. 
Outlook ne synchronise plus
Echange de telephone mobile 
Xerox en panne : telephone au support techinque et reparation à distance
Parametrage d’un PC pour Kelio 
Depanner SolidWorks (utilisation de mes connaissances en dev) 
Installation d’AX
Fix Caldera

