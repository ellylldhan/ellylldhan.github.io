title: notes

# ENI TSSR 17 - Supervision
Cours TSSR *"Supervision avec Centreon"* @ ENI (2023)

<table>
<tr><th>Dates     :</th><td>du 06/03 au 10/03/2023</td></tr>
<tr><th>Formateur :</th><td>Guillaume CHERAMY</td></tr>
</table>

id: 150

*150 - Supervision avec Centreon*

[TOC]

## Sommaire

1. La supervision
2. Le protocole SNMP 
3. Le protocole NRPE
4. Solution de supervision Centreon 
5. Les commandes de supervision
6. Configuration Centreon 
7. Notification et actions d'exploitation
8. La supervision distribuée

## 1. La supervision
### 1.1 Présentation
La supervision informatique est un ensemble de mécanismes de surveillance pour assurer le bon fonctionnement d'un système ou d'un service. Sa mise en oeuvre dans un réseau informatique d'entreprise apporte ou complète les aspects fonctionnels suivants.

La **prévention des incidents** :

- Détection des pannes
- Localisation
- Réparation

L'**audit des performances**, en se basant sur les éléments suivants :

- Le temps de réponse
- Le débit
- Le taux d'erreur par bit
- La disponibilité

Le **suivi de l'évolution** de son infrastructure :

- Identifier les différents éléments de son infrastructure
- Conserver un état des différents changements intervenus
  
Pour son fonctionnement, la supervision s'appuie sur :

- La collecte d'information
- Le contrôle de l'état du système
- La sauvegarde de l'état d'un historique

4 types de supervision sont définis, avec une gradation dans l'implication humaine nécessaire pour la correction des pannes : 

- **inactif** : pas de supervision ou alarmes ignorées
- **réactif** : pas de supervision ou réaction aux problèmes lorsqu'ils surviennent
- **interactif** : supervision présente mais la correction des pannes demande une intervention humaine
- **proactif** : supervision, détection des causes réelles 


### 1.2 Objectifs
Les principaux objectifs sont la prévention d'incidents, le raccourcissement de la durée entre l'incident et son constat (avec une influence directe sur le temps de résolution) et la possibilité d'analyse et de rapports.

Permet d'être averti rapidement d'un dysfonctionnement matériel ou logiciel, de localiser l'incident et d'agir en fonction du problèmes

La supervision a aussi pour but de faciliter les choix en termes de prévision et en termes d'anticipation par la possibilité de lecture et de suivi des différents tableaux de bord.


### 1.4 Découpe fonctionnelle de la supervision
Il est possible de découper la  supervision en actions :

- observer, découvrir, inventorier
- contrôler, collecter, stocker
- agréger, analyser, corréler et consolider
- présenter, indiquer et synthétiser
- alerter, notifier, réagir 


### 1.5 Les niveaux de supervision
Aujourd'hui, la supervision ne se limite plus à l'infrastructure. On peut également supervisé des applications, le respect des SLAs ou encore des processus informatisés.

Dans chaque domaine de supervision, on retrouve les 3 catégories de points de contrôle suivants :

- Contrôle de **disponibilité** : s'assurer de la présence d'un équipement, application, etc.
- Contrôle de **performance** : s'assurer des performances fournies par un équipement, une application, etc.
- Contrôle d'**intégrité**: s'assurer qu'il n'existe pas d'incohérence dans le fonctionnement prévvu d'un équipement, d'un service, d'une application, etc.

#### 1.5.1 Les domaines d'application de la supervision

- Supervision de l'infrastructure (Réseau, matériel, système, middlewares)
- Supervision applicative
- Supervision des SLA (ex. page contact d'un site marchand fonctionne, le site supporte 100 connexion simultanées, etc.)


**Middleware**: ex. lancement des services, temps de réponse d'un serveur Web, nombre de VM dans un hyperviseur, envoies de mails, etc.

**SLA (Service Level Agreement)**: Dans une démarche ITIL (Information Technology Infrastructure Library), c'est un contrat signé entre un prestataire de services informatiques et ses clients, qui définit les niveaux de service attendus et les responsabilités de chaque partie. 


#### 1.5.2 Comment superviser

La supervision doit être la moins intrusive possible, et la plus indépendante possible des éléments supervisés.

Idéalement, les éléments supervisés ne devraient pas avoir conscience qu'ils sont supervisés. Ainsi, nous éviterons toute installation de logiciels/scripts sur les éléments supervisés.

Les solutions de supervision actuelles sont basées sur **SNMP (Simple Network Management Protocol)**. Chacun

Il existe 2 grandes méthodes de supervision :

- **supervision active**
- **supervision passive**


##### 1.5.2.1 Supervision Active
Méthode la plus employée. Consiste à émettre des requêtes d'interrogation par la plateforme de supervision à destination des éléments supervisés. On parlera de **checks actifs**.

**Check actifs locaux**

Ce sont des vérifications des services/ressources directement hébergées sur le serveur de supervision (CPU, RAM, HDD, etc) mais aussi tous les tests réalisés depuis le serveur de supervision pour tester d'autres composants du réseau.

Les principaux check actifs locaux s'effectueront grâce à la verification d'un socket TCP/UDP et de ressource directement sur le serveur de supervision.


**Checks actifs distants** 

L'élément exécutant les tests n'est pas le serveur de supervision en réalité. Ce dernier initie une commande de check spécifique (distant) à destination de l'hôte distant responsable du test.

voir schéma p8

Avantages des checks actifs distants :

- Moins de travail pour le superviseur
- Accès à des ressources normalement impossible depuis le superviseur 
- Dépassement des limites du système hôte de supervision


L'installation d'un agent sur les machines devient alors obligatoire et nécessitera un travail supplémentaire d'étude et d'implémentation. Son installation est impossible sur les équipements à accès limités (switchs, routeurs, imprimantes, etc)

Les principales commandes de check actifs distants sont :

- `check_by_ssh`
- `check_nrpe`
- requêtes SNMP
- requêtes WMI

##### 1.5.2.2 Supervision Passive
Les checks actifs couvrent une grande partie des besoin, cependant il est parfois nécessaire d'attendre une information plutôt que d'aller la chercher en permanence à l'aide des checks passifs. On

Ce sont les ressources supervisées qui transmettent des alertes au serveur de supervision. 


La ressource supervisée vérifie son état et transmet de manière autonome le résultat au serveur de supervision qui après reception va la traiter.

Avantage : on peut faire de la **supervision en temps réel**, chose impossible en supervision active puisque les vérifications sont périodiques. Cependant, l'absence d'alerte ne signifie pas forcément que la ressource est dans un état correct.

Ce genre de supervision n'est pas toujours applicable. Il est utilisé conjointement avec de la supervision active.

**Principaux checks actifs** :

- **SNMP** : peut aussi être utilisé pour de la supervision passive. On parlera alors de **traps SNMP**. Ces trap sont massivement implémentées sur les équipements réseaux/d'infra et les possibilités sont définies à l'avance par le constructeur.
- **NSCA (Nagios Service Check Acceptor)** : permet l'envoi d'informations au serveur de supervision à des fins de supervision. Ce protocole à l'avantage d'être utilisable depuis n'importe quel contexte, sous Linux et Windows


## 2. Le protocole SNMP
Le protocole **SNMP** (Simple Network Management Protocol) est le protocole de gestion de réseaux fourni par l'IETF. 


## Notes Perso

### Poller

Un **poller** est un serveur dédié à la collecte d'informations sur l'état des hôtes et des services surveillés. Les poller sont des éléments clés de l'architecture de Centreon car ils permettent de répartir la charge de surveillance sur plusieurs serveurs.

Les pollers exécutent les **sondes** (plugins) qui interrogent les équipements à surveiller (serveurs, routeurs, applications, etc.) via des **protocoles** standard (SNMP, NRPE, SSH, etc.) et récupèrent des **informations** sur leur état (disponibilité, niveau de charge, etc.). Les résultats sont ensuite envoyés à un **serveur central** (appelé "Central") qui stocke et analyse les données.

La répartition de la charge de travail sur plusieurs pollers permet de surveiller un grand nombre d'équipements sans surcharger un seul serveur. Cette architecture distribuée augmente également la disponibilité du système en évitant les points de défaillance uniques.

### SLA

Dans une démarche **ITIL** (Information Technology Infrastructure Library), une **SLA (Service Level Agreement)** est un contrat entre un prestataire de services informatiques et ses clients, qui définit les niveaux de service attendus et les responsabilités de chaque partie.

**La SLA décrit les détails de la prestation de service**, tels que les objectifs de niveau de service (ex: temps de disponibilité du service, temps de réponse, temps de résolution des incidents, etc.), les garanties offertes par le prestataire (ex: remboursement en cas de non-respect des engagements), les indicateurs de performance (KPI) et les modalités de suivi et de reporting.

**La SLA permet de formaliser les attentes des clients envers le prestataire** et de s'assurer que les niveaux de service sont respectés. Elle sert également de base pour la gestion des incidents, des problèmes et des changements, en définissant les processus à suivre en cas de non-respect des engagements.

En résumé, une SLA est un contrat qui établit une relation de confiance entre le prestataire de services informatiques et ses clients, en définissant les niveaux de service attendus et les engagements de chaque partie


### Trap SNMP

Une trap SNMP (Simple Network Management Protocol) est un type de message envoyé par un équipement réseau (comme un routeur, un commutateur, ou un serveur) à un système de gestion de réseau (NMS) pour signaler un événement important ou une condition d'erreur.

Les traps SNMP sont utilisées pour alerter les administrateurs de réseau en temps réel de tout événement important qui se produit sur l'équipement, comme une panne, une surcharge, une anomalie de trafic, ou toute autre condition qui peut nécessiter une intervention immédiate. Les traps SNMP sont générées de manière asynchrone, c'est-à-dire qu'elles sont envoyées spontanément par l'équipement, sans qu'une requête ne soit initiée par le système de gestion de réseau.

Lorsqu'une trap SNMP est envoyée, elle contient des informations sur l'événement ou l'erreur qui a été détecté par l'équipement, comme le type d'événement, l'adresse IP de l'équipement, l'heure de l'événement, et d'autres informations pertinentes.

Les systèmes de gestion de réseau, tels que Centreon, Nagios ou Zabbix, peuvent recevoir les traps SNMP et les utiliser pour déclencher des actions de surveillance, d'alerte, ou de correction automatisées en réponse à l'événement. En résumé, les traps SNMP sont un moyen d'alerte en temps réel pour les administrateurs de réseau sur les événements critiques qui se produisent sur les équipements de leur réseau.



<p class="fin">~Fin~</p>



<footer>
   G. Chéramy @ ENI 03/2023
</footer>

<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/headings.css">
