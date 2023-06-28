# TSSR 07 - ITIL GLPI
Cours du 25/04 au 29/04/2022

Formateur : JY Bourlès (externe)

**Objectifs** : 

- Se conformer aux règles de bonnes pratiques de la démarche ITIL v3
- Utiliser un outil de gestion d'incident
- Traiter un dossier d'incident conformément à un processus 
- Appliquer un script de questionnement ou une méthode d'analyse de résolution d'incident
- Utiliser et renseigner une base de connaissance
- Gérer les problèmes

**Sommaire**

1. Présentation ITIL et historique
2. Gestion des services
3. Publications centrales : Stratégie et conception
4. Publications centrales : Transition
5. Publications centrales : Exploitation
6. Savoir, savoir-faire, savoir-être
7. Assistance utilisateur sous GLPI
8. Publication centrales : Amélioration continue

<span id="toc"></span>

[TOC]

<a href="#toc">Retour au sommaire</a>

## Mod. 1 Présentation ITIL et historique
<a href="#toc">Retour au sommaire</a>

### Atelier 1

Regrouper les mots du nuage par thème

| Réseau       | Dev      | Généalogie |
|:-------------|:---------|:-----------|
| Agent relais | Select   | Agnatique  |
| Routage      | SQL      | Cognatique |
| DNS          | Clé      | Ascendant  |
| DHCP         | Jointure | Arbre      |
| Modèle OSI   | Algèbre  | SOSA       |

- Agnatique : Relatif à l'agnation (parenté par les mâles).
- Cognatique : Se dit d'un mode de filiation non unilinéaire, qui passe indifféremment par les hommes et par les femmes.


<a href="#toc">Retour au sommaire</a>

### Présentation ITIL
- ITIL Information Technology Infrastructure Library
- Bibliothèqye pour l'infrastructure des technologies de l'information
- ITIL définit les bonnes pratiques informatiques afin d'avoir un SI le plus efficace et efficient que possible.

<a href="#toc">Retour au sommaire</a>

### Les normes
- **ISO 9001** : norme qui s'adresse à tous les secteurs d'activités, qui définit un système de gestion de qualité par le processus.
- **ISO 20000** : norme internationale spécifique à la gestion des systèmes d'information (SI), définie en 13 processus (ces processus sont définies dans iTIL).. Cette certification est facilitée si l'on possède ISO 9001 et ITILv2 minimum.

<a href="#toc">Retour au sommaire</a>

### Historique
- Fin 1980s 
	+ le gov britannique lance une étude nationale pour connaître les pratiques utilisées dans la gestion des infos au niveau de l'administration et afin de garder les meilleures. Le but était d'homogénéiser le traitement des informations.
	+ Création d'une bibliothèque de 42 livres baptisés **ITIL**.
	+ Le SI est un fournisseur de moyen.
- 1991 
	+ Création d'un forum permettant aux utilisateurs d'ITIL d'échanger les idées et leurs expériences. Il deviendra l'ITSMF.
- 2004
	+ Evolution vers ITIL v2 qui repose sur 9 livres centraux
	+ Apparition de processus orientés sécurité et des SLAs
	+ **Le SI est un fournisseur de services.**
- 2007
	+ ITIL v3 repose sur 5 livres centraux
	+ Ajout de la notion de **cycle de vie des services**
- Janv. 2020
	+ ITIL 4 n'est pas une version, mais un dépoussiérage de la v3 en gardant les principes fondamentaux.
	+ Référenciel international de gestion des SI : *Service Strategy*, *Service Design*, *Service Transition*, *Service Opération*, *Continual Service Improvement*

<a href="#toc">Retour au sommaire</a>

### Présentation ITIL v3

ITIL repose sur l'évolution de l'informatique dans une gestion de projets vers une gestion de service.

Contenu :
- Les bonnes pratiques de la gestion des SI
- Définition d'un langage commun
- Définition d'un cadre de travail

#### Les différents acteurs

- **OGC** Office of Government Commerce : office public britannique du commerce. Propriétaire du référentiel, initialise et contrôle les publications.
- **Axelos**: Entreprise créée en 2014 par l'OGC pour gérer ITIL
- Organismes de gestion des certifications et des examens : définissent un langage commun (ex. APM Group, EXIN, Loyalist College, Dansk IT, DF Certifiering).
- **ITSMF** IT Service Management Forum : association d'utilisateurs
- Les organismes de formation et les formateurs agréés
- Les experts et les consultants en gestion de service certifiés ITIL

#### Apport d'ITIL 4
**ITIL 4** n'est pas une nouvelle version, mais représente la 4e génération industrielle. 

Nouveautés : gestion de projet Agile, le Lean (orig. Japon), et le cloud.

<a href="#toc">Retour au sommaire</a>

### Atelier 2 - Phase 1 et 2

???

<a href="#toc">Retour au sommaire</a>

## Module 2 - La Gestion des Services

<a href="#toc">Retour au sommaire</a>

### Projet vs Service

ITIL v3 propse une évolution de la gestion de projet vers la gestion de service qui est plus orientée client.

Un **projet**, c'est la capacité à implémenter de nouvelles fonctionnalités par rapport à de nouveaux besoins, une nouvelle législation, une avancée technologique.

Un **service**, c'est la capacité à produire le service demandé en respectant 3 critères importants :

1. Aligner les services informatiques sur les besoins des clients
2. Améliorer la qualité des services informatiques
3. Maîtriser les coûts de fourniture

<a href="#toc">Retour au sommaire</a>

### Définitions

- Un **service** est l'ensemble des moyens mis en oeuvre pour apporter à un client de la valeur sans qu'il n'en supporte ni les coûts ni les risques
- Un **service** est une application installée sur une infrastructure, avec :
	+ une documentation associée
	+ une formation adaptée
	+ un support mis en place
	+ de l'assistance aux utilisateurs
- Un **service** est un engagement sur le résultat : 
	+ face au client
	+ face au risque 
	+ en assumant les risques

**Un service doit fournir de la valeur.**

<a href="#toc">Retour au sommaire</a>

### Création de valeur
Les 2 conditions requises pour créer de la valeur :

- **Utilité** (dimension de la prestation) : la raison d'être d'un service
	+ Amélioration des performances
	+ Dépassement des contraintes
	+ ou les 2
- **Garantie** (utilisabilité) : c'est l'assurance pour le client qu'un service va remplir les exigences de niveau de qualité contractualisé (condition, résultats, lieu, délais et moment)
	+ C'est le niveau d'usage dont le client et ses utilisateurs ont besoin
	+ La garantie doit respecter : les horaires d'ouvertures, la disponibilité, la performance, la continuité de service, la sécurité 

![creation_valeur](../ressources/img/07-itil-glpicreation-valeur.png) 


<a href="#toc">Retour au sommaire</a>

### Les 5 acteurs de services
#### Le fournisseur
Le fournisseur de services informatiques (IT Service Provider) est l'**entité responsable de la mise à disposition des services informatiques**.

- **Type I** : fournisseur interne
	+ Ex. l'organisation marketing d'une entreprise décide de mettre en place chez elle une equipe informatique chargée de gérer l'informatique qu'elle utilise.
- **Type II** : fournisseur de services partagés
	+ Ex. une direction ayant pour clients les différentes organisations de l'entreprise (y compris elle-même)
- **Type III** : fournisseur externe
	+ Propose ses services à toutes les entreprises intéressées
	

#### Le client
Le client est une personne ou organisation bénéficiaire finale d'un service, comptable des résultats.

- Il est le **donneur d'ordre**
- Il est autorisé à signer un contrat (SLA) portant sur la fourniture de service informatique
- Il va exprimer les besoins métiers
	+ négocier le service
	+ valider la solution
	+ payer la solution et le service
- Il est le représentant des utilisateurs
- Il a une relation particulière avec la DSI

#### L'utilisateur
L'utilisateurs (collaborateur du client) est **la personne qui utilise un système informatique**.

- Il utilise les services informatiques au quotidien pour son activité professionnelle
- Il remonte ses exigences auprès du client
- Il ne paye pas l'utilisation d'un service
- Il contacte la DSI par l'intermédiaire du Centre de Services (HelpDesk)

#### Le propriétaire
Le propriétaire de service (Service Owner - marketing) est l'entité responsable qui effectue le **suivi du service informatique**.

- Il est responsable de la définition du service et de sa mise en oeuvre
- Il  participe aux propositions d'amélioration du service
- Il est responsable de la bonne mise en oeuvre des améliorations validées
- Il représente le service auprès des clients
- Il participe à la négociation des SLA (Service Level Agreement) et des OLA (Operationnal Level Agreement) 
- Il est l'un des destinataires pour les incidents majeurs lors des escalades
- Il est responsable de la vie du service (évolution et fin du service, création de tableaux de bord)
- Il s'assure que le service atteint les objectifs

#### Le gestionnaire

Le gestionnaire est l'**entité responsable de la mise en place de la démarche ITIL** au sein de l'entreprise et de la vie du service.

- Il possède une position hiérarchique élevée pour être légitime
- Il coordonne les activités des propriétaires de processus et des propriétaires de services
- Il travaille en collaboration avec le gestionnaire de l'amélioration continue des services

<a href="#toc">Retour au sommaire</a>

### Dispositions spécialisées
- La gestion de service intègre :
	+ la planification
	+ la mise en oeuvre
	+ l'optimisation de la fourniture des services
	+ le support des services
	
Pour cela, il y a 2 dispositions spécialisées au coeur d'ITIL : des **fonctions** et des **processus**.

#### La notion de Processus
Un **processus** est une suite d'activité structurée et logique poursuivant un objectif défini.

Il possèdes plusieurs caractéristiques :

- Il comprend un ou des éléments en entrée définis
- Il comprend un ou des éléments en sortie qui peuvent être en entrée d'un autre processus
- Il est mesurable : coûts, qualité, gain de productivité et délais de production
- Il a un ou des résultats attendus
- Il a un ou des clients
- Il a un ou des déclencheurs
- Il définit les rôles et responsabilité des différents acteurs
- Il définit les besoins en outils et les contrôles de gestion
- Il doit être documenté
- Il doit être contrôlé

##### Les mesures d'un processus
Les mesures (ses résultats, ses activités, ses livrables, etc.) permettent d'améliorer son **efficacité** et son **efficience**.

L'**efficatité** est une mesure permettant de savoir si les objectifs visés d'un processus, d'un service ou d'une activité ont été atteints.

L'**efficience** est une mesure permettant de savoir si  la quantité de ressources attribuées à un processus ou un service ou une activité, a été suffisante et bien utilisée (coût d'argent, d'hommes, de temps).


##### Modélisation d'un processus

![model_process](../ressources/img/07-itil-glpimodel-processus.png)

#### La notion de Fonction

Une **fonction** est un groupe de personnes fonctionnelles (unité, équipe) disposant d'outils et de ressources spécifiques pour exécuter un certain type de travaux et sera responsable des résultats spécifiques.

- Ce groupe assure une ou plusieurs activités par rapport à un ou plusieurs processus.
- Il est responsable des outils (définition et utilisation)
- ITIL définit **4 fonctions** :
	+ Le centre de services
	+ La gestion des opérations
	+ La gestion technique
	+ La gestion des applications 

#### Fonctions et processus

![fonction_processus](../ressources/img/07-itil-glpifonctions_processus.png)

1. Accueil par les RH
2. Appel au HelpDesk pour la création d'un nouveau compte
3. Escalade vers l'equipe "Serveurs"
4. Retour de l'information aux RH pour test

#### La notion de Rôle

Un **rôle** se définit à un instant t (qui fait quoi à ce moment-là).

Le modèle RACI va permettre une organisation de représenter les rôles et les responsabilités de chacun.

- **R=Responsible** (realise et reporte - **Chargé de faire**)
	+ en charge de la réalisation de l'action (plusieurs)
	+ sous-traitant de A=Accountable
	+ **Au moins 1 par action**
- **A=Accountable** (autorise et assume - **Responsable**)
	+ Rend les comptes sur l'avancement de l'action
	+ Assume la responsabilité de l'action
	+ **1 seul par action**
- **C=Consulted** (est consulté - **Consultant**)
	+ Impliqué dans l'action en tant que fournisseur d'avis
	+ L'avis doit être pris en compte par la personne qui l'a demandé
	+ **Au moins 1 par action**
- **I=Informed** (est informé)
	+ Doit prendre connaissance de l'action et de son avancement
	+ Doit être informé sur le déroulement, le résultat
	+ **Au moins 1 par action**

##### Le modèle RACI

|            | GestR Processus 1 | Resp. Service 1 | GestR Proc. 2 | Resp. Serv. 2 | GestR Proc. 3 | Resp. Serv. 3 |
|:-----------|:--:|:--:|:--:|:--:|:--:|:--:|
| Activité 1 |  I |  R |  A |  C |  C |  R |
| Activité 2 | C | I | R | C | A | I |
| Activité 3 | A |   | C | R | I |   |
| Activité 4 |   | I | A | R | C |   |


<a href="#toc">Retour au sommaire</a>

### Le Cycle de Vie des services

![cycle-vie-services](../ressources/img/07-itil-glpicycle-vie-services.png)

<a href="#toc">Retour au sommaire</a>

### Atelier 3 - Phase 3 et 4

<a href="#toc">Retour au sommaire</a>

## Module 3 - Les publications centrales : Stratégie & Conception
<a href="#toc">Retour au sommaire</a>

### Stratégie des services

**Objectifs** : 

- Comment développer l'offre de service dans un contexte concurrentiel ?
- Comment passer de la gestion des services à un rôle stratégique de la DSI pour l'entreprise ?
- Comment apporter de la valeur aux clients ?

**Rôle de la stratégie des services**

- Produire des services de qualité apportant de la valeur aux clients en prévoyant les conflits possibles
- Planifier et définir une stratégie des services (services offerts)
- Rester proche des demandes métiers en restant concurrentiel

#### Processus de la stratégie des services

- **Gestion de la stratégie** : permet l'établissement de la stratégie de services en fonction de l'état du marché, des demandes (clients), de l'offre (concurrence) et  des capacités de l'entreprise (Personnel, Matériel, Financière).
- **Gestion du portefeuille des services** : liste tous les services (futurs, actuels, retirés) et leur description (coût). Les services actuels sont contenus dans le catalogue des services (clients)
- **Gestion des demandes** : permet l'analyser les besoins des clients, actuels et surtout futurs, en fonction des évolutions des métiers et des technologies. Un des processus les plus critiques.
- **Gestion financière** : permet d'analyser les coûts d'un service afin d'en définir le prix.
- **Gestion de la relation métier** : maintient une relation de confiance avec les clients pour garantir la satisfaction générale ressentie.


#### Les 4 P

![4p](../ressources/img/07-itil-glpi4P.png)

Les **acteurs** des 4 P sont :

- La direction de l'entreprise
	+ Donner des directions
	+ Définir des politiques
	+ Identifier les projets
	+ Attribuer les ressources
- La direction financière
	+ Prioriser les investissements


#### Terminologie I

- **ROI** Return On Investment : retour sur investissement, comparaison de la dépense par rapport à la valeur produite et sur quelle durée
- **TCO** Total Cost of Ownership : coût total de possession, ensemble des coûts de fourniture des services
- **Coût d'un service** : argent dépensé pour concevoir ou fournir un service
	+ Coûts directs : achats matériels ou de fournitures (facture)
	+ Coûts indirects : frais par rapport à l'entreprise (location des locaux)
	+ Coûts cachés (inclus dans le TCO) : manque de formation des techniciens
- **Prix d'un service** : le coût augmenté d'une marge

<a href="#toc">Retour au sommaire</a>

### La conception des services
**Objectifs**: Produire des services en respectant les livrables produits par la stratégie des services.

**Son rôle** :

- Recueillir les exigences du client (SLR)
- Définir la solution
- Connaître les contraintes de l'architecture du SI
- Définir les processus
- Définir les indicateurs de mesure du service

#### Definir la solution

- Exigences, contraintes, spécifications, validité et bénéfices : Où je dois aller ?
- Options de réalisation : comment vais-je m'y prendre ?
	+ Réalisation interne ou sous-traitance ?
	+ Maintenance corrective interne ou externe (**TMA**) ?
	+ Exploitation interne ou infogérance ?
	+ Sous-traitance fonctionnelle (**BPO**)
	+ **ASP** Application Service Provision : fournir le service directement au client final via l'infrastructure de l'informatique d'un fournisseur ?
	+ **KPO** Knowledge Process Outsourcing : appel  à un ou plusieurs consultants externes pour leurs connaissances sur les métiers ou la technologie ?

#### Les indicateurs

- Comment évoluent les données du service ?
- Fait-il ce qu'on a vendu au client ?
- Le fait-il dans le respect des SLA ?
- Sommes-nous efficients dans la livraison quotidienne du service ?

#### Les acteurs de la conception des services 4P
![acteurs-4p](../ressources/img/07-itil-glpiacteurs-4p.png)

- **Personnes** : utiliser les meilleures ressources internes.
- **Processus** : créer, définir et faire évoluer les processus et les procédures en fonction de leur utilisation par les services.
- **Produits** : choisir des produits adaptés aux services.
- **Partenaires** : sélectionner et impliquer les sous-traitants et les fournisseurs spécialisés dans un domaine (apport de personnels, de savoir-faire et de compétences).


#### Les processus de la conception des services
- La **coordination de la conception** : met en relation les différnets processus pour la création des services.
- La **gestion du catalogue des services** : pour gérer et garder à jour les informations des services et leur disponibilité.
- La **gestion des niveaux de services** (**SLA**) : permet d'identifier les exigences, les besoins et les moyens nécessaires à la fourniture des services. Dans la matrice RACI, cette gestion des niveaux de services est "Accountable".
- La **gestion de la disponibilité** : s'assure que les niveaux de disponibilité d'un service sont conformes aux SLA. Permet également de supprimer les **SPOF** (Single Point of Failure). 
- La **gestion de la capacité** : s'assure que les services actuels et futurs sont et seront délivrés au meilleur coût (RH et/ou matérielles). Contient 3 sous-processus :
	+ BCM Business Capacity Management - gestion de la capacité orientée métier (futurs besoins)
	+ SCM Service Capacity Management - gestion de la capacité orientée service (perf actuelles)
	+ CCM Component Capacity Management - gestion de la capacité des composants (ressources dispo)
- La **gestion de la continuité** : s'assure de la poursuite de la livaison des services dans le respect des SLA dans un environnement dégradé (côté DSI et/ou client). Nécessite de tester régulièrement et adapter les **PCA** (Plan de Continuité d'Activité).
- La **gestion de la sécurité** : s'assure de la sécurité des données du SI. Nécessite de définir la politique d'utilisation du SI. 
- La **gestion des fournisseurs** : codifie la relation avec les fournisseurs (recrutement, contrat, niveau et qualité de service, litiges, ruptures de contrat)


#### La gestion des niveaux de services

**Contenu non exhaustif SLA** :

- Modalités du service
- Modalités de continuité
- Modalités de disponibilité
- Modalités des changements
- Modalités des performances
- Modalités de mise en production
- Modalités du support
- Modalités de support (sic)
- Modalités de sécurisation
- Modalités de reporting et suivi
- Modalités financières
- Coûts et prix
- Devoirs du client
- Date de démarrage et durée

**Contenu d'un OLA**:

- Un contrat de services OLA est un contrat pour réaliser un SLA (Service Level Agreement)
- Le document a la même structure que le SLA
- L'OLA est un contrat interne, les conditions de pénalités sont souvent inexistantes ou non applicables

**Contenu d'un UC**:

- Un contract de service UC est un contrat avec un prestataire externe pour réaliser un SLA.
- Le document a la même structure que le SLA
- Des clauses juridiques sont à ajouter pour traiter la relation entre les 2 organisations

#### La gestion de la disponibilté

##### FMD Fiabilité Maintenabilité Disponibilité

![fmd](../ressources/img/07-itil-glpifmd.png)

##### Terminologie II

- **Fiabilité** : aptitude d'un équipement, d'un logiciel, d'un service à fonctionner durablement avec un nombre minimum d'interruption ou d'incidents.
- **Maintenabilité** : aptitude d'un service ou d'un équipement à être remis en marche.
- **Résilience** : Aptitude à continuer à fonctionner même si un ou plusieurs composants sont hors-services.
- **Service-ability** : aptitude que l'on a à trouver des fournisseurs ou sous-traitants externes pour assurer disponibilité, fiabilité et maintenabilité.
- **Recoverability** : aptitude à s'auto reconfigurer jusqu'au dernier niveau d'avant arrêt. 

#### Terminologie III

- **SLR** Service Level Requirement : expression des besoins de client
- **SLM** Service Level Manager : responsable de la gestion des niveaux de services
- **SLA** Service Level Agreement : accord de niveaux de services **conclu avec le client**
- **OLA** Operationnal Level Agreement : accord de niveaux de services **conclu avec les fournisseurs internes**
- **UC** Underpinning Contract : contrat de **sous-traitance**
- **Catalogue de services** : document regroupant l'ensemble des services
- **SIP** Service Improvement Program : programme d'amélioration des services
- **TMA** Tierce Maintenance Applicative : maintenance corrective applicative
- **BPO** Business Process Outsourcing : sous-traitance fonctionnelle d'une application, d'un processus métier (la paie, la comptabilité)
- **ASP** Application Service Provision : fournir le service directement au client final via l'infrastructure de l'informatique d'un fournisseur
- **KPO** Knoledge Process Outsourcing : appel à un ou plusieurs consultants externes pour leurs connaissances sur les métiers ou la technologie.

#### Atelier 4 - gestion de la disponibilité : taux

![tp4](../ressources/img/07-itil-glpitp4-soluce.png)

#### Gestion de la continuité
##### Terminologie IV
- **BCP** Business Continuity Plan = **PCA** Plan de Continuité d'Activité : orienté métier, quelles sont les activités opérationnelles et leurs ressources que vais-je maintenir ?
- **BCM** Business Continuity Management : analyse et gestion, quels sont les risques et leurs impacts ?
- **BIA** : méthode d'analyse de l'impact business qui permet d'évaluer les pertes potentielles.
- **DRP** Disaster Recovery Plan = **PCA** Plan de Reprise d'Activité : plan de rétablissement et reprise informatique.

#### Gestion de la sécurité
##### Terminologie V
- **La disponibilité des données**: c'est donner à l'utilisateur qui le demande l'information dont il a besoin.
- **La confidentialité** : c'est rendre accessible l'information à ceux qui en ont l'autorisation et à eux seuls.
- **L'authenticité**: c'est rendre fiables les échanges par une signature électronique.
- **L'intégrité**: c'est s'assurer que l'information est complète et qu'elle n'a pas été altérée de manière frauduleuse.
- **La non-répudiation**: c'est assumer le fait d'avoir effectué l'action.

#### Gestion des fournisseurs
Organisation externe à l'entreprise qui va intervenir dans la fourniture d'un service sous contrat de sous-traitance (UC Underpinning Contract).

Plusieurs relations possibles :

- **Sous-traitance** : organisation externe qui s'engage pour la conception, le développement, l'exploitation et la maintenance d'un service.
- **Co-traitance** : organisation externe qui s'engage à participer à des activités du cycle de vie du service.
- **Partenariat** : engagement à long terme pour de nouvelles opportunités.
- **ASP** Application Service Provision : fourniture partielle ou totale d'un service à partir de son propre SI et de son réseau.

<a href="#toc">Retour au sommaire</a>

## Module 4 - Les publications centrales : Transition des services
<a href="#toc">Retour au sommaire</a>

### La transition des services
**Objectifs** : Mise en production des services (nouveaux ou améliorés)

**Son rôle** :

- Mettre en production en respectant les livrables produits par la conception des services ainsi que les coûts (ie. Réalisation, Construction, Test, Validation et Déploiement des services)
- Prévoir et gérer les ressources nécessaires
- Produire la documentation
- Surveiller et améliorer les services
- Respecter les critères de qualité, de sécurité et les délais dans la délivrance des services
- Prendre en compte et améliorer la perception client

Dans la phase de transition, tout commence par le processus de gestion des changements avec une **RFC** Request For Change.

![rfc](../ressources/img/07-itil-glpirfc-2.png)

<a href="#toc">Retour au sommaire</a>

### La gestion des changements

#### Objectifs de la gestion des changements

- S'assurer que les procédures et les méthodes pour traiter les changements sont efficaces, voire efficientes.
- S'assurer que les modifications des **CI** (Configuration Item) sont bien enregistrées dans le **CMS** Content Management System.
- Répondre aux évolutions exprimées par les clients en minimisant les risques d'interruption de service et en maximisant la valeur fournie.


#### Définition d'un changement

Modification, ajout ou retrait d'un ou plusieurs **CI** du système d'information d'un ou plusieurs services fournis par ce système d'information.

#### Origines d'un changement

- Les correctifs (évènement, incident, problème, etc.)
- La législation
- L'organisation
- Des directives ou des standards
- Des évolutions des services existants
- Des nouveaux services
- Un nouveau modèle de sourcing
- Une innovation technologique, etc.

#### La demande de changement

- Tous les clients sont habilités à émettre une demande de changement, mais cela ne veut pas dire qu'elle sera acceptée.
- Toute demande de changement doit être formalisée par une **RFC**
- **RFC** Request For Change est une formalisation d'une modification d'un ou plusieurs éléments de configuration (**CI**)
- Une RFC doit contenir :
	+ un identifiant unique 
	+ une date de demande
	+ le nom du demandeur
	+ une proposition de priorité de changement (priorité = impact x urgence)
	+ une description du changement
	+ les risques durant l'implémentation du changement
	+ les dates de mise en place du changement
	+ une estimation des ressources nécessaires (humaine, matériels, etc.)

#### La gestion de la priorité d'une demande de changement

ITIL 

![priorité RFC](../ressources/img/07-itil-glpirfc-priorite.png)


| Code priorité | description | Dans GLPI  | Priorité de changement | 
|:-------------:|:-----------:|:----------:|:----------------------:|
| 1             | Critique    | Très haute | Urgent / Critique      |
| 2             | Elevée      | Haute      | Urgent                 |
| 3             | Moyen       | Moyenne    | Normal                 |
| 4             | Faible      | Basse      | Normal                 |
| 5             | Très faible | Très basse | Standard / Planifié    |


#### Les types de changements
##### Le changement Normal

Nécessite une évaluation complète et une autorisation avant sa réalisation par le **CAB**.

##### Le changement standard

- Actions connues, documentées, déjà réalisées et testées
- Les risques sont faibles et bien maitrisés
- Changement préapprouvé, maitrisé et associé à des procédures établies 
- Référencé dans un mini-catalogue de changements préautorisés

##### Le changement Urgent

- L'urgence est **exceptionnelle** et devra être validée et autorisée par l'**ECAB**.
- Court-circuitage des procédures (réalisation, mise en oeuvre, documentation et tests).

![cycle de vie changement](../ressources/img/07-itil-glpicycle-vie-changement.png)

#### Les 7 "R" de la gestion des changements

1. **RAISED** : qui fait la demande ?
2. **REASON** : pour quelle raison ?
3. **RETURN** : quel est le retour attendu ?
4. **RISKS** : quels sont les risques 
5. **RESOURCES** : quelles sont les ressources ? 
6. **RESPONSIBLE** : qui est (le) responsable ?
7. **RELATIONSHIP** : quelles sont les relations avec les autres changements ?

#### La gestion des changements : Terminologie VI

- **CI** Configuration Item                : composant du SI qui va contribuer à la fourniture d'un ou plusieurs services. 
- **CMS** Content Management System        : logiciel de gestion des CI, de la base connaissance, etc.
- **CAB** Change Advisory Board            : comité consultatif qui évalue et donne un avis sur la mise en oeuvre des changements dits normaux.
- **ECAB** Emergency Change Advisory Board : comité qui donne l'autorisation de traiter le changement en urgence.
- **PIR** Post Implementation Review       : comité qui analyse les résultats des mises en production des changements.
 

<a href="#toc">Retour au sommaire</a>

### GLPI : Présentation et notions
#### Présentation
- **GLPI** : Gestion Libre de Parc Informatique
- **ITSM** : Information Technology Service Management conforme avec ITIL
- Logiciel libre sous licence GPL 100% libre
- Logiciel complet pour la gestion de parc et centre de services
- Plusieurs langues et plugins disponibles
- Multi-plateformes (Win + Linux)
- Pour les petits comme les grands SI

#### Fonctionnalités Gestion de Parc

- Inventaire matériel
- Vue détaillée, connexions, etc.
- Historique sur les éléments
- Systèmes d'exploitations
- Informations administratives et financières
- Composant internes
- Composants et cartographie réseau
- Cycle de vie des matériels
- Réservation de matériel
- Logiciels et licences

#### Recherche rapide
- Permet d'effectuer une recherche uniquement sur les champs affichés. 
- Etendue de la recherche aux champs affichés par défaut de tou sles éléments d'inventaire
- Utilisation possible de regex (ex. NULL pour chercher des champs vides, ^ pour début, $ pour fin, ^foo$ pour valeur exacte)

#### Les interfaces

**Interface simplifiée**

- interface la plus restrictive
- destinée aux utilisateurs finaux
- permet de créer un ticket, suivre ses tickets, accèder aux réservations et à la FAQ

**Interface standard**
 
- Interface principale de GLPI
- Tous les modules y sont disponibles en fonction des droits de chacun
- Utilisée pour les tâches techniciens, d'administration et de configuration
- 3 vues de travail : personnelle, groupe et globale

#### Démo GLPI
Rien

#### Atelier 5 : Utilisation GLPI

Voir TP

<a href="#toc">Retour au sommaire</a>

### Gestion des actifs de services et des configurations

#### Objectifs

**Objectif**:

- Identifier, contrôler et enregistrer les actifs de services et les éléments de configuration (**CI** Configuration Item, les "baselines")
- Editer des rapports sur l'état des actifs de services et des éléments de configuration
- Protéger l'intégrité des actifs de services et des éléments de configuration
- Gérer un système de gestion de configuration (**CMS** Configuration Management System)

#### Elements

**Elément de configuration**

- Un élément de configuration, dénommé **CI**, est un composant du SI qui va contribuer à la fourniture d'un ou plusieurs services
- Identifiable par un type et un ensemble d'attributs pour le décrire
- Relation possible avec d'autre **CI**: situation, physique et fonctionnelle


#### Exemples

**Exemples d'éléments de configuration**

- Composants matériels
- Composants logiciels
- Equipements réseau
- Equipements téléphoniques
- Composants d'infrastructure
- Ressources utilisateurs
- Element environnementaux
- Documentations 
- Procédures d'exploitation

#### Activités

**Activités : planification initiale**

- Définir le périmètre, la stratégie, la politique de gestion des éléments de configuration
- Connaître les outils et les données des différents composants existants (véracité et mise à jour) : analyse de l'existant
- Sélection, configuration et modélisation du CMS/CMDB (type de CI, relations)
- Chargement initial
- Nomination du propriétaire, des acteurs clés avec leurs rôles et responsabilités
- Formation des collaborateurs

**Activités : planification itérative**

- Chargement des CMDB
- Ajustement des procédures, rôles et responsabilités

![cycle de vie actif](../ressources/img/07-itil-glpicycle-vie-gestion-actif.png)

#### Les outils

- **CMDB** Configuration Management Database : Bdd de l'outil de gestion associé. 
	Contient des enregistrements CI.
- **CMS** Configuration Management System : Ensemble d'outils pour gérer les données de configuration. 
	Prend les données de plusieurs CMDB pour constituer une CMDB fédérée.
- **DML** Definitive Media Library : Lieu de stockage sécurisé des CI logiciels.
	Référence pour tous les logiciels : contient les médias, documentations et clés de licence associées.

<a href="#toc">Retour au sommaire</a>

### Gestion des mises en production et des déploiements

- Valide, organise et planifie le déploiement des servcies (nouveaux ou mis à jour) de façon "industrielle", en garantissant la valeur apportée, dans le respect des SLA.
- Crée et fournit le document à l'exploitation des services.
- S'assure que les utilisateurs ont reçu les informations et sont formés pour utiliser les nouveaux services.
- Gestion des versions, convention de nommage, le RACI, les délais, etc.

|| Fonction1 | Fonction2 | Fonction3 |
|:--|:--:|:--:|:--:|
| Activité 1 | A | R,C | C |
| Activité 2 | A,I | R | C |
| Activité 3 | A | R | C |
| Activité 4 | A | R | C,I |
| Activité 5 | A | R | C,I |

- **R Responsible** : celui qui réalise la tâche
- **A Accountable** : celui qui valide. Le Responsable
- **C Consulted**   : celui qui est consulté. L'Expert.
- **I Informed**    : celui qui doit obligatoirement être informé. 

#### Les différents modes de déploiements

- **Mode Push** : le déploiement est l'initiative d'un centre vers les sites utilisateurs cibles. Déploiement d'une mise à jour sur l'ensemble des utilisateurs concernés.
- **Mode Pull** : le déploiement est mis à disposition des utilisateurs sur un serveur. Les utilisateurs vont initier le déploiement à leur convenance.
- **Big Bang**  : le déploiement est effectué en une seule opération vers tous les utilisateurs.
- **Par phase** : le déploiement s'effectue selon un plan en tenant compte des périmètres définis par le client.
- **Manuel**    : Déploiement avec l'aide du personnel de la DSI avec contrôles et surveillance.
- **Automatique** : Fortement conseillé, déploiement sans l'aide du personnel de la DSI.

<a href="#toc">Retour au sommaire</a>

### Gestion de l'évaluation des changements

- Mesure l'impact des changements, en évaluant les effets, les impacts et les risques.
- Crée la revue de post-implémentation (PIR)
- Indépendante de la gestion des changements

<a href="#toc">Retour au sommaire</a>

### Validation et tests

- Garant du bon fonctionnement des services (nouveaux et màj) après et de la gestion des erreurs découvertes pendant les phases d'intégration, de préprod et de post-mise en prod.
- Création de procès-verbaux de recette (fonctionnelle, performance, d'exploitabilité, de service régulier).

<a href="#toc">Retour au sommaire</a>

### Gestion de la planification et le support à la transition

Organise le ou les changements de services (nouveaux ou mise à jour) et gère les ressources nécessaires (humaines et matérielles).

<a href="#toc">Retour au sommaire</a>

### Gestion de la connaissance

#### Objectifs

- Donner de l'info à un collaborateur avec la granularité dont il a besoin.
- Fournir une info compréhensible et fiable.
- Permettre une prise de décision à tous les instants du cycle de vie.
- Permettre d'optimiser et de fiabiliser les prises de décision (efficience).
- Permettre d'enregistrer les situations déjà connues.
- Mettre en place et faire vivre un système de gestion de la connaissance.
- Gérer l'information.
- S'assurer de la bonne utilisation de la base de connaissance.
- **SKMS** Service Knowledge Management System

#### Gestion de l'information

- Identifier les exigences, les contraintes, les spécifications des données traitées 
- Définir une architecture permettant de supporter ces données
- Définir des outillages appropriés pour mettre en œuvre cette architecture
- Écrire les procédures qui vont faire vivre ces données
- Effectuer une analyse précise de l'état des lieux en matière de gestion de la connaissance
- Appréhender cette spécificité pour mieux bâtir une solution adaptée
- Évaluer la performance des bases de connaissances et être force de propositions pour l'amélioration des bases

#### Bonne utilisation de la base

- Savoir si ce que l'on a mis en place sert à quelque chose ou si des collaborateurs l'utilisent
- Comprendre qui partage la connaissance, qui capitalise la connaissance de l'entreprise
- L'important n'est pas une base de connaissances contenant beaucoup d'informations, mais une base de connaissances qui est utilisée
- Gérer la promotion, l'information, la formation sur les bases de connaissances

<a href="#toc">Retour au sommaire</a>

### GLPI : Gestion de parc

#### Menu Parc
- Affichage par défaut des ordinateurs
- Possibilité de personnaliser les colonnes affichées
- Menu de recherche avancée
- Export possible des données sous différents formats
- Sélection du nombre d'éléments à afficher par page
- Navigation entre les pages 
- Affichage possible de la corbeille 

#### Recherche basique multicritères

- Possibilité de recherches combinant plusieurs critères
- Combinaison possible de critères à l'aide d'opérateurs logiques
- Opérateurs logiques disponibles : ET/OU – ET PAS/OU PAS
- S'applique à un grand nombre de paramètres de l'objet concerné
- Plusieurs critères de recherches selon le paramètre choisi : Contient, Est, N'est pas, Sous, Pas sous, Avant, Après, etc.) 
- Critères globaux de recherche possibles


#### Recherche avancée

- Possibilité d'utiliser des caractères spéciaux pour les recherches
- "NULL" : S'assurer qu'un champ est vide
- "<Nb ou >Nb" : Utilisé dans le cas des dates, prend un nombre de mois
- "^" : Tester le début d'un champ
- "$" : Tester la fin d'un champ
- "^$" : Tester une valeur exacte pour un champ
- "[Année]-[Mois]-[Jours]" : Tester un champ date


#### Recherche sauvegardée

- Possibilité de sauvegarder ses recherches
- Création d'une recherche sauvegardée
	+ Un nom
	+ Une visibilité/portée
	+ Entité de rattachement avec ou sans récursivité
	+ Comptage
- Accès à ses recherches 


#### Modification massive

- Pour effectuer une modification sur un ensemble d'éléments
- Utilisé conjointement aux recherches avancées
- Généralement appliquée sur tous les éléments retournés d'une recherche
- Plusieurs actions possibles

#### Fiche élément


- Accessible en cliquant sur un élément 
- Contient toutes les informations de l'élément
- Menu de navigation vertical sur la gauche
- Certains onglets communs à tous les éléments
- Possibilité d'afficher tous les onglets sur la même page
- Navigation possible entre les fiches des éléments de la page courante

#### Démo Gestion de parc et de la base de connaissance dans GLPI
Rien

#### Atelier 6
Rien - voir TP


<a href="#toc">Retour au sommaire</a>
## Module 5 - Les publications centrales : Exploitation des services
<a href="#toc">Retour au sommaire</a>
### L'exploitation des services
#### objectifs
- Coordonner les activités des processus garantissant l'atteinte des niveaux de service convenus
- Gérer l'exploitation au quotidien

#### Ses missions

- Coordonner et réaliser les activités nécessaires à la fourniture des services (ex. Exploitation, Supervision, Pilotage, Support, Maintenance).
- Etre efficace puis efficient tout au long de la vie des services (coût).
- Produire des indicateurs pour permettre à la phase d'amélioration continue de faire des propositions d'optimisation de la DSI.

#### Caractéristiques

**Stabilité** :

- le SI fonctionne normalement et est disponible : on ne change plus rien.
- Réduction du nombre de changements et donc de **MEP** Mises en Production au minimum.

**Réactivité**

- Réaction aux sollicitations des métiers pour les rendre les plus performantes possibles.

**Coûts par rapport à qualité**

- Eviter la surqualité, réduire les coûts en gardant le niveau de qualité demandé : industrialisation de l'exploitation, supervision et pilotage.

**Réactivité par rapport à proactivité**

- Agir en fonction des évènements ou incidents.
- Essayer d'anticiper en recherchant des moyens d'optimiser le SI.
- Investir pour garantir un bon fonctionnement.

### Les 4 fonctions ITILv3

Ce sont le **Centre de services**, la **Gestion technique**, la **Gestion des opérations**, la **Gestion des applications**.

![Les 4 Fonctions ITILv3](../ressources/img/07-itil-glpifonctions-itil.png)


<a href="#toc">Retour au sommaire</a>

### Le centre de service : au coeur de l'exploitation

![Centre de Services](../ressources/img/07-itil-glpicentre-services.png)


<a href="#toc">Retour au sommaire</a>

### Fonction centre de service
#### Ses missions
 
Les missions du Centre de Services sont :

- Le "Service Desk"
- Etre point de contact unique pour les utilisateurs
- Porter toute la relation avec les utilisateurs : relation bidirectionnelle
- Servir les utilisateurs et les satisfaire
- Garantir la bonne image de la DSI auprès des utilisateurs
- Etre vitrine du département informatique
- Répondre aux questions et demandes des utilisateurs
- Restaurer le service dans un état normal, standard le plus rapidement possible dans le respect des délais définis et contractuels
- Assurer les activités de N1, gérer les escalades aux groupes supérieurs et coordonner 

#### Les concepts

- **Centre d'appel** ("Call Center")        : Compétences étendues à tout type de demandes
- **Centre d'assistance** ("Help Desk")     : Compétences de résolution d'incidents de 1er niveau 
- **Centre de services** ("Service Center") : Faibles compétences



<a href="#toc">Retour au sommaire</a>

### Le centre d'appels

Il est le niveau 0 :
	
- Gère très peu d'actions, amène une forte frustration des utilisateurs
- Transfert le ticket d'appel


- Prendre des appels
- Passer des appels en masse
- Un standard téléphonique est en place
- On l'appelle / Il nous rappelle
- On s'identifie (nom, numéro de contrat, etc.)
- On explique les raisons de l'appel
- La réponse du centre d'appel est souvent : "On vous rappellera", "Un technicien vous rappellera"
- Très peu de valeur ajoutée, réponse minimale pour l'appelant



<a href="#toc">Retour au sommaire</a>

### Le centre d'assistance

Le centre d'assistance...

- Est là en support des utilisateurs qui appellent
- Répond aux sollicitations des utilisateurs
- À peu ou pas d'actions proactives vers les utilisateurs

- Gère les pannes et les dysfonctionnements remontés par les utilisateurs
- Gère et coordonne toutes les activités liées au dépannage de l'utilisateur
- Donne des informations sur l'avancement du dépannage si l'utilisateur le demande
- Est dans des actions de type réactif
- Attend que l'utilisateur appelle pour le renseigner

<a href="#toc">Retour au sommaire</a>

### Le centre de service

Le centre de service est un sur-ensemble du centre d'assistance en ajoutant des activités de proactivité.

- Intervient dans tous les processus de l'exploitation des services
- Et dans une partie des activités de deux processus de la transition des services
	+ La gestion des changements
	+ La gestion des déploiements et des mises en production

Ses **activités** sont...

- La prise en compte de l'appel de l'utilisateur
- Ouverture du ticket d'appel dans l'outil de gestion du centre de services
- Enregistrement des informations liées à l'appel de l'utilisateur
- La catégorisation
- La codification
- L'investigation et le diagnostic
- La réponse dépendra de la demande utilisateur
- Escalade vers les groupes support de niveau 2 et de niveau 3 si nécessaire
- Le suivi de l'appel
- La résolution / clôture du ticket
- La gestion des enquêtes de satisfaction des utilisateurs
- La mise à jour de la base de connaissances


#### Configuration et architecture

Va dépendre de différents paramètres: 

- Le périmètre (fonctionnalités, horaires, etc.)
- La typologie des appels gérés
- Les périodes de charge et les périodes creuses
- Les moyens nécessaires (les outils)

4 types d'architecture :

- Le centre de services **local**
- Le centre de services **centralisé**
- Le centre de services **virtuel**
- Le centre de services **qui suit le soleil**

#### Le centre de service local

**Définition**

- Implémenté sur le même site que les utilisateurs
- Architecture souvent représentée par un guichet, un bureau où les utilisateurs peuvent venir
- Implémente des environnements très spécialisés avec des besoins spécifiques

**Avantages**

- Proximité des utilisateurs
- Forte réactivité, délai d'intervention rapide 
- Meilleure compréhension de la problèmatique des utilisateurs
- Connaissance des utilisateurs eux-mêmes

**Inconvénients**

- Pas de mutualisation des ressources et leur optimisation
- Moins de partages de connaissance avec les autres centres de services locaux

![Support Niveau 1](../ressources/img/07-itil-glpicentre-services-1.png)

#### Le centre de service centralisé

**Définition**

- Implanté sur un site unique
- Externalisé
- Contacté par des canaux de télécommunication (téléphone, e-mail, intranet)

**Avantages**

- Mutualisation des ressources et des moyens
- Meilleur partage de l'information et des connaissances : Procédures homogènes

**Inconvénients**

- Pas de proximité avec les utilisateurs
- La réactivité sera moins forte 

**Pour limiter ces inconvénients**

- Outils de prise en main à distance, technicien de proximité, mixité centre de service local.

![Centre de Service centralisé](../ressources/img/07-itil-glpicentre-service-centralise.png)

#### Le centre de service virtuel

**Définition**

Mettre le demandeur en relation avec le technicien possédant le meilleur profil, en fonction de l'heure, du pays ou du site d'appel, du profil de l'utilisateur appelant ou du métier du demandeur. 

**Avantages**

Une meilleure crédibilité et réactivité.

**Inconvénients**

- Mise en place d'outils téléphoniques spécifiques avec SVI
- Problème de coordination des différentes entités
- Pour limiter ces inconvénients : utilisation d'un responsable unique

![Centre de Service virtuel](../ressources/img/07-itil-glpicentre-service-virtuel.png)

#### Le centre de service "qui suit le soleil"

- Couvre une problématique particulère 
- Fonctionne 24h/24
- Réparti dans plusieurs entités aux 4 coins du monde dans des faisceaux horaires différents
- A toute heure du jour ou de la nuit, l'appel est aiguillé vers un centre ou une équipe de jour présente
- Choix des moyens et des outils
- Avoir des procédures et des escalades communes et partagées 
- Avoir une langue commune (souvent anglais)

![Centre de Service qui suit le soleil](../ressources/img/07-itil-glpicentre-service-soleil.png)

#### Le centre de service : les outils

- L'autocommutateur téléphonique intelligent
- Serveur vocal interactif
- Couplage téléphonique informatique
- Logiciel de relation utilisateur (CRM)
- Intégration avec les autres outils
	+ le CMS
	+ la base des erreurs connues (KEDB)
	+ la gestion documentaire de l'entreprise (SKMS)
	+ les outils de gestion de services
- Centre de service dit en libre-service (utilisateurs autonomes)

#### Les processus de l'exploitation des services

- **L'exécution des requêtes** : traiter les demandes de services provenant des utilisateurs
- **La gestion des accès** : traiter les requêtes relatives à l'accès, aux droits et aux privilèges des utilisateurs
- **La gestion des incidents** : restaurer au plus vite le servie dégradé ou arrêté dans les délais impartis.
- **La gestion des problèmes** : rechercher les causes et solutions à des incidents récurrents
- **La gestion des évènements** : interpréter et gérer tous les faits détectables qui arrivent sur l'infrastructure, qu'ils soient normaux ou anormaux.


##### L'execution des requêtes
**Objectifs**

- Fournir un canal privilégié vers la DSI aux utilisateurs pour émettre et traiter leurs demandes
- Fournir de l'assistance auprès des utilisateurs sur l'utilisation des services
- Approvisionner des composants standards des services suivant les demandes des utilisateurs
- Fournir un canal pour faire remonter les plaintes des utilisateurs vers la DSI

**Une requête** : Demande de service provenant d'un utilisateur

- Assistance
- Conseil
- Information
- Changement standard simple
- Approvisionnement de consommable
- Accès à un service
- Une plainte
- Tout ce qui n'est pas un incident

**Une requête va réaliser une action**

- Limitée dans le temps 
- A faible risque et coût
- Traitée par une seul personne

**Le Catalogue des Requêtes**

- Base de fonctionnement de ce processus
- Liste détaillée des demandes de services provenant des utilisateurs
- Identifie précisément quel profil d'utilisateur a le droit de demander telle requête
- Diffusion et promotion de ce catalogue auprès de tous les utilisateurs sont un enjeu majeur

##### La gestion des accès

**Ojectifs**

- Mettre en place les procédures définies par 
	+ la politique de sécurité de la DSI
	+ les recommandations de la gestion de la disponibilité
	+ les procédures doivent aussi être connues et diffusées auprès de tous
- Fournir aux utilisateurs les droits et privilèges d'un service ou d'un groupe de services

**Les droits** : ensemble des règles qui vont définir les types d'accès à un service ou un groupe de services

**L'identité** : gestion d'une identification fiable des utilisateurs qui vont accéder à ce service.

**L'accès au service** 

- est le niveau, le périmètre de fonctionnalités ou de données auquel un utilisateur peut avoir accès
- Notions de confidentialité, gestion des mots de passe et règles associées (initialisation, validation et revalidation)

**L'identité des groupes**

- Cartographie des groupes de l'entreprise nécessaire
- Notions de groupe de services offerts à un utilisateur ou groupe d'utilisateurs
- Cartographie des services mettant en avant les familles de services en fonction des droits



##### La gestion des incidents

**Objectifs**

- Rétablir le service dans un état normal de plus rapidement possible conformément au SLA
- Rétablir c'est trouver une solution, un palliatif, qui va relancer le service dans son état normal
- Minimiser l'impact de l'incident sur les utilisateurs (les conséquences pour l'utilisateur)
- Rétablir le service dans les délais contractuels (engagement auprès du client) 
- Ce processus ne s'occupe pas de trouver la cause de l'incident

**Définition d'un incident**

- Ne pas confondre incident, évènement et problème
- Un évènement est un fait détectable qui arrive du SI alors que l'incident est un évènement qui altère ou dégrade le service rendu
- Il survient lorsque le service est arrêté ou quand la qualité du service est diminuée
- L'incident a pour origine un évènement (détecté ou non), mais tous les évènements ne créent pas d'incident 
- Il est détecté soit par un utilisateur, des outils de supervision ou de pilotage par la gestion des évènements


**Codifier un incident** c'est déterminer la priorité que l'on va lui attribuer.
Pour cela :

- identifier l'impact de l'incident 
- identifier l'urgence de l'incident
- utilisation d'une matrice ou d'un référentiel applicatif

**Determiner le délai de rétablissement** : toutes ces notions devront être notées dans les SLA pour chaque service et négociées avec les clients avant la mise en exploitation du service.

![Codes priorité](../ressources/img/07-itil-glpirfc-priorite.png)

<table class="table_priorite">
	<thead>
		<tr>
			<th class="table_header">Code priorité</th>
			<th class="table_header">Description</th>
			<th class="table_header">Durée de résolution</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="row_red">1</td>
			<td class="row_red">Critique</td>
			<td class="row_red">1 heure</td>
		</tr>
		<tr>
			<td class="row_red">2</td>
			<td class="row_red">Elevée</td>
			<td class="row_red">8 heures</td>
		</tr>
		<tr>
			<td class="row_orange">3</td>
			<td class="row_orange">Moyen</td>
			<td class="row_orange">24 heures</td>
		</tr>
		<tr>
			<td class="row_green">4</td>
			<td class="row_green">Faible</td>
			<td class="row_green">48 heures</td>
		</tr>
		<tr>
			<td class="row_green">5</td>
			<td class="row_green">Planification</td>
			<td class="row_green">Best effort</td>
		</tr>
	</tbody>
</table>

**L'incident majeur**

- Fort impact sur le client
- Hors grille de codification
- D'une priorité très élevée
- Traité différemment des autres incidents
- Utilisation d'une procédure dite de "crise"

**Les escalades**

- **Escalade fonctionnelle** : survient qd une équipe est dans l'incapacité de réaliser un traitement (diagnostic ou rétablissement). 
	+ Transfert vers un niveau supérieur ou de mêmes niveaux d'expertise, mais dans un autre domaine.
- **Escalade hiérarchique** : survient pour une situation particulière.
	+ incidents majeurs potentiels
	+ impact fort sur les branches métier
	+ blocage dû à un manque de ressources, moyens, etc. 
	
**Concept**

- Période de fourniture des services : Définir un calendrier d'utilisation des services
- Arbre de résolution
	+ Modèle d'incident – Branche de l'arbre la plus souvent parcourue
	+ Listing de dépannage – Check-list 
- Base de connaissance : Liste des incidents connus et leurs solutions
- Incident majeur : Gravité importante pour les clients
- Crises : Incident majeur à résoudre tout de suite. Peut donner suite à un Post-Mortem

![Gestion des incidents](../ressources/img/07-itil-glpigestion-incident.png)

##### La gestion des problèmes

**Objectifs**

- Faire diminuer le nombre d'incidents
- Prévenir l'apparition de nouveaux incidents et problèmes
- Minimiser l'impact des incidents
- Optimiser l'efficacité des équipes supports
- Contrôler les problèmes : Les transformer en erreurs connues
- Gérer les erreurs
- La proactivité
- Participe à maintenir le niveau de qualité de service demandé
- Prend l'initiative de la recherche de situations qui dégradent ce niveau

**Un problème**

- Situation dont on recherche la cause inconnue d'un ou plusieurs incidents
- La gestion des incidents traite en temps réel les situations (front line)
- La gestion des problèmes traite les causes de ces situations (back-office)
- Tous les incidents ne déclenchent pas de problèmes
- On ouvre un problème dans le cas d'incidents récurrents ou dans un contexte d'incident majeur

**Une erreur connue**

- Problème dont on connait la cause et dont on a identifié une solution temporaire ou définitive
- La base des erreurs connues (**KEDB**) contient l'ensemble de ces problèmes transformés en erreurs connues
- Base mise à disposition du centre de services sous la responsabilité des groupes support

![Gestion des Problèmes](../ressources/img/07-itil-glpigestion-problemes.png)


##### La gestion des évènements

**Objectifs**

- Minimiser le nombre d'incident (objectif principal)
- Garantir le niveau de qualité de service (anticiper les situations, être proactif)

**Définition d'un évènement**

- Fait détéctable arrivant sur le SI ou sur la fourniture d'un service
- Changement d'état d'un ou plusieurs composants de l'infrastructure
- Aléatoire, observable et mesurable
- Des outils sont nécessaires pour le détecter et le mesurer
- Sans outillage, pas d'évènements

**4 types d'évènements**

- Normal
- Exception
- Avertissement
- Alerte (ou alarme)

- **Evènement normal** : indique un fonctionnement... normal, dans la Baseline
- **Evènement Exception**: évenement anormal.
	+ Peut être visible par les utilisateurs sans dégrader le niveau de qualité de service offert.
	+ Peut se transformer en *incident* si la situation impacte le niveau de qualité de service.
- **Evènement avertissement** : Evènement inhabituel, un avertissement (approche d'un seuil critique, un pic d'activité)
- **Evènement alerte** : exception nécessistant une intervention
	+ prédéfini en avance avec positionnement d'un seuil
	+ des consignes pré-établies vont permettre d'intervenir
	+ un travail préliminaire sur l'identification des seuils est nécessaires

![Gestion des Evènements](../ressources/img/07-itil-glpigestion-evenements.png)

<a href="#toc">Retour au sommaire</a>


## Module 6 - Savoirs, savoir-faire, savoir-être
<a href="#toc">Retour au sommaire</a>


### Rôle du technicien support

- Régler les incidents et les problèmes rencontrés par les utilisateurs
- Diagnostiquer un incident - Effectuer une réparation matérielle
- Proposer une solution de contournement 
- Commander et changer des matériels défectueux
- Installer du nouveau matériel (intégrer et gérer un réseau) 
- Surveiller la sécurité
- Former les utilisateurs

<a href="#toc">Retour au sommaire</a>

### Compétences requises

- Le savoir / **Connaissance** : faculté mentale produisant une assimilation par l'esprit d'un contenu objectif préalablement traduit en signes et en idées.
- Le savoir-faire / **Compétence** : compétence acquise par l'expérience dans les problèmes pratiques, dans l'exercice d'un métier.
- Le savoir-être / **Aptitude** : correspond à la capacité de produire des actions et des réactions adaptées à l'environnement humain et écologique


<a href="#toc">Retour au sommaire</a>

### Compétences et profils

- Compétences professionnelles :
	+ Connaissances système
	+ Connaissances réseau
	+ Connaissances de l'ERP et du métier du client (workflow) 
- Profils
	+ Sens de l'écoute
	+ Calme
	+ Qualités relationnelles
	+ Efficacité
	+ Organisation
	+ Veille technologique

<a href="#toc">Retour au sommaire</a>

### Savoirs - connaissances

- il faut une bonne base de connaissance
- il faut une bonne veille technologique

- Documentez les bonnes pratiques
- Partagez les solutions pour les incidents communs
- Permettez aux utilisateurs finaux de résoudre par eux-mêmes leurs incident
- Facilitez les recherches en rendant visible les articles qu'aux personnes nécessaires
- Partagez vos idées, vos expériences, votre veille technologique

**Avantages**

- Solutions pour les utilisateurs finaux 24/7 par un navigateur web
- Réduit la charge de travail du service helpdesk
- Améliore la productivité générale et donc l'efficience
- Facilité d'utilisation et de partage
- Réduction des temps de résolution qui permet de respecter les SLA

<a href="#toc">Retour au sommaire</a>

### Savoir-faire - compétences

Désigne la mobilisation d'un ensemble de ressources en vue de résoudre une situation complexe.


- La communication
- La communication externe tente de répondre à l'un des objectifs suivant
	+ Faire passer une information, une connaissance ou une émotion
	+ Créer un langage commun pour faciliter la compréhension (ITIL) 
	+ Créer une relation pour être connu et ainsi fidélisé
	+ Créer une influence pour inciter l’autre
- La communication interne permet 
	+ Implication
	+ Adaptation au changement 
	+ Bonne ambiance
	+ Disparition des rumeurs
	
- Communication verbale vs non-verbale (bullshitomètre:9000)
- La technique (questionner le client, analyser ses besoins, reformuler pour confirmer) = methode de centre d'appel
- Questionnement ouvert (généraliser) vs questionnement fermé (spécifier)
- L'ecoute
- La reformulation
- Communication écrite : adapter son écrit en fonction de son interlocuteur

Problèmes posés par la messagerie :

- stress
- surcharge
- urgence
- interruption
- dépersonnalisation de la relation
- aplatissement des structures hiérarchiques
- à ne pas confondre avec le chat
- mauvaise interprétation
- attention à la gestion de la confidentialité

	
p158

<a href="#toc">Retour au sommaire</a>

### Atelier 7 et 8



<a href="#toc">Retour au sommaire</a>

### Savoir-être - Aptitudes


#### Compréhension verbale

<a href="#toc">Retour au sommaire</a>
### Atelier 7

<a href="#toc">Retour au sommaire</a>
## Module 7 - Assistance avec GLPI


<a href="#toc">Retour au sommaire</a>
### Le ticket


<a href="#toc">Retour au sommaire</a>
### L'assistance sous GLPI


<a href="#toc">Retour au sommaire</a>
### Flux d'entrée


<a href="#toc">Retour au sommaire</a>
### Traitement d'un ticket 
#### Aperçu


<a href="#toc">Retour au sommaire</a>
### Traitement d'un ticket 
#### Attribution
#### Observateurs
#### SLA
#### Validation
#### Clôture

<a href="#toc">Retour au sommaire</a>
### Cycle de vie d'un ticket


<a href="#toc">Retour au sommaire</a>
### Ticket : éléments liés


<a href="#toc">Retour au sommaire</a>
### Base de connaissance

#### Publique
#### Article
#### Création
#### Cible

<a href="#toc">Retour au sommaire</a>
### Démo


<a href="#toc">Retour au sommaire</a>
### Atelier 7,9 et 10



<a href="#toc">Retour au sommaire</a>




## Module 8 - Les publications centrales : Amélioration continue des services

<a href="#toc">Retour au sommaire</a>
### Amélioration continue des services

#### Objectifs

- Analyser les résultats des différents contrats (SLA, OLA, UC) 
- Identifier et mettre en oeuvre toutes les actions conduisant à l'amélioration des services
- Améliorer la rentabilité sans diminuer la qualité : l'efficience
- Améliorer la relation client 
- S'assurer que les méthodes de gestion sont efficaces


#### Ses Missions

- Analyser les évolutions et les tendances
- Conduire les enquêtes de satisfaction et les audits internes
- Émettre des préconisations d'amélioration
- Conduire les revues de l'amélioration continue des services

#### Les Indicateurs

- Les Key Performance Indicators
- Les Critical Success Factor 
- Les bases de références
- La mesure des services
	+ Métriques techniques (ne pas communiquer au client) 
	+ Métriques de processus
	+ Métriques de services (à communiquer au client)


#### Roue de Deming : PDCA plan-do-check-act

Meh ?

#### Atelier 7

<a href="#toc">Retour au sommaire</a>

## Glossaire
- **Roue de Deming** : PDCA plan-do-check-act
- - **PDCA** plan-do-check-act : Roue de Deming (amélioration continue des services)
- **SKMS** Service Knowledge Management System
- **ASP** Application Service Provision : fournir le service directement au client final via l'infrastructure de l'informatique d'un fournisseur
- **BCM** Business Capacity Management : gestion de la capacité orientée métier (futurs besoins)
- **BCM** Business Continuity Management : analyse et gestion, quels sont les risques et leurs impacts ?
- **BCP** Business Continuity Plan = **PCA** Plan de Continuité d'Activité : orienté métier, quelles sont les activités opérationnelles et leurs ressources que vais-je maintenir ?
- **BIA** : méthode d'analyse de l'impact business qui permet d'évaluer les pertes potentielles.
- **BPO** Business Process Outsourcing : sous-traitance fonctionnelle d'une application, d'un processus métier (la paie, la comptabilité)
- **CAB** Change Advisory Board            : comité consultatif qui évalue et donne un avis sur la mise en oeuvre des changements dits normaux.
- **Catalogue de services** : document regroupant l'ensemble des services
- **CCM** Component Capacity Management : gestion de la capacité des composants (ressources disponibles)
- **CI** Configuration Item                : composant du SI qui va contribuer à la fourniture d'un ou plusieurs services. 
- **CMS** Content Management System        : logiciel de gestion des CI, de la base connaissance, etc.
- **DRP** Disaster Recovery Plan = **PCA** Plan de Reprise d'Activité : plan de rétablissement et reprise informatique.
- **ECAB** Emergency Change Advisory Board : comité qui donne l'autorisation de traiter le changement en urgence.
- **FMD**
- **KPO** Knowledge Process Outsourcing : appel à un ou plusieurs consultants externes pour leurs connaissances sur les métiers ou la technologie.
- **OLA** Operationnal Level Agreement : accord de niveaux de services **conclu avec les fournisseurs internes**
- **PCA** Plan de Continuité d'Activité
- **PIR** Post Implementation Review       : comité qui analyse les résultats des mises en production des changements.
- **RFC** Request For Change.
- **SCM** Service Capacity Management : gestion de la capacité orientée services (performances actuelles)
- **Service Owner** : propriétaire de service. Responsable du suivi du service.
- **SI** Système d'Information
- **SIP** Service Improvement Program : programme d'amélioration des services
- **SLA** Service Level Agreement : accord de niveaux de services **conclu avec le client** (contrat)
- **SLM** Service Level Manager : responsable de la gestion des niveaux de services
- **SLR** Service Level Requirement : expression des besoins de client
- **SPOF** Single Point Of Failure
- **TMA** Tierce Maintenance Applicative : maintenance corrective applicative
- **UC** Underpinning Contract : contrat de **sous-traitance**
- Cycle de vie des services
- Fonction
- Modele RACI
- Processus
- Rôle
- Valeur d'un service
- **CMDB** Configuration Management Database : Bdd de l'outil de gestion associé. 
- **CMS** Configuration Management System : Ensemble d'outils pour gérer les données de configuration. 
- **DML** Definitive Media Library : Lieu de stockage sécurisé des CI logiciels.
- **MEP** Mise en Production
- **KEDB** Known Errors Database : base de données des erreurs connues

<a href="#toc">Retour au sommaire</a>


<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">

<style>

img {
  border: 1px solid black;
  display: block;
  max-width: 600px;
  max-height: 600px; 
  margin: 0 auto;
}


.table_priorite {
	font-weight: bold;
	color: white;
	text-align: center;
}

.table_header {
	background-color: 	#336699;
}

.row_red {
	background-color:  #cc3333;
	border: 2px solid white;
}

.row_orange {
	background-color:   #ff4000;
	border: 2px solid white;
}

.row_green {
	background-color:  #00994d;
	border: 2px solid white;
}


</style>