#!/bin/sh
# A executer en tant que root

user='francois'
full_name='François'
mdp='password'
group0='admin'
group1='stagiaire,documentation'
shell='/bin/sh'


function create() {
	user=$1
	full_name=$2
	mdp=$3
	group0=$4
	group1=$5
	shell=$6
	
	useradd -m -g $group0  -G $group1 -s "${shell}" $user
	chfn --full-name "${full_name}" $user
	echo $user:$mdp | chpasswd
#	passwd $user <<< "$mdp
#$mdp"
}

groupadd admin
groupadd stagiaires
groupadd documentation
groupadd vip

create toto 'Toto le Haricot' 'password' admin 'stagiaires,documentation' '/bin/sh'
create francois 'François' 'password' admin 'stagiaires,documentation' '/bin/sh'


# User                : francois
# Fullname            : François
# Home                : /home/francois
# Mdp                 : password
# Groupe principal    : admin
# Groupes secondaires : stagiaires, documentation
# Shell à utiliser    : le shell sh
useradd -m -g 'admin' -G stagiaires,documentation -s '/bin/sh' francois
chfn --full-name 'François' francois



# User : fred
# Fullname : Frédéric
# Home : /home/fred
# Mdp : AchAngEr (à changer à la 1ere connection)
# Groupes secondaires : stagiaires, documentation
# Shell : /bin/bash
user='fred'
pass='AchAngEr'

useradd -m -G stagiaires,documentation -s '/bin/bash' $user
chfn --full-name 'Frédéric' $user
echo $user:$pass | chpasswd
passwd --expire fred



# User : fabrice
# Fullname : Fabrice
# Home : /home/fabrice
# Mdp : password (compte devra être désactivé)
# Groupes secondaires : vip
# Shell : /bin/bash
user='fabrice'
pass='password'
useradd -m -G vip -s /bin/bash $user
chfn -f 'Fabrice' $user
echo $user:$pass | chpasswd
usermod --expiredate 0 fabrice




- Pour Fabrice :
	+ Shell à utiliser : Le shell bash
	+ Répertoire personnel : /home/fabrice
	+ Mot de passe : pasword (compte devra être désactivé)
	+ Groupes secondaires : vip




passwd $user <<< "$mdp
$mdp"



