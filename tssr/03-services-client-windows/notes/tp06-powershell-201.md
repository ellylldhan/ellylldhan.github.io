title: tp06 - powershell 201

# ENI TSSR 03 - Services Client Windows
## TP06 - Devenir autonome avec PowerShell

[TOC]

### Win10
####  Afficher les commandes disponibles sur le Système

```ps1
ps> get-command
```

#### Afficher seulement les cmdlets

```ps1
ps> get-command -type cmdlet
ps> get-command -commandtype cmdlet
```

#### Afficher seulement les cmdlets commençant par get

```ps1
ps> get-command -commandtype cmdlet | where Name -like get*
ps> get-command -commandtype cmdlet [-Name] get* 
```
 
#### Afficher la liste des groupes locaux présents sur le Système

```ps1
ps> get-command *group*         # recherche
ps> get-localgroup              # trouvé
```

**Q: Quelles sont les 2 propriétés des groupes locaux que le Système affiche par défaut ?** 
Name, Description

#### Afficher les autres propriétés des groupes locaux qui ne sont pas affichés par le Système

```ps1
ps> get-localgroup | select *       # solution 1
ps> get-localgroup | format-list    # solution 2
```

#### Afficher SID et source principale du groupe Utilisateurs du bureau à distance

```ps1
ps> get-localgroup -Name *bureau*distance | select SID,PrincipalSource
```

### Win11
####  Afficher les disques dur de la vm 
Combien de disques ?

```ps1
# Moi
ps> get-command *drive*
ps> get-psdrive -provider filesystem

# Correction
ps> get-command *disk*
ps> get-disk
```

#### Afficher numéro et modèle des disques

```ps1
ps> get-disk | select Number, Model
```

#### Afficher seulement le nom, le type de bus et le fabricant du disque no. 2

```ps1
# Moi
ps> get-disk | select Name, BusType, Manufacturer | where Number -like 2

# Correction
ps> get-disk -Number 2 | select Name, BusType, Manufacturer
```

#### Afficher nom, status, description du pilote de l'adaptateur réseau de la vm

```ps1
ps> get-netadapter | select name, status, driverdescription
```

#### Afficher les membres du groupe local Administrateurs de la vm

```ps1
ps> get-localGroupMember administrateurs
```

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
