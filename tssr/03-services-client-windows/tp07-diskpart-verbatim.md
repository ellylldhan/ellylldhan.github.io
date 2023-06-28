titre: tp07 - diskpart (verbatim)

## TP07 - Gestion des stockages

**Diskpart - verbatim**

<pre>Microsoft Windows [version 10.0.19043.928]
(c) Microsoft Corporation. Tous droits réservés.

C:\Windows\system32&gt;diskpart

Microsoft DiskPart version 10.0.19041.610

Copyright (C) Microsoft Corporation.
Sur l’ordinateur : WIN10-RL

<span class="prompt">DISKPART&gt;</span> <span class="cli">help</span>

Microsoft DiskPart version 10.0.19041.610

ACTIVE      - Indiquer la partition sélectionnée comme étant active.
ADD         - Ajouter un miroir à un volume simple.
ASSIGN      - Assigner une lettre de lecteur ou un point de montage au volume
              sélectionné.
ATTRIBUTES  - Manipuler les attributs de volume ou de disque.
ATTACH      - Attache un fichier de disque virtuel.
AUTOMOUNT   - Activer et désactiver le montage automatique des volumes de base.
BREAK       - Détruire un jeu de miroir.
CLEAN       - Effacer les informations de configuration ou toutes les
              informations du disque.
COMPACT     - Tente de réduire la taille physique du fichier.
CONVERT     - Convertir à différents formats de disque.
CREATE      - Créer un volume, une partition ou un disque virtuel.
DELETE      - Supprimer un objet.
DETAIL      - Fournir des détails concernant un objet.
DETACH      - Détache un fichier de disque virtuel.
EXIT        - Quitter DiskPart.
EXTEND      - Étendre un volume.
EXPAND      - Étend la taille maximale disponible sur un disque virtuel.
FILESYSTEMS - Affiche les systèmes de fichiers en cours et pris en charge sur le volume.
FORMAT      - Formater la partition ou le volume actif
GPT         - Assigne des attributs à la partition GPT sélectionnée.
HELP        - Imprimer une liste de commandes.
IMPORT      - Importer un groupe de disques.
INACTIVE    - Marquer la partition sélectionnée comme inactive.
LIST        - Afficher une liste des objets.
MERGE       - Fusionne un disque enfant avec ses parents.
ONLINE      - Mettre en ligne un objet qui est actuellement marqué comme hors connexion.
OFFLINE     - Mettre hors connexion un objet actuellement marqué comme en ligne.
RECOVER     - Actualise l’état de tous les disques dans le jeu de disques sélectionné.
              Tente une récupération sur les disques situés dans le jeu de
                  disques non valide, et resynchronise les volumes en miroir et les
                  volumes RAID5 qui possèdent des données de plex ou de parité
                  périmées.
REM         - Ne fait rien. Utilisé pour commenter des scripts.
REMOVE      - Supprimer une lettre de lecteur ou l’assignement d’un point de
              montage.
REPAIR      - Réparer un volume RAID-5 avec un membre défectueux.
RESCAN      - Analyser à nouveau l’ordinateur à la recherche de disques et de
              volumes.
RETAIN      - Placer une partition nominale sous un volume simple.
SAN         - Afficher ou définir la stratégie SAN pour le système d’exploitation actuellement démarré.
SELECT      - Déplacer le focus vers un objet.
SETID       - Changer le type de partition.
SHRINK      - Réduisez la taille du volume sélectionné.
UNIQUEID    - Affiche ou définit l’identificateur de la table de partition GUID (GPT) ou
         signature de l’enregistrement de démarrage principal (MBR) d’un disque.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list</span>

Microsoft DiskPart version 10.0.19041.610

DISK        - Afficher une liste des disques. Par exemple, LIST DISK.
PARTITION   - Affichez la liste des partitions sur le disque sélectionné.
              Par exemple, LIST PARTITION.
VOLUME      - Afficher une liste des volumes. Par exemple, LIST VOLUME.
VDISK       - Affiche une liste des disques virtuels.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
  Disque 1    En ligne         60 G octets     9 G octets   *    *
  Disque 2    En ligne         60 G octets    45 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">select disk 2</span>

Le disque 2 est maintenant le disque sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
  Disque 1    En ligne         60 G octets     9 G octets   *    *
* Disque 2    En ligne         60 G octets    45 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">select disk 1</span>

Le disque 1 est maintenant le disque sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
* Disque 1    En ligne         60 G octets     9 G octets   *    *
  Disque 2    En ligne         60 G octets    45 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1                      RAW    Simple        14 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">select volume 1</span>

Le volume 1 est le volume sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
* Volume 1                      RAW    Simple        14 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">help format</span>

    Met en forme le volume spécifié pour l'utiliser avec Windows.

Syntaxe :  FORMAT [[FS=&lt;FS&gt;] [REVISION=&lt;X.XX&gt;] | RECOMMENDED] [LABEL=&lt;"label"&gt;]
                [UNIT=&lt;N&gt;] [QUICK] [COMPRESS] [OVERRIDE] [DUPLICATE] [NOWAIT]
                [NOERR]

    FS=&lt;FS&gt;     Spécifie le type de système de fichiers. Si aucun système de fichiers n'est proposé,
                le système de fichiers par défaut affiché par la commande FILESYSTEMS est
                utilisé.

    REVISION=&lt;X.XX&gt;

                Spécifie la révision du système de fichiers (si disponible).

    RECOMMENDED If specified, use the recommended file system and revision
                instead of the default if a recommendation exists. Le
                système de fichiers recommandé (s'il y en a un qui existe) s'affiche en utilisant la
                commande FILESYSTEMS.

    LABEL=&lt;"label"&gt;

                Spécifie l'étiquette du volume.

    UNIT=&lt;N&gt;    Remplace la taille d'unité d'allocation par défaut. Les paramètres par défaut
                sont fortement recommandés pour une utilisation générale. La
                taille d'unité d'allocation par défaut pour un système de fichiers spécifique s'affiche
                grâce à la commande FILESYSTEMS.

                NTFS compression n'est pas pris en charge pour des tailles d'unité d'allocation
                supérieures à 4 096.

    QUICK       Effectue une mise en forme rapide.

    COMPRESS    NTFS uniquement : les fichiers créés sur le nouveau volume seront compressés
                par défaut.

    OVERRIDE    Force le système de fichiers à se démonter en premier lieu si nécessaire. Tous les
                handles ouverts vers le volume ne seront plus valides.

    DUPLICATE   UDF uniquement : cet indicateur s'applique au format UDF, version 2.5 ou
                supérieure.
                Cet indicateur amène l'opération de mise en forme à dupliquer les métadonnées du système de fichiers
                vers un second ensemble de secteurs sur le disque. Les
                métadonnées en double seront utilisées par des applications, telles que les applications de réparation
                ou de récupération. S'il s'avère que les secteurs de métadonnées principales sont
                corrompus, les métadonnées du système de fichiers seront lues
                à partir des secteurs en double.

    NOWAIT      Force un retour immédiat de la commande pendant que le processus de mise en
                forme est toujours en cours. Si NOWAIT n'est pas spécifié,
                DiskPart affichera la progression de la mise sous forme de pourcentage.

    NOERR       À des fins de script uniquement. Lorsqu'une erreur se produit, DiskPart
                continue d'exécuter des commandes, comme si l'erreur ne s'était pas produite.
                Sans le paramètre NOERR, une erreur provoque la sortie de DiskPart
                avec un code d'erreur.

    Un volume doit être sélectionné pour que cette opération soit une réussite.

Exemples :

    FORMAT FS=NTFS LABEL="New Volume" QUICK COMPRESS
    FORMAT RECOMMENDED OVERRIDE

<span class="prompt">DISKPART&gt;</span> <span class="cli">select volume 1</span>

Le volume 1 est le volume sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
* Volume 1                      NTFS   Simple        14 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">format fs=ntfs label="COMMUN" quick</span>

  100 pour cent effectués

DiskPart a formaté le volume.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
* Volume 1         COMMUN       NTFS   Simple        14 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">assign letter=Q</span>

DiskPart a correctement assigné la lettre de lecteur ou le point de montage.

<span class="prompt">DISKPART&gt;</span> <span class="cli">help extend</span>

    Étend le volume ou la partition avec  et son système de fichiers vers un espace
    libre (non attribué) sur un disque.

Syntaxe :  EXTEND [SIZE=&lt;N&gt;] [DISK=&lt;N&gt;] [NOERR]
        EXTEND FILESYSTEM [NOERR]

    SIZE=&lt;N&gt;    Spécifie le volume d'espace en mégaoctets à ajouter au
                volume actuel ou à la partition actuelle. Si aucune taille n'est donné, l'ensemble
                de l'espace libre contigu disponible sur le disque est utilisé.

    DISK=&lt;N&gt;    Spécifie le disque sur lequel le volume ou la partition est
                étendu(e). Si aucun disque n'est spécifié, le volume ou la partition est
                étendu(e) au disque actuel.

    FILESYSTEM  Étend le système de fichiers du volume avec focus pour couvrir
                le volume entier. À utiliser uniquement sur des volumes où le système
                de fichiers n'était pas étendu avec le volume.

    NOERR       À des fins de script uniquement. Quand une erreur se produit, DiskPart
                continue de traiter des commandes comme si l'erreur ne s'était pas produite.
                Sans le paramètre NOERR, une erreur provoque la sortie de DiskPart
                avec un code d'erreur.

    Sur des disques de base, l'espace libre doit se trouver sur le même disque que le volume ou
    la partition avec focus. L'espace libre doit également immédiatement suivre le
    volume ou la partition avec focus (commence au prochain décalage de secteur).

    Sur des disques dynamiques avec des volumes simples ou des volumes fractionnés, un volume peut être étendu
    à n'importe quel espace libre sur un disque dynamique. En utilisant cette commande, vous pouvez convertir
    un simple volume dynamique en un volume dynamique fractionné. Mis en miroir, les volumes RAID-5 et
    agrégés par bandes ne peuvent pas être étendus.

    Si la partition était précédemment mise en forme avec le système de fichiers NTFS, le
    système de fichiers est automatiquement étendu pour remplir la partition de plus grande taille. Aucune perte
    de données ne se produit. Si la partition était précédemment mise en forme avec un autre
    système de fichiers que NTFS, la commande échoue, sans modification apportée à la partition.
    Si la partition n'était précédemment pas mise en forme avec un système de fichiers, la
    partition sera malgré tout étendue.

    Un volume ou une partition doit être sélectionné(e) pour que cette opération soit une réussite.

Exemple :

    EXTEND SIZE=500 DISK=3
    EXTEND FILESYSTEM

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
* Disque 1    En ligne         60 G octets     9 G octets   *    *
  Disque 2    En ligne         60 G octets    45 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">extend</span>

DiskPart a correctement étendu le volume.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
* Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">help remove</span>

    Supprime une lettre de lecteur ou un nom de chemin de dossier monté à partir du volume
    avec focus.

Syntaxe :  REMOVE [LETTER=&lt;D&gt; | MOUNT=&lt;PATH&gt; | ALL] [DISMOUNT] [NOERR]

    LETTER=&lt;D&gt;  La lettre de lecteur à supprimer.

    MOUNT=&lt;PATH&gt;

                Le chemin de dossier monté à supprimer.

    ALL         Supprime toutes les lettres de lecteur et chemins de dossiers montés existants.

    DISMOUNT    Ce paramètre peut être utilisé si 1) toutes les lettres de lecteur et
                chemins de dossiers montés ont été supprimés du volume, ou
                2) le paramètre ALL est spécifié.  Ce paramètre
                spécifie que le système de fichiers doit être démonté et
                le volume mis hors connexion. Si d'autres processus utilisent
                le volume, DiskPart ferme tout handle ouvert avant de
                démonter le système de fichiers et de mettre le volume hors connexion.
                Vous pouvez mettre le volume en ligne en lui affectant la lettre d'un
                lecteur, en créant un chemin de dossier monté vers le volume ou
                en utilisant la commande ONLINE. DISMOUNT échouera si ce paramètre est utilisé
                sur un volume comptant des lettres de lecteur restantes ou des chemins de dossiers
                montés. À des fins de script, utiliser REMOVE ALL DISMOUNT est
                recommandé.

    NOERR       À des fins de script uniquement. Lorsqu'une erreur se produit, DiskPart
                continue de traiter des commandes, comme si l'erreur ne s'était pas produite.
                Sans le paramètre NOERR, une erreur provoque la sortie de DiskPart
                avec un code d'erreur.

    Si aucune lettre de lecteur ou chemin de dossier monté n'est spécifié(e), DiskPart supprime
    la première lettre de lecteur ou le premier chemin de dossier monté qu'il rencontre. Si le paramètre ALL
    est utilisé, toutes les lettres de lecteur et tous les chemins de dossier montés actuels
    sont supprimés. Si le paramètre DISMOUNT est utilisé, DiskPart ferme tous les
    handles ouverts vers le volume, puis démonte le volume et le met hors connexion.

    La commande REMOVE peut être utilisée pour modifier la lettre de lecteur associée à un
    lecteur amovible. Vous ne pouvez pas supprimer les lettres de lecteur sur des volumes de démarrage ou de
    pagination.

    Un volume doit être sélectionné pour que cette opération soit une réussite.

Exemple :

    REMOVE LETTER=K
    REMOVE MOUNT=G:\MountH
    REMOVE ALL DISMOUNT

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
* Disque 1    En ligne         60 G octets      0 octets   *    *
  Disque 2    En ligne         60 G octets    45 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
* Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">select volume 3</span>

Le volume 3 est le volume sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">remove</span>

DiskPart a correctement supprimé la lettre de lecteur ou le point de montage.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
  Disque 1    En ligne         60 G octets      0 octets   *    *
  Disque 2    En ligne         60 G octets    45 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
* Volume 3         DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">select disk 0</span>

Le disque 0 est maintenant le disque sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">select volume 3</span>

Le volume 3 est le volume sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
* Volume 3         DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">assign letter=D</span>

DiskPart a correctement assigné la lettre de lecteur ou le point de montage.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
* Volume 3     D   DATA         NTFS   Fractionné    29 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">delete volume</span>

DiskPart a correctement supprimé le volume.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">select disk 1</span>

Le disque 1 est maintenant le disque sélectionné.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
* Disque 1    En ligne         60 G octets    14 G octets   *    *
  Disque 2    En ligne         60 G octets    59 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">help create</span>

Microsoft DiskPart version 10.0.19041.610

PARTITION   - Créer une partition.
VOLUME      - Créer un volume.
VDISK       - Crée un fichier de disque virtuel.

<span class="prompt">DISKPART&gt;</span> <span class="cli">help create volume</span>

Microsoft DiskPart version 10.0.19041.610

RAID        - Créer un jeu de volume RAID-5 logiciel.
SIMPLE      - Créer un volume simple.
STRIPE      - Créer un jeu de volumes par bandes.
MIRROR      - Créez un jeu de volumes miroir.

<span class="prompt">DISKPART&gt;</span> <span class="cli">help create volume simple</span>

    Crée un volume simple.

Syntaxe :  CREATE VOLUME SIMPLE [SIZE=&lt;N&gt;] [DISK=&lt;N&gt;] [ALIGN=&lt;N&gt;] [NOERR]

    SIZE=&lt;N&gt;    Taille du volume en méga-octets (Mo). Si aucune taille n’est
                spécifiée, le nouveau volume occupe la totalité de l’espace disque disponible sur le disque.

    DISK=&lt;N&gt;    Disque dynamique sur lequel le volume est créé. Si aucun
                disque n’est spécifié, le disque actuel est utilisé.

    ALIGN=&lt;N&gt;   Généralement utilisé avec des baies matérielles RAID LUN
                (numéro d’unité logique) pour améliorer les performances. Aligne toutes les étendues de volume à la limite
                d’alignement la plus proche. Le décalage des étendues sera
                un multiple de &lt;N&gt;.

    NOERR       Pour script uniquement. En cas d’erreur, DiskPart continue à
                traiter les commandes comme si l’erreur ne s’était pas produite.
                Sans le paramètre NOERR, la détection d’une erreur
                entraîne la fermeture de DiskPart et l’affichage d’un code d’erreur.

    Après la création du volume, le focus se déplace automatiquement sur
    le nouveau volume.

Exemple :

    CREATE VOLUME SIMPLE SIZE=1000 DISK=1

<span class="prompt">DISKPART&gt;</span> <span class="cli">create volume simple disk=1</span>

DiskPart a correctement créé le volume.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list disk</span>

  N° disque  Statut         Taille   Libre    Dyn  GPT
  ---------  -------------  -------  -------  ---  ---
  Disque 0    En ligne         32 G octets  1024 K octets        *
* Disque 1    En ligne         60 G octets      0 octets   *    *
  Disque 2    En ligne         60 G octets    59 G octets   *    *

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
* Volume 3                      RAW    Simple        14 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span> <span class="cli">assign letter=D</span>

DiskPart a correctement assigné la lettre de lecteur ou le point de montage.

<span class="prompt">DISKPART&gt;</span> <span class="cli">format fs=ntfs label="Data" quick</span>

  100 pour cent effectués

DiskPart a formaté le volume.

<span class="prompt">DISKPART&gt;</span> <span class="cli">help extend</span>

    Étend le volume ou la partition avec  et son système de fichiers vers un espace
    libre (non attribué) sur un disque.

Syntaxe :  EXTEND [SIZE=&lt;N&gt;] [DISK=&lt;N&gt;] [NOERR]
        EXTEND FILESYSTEM [NOERR]

    SIZE=&lt;N&gt;    Spécifie le volume d'espace en mégaoctets à ajouter au
                volume actuel ou à la partition actuelle. Si aucune taille n'est donné, l'ensemble
                de l'espace libre contigu disponible sur le disque est utilisé.

    DISK=&lt;N&gt;    Spécifie le disque sur lequel le volume ou la partition est
                étendu(e). Si aucun disque n'est spécifié, le volume ou la partition est
                étendu(e) au disque actuel.

    FILESYSTEM  Étend le système de fichiers du volume avec focus pour couvrir
                le volume entier. À utiliser uniquement sur des volumes où le système
                de fichiers n'était pas étendu avec le volume.

    NOERR       À des fins de script uniquement. Quand une erreur se produit, DiskPart
                continue de traiter des commandes comme si l'erreur ne s'était pas produite.
                Sans le paramètre NOERR, une erreur provoque la sortie de DiskPart
                avec un code d'erreur.

    Sur des disques de base, l'espace libre doit se trouver sur le même disque que le volume ou
    la partition avec focus. L'espace libre doit également immédiatement suivre le
    volume ou la partition avec focus (commence au prochain décalage de secteur).

    Sur des disques dynamiques avec des volumes simples ou des volumes fractionnés, un volume peut être étendu
    à n'importe quel espace libre sur un disque dynamique. En utilisant cette commande, vous pouvez convertir
    un simple volume dynamique en un volume dynamique fractionné. Mis en miroir, les volumes RAID-5 et
    agrégés par bandes ne peuvent pas être étendus.

    Si la partition était précédemment mise en forme avec le système de fichiers NTFS, le
    système de fichiers est automatiquement étendu pour remplir la partition de plus grande taille. Aucune perte
    de données ne se produit. Si la partition était précédemment mise en forme avec un autre
    système de fichiers que NTFS, la commande échoue, sans modification apportée à la partition.
    Si la partition n'était précédemment pas mise en forme avec un système de fichiers, la
    partition sera malgré tout étendue.

    Un volume ou une partition doit être sélectionné(e) pour que cette opération soit une réussite.

Exemple :

    EXTEND SIZE=500 DISK=3
    EXTEND FILESYSTEM

<span class="prompt">DISKPART&gt;</span> <span class="cli">extend disk=2</span>

DiskPart a correctement étendu le volume.

<span class="prompt">DISKPART&gt;</span> <span class="cli">list volume</span>

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     A   ARCHIVE      FAT32  Simple      7000 M   Sain
  Volume 1     Q   COMMUN       NTFS   Simple        23 G   Sain
  Volume 2     E   TOOLS        NTFS   Simple        14 G   Sain
* Volume 3     D   Data         NTFS   Fractionné    74 G   Sain
  Volume 4     Z   CCCOMA_X64F  UDF    DVD-ROM     5587 M   Sain
  Volume 5     C                NTFS   Partition     31 G   Sain       Démarrag
  Volume 6                      FAT32  Partition    100 M   Sain       Système
  Volume 7                      NTFS   Partition    522 M   Sain       Masqué

<span class="prompt">DISKPART&gt;</span></pre>

<style>

.cli {
    font-weight:  bold;
    color:  #ba0bab;
}

.prompt {
    font-weight:  bold;
    color: darkblue;
}
</style>