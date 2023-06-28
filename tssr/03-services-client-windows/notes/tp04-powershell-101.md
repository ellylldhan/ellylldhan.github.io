title: tp04 - powershell 101

# ENI TSSR 03 - Services Client Windows

[TOC]

## TP 04 - Premier pas avec PowerShell
#### Quelle version de Powershell ?

```powershell
ps> $PSVERSIONTABLE
v5.1.19041.906
```

#### Afficher le contenu d'un repertoire

```ps1
ps> ls c:\users
ps> dir c:\users
ps> get-childitem c:\users
```

#### Afficher la liste des alias dans Powershell

```powershell
ps> get-alias -Definition get-childitem             # Correction
ps> get-alias | where-object ResolvedCommand -like get-childitem
```

#### Afficher contenu d'un fichier foo.txt

```powershell
ps> cat foo.txt
ps> type foo.txt
ps> more foo.txt                    # less ne fonctionne pas 
ps> foo.txt
ps> get-content foo.txt
```

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
