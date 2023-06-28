title: msp1-systemes-clients

# MSP 1 - Systemes clients

[TOC]


## Partie 1 - Installation

**Objectif** : installer et configurer progressivement deux OS, Win10 et Debian 10.

### Instructions Réseau

![Réseau](.ressources/img/reseau.png)

1. Partager les sous-réseaux<br>
Vous et votre binôme prendrez les **dernières adresses disponibles** du **dernier sous-réseau en /26**.<br>En classe, vous définirez les X premiers sous-réseaux, X étant le nombre de binômes dans la classe.<br>Suite à cela, vous définirez les sous-réseaux appartenant à chaque binôme.

2. Utiliser VMWARE<br>
Vous installerez 2 systèmes clients à l'aide de l'outil de virtualisation VMWARE WORKSTATION en respectant les caractéristiques fournies plus loin.

3. Travailler parfois en binôme<br>
Certaines tâches nécessiteront de travailler en binôme.

4. Créer des procédures le plus souvent possible<br>
Vous prendrez soin de créer des procédures relatant toutes vos actions. Utiliser l'outil PSR si besoin (qualité pourrie) ou faire les screens à la main, ça va aussi vite.

### Caractéristiques matérielles des VM

<table>
  <thead>
		<tr>
			<th scope="row"></th>
			<th scope="row">Machine 1</th>
			<th scope="row">Machine 2</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="col">Nom</th>
			<td scope="row">W10-NumeroDeStagiaire </td>
			<td scope="row">DEB10-NumeroDeStagiaire</td>
		</tr>
		<tr>
			<th scope="col">OS</th>
			<td scope="row">Win10 Pro</td>
			<td scope="row">Debian 10</td>
		</tr>
		<tr>
			<th scope="col">CPU</th>
			<td scope="row" rowspan="2"><i>suivre reco Microsoft</i></td>
			<td scope="row">1x vCPU</td>
		</tr>
		<tr>
			<th scope="col">RAM</th>
			<td scope="row">2048 MB</td>
		</tr>
		<tr>
			<th scope="col">HDD1</th>
			<td scope="row">32 Go</td>
			<td scope="row">20 Go</td>
		</tr>
		<tr>
			<th scope="col">HDD2</th>
			<td scope="row">40 Go</td>
			<td scope="row">40 Go</td>
		</tr>
		<tr>
			<th scope="col">Réseau</th>
			<td scope="row">1x carte en "Host-Only"</td>
			<td scope="row">1x carte en "Host-Only"</td>
		</tr>
	</tbody>
</table>

**Notes**: Lorsque vous aurez besoin d'une connection internet, ou du réseau de l'école, vous passerez en carte réseau *Bridged* et en DHCP.


### Documents à produire
#### 1. Schéma

Reproduire le schéma du réseau et compléter avec les infos d'adressage IP. (avec drawio, par ex.)

#### 2. Tableau récapitulatif

Produire un tableau récapitulatif de l'ensemble des infos relatives aux configurations système (ex. login, mdp, hostname, ip, CPU, RAM).


### Installation WIN10

- La VM avec Win10 :
	+ le premier HDD ne comportera qu'une seule partition utilisant l'intégralité de l'espace
	+ configurer l'ip, le hostname
	+ empêcher Win Update de se connecter aux serveurs Microsoft.
	+ utiliser l'iso d'install sur le réseau `\\10.0.0.6\Distrib\iso\os\windows\10\xxxxx.iso`


### Installation de Debian 10

- La VM Debian 
	+ installer l'iso "DVD" de Debian 10.x **avec un environnement graphique**
	+ iso dispo ici : `\\10.0.0.6\Distrib\iso\os\unix-linux\linux\Debian\XXXX.iso`
	+ mettre la nic en bridged pour l'installation.

#### Partitionnement

- Partitionner le disque manuellement selon le schéma suivant en prenant garde de pouvoir exploiter ultérieurement l'espace non-alloué.
- Conserver le système de fichier par défauts des différents points de montage

<table class="table">
	<tbody>
		<tr>
			<th scope="col">/</th>
			<td>17 Go</td>
		</tr>
		<tr>
			<th scope="col">/boot</th>
			<td>512 Mo</td>
		</tr>
		<tr>
			<th scope="col">swap</th>
			<td>256 Mo</td>
		</tr>
		<tr>
			<th scope="col">/home</th>
			<td>1 Go</td>
		</tr>
	</tbody>
</table>

#### Package et source (à l'installation)

- Laisser cocher les paquets par défaut 
- Serveur miroir : choisir le premier serveur miroir français de la liste (ftp.debian.org). 
- Pas de proxy

### Test Connectivité

- Passer les cartes en bridged et ping le binôme (les VM, la passerelle).
- S'assurer que ça ping bien dans tous les sens.


## Partie 2 - Configuration des utilisateurs et de l'environnement
### 2.1 Création d'utilisateur et de groupes
#### Liste des membres du personnel

| Service | Membres | login | mdp |
|:--|:--|:--|:--|
| Direction | Rick Grimes | rgrimes | #TWD35rg |
| Commercial | Daryl Dixon<br>Gabriel Stokes<br>Maggie Greene | ddixon<br>gstokes<br>mgreene | #TWD35dd<br>#TWD35gs<br>#TWD35mg |
| Comptabilité | Eugene Porter<br>Carol Peletier (intérimaire) | eporter<br>cpeletier| #TWD35ep<br>#TWD35cp |
| Informatique | *Vous-même* (administrateur)<br>*Votre binôme* (prestataire) | rlizot<br>cbarrault| #TWD35rl<br>#TWD35cb |
| Logistique | Rosita Espinosa<br>Morgan Jones | respinosa<br>mjones| #TWD35re<br>#TWD35rg |

#### Conventions d'Identification

- Chaque utilisateur sera identifié par la 1re lettre de son prénom, suivi de son nom (ex **rgrimes**, **cpeletier**)
- Les mdp seront affectés à ma convenance, tout en respectant les recommandations de l'ANSSI `https://www.ssi.gouv.fr/guide/mot-de-passe/`
- Les mdp n'expirent jamais

- Adopter une convention de nommage pour les groupes, que l'on conservera à travers tous les OS. 


#### Particularités Win10

- Le système Win10 sera utilisé par les membres des services COMPTABILITE et COMMERCIAUX.
- Créer les groupes et comptes nécessaire, en précisant dans leur description leur service d'appartenance.
	+ Créer la partie DIRECTION et COMPTA via CLI
	+ Créer la partie INFORMATIQUE et LOGISTIQUE via POWERSHELL
	+ Créer la partie COMMERCIAUX en mode graphique
- Ces utilisateurs possèderont tous dans le dossier **Bureau** de leur profil un dossier nommé **Procédures** qui contiendra, en outre, un fichier **Règlement intérieur**.
- Le poste d'intérimaire COMPTABLE est un emploi à mi-temps. Rendre l'ouverture de session possible uniquement de 9h00 à 12h00 tous les jours ouvrés.

##### Contraintes supplémentaires
- la **stratégie globale de sécurité de mdp** comportera les contraintes suivantes : 
	+ 12 car. minimum
	+ changement obligatoire tous les 25 jours
	+ exigences de complexité activées
- Ajouter un autre compte administrateur du système en cli avec `cmd` et lui indiquer un mot de passe (voir `net user`)
- Les membres du service **INFORMATIQUE** doivent à l'aide de leur compte pouvoir se connecter sur le système et bénéficier des privilèges administrateurs.
- Le changement du mdp du compte du binôme devra être forcé à sa première connection.

#### Particularités Deb10
- Tous les users de la société sont susceptibles d'utiliser ce poste **localement** ou en **connection à distance**. Par conséquent, la base de comptes de ce poste contiendra tous les users et groupes. 
- Tous les users auront un shell **/bin/bash** par défaut, sauf le prestataire qui aura un **/bin/ksh**.
- Le changement du mdp du compte du binôme devra être forcé à sa première connection.

## 2.2 Configuration environnement de travail

### Win10 (restrictions)
- Paramètrer les restrictions suivantes pour **tous les utilisateurs non-admin** du système
	+ supprimer les fonctions de gravure CD 
	+ empêcher tout accès au lecteur CD/DVD 
	+ empêcher le lancement des outils de modification du registre (ex. regedit)
	+ forcer l'utilisation d'une image de votre choix en tant que fond d'écran

- Pour **tous les utilisateurs sans distinction**
	+ pare-feu obligatoirement actif par défaut quel que soit l'utilisateur connecté 


### Deb10 (vim)
- Mettre à jour **vim** via le package manager 
- Activer la coloration syntaxique (`syntax on`) 
- Et la numérotation des lignes (`:set nu`)
- Avec `vim`, dans /etc/apt/sources.list :
	+ avec la commande `:g/`, commenter les lignes commençant par **deb-src** 
	+ commenter la ligne indiquant le DVD si pas déjà fait 


## Configuration du stockage et des ressources
### Partionnement de disque 
#### Win10

- Sur le HDD2, utiliser le format de table de partition **MBR**
- Créer via DISKPART une partition nommée **DATA** avec la lettre **D:**


| Disque | Label | Lettre | Methode | Taille |
|:--:|:--:|:--:|:--:|:--:|
| HDD2 | DATA | D: | DISKPART | 10 Go puis étendre au 5 Go supplémentaires |


#### Deb10

- Créer 3 partitions principales sur le HDD2
	+ 1. ext4 "PROFILS" 15 Go
	+ 2. ext4 "DATA"    15 Go
	+ 3. xfs  "LOGS"    tout l'espace restant (**note**: le système de fichier xfs n'est pas installé par défaut)

### Occupation des espaces disques

<blockquote><i>C'est le moment de réaliser un snapshot des VM.</i></blockquote>

#### Win10

#### Deb10


<!-- CSS only -->
<lnk href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">

<style type="text/css" media="screen">
* {
	font-size: 20px;
	line-height: 1.5em;
}
</style>