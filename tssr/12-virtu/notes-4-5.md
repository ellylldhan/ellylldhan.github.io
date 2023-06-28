title: notes 4-5

# ENI TSSR 12 - Virtualisation

Des concepts de la virtualisation à leur mise en oeuvre.

**Sommaire**

1. Module 1 - Présentation 
2. Module 2 - Les applications de virtualisation d'environnements sur un poste de travail 
4. Module 3 - La virtualisation de serveurs 
5. **Module 4 - Découverte d'Hyper V**
6. **Module 5 - Les composants d'une infrastructure vSphère**
7. Module 6 - Gestion du réseau
8. Module 7 - Gestion du stockage 
9. Module 8 - Gestion du datacenter

[TOC]

## Objectifs

- Définir les termes de mutualisation, consolidation et rationalisation et différencier les hyperviseurs de type 1 et 2
- Enoncer les caractéristiques des offres de SaaS, PaaS et SaaS 
- Lister un ensemble de solutions de virtualisation et de services virtualisés
- Décrire les composants d'une infrastructure vSphère 
- Configurer le réseau d'un ESXi afin de répondre à des besoins ciblés
- Configurer le stockage local ou partagé 


## Module 4 - Découverte d'HYPER-V
### Prérequis et installation
**Prérequis matériel**

- Processeur 64 bits Intel VT-x ou AMD-V (attention aux réglages BIOS/UEFI)
- CPU, RAM et espace disque adaptés 

**Prérequis logiciel**

- Un système Windows Server (W2008 ou supérieur)
- ou un système W8 Pro x64 bits (+ SLAT Secont Level Address Translation)

**Installation**

- Versions : Hyper-V v2 (W2008 R2), Hyper-V v3 (W8, W2012)
- Pour les serveurs, rôle intégré à installer avec le **gestionnaire de serveur**
- Pour le client Windows 8, fonctionnalité intégrée à activer

Lors de l'installation du rôle, 2 redémarrages sont nécessaires pour permettre le redémarrage de l'hyperviseur en mode natif (type 1). 


### Utilisation et mise en oeuvre
**Intéraction avec le système hôte**

- Les médias amovibles USB ne sont pas gérés avec la v2 (W2008 R2)
- Touche de bascule : <kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>GAUCHE</kbd>
- Services d'intégration (selon la compatibilité des systèmes hôtes)

**Fonctionnalités**

- Chaque VM peut être affichée dans une console séparée
- Gestion poussée des paramètres matériels (BIOS, mémoire, etc.)
- Capture instantanée 
- Importation et exportation (obligatoire avec la v2 pour la copie ou le transfert)

**Spécificités**

- Outil "serveur" orienté administrateur, moins convivial
- Fichiers des VM difficilement manipulables manuellement
- Pour faire <kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>SUPPR</kbd> dans la VM, <kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>FIN</kbd>


### Paramétrages réseau

<table style="border:none">
	<tr>
		<td rowspan="4" width="50%">
			<ul>
				<li><b>Réseau privé</b> : réseau entre guest uniquement.</li>
				<li><b>Host-Only</b> : réseau interne avec connection à l'hôte, les VM ne peuvent communiquer qu'entre elles et avec l'hôte.</li>
				<li><b>Bridged</b> : connection au réseau physique.</li>
				<li><b>Externe dédié</b> : la carte de réseau externe est associé de manière exclusive à une carte physique de l'hôte.</li>
				<li><b>Identification</b> des LAN pour les réseaux internes et externes (VLAN)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td><img alt="notes-09.png" src="../ressources/img/12-virtunotes-09.png"/></td>
	</tr>
	<tr>
		<td><img alt="notes-10.png" src="../ressources/img/12-virtunotes-10.png"/></td>
	</tr>
	<tr>
		<td><img alt="notes-11.png" src="../ressources/img/12-virtunotes-11.png"/></td>
	</tr>
</table>


### Console de gestion

<table style="border: none;">
	<caption class="caption">Console de Gestion</caption>
	<tr>
		<td width="30%">
			<ol>
				<li>Liste des serveur</li>
				<li>Liste et état des VM</li>
				<li>Info sur la VM sélectionnée</li>
				<li>Gestion du serveur</li>
				<li>Gestion de la VM</li>
			</ol>
		</td>
		<td>
			<img src="../ressources/img/12-virtunotes-12.png" alt="Console de gestion">
		</td>
	</tr>
</table>


### Etapes de configuration

#### Définition des réseaux virtuels
- Avec l'outil **Gestionnaire de réseau virtuel** (volet de droite de la console)
- Non définis par défaut, à créer selon les besoins 
- Un seul réseau externe est possible par carte réseau hôte (Hyper-V "s'approprie" la carte réseau physique)

#### Création des VM
- Avec l'assistant **Nouveau** > **Ordinateur virtuel**
- Définir l'emplacement de stockage et les paramètres matériels 

*Le disque d'amorçage d'une VM de première génération est obligatoirement sur une interface de type IDE.*


### Console d'ordinateur virtuel

<table style="border: none;">
	<caption class="caption">Console d'Ordinateur Virtuel</caption>
	<tr>
		<td width="30%">
			<ol>
				<li>Gestion de base</li>
				<li>Gestion des paramètres et du matériel </li>
				<li>Gestion de la fenêtre, la fermeture <u>n'arrête pas</u> la VM</li>
			</ol>
		</td>
		<td><img src="../ressources/img/12-virtunotes-13.png" alt="notes 13"></td>
	</tr>
</table>

### Exportation et importation
**Des manipulations plus contraignantes (avec Hyper-V v3)**

- Pour pouvoir être dupliquée ou déplacée, une VM doit être **exportée** 
- Pour pouvoir **importer**, il faut disposer des fichiers de configuration 
- L'importation <u>sans</u> "**Dupliquer tous les fichiers**" <u>empêche</u> de réimporter la même VM.
- L'option "**Dupliquer tous les fichiers**" permet d'utiliser <u>plusieurs fois</u> la même VM exportée, **MAIS** les disques VHD sont alors copiés dans un <u>même emplacement</u>


**Exemple de procédure**

- Exporter la VM dans un emplacement dédié
- Copier le répertoire contenant la VM à l'emplacement voulu 
- Importer la VM sans "**Dupliquer les fichiers...**"

**REMARQUE** : Attention à bien sélectionner <u>le dossier</u> contenant tous les fichiers.

### Atelier 2 - Hyper-V
Voir Atelier 2 - HYPER-V

## Module 5 - Les composantes d'une infrastructure vSphere
### De vSphere 5 à vSphere 6
<table style="border: none">
	<tr>
		<td width="50%">
			<ul>
				<li>Disparition de l'ESX et du <b>Service Console</b></li>
				<li>Disparition du client lourd <b>vSphere Client</b></li>
				<li>vCenter disponible sous forme d'Appliance virtuelle</li>
				<li>Apparition du web client vSphere (lié à vCenter)</li>
			</ul>
		</td>
		<td><img src="../ressources/img/12-virtunotes-14.png" alt="vSphere"></td>
	</tr>
</table>


### Composantes d'une solution vSphere

| Element | Nom dans VMware |
|:-------:|:---------------:|
| Solution de virtualisation | vSphere |
| Hyperviseur | ESXi / ESX |
| Client d'administration | client vSphere / vSpere web client | 
| Solution de regroupement d'hyperviseurs | vCenter | 

Attention, les versions des différents éléments d'une infrastructure vSphere doivent concorder ! (?)

![vSphere](../ressources/img/12-virtunotes-15.png)

### Les principales fonctionnalités

| Fonctionnalités | Utilité |
|:--:|:--:|
| vMotion | Déplacement de VM d'un hôte vers un autre hôte. |
| Storage vMotion | Déplacement du stockage d'une VM d'une banque de données vers une autre bdd |
| DRS | Automatisation du déplacement de VM d'un hôte vers un autre hôte disposant de plus de ressourcess. |
| Storage DRS | Automatisation du déplacement de VM d'un datastore vers un autre disposant de plus de ressources. |
| DPM | Fonctionnalité permettant d'automatiser l'entrée et la sortie de veille d'hyperviseurs en fonction de la charge d'activité du cluster. |
| HA | High Availability : Fonctionnalité de haute disponibilité. Lors de la défaillance d'un hôte, les VM ciblées seront redémarrées sur un autre hôte du cluster. | 
| FT | Fault Tolerance : Fonctionnalité de très haute disponibilité protégeant des VM ciblées de la défaillance d'un hôte. Aucune interruption de service n'affectera les VM ciblées |

Voir module 8 pour plus de détails.

### Les tarifs de VMware

<table>
	<caption class="caption">Tableau comparatif des coûts</caption>
	<tr>
		<td></td>
		<th>Comparatif des solutions</th>
	</tr>
	<tr>
		<th>ESXi seul</th>
		<td>Fonctionnalités très limitées : gratuites</td>
	</tr>
	<tr>
		<th>Suite Essentials</th>
		<td>ESXi + Gestion centralisée + Gestion des MàJ</td>
	</tr>
	<tr>
		<th>Suite Essentials Plus</th>
		<td>Suite Essentials + Haute dispo (HA) + DRS + DRS Storage</td>
	</tr>
	<tr>
		<th>vSphere Standard</th>
		<td>Suite Essentials Plus + FT + DPM</td>
	</tr>
</table>


<table>
	<caption class="caption">Licences et contextes d'utilisation</caption>
	<tr>
		<td></td>
		<th colspan="2" style="text-align:center;">PME</th>
		<th colspan="3" style="text-align:center;">TPE</th>
	</tr>
	<tr>
		<th>Cible</th>
		<td style="text-align:center;">Essentials</td>
		<td style="text-align:center;">Essentials Plus</td>
		<td style="text-align:center;">Standard</td>
		<td style="text-align:center;">Entreprise Plus</td>
		<td style="text-align:center;">Platinum</td>
	</tr>
	<tr>
		<th>Coût</th>
		<td style="text-align:center;"> 574.13 EUR HT</td>
		<td style="text-align:center;">4991.23 EUR HT</td>
		<td style="text-align:center;">1262.14 EUR HT</td>
		<td style="text-align:center;">3596.23 EUR HT</td>
		<td></td>
	</tr>
	<tr>
		<th>La licences couvre...</th>
		<td colspan="2" style="text-align:center;">Elle inclut vCenter Foundation</td>
		<td colspan="3" style="text-align:center;">Qté max de RAM par hôte
	</tr>
</table>

Les vRAM pool permettant de cumuler la quantité de mémoire des licences de chaque ESXi pour les attribuer ensuite aux VM n'est plus en vigueur sur vSphere 5.5. 

### Démo : découverte de la gestion d'ESXi depuis le client vSphere

### Atelier 3 - vSphere
Voir l'atelier 3 - vSphere


<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/headings.css">
