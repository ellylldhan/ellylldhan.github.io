title: mod1-notes-intro

# ENI TSSR 08 - Réseau & Téléphonie sur IP (ToIP)

Du 07/06 au 17/06/2022<br>
Formatrice : Elisabeth LEFRANC

<span id="toc"></span>

[TOC]


## Module 1 - Intro


**Objectifs** :

- Representer le modèle OSI
- Expliquer le principe d'encapsulation
- Expliquer le principe de dés-encapsulation
- Connaître le fonctionnement des couches du modèle OSI
- Voir les champs d'une trame
- Voir les champs d'un paquet
- Manipulation d'un outil d'analyse réseau (WireShark)
- Comprendre le routage statique

### Présentation du modèle OSI

OSI = Open System Interconnection

Représente la communication entre systèmes d'information en réseau, présenté en 7 couches indépendante et communicantes.

**PDU** (Protocol data unit) : unités de données de protocole.

- unité de mesure des données échangées dans un réseau.
- constituée de plusieurs éléments distincts :
	+ des infos de contrôle de protocole (**PCI** Protocol Control Information)
	+ des unités de données de service (**SDU** : Service Data Unit)


#### Les couches

- 7. Application : point d'accès au réseau
- 6. Presentation : traduction des données
- 5. Session : Fiabilisation de la communication
- 4. Transport : transmission de bout en bout en tre applications / Segmentation des données
- 3. Réseau : transmission de bout en bout entre PC / Routage
- 2. Liaison : transmission de point à point
- 1. Physique : transmission du signal

| #  | Couche       | Rôle | Description |
|:--:|:-------------|:-----------------------|:------------|
|7.| Application  | Point d'accès au réseau       | - communication entre application<br>- communication entre l'utilisateur et les applications<br>- entrée et sortie des données |
|6.| Présentation | Traduction des données        | - chiffrement / déchiffrement<br>- compression / décompression<br>- formatage des données (dédiées / non-dédiées) |
|5.| Session      | Fiabilisation des données     | - Authentification entre les PC<br>- Synchronisation des échanges<br>- création de points de contrôle |
|4.| Transport    | Segmentation des données      | - transmission de bout en bout entre applications<br>- contrôle de flux (segmentation et réduction de l'encombrement)<br>- communication entre même type d'applications (ports) |
|3.| Réseau       | Routage | - transmission de bout en bout entre PC<br>- communication entre les PC expéditeur et destinataire<br>- choix de la meilleure route (routage)<br>- adressage logique (adresses IPv4 &amp; IPv6)|  
|2.| Liaison      | Transmission de point à point | 
|1.| Physique     | Transmission du signal        |



[refaire page 7 dans drawio]

<a href="#toc">Retour au sommaire</a>

<link rel="stylesheet" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" href="../ressources/css/style.css">

