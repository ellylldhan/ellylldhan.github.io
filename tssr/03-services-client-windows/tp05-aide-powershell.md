title: tp05 - aide powershell

# ENI TSSR 03 - Services Client Windows

[TOC]

## TP 05 - Manipuler l'aide de Powershell

#### Afficher l'aide complète de la cmdlet Get-Alias
```ps1
ps> get-help -full get-alias
```

#### Différence sur Win11 ?
Oui parce que l'update-help a été faite sur win10.

#### Màj dépot local
Mettre vm en bridge pour avoir accès au net. Attention c'est le login AD machine hôte

```ps1
ps> update-help -SourcePath \\ad.campus-eni.fr\Campus\distrib\depot\powershell -UICulture en-us -Credential rlizot2019
```

#### Obtenir les exemples de get-help

```ps1
ps> get-help -examples get-help
```

#### Afficher la liste de tous les concepts disponibles et utilisables

```ps1
ps> get-help about_*
```

#### En apprendre plus sur le concept d'alias

```ps1
ps> get-help -ShowWindow about_alias
```

	History & Aliases
	The aliases you create are saved only in the current session
	Aliases can be imported/exported


#### Historique de commande : `get-history`

- Nombre maxi de ligne d'historique conservée définie dans la variable `$MaximumHistoryCount`. 
Valeur par défaut : **4096 (lignes)**

- Modifier cette valeur :

```ps1
ps> get-history -count <int32>
```

<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
