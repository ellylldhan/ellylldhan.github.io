title: tous les tp

# ENI TSSR 13 - Init Bash

[TOC]

## TP 1 - Pseudocode

Pour faire du café, il faut :

- de l'eau 
- du café moulu
- un filtre
- une cafetière
- de l'électricité 

- Les quantités d'eau et de café moulu sont variables en fonction du nombre de tasses de café souhaitées. 
- Le nombre de tasses doit être connu avant la préparation du café.

``` 
Si cafetière n'existe pas 
	ou si café n'existe pas 
		ou si filtre n'existe pas 
			ou si électricité n'existe pas 
				alors fin du script 
Fin si 

n est le nombre de tasses souhaitées
v est le volume d'eau pour une tasse 
c est le nombre de doses de café mises dans le filtre

ajouter 1 filtre dans la cafetière

c est initialisé à 0
Tant que c est inférieur à n 
	ajouter 1 dose de café 
	ajouter v dose d'eau
	incrémenter c de 1 
Fin tant que 

Allumer la cafetière
```

## TP 02 - Divers
```bash 
# TP 02

# Intro
echo "Bonjour, cette machine est fin prête pour scripter..."

# Afficher répertoire courant
echo '####################'
echo "Scripts Shell présent ici : " $PWD

# Afficher liste fichiers présents
echo '####################'
echo "Liste détaillée des scripts présents : "
ls -l $PWD

# Pour afficher un saut de ligne :
echo

# Afficher infos bash
echo '####################'
echo "Informations relatives à l'interpréteur BASH : (\`bash --version\`)"
bash --version

# Afficher la version installée
echo '####################'
echo "Version de bash installée (\$BASH_VERSION) : $BASH_VERSION"   # marche pas, var vide :(

# Afficher chemins re: bash
echo '####################'
echo "Chemin du binaire de bash : $(which bash)"

#   NOTE : différence WHEREIS et WHICH ?
#   ------------------------------------
#   whereis  : retourne le binaire, le fichier config et la doc 
#              
#              $ whereis bash
#              bash: /usr/bin/bash /etc/bash.bashrc /usr/share/man/man1/bash.1.gz
#  
#   which    : retourne seulement le chemin du binaire
#              
#              $ which bash
#              /usr/bin/bash 
#
#   VOIR AUSSI : `locate .bashrc` (pas toujours installé)

echo '---------------------'
echo -e "Chemin du fichier bashrc commun à tous les utilisateurs : \c"
whereis bash | awk -F\  '{print $3}'               # solution de feignasse

echo '---------------------'
find / -type f -iname *.bashrc 2>/dev/null         # solution de bourrin

echo '---------------------'
echo -e "Chemin de la documentation de bash : \c"
whereis bash | awk -F\  '{print $4}'

echo '---------------------'
echo "Les 3 à la suite ! (0: binaire, 1: config, 2: documentation)"
whereis bash 

# Afficher message 'Mise(s) à jour disponible(s)'
echo '####################'


#sudo apt update 1&2>/dev/null               # faut être dans groupe sudo pour que ça marche
#apt list -u > /tmp/upg.txt  2>/dev/null      # --upgradeable
#upg=$(cat /tmp/upg.txt | wc -l)
upg=$(apt list -u 2>/dev/null | wc -l )   

echo "Mise à jour disponible pour ${upg} packages !"


# Afficher message 'Mise(s) à jour BASH disponible(s)'
echo '####################'
echo -e "Mise à jour disponible pour bash ? \c"

maj=$(apt list -u 2>/dev/null | grep bash | wc -l)
if [[ $maj -eq 0 ]]; then 
	echo "Non" 
else 
	echo "Oui" 
fi
```

## TP 03 - Divers
```bash
# TP03 

# 0. Generer les txt
## Nettoyage des fichiers txt précédemment générés
find $PWD -iname "[0-9].txt" -delete #-print0

## 10 fichiers contenant 2 lignes de blabla
for((i=0;i<10;i++)); do 
	echo -e 'bla bla bla\nbla bla bla' >> $i.txt
done

## On ajoute 2 lignes de +
for((i=0;i<5;i++)); do 
	echo -e 'bla bla bla\nbla bla bla' >> $i.txt
done

# 1. Afficher la liste des variables d'environnements et locales du shell courant.
## 1.1 Chemin du fichier d'historique des commandes 
echo $HISTFILE         # /home/reno/.bash_history


## 1.2 Emplacemetn où enregistrer les scripts pour pouvoir les executer 
##     sans indiquer leur chemin absolu
echo $PATH


# 2. Modifier le prompt de root pour qu'il soit `nom d'hôte# '
PS1="$HOSTNAME# "


# 3. Réaliser un script d'après pseudocode
rep="$PWD"
extension="txt"

echo "Répertoire de travail: $rep"
echo "Fichiers pouvant être traités :"
ls "$rep"/*.$extension

read -p "Quel fichier voulez-vous traiter ? " fic
nblign=$(cat "$fic" | wc -l)
debut=$(head -2 "$fic")
fin=$(tail -2 "$fic")

echo -e "\e[4mCARACTERISTIQUES\e[0m de $fic"
echo "Nb de lignes : $nblign"
echo -e "Debut :\n$debut"
echo -e "Fin   :\n$fin" 
```

## TP 04 - Conditions

```bash
# TP04 Branchements conditionnels

# 200 : OK
# 201 : Created
# 204 : No content
# 303 : Redirection
# 304 : Not modified
# 400 : Bad request from client
# 401 : Unauthorized
# 403 : Forbidden
# 405 : Method not allowed (server sait pas faire)
# 406 : Not acceptable (server incapable de répondre)
# 409 : Conflict
# 422 : Unprocessable entity (ex. entité existe déjà)
# 500 : Server Error

USAGE="""
USAGE
	Indiquer en argument '\e[1mroot\e[0m' ou '\e[1minvité\e[0m'.
	
	A défaut d'argument, vous serez affecté au nom 'invité'.
	Si trop d'arguments, une erreur sera levée et ce message s'affichera.

	$ ./tp04.sh [ root | invité | --usage | --help ]

OPTIONS
	-u, --usage   Affiche ce message
	-h, --help    Affiche ce message

"""


if [[ ! -z $2 ]]; then 
	echo "Trop d'arguments, il n'en faut qu'un. Bye ! -- Voir usage : -h ou --help"
	echo ""
	echo -e "$USAGE"
	exit 400
fi

nom="invité"
if [[ -n $1 ]]; then
	nom="$1"
fi

case "$nom" in 
	"--help"|"-h"|"--usage"|"-u")
		echo -e "$USAGE"
		echo "Fin du script"
		exit 0
		;;
	"root")
		echo -e "\e[1;40;31mInterdit de se connecter en root\e[0m"
		exit 4
		;;
	"invité")
		echo "Vous avez été redirigé sur le compte de la machine \"invité\""
		;;
	*)
		echo -e "$USAGE"
		exit 400
		;;
esac

echo "Bonjour $name bienvenue sur la machine $(hostname)" 
echo "Fin du script"
```

## TP 05 - Switch case
```bash
# TP05 case
# -----------------------------
# CODES EXIT :
#    0 : OK
#    1 : Besoin des droits root
#    2 : Utilisateur existe déjà
#    3 : Utilisateur n'existe pas
# -----------------------------

amiroot () {
	# Check si root - sinon: exit
	if [[ $(id -u) != 0 ]]; then
	#if [[ $(whoami) != "root" ]]; then
		echo -e "\e[1;31mI AM (not) \e[1;31;9mG\e[0m\e[1;31mROOT !\e[0m"
		echo "Veuillez lancer le script en mode root."
		exit 1
	fi
}

# Warning ! Need root !
if [[ $(whoami) != "root" ]]; then  
	echo -e "\e[1;31mATTENTION certaines commandes requièrent d'être en root\e[0m"
fi

# Boucle tant que nom est vide
while [[ "$nom" = "" ]]; do
	read -p "Saisir l'identifiant utilisateur souhaité : " nom
done
	
while true ; do
	echo """
	GESTION DES UTILISATEURS : $nom
	--------------------------
	C - Créer le compte utilisateur (droits root requis)
	M - Modifier le mot de passe de l'utilisateur (droits root requis)
	S - Supprimer le compte utilisateur (droits root requis)
	V - Vérifier si le compte utilisateur existe

	Q - Quitter
	"""

	read -p "Votre choix : " choix


	case "$choix" in
		[cC])
			# Check si est root
			amiroot
			
			# Check si user existe
			if id "$nom" &>/dev/null; then
				echo "L'utilisateur $nom existe déja. Bye !"
				exit 2
			fi
			
			# Création user
			useradd -M -s /bin/bash "$nom"
			
			echo "Utilisateur $nom a bien été créé."
			;;
		[mM])
			# Check si est root
			amiroot
			
			# Check si user existe
			if id "$nom" &>/dev/null; then
				# Modification du mot de passe
				passwd "$nom"
						
				echo "Mot de passe modifié avec succès."
			else
				echo "L'utilisateur $nom n'existe pas. Bye !"
				exit 3
			fi
			;;
		[sS])
			# Check si est root
			amiroot
		
			# Supprimer le compte utilisateur
			userdel "$nom"
			
			echo "Utilisateur $nom supprimé."
			;;
		[vV])
			# Vérifier si le compte utilisateur existe
			if id "$nom" &>/dev/null; then
				echo "L'utilisateur $nom existe."
			else
				echo "L'utilisateur $nom n'existe pas."
			fi
			;;
			
		[qQ])
			echo "Bye !"
			;;
		*) 
			echo "Mauvais choix, recommencez !"
			exit 0
			;;
	esac
	
	# Reset $nom sinon reprend la même valeur dans l'itération suivante
	nom=""		
done
		
echo "Fin du script"
```

## TP 06
### 13 - Vendredi treize
```bash
# TP06
# Dépendance :  ncal

# A COMPLETER #
# Ici on définit des variables...
annee=$1
nummois=1
#~ annee=2012
rouge='\033[31m'
orange='\033[33m'
vert='\033[32m'
noir='\033[0m'

# A COMPLETER #

# A COMPLETER #
# On teste si on a bien passé un argument au script. Si false, alors on affiche l'usage
[[ -z $1 ]] && { echo -e "Syntaxe d'utilisation : $0 $rouge <annee> $noir"; exit 13; }

echo "###################"
echo "##  ANNEE $annee   ##"
echo "###################"

# A COMPLETER #
# 1. Va boucler sur chaque mois (au format nombre) de l'année donnée en 
#    commençant par 1, et sortira de la boucle à 13. 
# 2. A chaque tour, on vérifie que la chaîne retournée la commande grep 
#    se finit par '13 14', ce qui, selon la présentation de l'output de la
#    commande `cal`, signifie que le 13 est un vendredi. 
# 3. Si ce test est vrai, alors on definit une variable contenant le nom 
#    du mois grâce à la commande `date`, que l'on concatène à une variable `listmois`.
#  	 Ainsi, à chaque tour de boucle et à chaque test vrai, cette même variable prendra 
#    sa propre valeur ajoutée de la variable $nommois créant ainsi un liste de mois.
# 4. La variable $nummois est finalement incrémentée afin de faire avancer la boucle
#    et ainsi éviter de se trouver dans une boucle infinie.
until [[ $nummois -eq 13 ]]; do
	# Output: '8 9 10 11 12 13 14' (le vendredi est avant-dernier, selon l'output de cal)
	ligne13=`cal $nummois $annee | grep 13`
	
	# format du retour de la commande precedente incorrect
	# Permet de "convertir" l'output du grep en une seule chaine de caractère (?)
	ligne13=$(echo $ligne13)
	if [[ $ligne13 = *13\ 14 ]]; then
		nommois=`date --date "$nummois/01" +%B`
		listmois="$listmois $nommois,"
		nbremois=`expr $nbremois + 1`
	fi
	nummois=`expr $nummois + 1`
done

# A COMPLETER #
# On affiche la liste des mois en rouge + un message a propose des gens qui n'aime pas les perroquets qui ne trie pas leurs déchets (?)
echo -e "En $rouge $listmois $noir surveiller les paraskaviedekatriaphobes "

# A COMPLETER #
# Switch Case pour parametrer des variables en fonction du niveau de vigilance
# Ces variables sont utilisés dans l'echo final
case $nbremois in
	1)
		niveau="calme"
		color="$vert"
		;;
	2)
		niveau="moyenne"
		color="$orange"
		;;
	*)
		niveau="a forte vigilance"
		color="$rouge"
		;;
esac

# A COMPLETER #
# On affiche l'année passé en argument et le niveau de vigilance avec un code couleur adapté
# + le nombre de mois qui ont un vendredi 13.
echo -e "$annee sera une annee ${color}$niveau $noir( $nbremois )"
```

### 29 - Années bissextiles
```bash
# TP06
# Part2 - Années bissextiles sur une étendue donnée
# 
# USAGE : 
#     $ ./29.sh [ ANNEE1 ] [ ANNEE2 ]
# EXEMPLES :
#     $ ./29.sh
#     $ ./29.sh 2021
#     $ ./29.sh 2021 2039
#     $ ./29.sh 2039 2021

rouge='\033[31m'
orange='\033[33m'
vert='\033[32m'
noir='\033[0m'

# Plus besoin de ça... fonctionne quoi qu'il arrive
#~ [[ -z $1 ]] && { echo -e "Syntaxe d'utilisation : $0 $rouge <annee> $noir"; exit 13; }

# On laisse le choix à l'utilisateur d'entrer aucune ou une ou deux années en argument du script
# Test si $1 ou $2 sont vides
read=0
if [[ -z $1 ]]; then
	read=1
elif [[ -z $2 ]]; then
	read=2
fi

# Switch case qui lance éventuellement un prompt pour demander une étendue d'années
# Note: ;& permet de "fall through", càd si cas vérifié alors descend qd même 
# dans le cas suivant au lieu de sortir du switch
case $read in
	1) 
		read -p "Merci de donner une année de départ : " annee1
		;&
	2) 
		# Pour éviter d'écraser la variable $annee1 si le cas 1 est passé
		[[ -z $annee1 ]] && annee1=$1
		read -p "Merci de donner une année de fin    : " annee2
		;;
	0)
		annee1=$1
		annee2=$2
esac

# Permet de commencer la boucle avec l'annee la plus ancienne afin de remonter le temps dans la boucle
if [[ $annee1 -gt $annee2 ]]; then 
	anneeDepart=$annee2 
	anneeDepartOutput=$annee2     # pour garder la valeur d'anneeDepart en mémoire afin de pouvoir l'afficher à la fin
	anneeFin=$annee1
else
	anneeDepart=$annee1
	anneeDepartOutput=$annee1
	anneeFin=$annee2
fi


# On boucle sur chaque année en commençant par la plus ancienne (la plus petite)
# On check le 31/12 de chaque année, si égale à 366 alors c'est une année bissextile
# Note: date comprend que le format US, je sais pas pourquoi. Veut pas de %B.
nbAnnees=0
until [[ $anneeDepart -gt $anneeFin ]]; do
	# Check si le 31 décembre est le 366e jour de l'année. Si oui alors bissextile = true
	doy=$(date --date="12/31/${anneeDepart}" +%j 2>/dev/null)
	if [[ $doy -eq 366 ]]; then
		listeAnnees="$listeAnnees $anneeDepart, "
		nbAnnees=$(expr $nbAnnees + 1)
	fi
	
	# Incrémentation
	anneeDepart=$(expr $anneeDepart + 1)
done

# Output
echo "Sur les années $anneeDepartOutput et ${anneeFin}, il y a $nbAnnees année(s) bissextile(s)."

# Output nombres d'année seulement si on a des matches positifs
if [[ $nbAnnees -gt 0 ]]; then
	echo "Et ces années sont : $listeAnnees"
fi
```

## TP 07 - IFS
```bash
#!/bin/bash
# TP07 IFS
#
# USAGE :
#    ./tp07.sh /chemin/vers/dossier
# -----------------------------
# CODES EXIT :
#    0 : Succès
#    1 : Absence d'argument
#    2 : Mauvais argument
#    3 : Trop d'arguments
# -----------------------------

rouge='\033[31m'
orange='\033[33m'
vert='\033[32m'
noir='\033[0m'
gras='\e[1m'

USAGE="""
USAGE
	Indiquer le chemin vers un répertoire.
	
	\$ $0 [ /chemin/vers/dossier | ./dossier ]
"""

# Le script doit être lancé avec le nom du répertoire souhaité 
if $# < 1; then 
	echo -e "${rouge}${gras}Erreur : pas assez d'argument (1 attendu, $# donné)${noir}"
	echo "$USAGE"
	exit 1
elif $# > 1; then
	echo -e "${rouge}${gras}Erreur : trop d'arguments (1 attendu, $# donnés)${noir}"
	echo "$USAGE"
	exit 3
fi


# L'argument doit être un dossier existant
if [[ ! -d $1 ]]; then
	echo -e "${rouge}${gras}Erreur : dossier inexistant. Utiliser le chemin absolu.${noir}"
	echo "$USAGE"
	exit 2
fi

rep=$1

# Récupérer la liste des extensions cherchées
fname='extensions.ini'

# Pour simplifier les tests: écriture du fichier à lire ici
cat > $fname << DELIM
txt
sh
png
md
DELIM

# Initialisation nombre matchs pour pouvoir afficher msg 'si aucun trouvé'
nbMatch=0

# 'tite bouclette de lecture du fichier
echo "Répertoire : '$rep'"
while read ext; do
	# Calcul nb fichiers
	nbMatch=$(ls -l ${rep}/*.${ext} 2>/dev/null|egrep -c "[^d]")
	nbTotal=$(ls -l ${rep}/* 2>/dev/null|egrep -c "[^d]" )

	# Calcul pourcentage
	pourcentage=$((nbMatch * 100 / nbTotal))
	
	if (($nbMatch > 0)); then 
		echo "-------------------"
		echo " Extension : $ext  "
		echo "-------------------"

		echo "-> $nbMatch fichiers trouvés"
		echo "-> ${pourcentage}% des fichiers du répertoire"
	fi
done < $fname
	
# Affiche message si aucun fichier trouvé
if [[ $nbMatch -eq 0 ]];then
	echo "Aucun fichier trouvé avec les extensions données"
fi


echo "Fin du script"
```

## TP 09 - Fonctions
```bash
#!/bin/bash
# TP09 Fonctions
#
# USAGE :
#    ./fonctions.sh
# -----------------------------
# CODES EXIT :
#    0 : Succès
#    1 : Absence d'argument
#    2 : Mauvais argument
#    3 : Trop d'arguments
#    6 : Action annulée
#    7 : Aucun élément trouvé
# -----------------------------

rouge='\033[31m'
orange='\033[33m'
vert='\033[32m'
noir='\033[0m'
gras='\e[1m'
italic='\e[3m'

USAGE="""
USAGE
	Script répondant à des besoins fonctionnels.
		
	\$ $0
"""

init() {
	echo "... Création de fichiers"
	# Setup fichiers pour tester
	for((i=0;i<10;i++)); do
		echo $i > ./foo${i}.sh
		echo $i > ./bar$((i + 10)).txt
	done
}


save() {
	echo "... Sauvegarde des fichiers .sh"

	# Sauvegarder les fichiers du repertoire courant se terminant par .sh
	for f in *.sh; do
		cp -vu "$f" "${f%.*}.save" 
	done
}


del() {
	echo "... Suppression des fichiers .save"
	
	if $(ls -l *.save 2>/dev/null|wc -l) < 1; then
		echo "Aucun fichier .save trouvé."
		exit 7
	fi
	
	# Demande de confirmation
	read -p "Etes-vous sûr de vouloir supprimer tous les fichiers .save ? (Y/N)" reponse
	
	# Suppression des fichiers .save
	case $reponse in 
		[YyoO])
			rm -v *.save 2>/dev/null
			;;
		*)
			echo "... Suppression annulée"
			exit 6
			;;
	esac
}


lister() {
	# Liste les éléments sans sauvegarde et les éléments avec
	for f in *.*; do
		if [[ "${f##*.}" != "save" ]]; then
			if [[ -f "${f%.*}".save ]]; then
				listAvec="${listAvec} ${f},"
			else
				#~ listSans="${rouge}${gras}${listSans} ${f}${noir},"
				listSans="${listSans} ${f},"
			fi
		fi
	done
	echo -e "Liste des fichiers sauvegardés     : ${vert}${gras}${listAvec}${noir}"
	echo -e "Liste des fichiers non sauvegardés : ${rouge}${gras}${listSans}${noir}"
}


loadMenu() {
	# Charge le menu
	texte="""
	--------------------------------------------------------------------
	Faites votre choix :
	--------------------------------------------------------------------
	   S - Sauvegarder les fichiers .sh du répertoire courant
	   D - Supprimer les sauvegardes
	   L - Lister les fichiers 
	   Q - Quitter
	--------------------------------------------------------------------

	"""
	
	read -p "$texte" choix
	
	case $choix in 
		[sS])
			save
			;;
		[Dd])
			del
			;;
		[Ll])
			lister
			;;
		[Qq])
			echo "Bye !"
			exit 0
			;;
		*)
			echo -e "${italic}Je ne connais pas ce choix ! Gzz... Gzzt... ! Couic.${noir} (x_x)"
			exit 2
			;;
	esac
}


main() {
	# Création des fichiers pour tester
	init
	
	# Envoi du menu
	while true; do
		loadMenu
	done
}



############################
# MAIN CALL                #
############################ 

main
```



<p class="fin">~Fin~</p>

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">