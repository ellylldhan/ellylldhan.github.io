title: notes-1 intro

# ENI TSSR 14 - Powershell
Cours "Initiation au scripting Powershell" @ ENI (2022)

<table>
<tr><th>Dates     :</th><td>du 28/11 au 02/12/2022</td></tr>
<tr><th>Formateur :</th><td>Thélo GUYADER</td></tr>
</table>

id: 140
<nav>

[TOC]

</nav>

## Notes

### Evolution de PowerShell

Sorti en 2006, PowerShell v1.0 était disponible sur les systèmes WinXP SP2, Vista et WinServer 2003 SP1. Cette première version apporte 129 commandes réparties sur 5 modules.

La version 5.1 est actuellement installée par défaut sur Win10 et WinServer 2019. Elle met à disposition 2855 commandes et supporte plusieurs milliers de modules, notamment Azure et Exchange.

Chaque montée de version apporte de nouvelles commandes (cmdlets et fonctions), des màj de commandes existantes et de nouveaux modules. L'interpréteur PowerShell est également mis à jour.

De grands éditeurs ont développé des modules permettant de piloter leurs plateformes et produits depuis PowerShell.

Depuis 2016, dans la lignée des Frameworks .NET deux ans auparavant, PowerShell est passé en Open Source. La montée en version de PowerShell Core suit les évolutions du Framework DotNet Core actuellement en version 3. PowerShell Core est en version 7.0

Powershell 7 (Core) est cross platform, mais permet surtout de contrôler des machines Windows depuis un Linux. PS7 ne sert pas à gérer un système Linux, montre assez vite ses limites. La version Core permet également de créer ses propres modules.

C'est une évolution majeur de Microsoft ces dernières années, démontrant une volonté d'ouverture vers d'autres environnements (ex. intégration de Bash dans Win10, SQL Server porté sur Linux, ouverture d'Azure vers l'univers Linux, etc.).

### Particularités de PowerShell Core
- Pas de requêtes WMI ou CIM (propres aux systèmes Windows). Certaines commandes utilisant du WMI sont donc indisponibles.
- Pas de planification de tâches via cmdlets
- Certains alias ne sont pas disponibles
- Utilisation du Remoting PowerShell impossible
- Sous Linux, on respecte la casse !
- Certaines incompatibilités sur des fonctions avec des scripts Windows

Quelques alias ne fonctionnent pas, ex. ls, cp, mv, rm, cat, man, mount et ps. Les commandes passent bien car natives mais dans le cas d'un ls, on perd l'objet et on remonte du texte.


#### Comparaison .NET Framework -vs- .NET Core
Powershell sous Linux/MacOS utilise la version CORE qui est un sous-ensemble de la version complète de .NET Framework sous Microsoft Windows. C'est un point important, car PowerShell offre un accès direct aux méthodes, types de Framework, etc. sous-jacents.

Par conséquent, les scripts qui s'exécutent sous Windows risquent de ne pas fonctionner sur les plateformes autres que Windows en raison des différences d'infrastucture.

Avec l'arrivée de .NET Standard 2.0, .NET Core 2.0 réintégrera la plupart des types et méthodes traditionnels présents dans la version complète du .NET Framework. PowerShell Core pourra donc charger de nombreux modules Windows Powershell traditionnels sans modification.


### Notes

PS manipule des objets.

Base SAM = Security Account Management

### Les Cmdlets
Les commandes PS sont toujours composées ainsi : **Verbe-Nom**. Attention, le nom sera **toujours au singulier**.

Exemple : `Get-ChildItem`, `Get-Service`, `Get-Volume`, `Get-SMBShare`, `Get-Process`, `Get-Item`

- Les commandes PS disposent de paramètres nécessaires au bon fonctionnement de la commande
```ps1
PS> Get-LocalUser -Name "Nom de l'utilisateur recherché"
```

- Le paramètre est systématiquement indiqué avec un tiret. Une commande peut disposer de plusieurs paramètres.
```ps1
PS> Get-LocalGroupMember -Group "Nom du groupe recherché" -Member "Membre du groupe recherché dans le groupe indiqué"
```

### Get-Command
Permet de rechercher une commande.

1. La recherche peut se faire sur le paramètre `-Name`. Note: Prend des wildcards `*`.
```ps1
PS> get-command -Name *-Service
```

2. La recherche peut se faire sur le paramètre `-Verb`
```ps1
PS> Get-Command -Verb stop
```

### Get-Help

```ps1
PS> Get-Help -Name Get-Service
```

Options disponibles :

- `-Full`: aide complète
- `-Online`: aide en ligne donc la plus récente. Requiert une connection Internet.
- `-Examples`: affiche que des exemples d'utilisation
- `-ShowWindow`: affiche dans une popup en dehors du terminal, offrant une option de filtrage, la possibilité de copier-coller, etc.

Pour en savoir plus, ne pas hésiter d'aller voir... `Get-Help Get-Help`.


### Update-Help

- Mettre à jour en ligne
```ps1
PS> update-help
```

- Spécifier la source locale
```ps1
PS> update-help -SourcePath D:\Powershell
```

- Spécifier un langage
```ps1
PS> Update-Help -SourcePath D:\Powershell -UICulture en-GB
```

### La commande de protection
L'exécution de script est par défaut soumise à une forte restriction.

Le niveau de confiance requis pour l'exécution est modifiable :

- Permet d'exécuter tous les scripts. A executer dans un CLI avec les droits admin :
```ps1
PS> Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

**Niveaux de confiance**:

- Niveau Secu elevé
    + **Restricted** (par défaut) : aucune execution possible.
    + **AllSigned** : Tous les scripts doivent être signés par une autorité de certification de confiance, y compris ceux écrits sur la machine.
    + **RemoteSigned** : Nécessite que tous les scripts provenant du net soient signés par une autorité de certification de confiance.
- Niveau Secu limité
    + **Unrestricted** : Pas de restrictions particulières sur les scripts. Ceux provenant d'internant déclenche un avertissement.
    + **Bypass** (open bar) : Open bar
- Niveau autre
    + **Default**
    + **Undefined** : Remove the currently assigned execution policy from the current scope. This parameter will not remove an execution policy that is set in a Group Policy scope.

**Attention** ces commandes nécessitent un PowerShell avec les droits admin.

### Les modules
Chaque cmdlet provient d'un module Powershell.

Les modules sont des fichiers portant extension **.PSM1**.

La commande `Get-Module` permet de voir les modules actuellement disponible dans PS.

#### Ajouter un module
1. Après la récupération d'un fichier PSM1 pour connaître l'emplacement disponible, il faut saisir la commande :
```ps1
PS> $env:PsModulePath
```

2. Après la copie du fichier dans l'emplacement; on importe le module dans la console :
```ps1
PS> Import-Module -Name "Le nom du dossier contenant le module"
```

3. Puis on vérifie l'installation :
```ps1
PS> Get-Command -module "Le nom du module"
```

**Important** :

- Ces commandes nécessitent un Powershell avec les droits admin.
- Il faut modifier les droits d'execution de script sur le système.


### La personnalisation de la console
L'équivalent .bashrc existe sous PS. Cette commande va créer un fichier pour le profil :
```ps1
PS> New-item -Path $Profile -Type File -Force
```

Va générer un fichier dans le **%USERPROFILE%/Documents/WindowsPowershell** que l'on pourra modifier (ex. créer des alias, des variables supplémentaires, modifier le prompt)

Attention, le fichier en **.ps1** généré est vide. Il s'agira d'y ajouter une fonction `prompt` définissant les paramètres du prompt (avec des `write-host`). Cette fonction sera chargée à chaque ouverture de CLI.

## TP 1 - Présentation

[Voir Atelier 1 - Présentation](./tp01.html){:target="_blank"}

```ps1
# Count how many commands
get-command | measure
get-command | measure | select count
(get-command).count

# Get All Verbs
get-command | select verb | Group-Object verb
get-verb

# Get All Verbs containing *new*
get-command | select verb | Group-Object verb | where Name -like new
get-command -verb new

# Get all commands containing *user*
get-command *user*

# Création user
$mdp=Read-Host -AsSecureString
new-localuser "user_tp01" -Password $mdp -FullName "Utilisateur Local TP01" -UserMayNotChangePassword -PasswordNeverExpires

# Get first 5 local users
Get-LocalUser | select -First 5

# Update 1 user
Set-localuser -Description "Utilisateur std modifié"  FerdinandMorse

# Get Get-Help
get-help get-Service -ShowWindow      # dans fenêtre à part
get-help get-Service -Full            # totalité dispo
get-help -Online Get-LocalGroupMember # online

# Update-Help d'après un package
update-help -SourcePath \\CD01\Partage\Depot\CLI01
update-help -SourcePath \\CD01\Partage\Depot\CLI01 -UICulture fr-FR

# Get modules actuellement chargés
Get-Module

# Get issue package
Get-Command Get-LocalUser

# Get Module location
$env:PSModulePath

# Installation d'un module
# 1. Dezip pkg in one folder that is in the module path
# 2. Import module
Import-Module AWSPowerShell
# 3. Vérification
Get-Module

# Get first 3 commands available for a module
Get-Command -module AWSPowershell | select -first 3

# Custom Profile
new-item -path $profile -type file -force  # voir TP pour contenu de la fonction prompt
```


<p class="fin">~Fin Module 1~</p>

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">