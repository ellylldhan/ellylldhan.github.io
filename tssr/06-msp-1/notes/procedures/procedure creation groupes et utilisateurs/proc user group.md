title: proc user group

## Utilisateurs et Groupes

### Windows 10
#### Création des groupes
##### En invite de commande CMD
Ouvrir une invite de commande cmd en mode administrateur et entrer les lignes suivantes :

```
net localgroup Direction /add
net localgroup Comptabilite /add
```

Vérification : afficher la liste des groupes locaux

```
net localgroup
```

**capture**

##### En powershell

```
New-LocalGroup "Informatique" -Description "Groupe local"
New-LocalGroup "Logistique"
```

Vérification 

```
Get-LocalGroup
```

**capture**

### Debian 10
#### Création via un script bash
Utiliser le script suivant pour créer les groupes et les utilisateurs.

Pré-requis : ajouter /sbin dans la variable d'environnement $PATH afin de pouvoir utiliser facilement certaines commandes telles que useradd.

```bash
#!/bin/bash

function create_user() {
	group1="$3"
	user="$1"
	fullname="$2"
	mdp="$4"
	shell="$5"

	echo "Création de l'utilisateur $user"
	useradd -m -g "$group1" -s "$shell" "$user"
	chfn --full-name "$fullname" "$user"
	echo "$user":"$mdp" | chpasswd
}

# AJOUT /sbin DANS $PATH
echo "Ajout /sbin au PATH"

export PATH=$PATH:/sbin


# CREATION GROUP
echo "Création des groupes"

groupadd Commercial
groupadd Comptabilite
groupadd Informatique
groupadd Logistique


# CREATION UTILISATEURS
group1='Direction'
user='rgrimes'
fullname='Rick Grimes'
mdp='85lmTr568Y'
shell='/bin/bash'

echo "Création des utilisateurs"

group1='Commercial'
user='ddixon'
fullname='Daryl Dixon'
mdp='45jMQKu3pmEV'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"

group1='Commercial'
user='gstokes'
fullname='Gabriel Stokes'
mdp='KS6hPENpwDfU'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"

group1='Commercial'
user='mgreene'
fullname='Maggie Greene'
mdp='4X74js6Y6kGP'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"

group1='Comptabilite'
user='eporter'
fullname='Eugene Porter'
mdp='XmNS7639Tum4'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"


group1='Comptabilite'
user='cpeletier'
fullname='Carol Peletier'
mdp='S82nd7cGQgUs'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"


group1='Informatique'
user='rlizot'
fullname='Renaud Lizot'
mdp='PJzF8faKcgnw'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"


group1='Informatique'
user='cbarrault'
fullname='Corentin Barrault'
mdp='uA2wqRjJvQje'
shell='/bin/ksh'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"
passwd --expire "$user"       # doit changer de mdp au 1er login


group1='Logistique'
user='respinosa'
fullname='Rosita Espinosa'
mdp='ncm4kvAhaQzV'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"


group1='Logistique'
user='mjones'
fullname='Morgan Jones'
mdp='SUL8kbEFmupY'
shell='/bin/bash'

create_user "$user" "$fullname" "$group1" "$mdp" "$shell"
```

### Usage

```
reno@DEB10-19:~$ su -
root@DEB10-19:~# chmod 775 create_user.sh 
root@DEB10-19:~# ./create_user.sh 
Ajout /sbin au PATH
Création des groupes
Création des utilisateurs
Création de l'utilisateur rgrimes
Création de l'utilisateur ddixon
Création de l'utilisateur gstokes
Création de l'utilisateur mgreene
Création de l'utilisateur eporter
Création de l'utilisateur cpeletier
Création de l'utilisateur rlizot
Création de l'utilisateur cbarrault
passwd: password expiry information changed.
Création de l'utilisateur respinosa
Création de l'utilisateur mjones
```

### Vérification
Il existe plusieurs manières de tester la créations de groupes et de comptes utilisateurs, notamment avec le fichier /etc/passw

```
root@DEB10-19:~# su mgreene 
mgreene@DEB10-19:/root$ exit
exit
root@DEB10-19:~# exit
déconnexion
reno@DEB10-19:~$ su eporter
Mot de passe : 
eporter@DEB10-19:/home/reno$
```

```
reno@DEB10-19:~$ tail -9 /etc/pssword
ddixon:x:1001:1001:Daryl Dixon,,,:/home/ddixon:/bin/bash
gstokes:x:1002:1001:Gabriel Stokes,,,:/home/gstokes:/bin/bash
mgreene:x:1003:1001:Maggie Greene,,,:/home/mgreene:/bin/bash
eporter:x:1004:1002:Eugene Porter,,,:/home/eporter:/bin/bash
cpeletier:x:1005:1002:Carol Peletier,,,:/home/cpeletier:/bin/bash
rlizot:x:1006:1003:Renaud Lizot,,,:/home/rlizot:/bin/bash
cbarrault:x:1007:1003:Corentin Barrault,,,:/home/cbarrault:/bin/ksh
respinosa:x:1008:1004:Rosita Espinosa,,,:/home/respinosa:/bin/bash
mjones:x:1009:1004:Morgan Jones,,,:/home/mjones:/bin/bash
```
```
reno@DEB10-19:~$ tail -4 /etc/group
Commercial:x:1001:
Comptabilite:x:1002:
Informatique:x:1003:
Logistique:x:1004:
```
```
reno@DEB10-19:~$ id eporter
uid=1004(eporter) gid=1002(Comptabilite) groupes=1002(Comptabilite)
```


