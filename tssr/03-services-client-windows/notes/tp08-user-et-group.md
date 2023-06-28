title: tp08 - users & groups

# ENI TSSR 03 - Services Client Windows
## TP08 - Gestion des utilisateurs et des groupes

[TOC]

### Tâches à faire

**Dans la console de Gestion des utilisateurs (lusrmgr.msc)**

- Créer les groupes L_Informatique et L_Responsables 
- François possèdera un mdp qui n'expire jamais.
- François fera partie des groupes L_Informatique et L_Responsables
- Yann fera partie des mêmes groupes que François
- Créer des comptes utilisateurs correspondant à vos voisins de table, faisant partie du groupe L_Voisins

**Mise en place de privilèges d'administration**

- François aura la possibilité d'administrer l'ensemble des ressources du poste Win10-XX (xx= numero étudiant, 17)
- Yann pourra consulter les journaux d'évènements et configurer la carte réseau.
- Vous accorderez à vos voisins la possibilité de sauvegarder votre poste Win10-17 
- Retirer l'un de vos voisins du groupes **Utilisateurs**.

**Informations concernant les utilisateurs et groupes**

- En naviguant dans la console graphique des utilisateurs et des groupes, lister les propriétés d'un utilisateur
- Lister les propriétés d'un groupe 

**En ligne de commande (cmd.exe)**

- Afficher les informations du compte utilisateur François
- Afficher les membres du groupe Administrateurs 
- Créer un utilisateur Romain, avec mot de passe. Attention, le mot de passe ne devra pas s'afficher à l'écran.
- Ajouter Romain au groupe L_Responsables

**Manipulations supplémentaires avec l'interface graphique de Windows 10**

- Fermer la session de l'utilisateur en cours
- Quels utilisateurs peuvent ouvrir une session sur le poste ?
- L'un de vos voisins ne peut pas ouvrir de session. Pourquoi ?
- Ouvrir une session avec François puis afficher les profils présents sur le Système. Que peut-on observer ?
- En invite de commande, afficher son SID, puis afficher les SID des groupes dont il est membre.

**Sur WIN11 et avec powershell**

- Afficher la liste des utilisateurs sur le Système. Afficher le nom, le sid et la description de chacun d'eux.
- Afficher les informations suivantes concernant l'utilisateur **james**
- Ajouter la description **Compte générique avec privilèges d'administration** à l'utilisateur **adm**.
- Afficher le nom et le SID des membres du groupe local **L_SupportInfo**

**Bonus**

- Limiter les horaires d'accès de vos voisins sur le poste Win10-17 du lundi au vendredi entre 9h et 17h.



### CMD.EXE
####  Afficher les infos du user account François

```cmd
cmd> net user francois
```

#### Afficher les membres du groupe Administrateurs

```cmd
cmd> net localgroup administrateurs
```

#### Créer un utilisateur ROMAIN avec mdp. Attention le mdp ne devra pas être visible en CLI

```cmd
cmd> net user Romain * /ADD
(prompt pour mdp + confirmation)
```

#### Ajouter Romain au groupe L_Responsables

```cmd
cmd> net localgroup L_Responsables Romain /ADD
```

#### Afficher le SID du current user, puis les SID des groupes dont il est membre

```cmd
cmd> whoami /USER
cmd> whoami /USER /GROUPS
```

### POWERSHELL sur WIN11
####  Afficher la liste des utilisateurs sur le Système (nom, sid, description)
```ps1
ps> get-localuser | select name,sid,description
```

#### Afficher les informations suivantes pour l'utilisateur James
```ps1
ps> get-localuser james | select fullname, name, description, objectclass, lastlogon 
```

#### Ajouter la description "Compte générique avec privilèges d'administration"
```ps1
ps> set-localuser -Name "adm" -Description "Compte générique avec privilèges d'admin"
```

<span class="attention">ATTENTION</span>, il y a une limite de 50 caractères en powershell mais que sur la description, dans ce cas de figure-ci.

#### Afficher le nom et le SID des membres du groupe local L_SupportInfo
```ps1
ps> get-LocalGroupMember -Name "L_SupportInfo" | select name,sid
```

### Bonus : Création d'utilisateur

```ps1
ps> $pswd=Read-Host -AsSecureString
ps> New-LocalUser "francois" -Password $pswd -FullName "François" 
							-Description "Responsable Info" 
							-UserMayNotChangePassword 
							-PasswordNeverExpires
ps> Add-LocalGroupMember -Group "L_Reesponsables" -Member "francois"
```

**La totale :**

```ps1
ps> new-localuser "francois" -Password $mdp -FullName "François" -UserMayNotChangePassword -PasswordNeverExpires
ps> new-localuser "romain"   -Password $mdp -FullName "Romain"   -UserMayNotChangePassword -PasswordNeverExpires
ps> new-localuser "yann"     -Password $mdp -FullName "Yann"     -UserMayNotChangePassword -PasswordNeverExpires
ps> new-localuser "voisin1"  -Password $mdp -FullName "Voisin"   -UserMayNotChangePassword -PasswordNeverExpires
ps> new-localuser "voisin2"  -Password $mdp -FullName "Voisin"   -UserMayNotChangePassword -PasswordNeverExpires

ps> new-localgroup L_Responsables
ps> new-localgroup L_Voisins
ps> new-localgroup L_Informatique

ps> Add-LocalGroupMember -Group "L_Responsables" -Member "francois" 
ps> Add-LocalGroupMember -Group "L_Informatique" -Member "francois" 
ps> Add-LocalGroupMember -Group "Administrateurs" -Member "francois"

ps> Add-LocalGroupMember -Group "L_Voisins" -Member "voisin1"
ps> Add-LocalGroupMember -Group "L_Voisins" -Member "voisin2"

ps> Add-LocalGroupMember -Group "L_Responsables" -Member "romain"
```

### Bonus 2 : Restrictions d'horaires
Vos voisins pourront ouvrir une session uniquement du lundi au vendredi entre 9h et 17h

```ps1
cmd> net user voisin1 /time:l-v,9:00,17:00
```

Oui, les jours sont en français...

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
