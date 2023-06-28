title: notes

# ENI TSSR 14 - Powershell
Cours "Initiation au scripting Powershell" @ ENI (2022)

<table>
<tr><th>Dates     :</th><td>du 28/11 au 02/12/2022</td></tr>
<tr><th>Formateur :</th><td>Thélo GUYADER</td></tr>
</table>

id: 140

[TOC]


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


## Module 2 : PowerShell Langage Objet

Powershell est un langage orienté objet.

Chaque objet pourra porter des **méthodes** et des **propriétés**.

Exemple: `Get-Service` renvoie un objet **Service Windows**

| Propriétés        | Méthodes              |
| :---------------- | :-------------------- |
| Nom du Service    | démarrer le Service   |
| Type de démarrage | désactiver le Service |
| status du Service | arreter le Service    |

### Get-Member
Permet de connaître les propriétés *essentielles* d'un objet.

```ps1
PS> get-Service | get-member
```

Un objet est constitué de proprietes qui contiennent une valeur.

On peut modiifer la valeur d'une propriété avec le verbe `Set`

```ps1
PS> Set-Service -Name WSearch -DisplayName "Service de recherche Windows"
```

### Les objets : methodes

Les objets disposent de méthodes  parfois communes à plusieurs types d'objets.

Contrairement aux propriétés, les méthodes effectuent des actions sur la totalité de l'objet ou sur la valeur d'une ou plusieurs propriétés d'un objet.

```ps1
PS> get-date | gm
PS> (get-date).adddays(1)
```
**Note**:

-  `gm` est un alias de `Get-Member`
- ne modifie pas la valeur de `get-date`, c'est juste un calcul fait sur une valeur.
- `Get-Date` est un objet `System.DateTime`

### TP 02 - Objet
[Voir Atelier 2 - Les objets](./tp02.html){:target="_blank"}


## Module 03 - Manipulation des objets
### Manipuler des objets
En PowerShell, le résultat d'une commande peut être composé d'un ensemble d'objets
```ps1
PS> Get-Service
```

Le nombre d'objets étant souvent élevé, il est important de pouvoir sélectionner et mettre en forme le résultat d'une commande.
```ps1
PS> Get-EventLog
```

#### Pipeline

L'utilisation de redirections au moyen de pipeline permet d'effectuer des commandes de triage, de mise en forme, de sélection et de conditionner le résultat final. Peut être utilisé plusieurs fois.
```ps1
PS> Get-EventLog -LogName "System" | Select-Object Name | Format-Table
```

Le pipe utilise la variable réservée `$PSItem`. Cela permet de cibler une propriété d'un objet :
```ps1
PS> Get-Process | Select Name, Id | Where { $PSItem.id -gt 1500 -and $PSItem.id -lt 2000 }
```

#### Select-Object
La commande `Select-Object`  permet de sélectionner une ou plusieurs propriétés.

```ps1
PS> Get-Service | Select-Object -Property Name, Status
PS> Get-Service | Select Name, Status
```

Parmi les propriétés de la fonction `Select` :
```powershell
PS> Get-Service | select -First 5       # les 5 premiers résultats
PS> Get-Service | Select -Last 5        # les 5 derniers
PS> Get-Service | Select -Unique Name   # equiv. Distinct
PS> Get-Service | Select -ExpandProperty Name   # affiche uniquement les valeurs dans la console
```

#### Sort-Object
La commande `Sort-Object` permet de trier selon un critère donné.

```ps1
PS> Get-Service | Select Name, Status | Sort Status
PS> Get-Service | Select Name, id | Sort id -Descending
```

Ex. La propriété `Length` indique le poids des fichiers en octets. Ils seront classés du plus faible au plus élevé.
```ps1
PS> Get-ChildItem -Path C:\Windows | Sort -Property Length
```

#### Measure-Object
La commande `Measure-Object` permet de compter le nombre d'objets, d'établir des moyennes, etc.


- L'action par défaut est le **comptage**.
```ps1
PS> Get-Process | Measure-Object
```

- La commande est aussi utilisable sur une propriété pour déterminer une valeur **moyenne**.
```ps1
PS> Get-ChildItem -Path | Measure-Object -Property Length -Average
```

- Sert aussi à calculer des valeurs **minimales** et **maximales**.
```ps1
PS> Get-ChildItem -Path | Measure -Property Length -Minimum -Maximum
```

#### Where-Objet

La commande `Where-Objet` conditionne la présence d'un objet dans le résultat.

- Les conditions sont toujours appliquées sur des valeurs de propriété
- Elles peuvent être uniques ou multiples, obligatoires ou optionnelles

```ps1
PS> Get-Service | Where -Property Status -eq "Running"
PS> Get-Process | Where -Property Name -like "power*"
```

| Comparaison            | insensible à la casse | Sensible à la casse |
| :--------------------- | :-------------------: | :-----------------: |
| Egalité                |          -eq          |        -ceq         |
| Inégalité              |          -ne          |        -cne         |
| Supérieur à            |          -gt          |        -cgt         |
| Sup. ou égal à         |          -ge          |        -cge         |
| Inférieur à            |          -lt          |        -clt         |
| Inf. ou égal à         |          -le          |        -cle         |
| égalité d'expression   |         -like         |       -clike        |
| inégalité d'expression |       -notlike        |      -cnotlike      |

##### OR / AND & FilterScript
Pour ajouter des expressions logique à un Where-Objet :

**And**
```ps1
PS> Get-Process | Select Name, Id | Where -FilterScript { $PSItem.id -gt 1500 -and $PSItem.id -lt 2000 }
PS> Get-Process | Select Name, Id | Where -FilterScript { $_.id -eq 825 -and $_.Name -like "power*" }
```

**Or**
```ps1
PS> Get-LocalUser | Select Name, Sid, Enabled | Where { $_.Name -like "Toto"
-or $_.Sid -eq S-1-5-21-3376288570-2491860933-3167967787500
-or $_.Enabled -eq $true }
```

**Important** : penser à inclure les propriétés à tester dans le Select-Object.

##### Collaboration de conditions
Il est également possible de grouper des conditions

```ps1
PS> Get-ADUser -Filter * | Select Name, UserPrincipalName | Where -FilterScript {
	($_.Name -eq "Administrateur" -or $_.Name -eq "Administrator")
	-and
	$_.UserPrincipalName -eq "Admin"
}
```

#### Format-Table
Permet de mettre en forme le résultat final afin d'améliorer la lecture du résultat, mais également de permettre l'export vers un fichier dans un ou plusieurs formats.

```ps1
PS> Get-ADUser -Filter * | Select Name,GivenName,Enabled | Format-Table
```

- L'ordre des colonnes est personnalisable
```ps1
PS> Get-ADUser -Filter * | Format-Table -Property Enabled, Name, SamAccountName
```
- On peut également regrouper les objets par valeurs de propriétés identiques
```ps1
PS> Get-ADUser -Filter * | Format-Table -GroupBy Enabled
```

- Les utilisateurs seront regroupés selon l'état de leur compte actif ou inactif.

**Attention** Select-Object n'est pas obligatoire pour l'utilisation des commandes de format.

```ps1
PS> Get-Service | Format-Table -HideTableHeaders    # masque le nom de la propriété, affichage brut
PS> Get-Service | Format-Table -Wrap                # force le retour à la ligne en fin de console (wrap word)
```

#### Format-Wide
Permet de mettre en forme les valeurs d'une propriété en colonne. Le nombre de colonnes est paramétrable.

```ps1
PS> Get-Service | Format-Wide -Column 10
PS> Get-Service | Format-Wide -AutoSize
```

Avec `-AutoSize`, le nombre de colonnes est déterminé automatiquement.

#### Format-List
Permet de formater un affichage sous forme de liste. L'ordre d'affichage des propriétés est paramétrable dans la commande.

```ps1
PS> Get-ADUser -Filter * | Format-List -Property Name, Enabled, SamAccountName
PS> Get-ADUser -Filter * | fl -Property Name, Enabled, SamAccountName
```

#### Export-Object
Permet d'exporter un output dans un format donné (ex. csv). Les formats pris en charge nativement sont le CSV, le CLIXML, le JSON, le HTML.

```ps1
PS> Get-ADUser -Filter * | Export-CSV C:\ENI\export.csv -Delimiter ";"
PS> Get-ADUser -Filter * | Export-CSV C:\ENI\export.csv -Delimiter ";" -NoTypeInformation
```

Par défaut le type d'objet est exporté dans le fichier. La propriété `-NoTypeInformation` évite cela.

Pour les formats JSON et HTML, il faut convertir les données puis les exporter.

```ps1
PS> Get-Service | ConvertTo-Html | Out-File C:\ENI\Services.html
```

Il existe des modules supplémentaires qui permettent de manipuler plus de formats (ex. Import-Excel).


#### Out-File
Permet de rediriger un flux vers un fichier (equiv. du chevron en bash).

```ps1
PS> Get-Service | Out-File C:\ENI\Services.txt
PS> Get-Service | Out-File C:\ENI\Services.txt -Append
PS> Get-Service | Out-File C:\ENI\Services.txt -Width 42   # défaut: 80
```

- `-Append` permet d'ajouter en fin de fichier
- `-Width` spécifie le nombre de caractères par ligne. Par défaut 80.

**Remarques**: 

- Le chevron à la Bash fonctionne aussi, dans les 2 sens. `>`, `>>`, `<`, `<<`
- Le `2>` fonctionne aussi pour rediriger les erreurs. 
- `$Null` est l'équivalent du `/dev/null`

#### Get-Content
Permet d'afficher le contenu d'un fichier dans la console, on utilise la commande `Get-Content`.

```ps1
PS> Get-Content C:\User.csv
PS> Get-Content | C:\User.csv -Tail 1
```

#### Import-CSV
Permet d'importer des données dans certains formats en vue d'être manipuler dans le shell.

Exemple : Créer des comptes AD d'après un csv importé
```ps1
PS> Import-CSV C:\users.csv -Delimiter ";" | New-ADUser
```

Il n'est pas possible de cibler une propriété du fichier CSV et de l'attribuer à une propriété particulière d'un objet.

```ps1
# CETTE COMMANDE N'EST PAS FONCTIONNELLE !
PS> Import-CSV C:\users.csv -Delimiter ";" | New-ADUser -Name $_.nom -GivenName $_.GivenName
```


### Les propriétés calculées

Lorsque les propriétés ne correspondent pas, il faut créer de nouvelles propriétés et récupérer la valeur de propriété d'origine.

Cela peut être utile pour mieux interpréter le résultat d'une commande, notamment en assurant la traduction de la propriété.

```ps1
PS> Import-CSV c:\users.csv -Delimiter ";" | New-ADUser -Name $_.nom -GivenName $_.GivenName
PS> Import-CSV c:\users.csv -Delimiter ";" | Select GivenName @{n='Name';e={$_.nom}} | New-ADUser -Name $_.Name -GivenName $_.GivenName
```

- `n=Name`        : nouvelle étiquette de la propriété
- `e={$_.nom}`    : nom de la propriété dont la valeur va être récupérée
- `-Name $_.Name` : utilisation de la nouvelle propriété avec son nouveau label

On peut également changer l'**unité de mesure** remontée par les commandes.

Ex. la propriété **Length** est affiché en octet. On peut se servir des propriétés calculées pour afficher un résultat "*human-readable*".

```ps1
PS> Get-ChildItem -File | Select Name,
    @{
        n='Taille';
        e={ '{0:N2}' -f ($_.Length / 1MB) }
    }
```

- `'{0:N2}'` : numérique à 2 décimales
- `($_.Length / 1MB)` : La conversion est faite en bytes et non en octets.

Explications supplémentaires sur les formats : https://docs.microsoft.com/fr-fr/dotnet/standard/base-types/standard-numeric-format-strings

On peut également intégrer plusieurs propriétés calculées dans une même commande.

```ps1
PS> Get-Volume | Select DriveLetter,
    @{
        n='Taille (GB)';
        e={'{0:N2}' -f ($PSItem.Size / 1GB)}
    },
    @{
        n='Espace Libre (GB)';
        e={'{0:N2}' -f ($PSItem.SizeRemaining / 1GB)}
    }
```


<p class="fin">~Fin~</p>

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">