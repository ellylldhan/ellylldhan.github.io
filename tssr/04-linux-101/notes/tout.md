title: Linux 101 | TPs

## 04 - Linux 101
Du 14/02 au 18/02 - Formateur : Hasan KURTULUS 

[TOC]

### TP 01 - Premières commandes

#### Setup
- Activer VPN
- Connection à une vm de l'ENI en ssh 

```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```

#### 1. changer le mot de passe et tester

```sh
$ passwrd     # will prompt
```

#### 2. Depuis quand êtes-vous connecté ?

```sh
$ who -tuH
NOM      LIGNE        HEURE                   PID COMMENTAIRE
user01   tty1         2022-02-14 10:32 00:49         671
eni      pts/0        2022-02-14 10:53   .          1047 (10.52.0.254)
user18   pts/1        2022-02-14 11:05   .          1333 (10.52.101.13)
user20   pts/2        2022-02-14 11:04   .          1231 (10.52.101.8)
user02   pts/3        2022-02-14 11:05 00:03        1343 (10.52.101.17)
user01   pts/4        2022-02-14 11:04 00:04        1251 (10.52.101.7)
user15   pts/5        2022-02-14 11:18   .          1709 (172.25.35.73)
user10   pts/6        2022-02-14 11:04   .          1302 (10.52.101.6)
user19   pts/7        2022-02-14 11:04 00:05        1253 (10.52.101.10)
user13   pts/8        2022-02-14 11:04   .          1289 (10.52.101.15)
user08   pts/9        2022-02-14 10:52   .          1001 (10.52.101.18)
user17   pts/10       2022-02-14 11:08   .          1443 (10.52.101.12)
user07   pts/11       2022-02-14 11:07   .          1374 (10.52.101.20)
user09   pts/12       2022-02-14 11:01   .          1168 (10.52.101.20)
user03   pts/13       2022-02-14 11:08   .          1396 (10.52.101.14)
user04   pts/14       2022-02-14 11:08 00:13        1392 (10.52.101.18)
user16   pts/15       2022-02-14 11:19   .          1739 (172.25.35.212)
user14   pts/16       2022-02-14 11:16   .          1655 (10.52.101.3)
```

#### 3. Quels sont les utilisateurs qui travaillent sur le serveur ?

Voir colonne NOM

#### 4. Quel est le temps d'inactivité des utilisateurs connectés ?

voir colonne HEURE

#### 5. Quel est le numéro de processus de votre session ?

voir colonne PID (moi: 1709)

#### 6. Afficher détails user & group
6. Afficher vos identifiants d'utilisateur et de groupes (UID et GID) et relevez les noms de vos
groupes d’appartenance.

```sh
$ id
uid=1185(user15) gid=1185(user15) groupes=1185(user15),100(users),1000(eni)
```

#### 7. Afficher heure
7. A l'invite de commande, afficher juste l’heure.

```sh
$ date
lundi 14 février 2022, 11:33:43 (UTC+0100)
```

#### 8. Afficher date formatée
8. A l'invite, afficher juste la date, suivant l'exemple : lundi 24 septembre 2009

Voir `date --help` 

```sh
$ date +"%A %d %B %Y"
lundi 14 février 2022
```

#### 9. cal
9. Commande cal avec et sans argument :

```sh
$ cal
    Février 2022      
di lu ma me je ve sa  
       1  2  3  4  5  
 6  7  8  9 10 11 12  
13 14 15 16 17 18 19  
20 21 22 23 24 25 26  
27 28  
```

a) Afficher le calendrier de Janvier 1900 puis celui de toute l’année.

```
$ cal 1 1900
	    Janvier 1900      
	di lu ma me je ve sa  
	    1  2  3  4  5  6  
	 7  8  9 10 11 12 13  
	14 15 16 17 18 19 20  
	21 22 23 24 25 26 27  
	28 29 30 31
```

b) Afficher le calendrier du mois de Janvier de l'année courante.    

```sh
$ cal 1 2022
	    Janvier 2022      
	di lu ma me je ve sa  
	                   1  
	 2  3  4  5  6  7  8  
	 9 10 11 12 13 14 15  
	16 17 18 19 20 21 22  
	23 24 25 26 27 28 29  
	30 31
```

c) Afficher le calendrier de septembre 1752, quelle est la particularité de ce mois ?

```sh
$ cal 9 1752
   Septembre 1752     
di lu ma me je ve sa  
       1  2 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30
```

Ca saute de 10 jours à cause passage à un nouveau calendrier.

> 1752 (MDCCLII) was a leap year starting on Saturday of the Gregorian  
> calendar and a leap year starting on Wednesday of the Julian calendar 
> [...]
> (Wikipedia)

#### Bonus : secondes depuis epoch

10. **BONUS** Combien de secondes se sont écoulées depuis que Unix existe ?

```sh
$ date +%s
1644835775
```








### TP 02 - Manipuler les fichiers

- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```

1. Où êtes-vous positionné dans l'arborescence ?
```sh
$ echo $PWD
/home/user15
```

2. Existe-t-il des fichiers et des répertoires ?
```sh
$ ls
Edition
```

3. Créer un fichier vide appelé MonPremierFichier.
```sh
$ mkdir MonPremierFichier
```

4. Afficher les permissions et le propriétaire attribués à ce fichier.
```sh
$ ls -l
total 8
-rw-r--r-- 1 user15 user15  590 juin  22  2021 Edition
drwxr-xr-x 2 user15 user15 4096 févr. 14 12:02 MonPremierFichier
```

5. Afficher les fichiers se terminant par l'extension .conf dans le répertoire /etc.
```sh
$ ls /etc/*.conf
/etc/adduser.conf            /etc/host.conf        /etc/pam.conf
/etc/ca-certificates.conf    /etc/kernel-img.conf  /etc/reportbug.conf
/etc/debconf.conf            /etc/ld.so.conf       /etc/resolv.conf
/etc/deluser.conf            /etc/libaudit.conf    /etc/rsyslog.conf
/etc/discover-modprobe.conf  /etc/logrotate.conf   /etc/sysctl.conf
/etc/gai.conf                /etc/mke2fs.conf      /etc/ucf.conf
/etc/hdparm.conf             /etc/nsswitch.conf    /etc/xattr.conf
```

6. Afficher les caractéristiques détaillées du répertoire /tmp (pas son contenu), 
que remarquez-vous de particulier ?

```sh
$ ls -ld /tmp
drwxrwxrwt 8 root root 4096 févr. 14 12:06 /tmp
```

- `l` = liste
- `d` = liste le contenu uniquement

Le flag `t` indique que c'est un dossier temporaire ?



7. Afficher les fichiers et répertoires (pas leur contenu) dont le nom 
commence par a, b, c ou d du répertoire /etc.

```sh
$ ls -d /etc/[a-d]*
/etc/adduser.conf            /etc/ca-certificates       /etc/debconf.conf
/etc/alternatives            /etc/ca-certificates.conf  /etc/debian_version
/etc/apm                     /etc/calendar              /etc/default
/etc/apparmor                /etc/console-setup         /etc/deluser.conf
/etc/apparmor.d              /etc/cron.d                /etc/dhcp
/etc/apt                     /etc/cron.daily            /etc/dictionaries-common
/etc/bash.bashrc             /etc/cron.hourly           /etc/discover.conf.d
/etc/bash_completion         /etc/cron.monthly          /etc/discover-modprobe.conf
/etc/bind                    /etc/crontab               /etc/dpkg
/etc/bindresvport.blacklist  /etc/cron.weekly
/etc/binfmt.d                /etc/dbus-1
```

8. Créer l'arborescence suivante dans votre répertoire de travail ($HOME) :
```
		$HOME
		   |
	   +---+---+
       |       |
      bin     Tp 
               |
      +--------+-------+     
      |        |       |
    Bourne KornShell Divers
                       |
               +-------+-------+
               |       |       |
             Sources  lib   Executables
```

```sh
$ mkdir -pv bin Tp/{Bourne,KornShell} Tp/Divers/{Sources,lib,Executables} 
mkdir: création du répertoire 'bin'
mkdir: création du répertoire 'Tp'
mkdir: création du répertoire 'Tp/Bourne'
mkdir: création du répertoire 'Tp/KornShell'
mkdir: création du répertoire 'Tp/Divers'
mkdir: création du répertoire 'Tp/Divers/Sources'
mkdir: création du répertoire 'Tp/Divers/lib'
mkdir: création du répertoire 'Tp/Divers/Executables'
$ tree
.
├── bin
└── Tp
    ├── Bourne
    ├── Divers
    │   ├── Executables
    │   ├── lib
    │   └── Sources
    └── KornShell
```

9. Positionnez-vous dans le répertoire Sources. Dans ce répertoire, créer un fichier qui
comporte, dans son nom, un astérisque.

```sh
$ mkdir 'test*'
```

10. Sans vous déplacez dans l’arborescence, essayer de supprimer le répertoire Sources en
utilisant la commande rmdir. Que constatez-vous ?

```
$ rmdir Sources/
  rmdir: impossible de supprimer 'Sources/': Le dossier n'est pas vide
```

11. Supprimer le répertoire Divers en utilisant la commande rm.

```sh
$ rm Divers/ -fRv
répertoire 'Divers/Executables' supprimé
répertoire 'Divers/lib' supprimé
répertoire 'Divers/Sources/test*' supprimé
répertoire 'Divers/Sources' supprimé
répertoire 'Divers/' supprimé
```


12. Bonus 1 : 
Après vous être positionné dans votre répertoire d'accueil, afficher la liste détaillée des fichiers
répondants aux critères suivants :
- ils sont présents directement dans /etc
- leurs noms finissent par l'extension .conf
- la première lettre est une consonne, celle précédant l'extension est comprise entre f et s
- ils comportent exactement 6 lettres (hors extension).

```
$ ls /etc/ | egrep -i "([^aeiou]*[f-s]){6}.conf"  
rsyslog.conf

$ ls /etc/[!aeiouy][a-z0-9][a-z0-9][a-z0-9][f-s].conf
```

12. Bonus 2 : 
Créer un répertoire "startup rc3" dans votre répertoire d'accueil. Ce dossier devra contenir les
liens symboliques des fichiers commençant par "S" + 2 chiffres situés dans /etc/rc3.d.
La commande vous permettant de réaliser cette action devra vous afficher le détail des opérations
effectuées.

```sh
$ mkdir ~/startup rc3 && cd $_
$ cp -sv /etc/rc3.d/S* .
'/etc/rc3.d/S01bind9' -> './S01bind9'
'/etc/rc3.d/S01console-setup.sh' -> './S01console-setup.sh'
'/etc/rc3.d/S01cron' -> './S01cron'
'/etc/rc3.d/S01dbus' -> './S01dbus'
'/etc/rc3.d/S01lvm2-lvmpolld' -> './S01lvm2-lvmpolld'
'/etc/rc3.d/S01rsyslog' -> './S01rsyslog'
'/etc/rc3.d/S01ssh' -> './S01ssh'
'/etc/rc3.d/S01sudo' -> './S01sudo'
```

**Créer des liens symboliques au lieu d'une copie** :

```sh
$ cp  -s, --symbolic-link
```

13. Bonus 3 : 
Afficher la liste détaillée des fichiers ou répertoires présents directement 
dans le point d'arborescence destiné à l’hébergement de journaux, dont 
la première lettre est une consonne, la troisième une voyelle et dont 
l'extension est soit log, soit warn. La commande trouvée ne devra posséder 
qu'un seul argument.

```
$ ls /var/log/[^aeuio]?[aeiou]*.{log,warn} 
  ls: impossible d'accéder à '/var/log/[^aeuio]?[aeiou]*.warn': Aucun fichier ou dossier de ce type
  /var/log/daemon.log
 
$ ls /var/log/[^aeuio]?[aeiou]*.{log,warn} 2>/dev/null
  /var/log/daemon.log
```






 

### TP 03 - Afficher le contenu des fichiers

- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```

1. Créez un nouveau fichier appelé MonDeuxiemeFichier à l'aide de la commande cat, dont le
contenu sera :

```
Conseil :
pour bien utiliser la ligne de commande
faire des étirements de doigts avant chaque repas.
```

```
$ cat > MonDeuxiemeFichier << DELIM
> Conseil :
> pour bien utiliser la ligne de commande
> faire des étirements de doigts avant chaque repas.
> DELIM
$ cat MonDeuxiemeFichier 
Conseil :
pour bien utiliser la ligne de commande
faire des étirements de doigts avant chaque repas.
```

2. Créez un fichier MonTroisiemeFichier avec cat, contenant le texte :

```
Ne pas oublier de lire au moins 4 pages de man avant d'aller se coucher
```

```
$ cat > MonTroisiemeFichier
Ne pas oublier de lire au moins 4 pages de man avant d'aller se coucher
<CTRL-D>
$ cat MonTroisiemeFichier 
Ne pas oublier de lire au moins 4 pages de man avant d'aller se coucher
```


3. Créez un nouveau fichier fichier2+3 par concaténation des deux fichiers 
qui viennent d'être créés.

```
$ cat MonDeuxiemeFichier MonTroisiemeFichier > fichier2+3
$ cat fichier2+3 
Conseil :
pour bien utiliser la ligne de commande
faire des étirements de doigts avant chaque repas.
Ne pas oublier de lire au moins 4 pages de man avant d'aller se coucher
```

4. Combien de comptes d'utilisateurs ont été créés sur la machine, sachant que le fichier
contenant les utilisateurs est /etc/passwd et qu'une ligne correspond à un utilisateur ?

```sh
$ cat /etc/passwd | wc -l
62
$ wc -l /etc/passwd
62 /etc/passwd
```

5. Afficher uniquement les 2 premières lignes du fichier /etc/hosts.

```sh
$ head -2 /etc/hosts
	127.0.0.1       localhost
	127.0.1.1       srv-formateur
```







### TP 04 - Les Liens

- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```

1. Créez un **lien physique** (`ln ORIGIN NEW`) du fichier Edition vers le fichier edition1.txt, 
vérifiez que vous pouvez afficher son contenu.

```sh
$ ln Edition edition1.txt  
$ ls
 bin          edition1.txt   MonDeuxiemeFichier   'startup rc3'
 concat.tar   fichier2+3     MonPremierFichier     test.txt
 Edition      foo            MonTroisiemeFichier   Tp
$ ls -l
total 56
-rw-r--r-- 2 user15 user15   590 juin  22  2021  Edition
-rw-r--r-- 2 user15 user15   590 juin  22  2021  edition1.txt
$ cat edition1.txt 
<OK>
```

2. Créez un **lien symbolique** (`ln -s ORIGIN NEW`) du fichier edition1.txt vers le fichier 
/tmp/stagxx/edition2.txt, vérifiez que vous pouvez afficher son contenu.

```sh
$ mkdir /tmp/stag15 
$ ln -s edition1.txt /tmp/stag15/edition2.txt
$ ls -l /tmp/stag15
total 0
lrwxrwxrwx 1 user15 user15 12 févr. 14 15:55 edition2.txt -> edition1.txt
```

3. Créez un **lien physique** du fichier edition1.txt vers le fichier 
edition3.txt, vérifiez que vous pouvez afficher son contenu.


```sh
$ ln edition1.txt edition3.txt
```

4. Affichez avec la commande ls les caractéristiques de ces 4 fichiers 
en mettant en évidence les différences.

```sh
$ ls -li edition* /tmp/stag15/edition2.txt 
915720 -rw-r--r-- 3 user15 user15 604 févr. 14 16:02 edition1.txt
915720 -rw-r--r-- 3 user15 user15 604 févr. 14 16:02 edition3.txt
264635 lrwxrwxrwx 1 user15 user15  12 févr. 14 15:55 /tmp/stag15/edition2.txt -> edition1.txt
```
Si on modifie un des fichiers en hard link, les modif sont répercutées 
sur les autres fichiers en hard link. Même inode

5. Supprimez le fichier edition1.txt, pouvez-vous afficher le contenu de
edition2.txt et edition3.txt ?


```sh
$ rm ~/edition1.txt
$ cat ~/edition3.txt
<ok>
$ cat /tmp/stag15/edition2.txt 
cat: /tmp/stag15/edition2.txt: Aucun fichier ou dossier de ce type
$ ls /tmp/stag15/edition2.txt -li
264635 lrwxrwxrwx 1 user15 user15 12 févr. 14 15:55 /tmp/stag15/edition2.txt -> edition1.txt
``` 








### TP 05 - Recherche de contenu et de fichiers

- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```


1. Recherchez toutes les lignes contenant Dupont dans le fichier Edition.

```sh
$ grep Dupont Edition
Dupont Jean 111111
Dupont Jean 111111
Dupont Patrice 222222
Dupont Jojo 999999
Dupont Pierre 222222
```

2. Recherchez toutes les lignes contenant dupont quel que soit la casse 
dans le fichier Edition.

```sh
$ grep -i dupont Edition
Dupont Jean 111111
Dupont Jean 111111
Dupont Patrice 222222
Dupont Jojo 999999
Dupont Pierre 222222
```


3. Affichez toutes les lignes non vides du fichier Edition.

```sh
$ grep -n "\S" Edition
1:Aboaf Maurice 244748
2:Adda Jen 239234
3:Allo Jean-Pierre 255398
4:Ben Raf 238899
6:Bernard Jean-Paul 234567
7:ChasserAt Paul 245678
8:Cousin Pascal 222222
9:Froideceaux Michel 252423
10:Gros Lucien 212121
11:Cayrol Patrice 123456
12:Beux Leon 567891
13:Dupont Jean 111111
14:Dupont Jean 111111
16:Dupont Patrice 222222
17:Dupont Jojo 999999
18:Dupont Pierre 222222
19:Pavageau Andre 222222
20:Serpinet Roland
22:Holka Tadeusz 333333
23:Senechal Yves 245646
24:Gross Parcal 245367
25:Fiquet Paul 265746
26:Firon Pascale 123456
28:Pecheur Francois 223456
29:Grosbois Anne 123456
30:Fiancet Henri 098765
31:Couteau Jean 456378
32:Causse Claude
33:Blanche Michele
34:Sandra Housse
```


4. Listez les fichiers contenant localhost dans le répertoire /etc sans 
inclure les sous-répertoires.

```sh
$ grep -nd localhost /etc/*
grep: argument « localhost » incorrect pour « --directories »
Les arguments valables sont :
  - « read »
  - « recurse »
  - « skip »
Usage: grep [OPTION]... PATTERNS [FILE]...
Exécutez « grep --help » pour obtenir des renseignements complémentaires.

$ grep -nd skip localhost /etc/*
grep: /etc/gshadow: Permission non accordée
grep: /etc/gshadow-: Permission non accordée
/etc/hosts:1:127.0.0.1  localhost
/etc/hosts:5:::1     localhost ip6-localhost ip6-loopback
/etc/reportbug.conf:66:# smtphost localhost
grep: /etc/shadow: Permission non accordée
grep: /etc/shadow-: Permission non accordée
grep: /etc/sudoers: Permission non accordée

$ grep -nd skip localhost /etc/* 2>/dev/null
/etc/hosts:1:127.0.0.1  localhost
/etc/hosts:5:::1     localhost ip6-localhost ip6-loopback
/etc/reportbug.conf:66:# smtphost localhost
```


5. Recherchez tous les fichiers standards commençant par ho à partir du répertoire /etc.

```sh
$ find /etc/ -type f -iname ho* 2>/dev/null
/etc/host.conf
/etc/hosts
/etc/apparmor.d/tunables/home
/etc/hosts.allow
/etc/hosts.deny
/etc/hostname
```


6. Recherchez tous les répertoires depuis votre répertoire personnel.

```sh
$ find ~ -type d
/home/user15
/home/user15/Tp
/home/user15/Tp/KornShell
/home/user15/Tp/Bourne
/home/user15/startup rc3
/home/user15/MonPremierFichier
/home/user15/bin
```

7. Recherchez tous les fichiers standards de votre répertoire personnel se terminant par txt et
en faire une copie avec l'extension .save.

```sh
$ find . -type f -iname "*.txt"
./test.txt
./edition3.txt
$ find . -type f -iname "*.txt" -exec cp "{}" "{}.save" \;
$ ls
 bin            edition3.txt.save    MonPremierFichier     test.txt.save
 concat.tar     fichier2+3           MonTroisiemeFichier   Tp
 Edition        foo                 'startup rc3'
 edition3.txt   MonDeuxiemeFichier   test.txt
```


Bonus 1 :
Recherchez depuis /home les fichiers présents directement à la racine des répertoires personnels
dont le nom se termine par “ition”.

```sh
$ find /home -type f -iname *ition 2>/dev/null
/home/user34/Edition  /home/user01/Edition  /home/user19/Edition  /home/user11/Edition
/home/user25/Edition  /home/user23/Edition  /home/user04/Edition  /home/user09/Edition
/home/user35/Edition  /home/user13/Edition  /home/user30/Edition  /home/user21/Edition
/home/user22/Edition  /home/user24/Edition  /home/user18/Edition  /home/user06/Edition  
/home/user33/Edition  /home/user28/Edition  /home/user16/Edition  /home/user31/Edition  
/home/user02/TP4/Edition /home/user15/Edition /home/user32/Edition /home/user14/Edition
/home/user08/Edition  /home/user27/Edition  /home/user29/Edition  /home/user03/Edition
/home/user20/Edition  /home/user26/Edition  /home/user07/Edition  /home/user17/Edition
/home/user12/Edition  /home/user05/Edition  /home/user10/Edition
```


Bonus 2 :
En reprenant les critères du Bonus 1, chaque élément trouvé devra être affiché sur une ligne, seuls
le nom du fichier (sans son chemin) et le jour de la semaine seront à afficher.

```sh
$ find /home -type f -iname *ition  -exec echo $(basename "{}") $(date +"%A") \; 2>/dev/null
/home/user34/Edition mardi
/home/user01/Edition mardi
/home/user19/Edition mardi
/home/user11/Edition mardi
/home/user25/Edition mardi
/home/user23/Edition mardi
/home/user04/Edition mardi
/home/user09/Edition mardi
/home/user35/Edition mardi
/home/user13/Edition mardi
/home/user30/Edition mardi
/home/user21/Edition mardi
/home/user22/Edition mardi
/home/user24/Edition mardi
/home/user18/Edition mardi
/home/user06/Edition mardi
/home/user33/Edition mardi
/home/user28/Edition mardi
/home/user16/Edition mardi
/home/user31/Edition mardi
/home/user02/TP4/Edition mardi
/home/user15/Edition mardi
/home/user32/Edition mardi
/home/user14/Edition mardi
/home/user08/Edition mardi
/home/user27/Edition mardi
/home/user29/Edition mardi
/home/user03/Edition mardi
/home/user20/Edition mardi
/home/user26/Edition mardi
/home/user07/Edition mardi
/home/user17/Edition mardi
/home/user12/Edition mardi
/home/user05/Edition mardi
/home/user10/Edition mardi

$ find /home -type f -iname *ition -printf "%p %TA \n" 2>/dev/null
[...]
```


Bonus 3 :
Trouvez TOUS les fichiers que votre utilisateur peut modifier sur le système.

```sh
$ find / -writable 2>/dev/null
[...]
$ find / -user user18 -writable 2>/dev/null
[...]
$ find / -user user18 -writable -perm 664 2>/dev/null
[...]
```

Ultra-bonus :
Trouvez la méthode la plus rapide pour répondre au Bonus 3.

```sh
$ find / -writable 2>/dev/null
[...]
```







### TP 06 - Edition de texte avec vim

- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```


1. Ouvrir le fichier Edition de votre répertoire d'accueil avec vi.

```sh
$ vim Edition
```

2. Le premier Dupont Jean se prénomme en fait Jean-Jacques. Rechercher la première
occurrence de Dupont Jean.


```sh
/Dupont Jean
```



3. Déplacez-vous sur le n de Jean puis insérer -Jacques.
E : goto end WORD
A : append at eol
a : append


```sh
/Dupont Jean
EE
a
type '-Jacques'
echap
:wq
```


4. De la même manière, rechercher Dupont Pierre et insérer Jean- après 
vous être placé sur le 'P' de Pierre.
W : next WORD
w : next word
i : insertion

```sh
/Dupont Pierre
w
i
Jean-
```


5. Replacez-vous en début de fichier.
H : goto screen top
L : goto screen bottom

```sh
H
```


6. Chercher le premier Dupont et insérer sur la ligne précédente votre nom et prénom.
o : append (open) a new line below the current line
O : append (open) a new line above the current line

```sh
/Dupont
O
Marcel Pythagore 666
echap
:w
```


7. Entrer le nom et le prénom de votre voisin après la ligne du dernier Dupont. 
Déplacez-vous dans le fichier sur les différentes occurrences avec les 
touches 'n' et 'N'.
n : next find
N : prev find

```sh
/Dupont
nnnnn
o
Micheline Socrates 456789
echap
:w
```


8. Enregistrer les modifications apportées au fichier et sortir de l'éditeur.

```sh
:wq
```


9. Dupont Jean s'appelle en fait Merlin-Duval Jean. 
Recherchez Dupont Jean et changez Dupont par Merlin-Duval.

```sh
:%s/^Dupont Jean /Merlin-Duval Jean /
```


10. Supprimer la ligne Couteau Jean après l'avoir retrouvée.

```sh
/Couteau
dd
```


11. Changer tous les Dupont en Durand.

```sh
:%s/^Dupont /Durand /g
```


12. Déplacer toutes les lignes contenant Durand en fin de fichier.

- `:10,20t 100` 	copie les lignes de 10 a 20 a la 100 eme ligne .
- `:10,20m 100` 	deplace les lignes de 10 a 20 a la 100 eme ligne .
- `:10,20y` 		met dans le buffer les 10 lignes de 10 a 20.
- `:100,$m 50` 		deplace les lignes 100 jusqu'a la fin du fichier vers la 50 eme ligne.
- `yy` 				copie la ligne courante dans le buffer .
- `p` 				colle le buffer dans le texte.

m$ envoie à la fin du fichier
m100 envoie à la ligne 100

```sh
:g/Durand/m$

```


13. Ajouter un second Ben Raf, en dupliquant la ligne existante.

Action contexte sensitif, ou substitution puissance 10
On peut demander a VI de faire une action sur une phrase uniquement si cette derniere contient un motif textuel.

Syntaxe: ":g/chaine/commande"
- `:g/micrisoft/s/windows/linux/g` 	changes windows par linux uniquement dans les lignes ou "micrisoft" se trouve .
- `:g/ `^[ ]*$/d`	supprime toutes les lignes vides.
- `:g/linux/t 0` 	copie en haut du texte toutes les lignes contenants linux
- `:g/linux/t .` 	copie en haut du texte toutes les lignes contenants linux
- `:g/linux/cd 80` 	centre tous les lignes contenant linux
- `:g!/linux/d` 	efface toutes les lignes ne contenant pas linux
- `:v/linux/d` 	idem 

```sh
:g/Ben Raf/t .
```


14. Sans sortir de la session vi, afficher la date et l'heure (pour 
savoir si c'est l'heure de la pause).

```sh
.!date
```
Insert au curseur (remplace la ligne)


15. Créer un fichier .vimrc dans le répertoire de connexion ($HOME), dont 
le contenu va permettre d'afficher les numéros de lignes, de positionner 
les tabulations tous les 5 caractères et de passer en mode non compatible 
(Linux uniquement).
Recherche globale avec remplacement.

```sh
"line numbers
set nu
 
"tab space
set ts=5 sw=5
 
"syntax highlight
syntax on
 
"non compatible
set nocompatible
```


16. Rechercher et remplacez tous les Durand en Dupont.

```sh
:%s/^Durand/Dupont/g
```


17. Substituer Jean en Jean-Paul.

```sh
:%s/Jean /Jean-Paul /g
```


18. Substituer Jean en JEAN (sans écrire JEAN dans l'expression régulière).
# permet d'omettre l'echappement des characteres spéciaux

```sh
:%s#Jean#\U&#
:%s/Jean/\U&/
```


19. Substituer JEAN en Jean en modifiant le séparateur de l'expression régulière.

```sh
:%s/JEAN/\L&/
```

Pas tout à fait ça mais osef


20. Substituer Jean en Jean-Jean sur tout le texte.

```sh
:%s/jean/&-&/

:g/Jean/s//Jean-Jean/g
```


21. Ajouter (033) devant chaque numéro (en fin de ligne) commençant par 1,2 ou 3.
Exemple : Frederic Thouin (033)124666

```sh
:%s/\<[1-3]/(033)&/
```

22. Ajouter 0 (zéro) à la fin de toutes les lignes qui commencent par 'F'.

```sh
:g/^F/s/$/0/g
```

23. Bonus : Reformater le texte avec vim sans entrer dans vim, pour toutes 
les lignes comportant un nom, prénom et numéro de la façon suivante :

```
Prénom
NOM(en MAJUSCULE)
Tel : numéro de téléphone
```











### TP 07 - Redirections d'entrées/sorties

- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```


1. Listez tous les processus qui finissent par un d. Le résultat sera 
stocké dans $HOME/process/daemons.txt.

```sh
$ ps aux | egrep "d$"
root        423  0.0  0.1  19600  7448 ?        Ss   févr.14   0:01 /lib/systemd/systemd-logind
systemd+   8052  0.0  0.1  93080  6540 ?        Ssl  févr.14   0:00 /lib/systemd/systemd-timesyncd
root       8056  0.0  0.3  39860 12724 ?        Ss   févr.14   0:01 /lib/systemd/systemd-journald
root      18299  0.0  0.1  21792  4756 ?        Ss   févr.14   0:00 /lib/systemd/systemd-udevd
bind      23362  0.0  0.5 160472 23600 ?        Ssl  févr.14   0:00 /usr/sbin/named -u bind
user19    43795  0.0  0.0   8796  3792 pts/7    S+   11:27   0:00 man find
user19    43804  0.0  0.0   8796   892 pts/7    S+   11:27   0:00 man find

$ mkdir $HOME/process
$ ps aux | egrep "d$" > $HOME/process/daemons.txt
```

2. Recherchez les fichiers dont le nom se termine par .conf à partir de 
la racine. Cette recherche ne devra être effectuée que sur le système de 
fichier racine. Le résultat sera affiché à l'écran tout en étant stocké 
dans le fichier $HOME/resultats/fichiers.conf.

Pour rediriger un output à la fois vers l'ecran (stdout) et un fichier, il faut utiliser tee en pipe.

	The command you want is named tee:
	```
	foo | tee output.file
	```
	For example, if you only care about stdout:
	```
	ls -a | tee output.file
	```
	If you want to include stderr, do:
	```
	program [arguments...] 2>&1 | tee outfile
	```

```sh
$ mkdir $HOME/resultats
$ find / -type f -iname  *.conf 2>/dev/null | tee resultats/fichiers.conf 
[...]
```

3. La commande précédente a duré un certain temps, comment connaître le 
temps exact d’exécution de celle-ci ?

```sh
$ time <command>
[...]
real    0m0,291s
user    0m0,149s
sys     0m0,139s
```

4. En une commande, renvoyez dans le fichier $HOME/resultats/compteur.txt 
le nombre de fichiers trouvés au point 2, sans utiliser le fichier 
fichiers.conf. Le résultat devra comporter uniquement ce nombre (ce 
résultat sera réutilisé dans des scripts).

```sh
$ find / -type f -iname  *.conf 2>/dev/null | wc -l > $HOME/resultats/compteur.txt 
113
```









### TP 08 - Sauvegarde de fichiers

#### Setup
- Activer VPN
- Connection à une vm de l'ENI en ssh 
```sh
$ ssh user15@10.52.101.21              # de 6 à 21
> secret                               # ou kc
```

#### Questions
##### 1. tar -cvf : Création

1. Réaliser une sauvegarde de votre répertoire personnel dans /tmp, en 
utilisant votre login pour le nommage du fichier, noter sa taille.

```sh
$ tar -cvf /tmp/u15.tar /home/user15
[...]
$ ls -l /tmp/u15.tar 
-rw-r--r-- 1 user15 user15 81920 févr. 15 16:14 /tmp/u15.tar
```

##### 3. tar -czvf : Compression en gzip (tar.gz)

2. Créer une nouvelle archive de votre répertoire personnel, mais cette 
fois-ci en la compressant avec gzip, l'opération devant être réalisée en 
une seule instruction.

```
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file
```

Here’s what those switches actually mean:

    -c: Create an archive.
    -z: Compress the archive with gzip.
    -v: Display progress in the terminal while creating the archive, also known as “verbose” mode. The v is always optional in these commands, but it’s helpful.
    -f: Allows you to specify the filename of the archive.

```sh
$ tar -czvf /tmp/u15.tar.gz $HOME
[...]
$ ls -l /tmp/u15*
-rw-r--r-- 1 user15 user15 81920 févr. 15 16:14 /tmp/u15.tar
-rw-r--r-- 1 user15 user15  8206 févr. 15 16:27 /tmp/u15.tar.gz
```

##### 3. tar -cvjf : Compression en bzip2 (tar.bz2)

3. Répéter l'étape précédente en utilisant cette fois-ci une compression au format bzip2.

c = create, v = verbose, j = bz2 compression, f = output file name

```sh
$ tar -cvjf /tmp/u15.tar.bz2 $HOME
[...]
```

##### 4. Comparer les tailles d'archives (tar > tar.bz2 > tar.gz)

4. Comparer la taille des trois archives, laquelle est la moins volumineuse ?

```sh
$ ls -l /tmp/u15*
-rw-r--r-- 1 user15 user15 81920 févr. 15 16:14 u15.tar
-rw-r--r-- 1 user15 user15  9160 févr. 15 18:33 u15.tar.bz2
-rw-r--r-- 1 user15 user15  8206 févr. 15 16:27 u15.tar.gz
```

##### 5. tar -xvf : Décompression / Restauration
Dans votre répertoire de connexion, créer le répertoire Restaurations.
Restaurer votre sauvegarde dans ce répertoire en une seule instruction.

```sh
$ mkdir restauration
$ cd restauration/
$ tar xvf /tmp/u15.tar.gz
[...]
$ ls
home
```

##### 6. tar -cvf foo.tar --exclude=FILE bar/ : Exclusion de répertoire

6. Créer une nouvelle sauvegarde, non compressée, en excluant ce répertoire.

```sh
$ tar -cvf /tmp/u15_v2.tar --exclude="$HOME/restauration" $HOME
$ ls -l /tmp/u15*
-rw-r--r-- 1 user15 user15 81920 févr. 15 16:14 /tmp/u15.tar
-rw-r--r-- 1 user15 user15  9160 févr. 15 18:33 /tmp/u15.tar.bz2
-rw-r--r-- 1 user15 user15  8206 févr. 15 16:27 /tmp/u15.tar.gz
-rw-r--r-- 1 user15 user15 81920 févr. 15 20:47 /tmp/u15_v2.tar
```

ATTENTION à bien préciser le ou les dossiers à exclure avant l'inclusion. 


##### 7. tar -uNvf : update only newer files + exclude
7. Créer dans votre répertoire d'accueil un nouveau fichier vide et 
réaliser une mise à jour de votre archive avec votre répertoire d’accueil.

Si la taille de l'archive a "doublé", vous n’avez pas réellement fait une mise à jour.

Effacez votre archive et recommencez.
Aidez-vous de la commande vous permettant de lister le contenu de l'archive.

**Notes**

- Think of it this way, --update updates the TAR, not the files in the TAR. 
  So it is working as designed.
- `-N`, `--newer`, `--after-date=date` 	Only store files whose data or 
  status has changed on or after date. If date is a file name, the date 
  of that file is used.

Think of it this way, --update updates the TAR, not the files in the TAR. 
So it is working as designed.
`-N`, `--newer`, `--after-date=date` 	Only store files whose data or status has changed on or after date. If date is a file name, the date of that file is used.

```sh
$ mkdir $HOME/dossier_vide
$ tar -uNvf /tmp/u15_v2.tar --exclude="$HOME/restauration" $HOME
[...] ok
$ ls -l /tmp/u15*
-rw-r--r-- 1 user15 user15 81920 févr. 15 16:14 /tmp/u15.tar
-rw-r--r-- 1 user15 user15  9160 févr. 15 18:33 /tmp/u15.tar.bz2
-rw-r--r-- 1 user15 user15  8206 févr. 15 16:27 /tmp/u15.tar.gz
-rw-r--r-- 1 user15 user15 81920 févr. 15 21:32 /tmp/u15_v2.tar
$ tar -tf /tmp/u15_v2.tar 
[...] ok, pas de duplicatas
```

Script

```sh
#!/bin/sh

rmdir $HOME/dossier_vide 2>/dev/null
rm /tmp/u15_v2*
echo "... Création de l'archive"
tar -cvf /tmp/u15_v2.tar --exclude="$HOME/restauration" $HOME
ls -l /tmp/u15*
echo "... Ajout dossier vide"
mkdir $HOME/nouveau_dossier
echo '*********************************'
echo "... Update de l'archive"
tar -uNf /tmp/u15_v2.tar --exclude="$HOME/restauration" $HOME
ls -l /tmp/u15*
tar -tf /tmp/u15_v2.tar
```



<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">