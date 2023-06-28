title: tp07 - gestion stockage

# ENI TSSR 03 - Services Client Windows
## TP07 - Gestion du stockage

[TOC]

#### Tâches à réaliser

Sur la VM Win10, ajouter **2 disques durs de 60 Go chacun** (*store virtual disk as a single file*).

**1. En mode graphique (diskmgmt.msc)**

1. Sur le 1er disque, créer 3 partitions principales de **15 Go** chacune sans assigner de lettre au lecteur et sans formater.
2. Créer une 4e partition de **7 Go** sans assigner de lettre de lecteur et sans formater.
3. Formater les 2 premières partitions de **15 Go** en **NTFS**. La première sera nommée **DATA**, la seconde **TOOLS**.
4. Attribuer la lettre **D** au volume **DATA** et la lettre **E** au volume **TOOLS**.
5. Formater la partition de **7 Go** restante en **FAT32**, que vous nommerez **ARCHIVE** et lui attribuer la lettre de votre choix.
6. Etendre le volume **DATA** disponible de **15 Go** supplémentaire. Pour cela, on utilisera que l'espace libre disponible sur le disque 2.

**2. En mode terminal (diskpart)**

1. Formater la 3eme partition de **15 Go** en **NTFS**. Lui attribuer le label **COMMUN** et une lettre au choix.
2. Etendre le volume **COMMUN** en utilisant l'espace libre restant sur le disque 1.
3. Supprimer le volume **DATA**.
4. Recréer le volume **DATA** avec l'ensemble de l'espace libre des deux disques.

**3. Investigation de la VM Win11** 

1. Afficher le numéro, la taille et le type de table de partitionnement des disques durs présents sur la VM (get-disk)
2. Afficher la lettre de lecteur le nom, la taille totale des volumes qui possèdent un FriendlyName (get-volume)
3. Attribuer le nom **SYSTEM** au disque **C:** (set-volume)

#### Utilisation de diskmgmt.msc
Rien de nouveau

#### Utilisation de diskpart
1. Ouvrir PS ou CMD en admin et lancer `diskpart`.
2. Formater la 3e partition de 15 Go en NTFS. La nommer **COMMUN**, assigner une lettre au choix.
3. Etendre le volume **COMMUN** en utilisant l'espace libre restant sur le **disque 1**.
4. Supprimer le volume **DATA**.
5. Recréer le volume **DATA** avec l'ensemble de l'espace libre de deux disques.

Voir la [totalité du procédé avec DISKPART](./tp07-diskpart-verbatim.html){:target="_blank"} 

**Résumé**

```
C:\Windows\system32>diskpart

DISKPART> list disk
DISKPART> select disk 1

DISKPART> list volume
DISKPART> select volume 1

# FORMAT + LABEL
DISKPART> format fs=ntfs label="COMMUN" quick

# ASSIGNER LETTRE
DISKPART> assign letter=Q

# EXTEND COMMUN
DISKPART> select disk 1
DISKPART> extend

# REMOVE DATA
DISKPART> select volume 3
DISKPART> remove                   (supprime la lettre du lecteur)
DISKPART> select disk 0
DISKPART> select volume 3
DISKPART> assign letter=D
DISKPART> delete volume

# RECREATION OF "DATA" VOLUME
DISKPART> select disk 1
DISKPART> create volume simple disk=1
DISKPART> assign letter=D
DISKPART> format fs=ntfs label="Data" quick
DISKPART> extend disk=2
```

#### Investigation sur la VM win11 avec Powershell
##### get-disk

Afficher le numéro, la taille et le type de table de partitionnement des disques durs présents sur la VM (get-disk)

```powershell
REM Moi
ps> get-partition | select DiskNumber, Size, Type

REM Correction (la bonne solution)
ps> get-disk | select DiskNumber, PartitionStyle, Size
```
 
##### get-volume

Afficher la lettre de lecteur le nom, la taille totale des volumes qui possèdent un FriendlyName (get-volume)

```powershell
REM Moi
ps> get-volume | select DriveLetter, FileSystemLabel, Size, SizeRemaining
```

##### set-volume

Attribuer le nom "SYSTEM" au disque C: (set-volume)

```powershell
REM Moi
ps> set-volume -DriveLetter "C" -NewFileSystemLabel "SYSTEM"
```

#### Bonus: sur la vm win10
Sur le lecteur **ARCHIVE**, créer des répertoires et des fichiers. Convertir le format du systeme de fichiers de **FAT32** à **NTFS** sans perte de données.

```
REM Boucle
cmd> for($i=0;$i -lt 8;$i++) { md rep$i; echo $i > file$i.txt }

REM Formatage (/v:verbose)
cmd> convert A: /fs:nfts /v    
```

<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
