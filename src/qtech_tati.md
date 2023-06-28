## MSP Tati

## 1. Intervention sur le serveur AD

Ouvrez la VM WinServer et connectez-vous avec le compte `administrateur` (`P@ssw0rd`)

### 1er Demande

Le script suivant (**network-drive.bat**) permet de connecter automatiquement les lecteurs réseaux des utilisateurs. Il est déployé par la GPO **network-drive-mount** depuis l'UO "**Production**".

```powershell
# Création des lecteurs réseaux sur poste de travail
net use G:\SERVAD01.TSSR.INFO\PRODUCTION 
net use H:\SERVAD01.TSSR.INFO\INFORMATIONS
net use I:\SERVAD01.TSSR.INFO\IT_COMMUN
```
	
De nombreux appels au service Support ont été enregistrés : les lecteurs n'étaient pas montés.

Votre travail consiste à trouver et créer un autre type de stratégie pour connecter les lecteurs réseaux.

![[01](.ressources/img/t01.png)](.ressources/img/t01.png)
![[02](.ressources/img/t02.png)](.ressources/img/t02.png)
![[03](.ressources/img/t03.png)](.ressources/img/t03.png)
![[04](.ressources/img/t04.png)](.ressources/img/t04.png)

### 2e demande

Vous devez mettre en place une série de mesures limitant la connection de l'utilisateur Sylvie BIGALKE afin qu'elle puisse se connecter qu'à partir de son poste de travail (**PC-CLIENT01**) et uniquement pendant les horaires d'ouverture des bureaux (7h-17h du lundi au vendredi


![[05](.ressources/img/t05.png)](.ressources/img/t05.png)
![[06](.ressources/img/t06.png)](.ressources/img/t06.png)
![[07](.ressources/img/t07.png)](.ressources/img/t07.png)


### 3e Demande

La quantité de données stockées dans le dossier partagé "Gestion" doit être contrôlée.

Votre travail consiste à appliquer un modèle de quotas selon les critères suivants (Gestionnaire de ressources du serveur de fichiers) :

- Avertissement de l'utilisateur et de l'administrateur à partir de 4 Go de stockage
- Interdiction d'écrire au-delà de 5 Go

ATTENTION ! Le serveur de messagerie n'est pas configuré sur cette plateforme, donc vous pouvez mettre en place l'avertissement mais pas le tester. **Ne tenez pas compte d'éventuels messages d'erreur à ce sujet**.


![[08](.ressources/img/t08.png)](.ressources/img/t08.png)
![[09](.ressources/img/t09.png)](.ressources/img/t09.png)
![[10](.ressources/img/t10.png)](.ressources/img/t10.png)

Il est recommandé de créer des **quotas** uniquement à partir de modèles. De cette façon, vous pouvez facilement gérer vos quotas en modifiant les modèles plutôt que les quotas individuels. Le seul emplacement central pour la gestion des quotas facilite l'adoption de règles de stratégie de stockage.

![[11](.ressources/img/t11.png)](.ressources/img/t11.png)
![[12](.ressources/img/t12.png)](.ressources/img/t12.png)
![[13](.ressources/img/t13.png)](.ressources/img/t13.png)
![[14](.ressources/img/t14.png)](.ressources/img/t14.png)

Et modifier ou ajouter l'avertissement à 80%, ce qui correspondra au 4 Go.

![[15](.ressources/img/t15.png)](.ressources/img/t15.png)

## Adaptation de scripts

### 1e demande
Remplacer dans ce script les commentaires `#xxx` par un commentaire qui explique ce que fait la ligne ou le paragraphe en dessous. 

```bash
#condition.sh

#!/bin/bash

age=18

if [ $age = "18 ]; then
	echo "vous êtes majeur"
fi
```
(n'est pas l'original... nan, jure?)


### 2e Demande

Vous devez rendre maintenant votre script générique. 

- Le nom du fichier à prendre en compte sera passé en paramètre
- Vous devez pouvoir executer le script de cette manière (ex.)

```bash 
$ importUser.sh ./eleve.txt
$ importUser.sh ./classe1.txt
```

## Intervention sur serveur Linux 
### 1e demande
Afin d'améliorer la sécurité de l'accès SSH à votre serveur, vous devez changer le port TCP de ce service pour qu'il soit accessible sur le port 26.

<div class="is-success">Dans le fichier **/etc/ssh/sshd_config** changer le numéro de port</div>

![[16](.ressources/img/t16.png)](.ressources/img/t16.png)

### 2e Demande
Le site intranet se trouve sur le serveur **SRVLX02**.

Un fichier **LisezMoi** présent dans votre home vous indique où se trouve ce site et quel serveur HTTP est installé. 

Faites en sorte que le webmaster qui se connecte sur ce serveur avec le compte **webmaster** (**P@ssw0rd**) puisse modifier les fichiers du site et qu'il soit le seul à pouvoir le faire.

```bash
# cd /root
# ls -l
# cat LisezMoi
```

<div class="is-success">
Une fois le chemin du site web /var/www/... et modifier les droits (chmod 764) et modifier aussi l'ownership (`chown`) des fichiers, et du même pour fichier **webmaster**. 

Après se connecter avec webmaster... A vérifier
</div>

Moi : alors c'est pas tout à fait ça, refaire la manip vite fait histoire d'être sûr.


## Téléphonie
- Ouvrir les VM **IPBX** et **PC_CLIENT01**.
- Pour ces manipulations, 2 softphones seront utilisés : un sur chacun des windows client (phy...)
- Il est impératif de désactiver le son de vos postes de travail pour préserver le silence.
- Le softphone de l'utilisateur **Serge KESSLER** est configuré sur la VM. Son numéro est le **102**.

### 1e Demande
Votre travail consiste à créer la ligne 110 et à la mettre en service pour l'utilisatrice **Sofia K** - softphone de votre machine physique (sic)

[...]



<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">


<style>
.is-success {	
	font-family: Roboto, sans-serif;

	font-style: normal;
	font-variant: normal;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 24px;
	text-decoration: rgb(27, 94, 32);
	text-align: start;
	text-indent: 0px;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;
	word-spacing: 0px;
	
	background-attachment: scroll;
	background-color: rgb(232, 245, 233);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: no-repeat;
	color: rgb(27, 94, 32);
	
	border: ;
	border-top: 0px none rgb(129, 199, 132);
	border-right: 0px none rgb(129, 199, 132);
	border-bottom: 0px none rgb(129, 199, 132);
	border-left: 55px solid rgb(129, 199, 132);
	margin: 16px 0px;
	padding: 0px 16px 16px;
	max-height: none;
	min-height: 0px;
	max-width: none;
	min-width: 0px;
	
	position: relative;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
	float: none;
	display: block;
	clear: none;
	z-index: auto;
	
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;
	
	border-collapse: separate;
	border-spacing: 0px 0px;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;
	
	overflow: visible;
	cursor: auto;
	visibility: visible;
	
	transform: none;
	transition: all 0s ease 0s;
	box-sizing: border-box;
	resize: none;
	text-shadow: none;
	text-overflow: clip;
	word-wrap: normal;
	box-shadow: none;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
}

.is-question {	
	font-family: Roboto, sans-serif;

	font-style: normal;
	font-variant: normal;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 24px;
	text-decoration: rgb(13, 71, 161);
	text-align: start;
	text-indent: 0px;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;
	word-spacing: 0px;
	
	background-attachment: scroll;
	background-color: rgb(227, 242, 253);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: no-repeat;
	color: rgb(13, 71, 161);
	
	border: ;
	border-top: 0px none rgb(100, 181, 246);
	border-right: 0px none rgb(100, 181, 246);
	border-bottom: 0px none rgb(100, 181, 246);
	border-left: 55px solid rgb(100, 181, 246);
	margin: 16px 0px;
	padding: 0px 16px 16px;
	max-height: none;
	min-height: 0px;
	max-width: none;
	min-width: 0px;
	
	position: relative;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
	float: none;
	display: block;
	clear: none;
	z-index: auto;
	
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;
	
	border-collapse: separate;
	border-spacing: 0px 0px;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;
	
	overflow: visible;
	cursor: auto;
	visibility: visible;
	
	transform: none;
	transition: all 0s ease 0s;
	box-sizing: border-box;
	resize: none;
	text-shadow: none;
	text-overflow: clip;
	word-wrap: normal;
	box-shadow: none;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
}

</style>
