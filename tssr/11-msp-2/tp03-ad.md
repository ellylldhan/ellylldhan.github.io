title: tp03 - AD

# ENI TSSR 11 - MSP 2 - Services Réseaux Hétérogènes

[TOC]

## Atelier 3 - AD

En partant d'une infrastructure existante, vous allez mettre en oeuvre des services de domaine Active Directory.


### Prérequis

- Les ateliers 1 et 2 doivent être réalisés.
- Votre domaine AD utilise les informations d'une nouvelle zone DNS : **reno.domaine.tssr**


### Résumé des paramètres

[![Cartographie](../ressources/img/11-msp-2carto.png)](../ressources/img/11-msp-2carto.png){:target="_blank"}


### 1. Création d'un domaine Active Directory
- Sur **SRV1-WIN**, installer les composants permettant la prise en charge des services de domaine AD puis le promouvoir "Contrôleur de domaine" en respectant les contraintes suivantes :
	+ il s'agit d'un nouveau domaine dans une nouvelle forêt
	+ le nom du domaine est **reno.domaine.tssr**
	+ installer le service **DNS** sur le contrôleur de domaine
	+ le niveau fonctionnel du domaine et de la forêt doit être **"Windows Server 2019"**
	

#### Mise en oeuvre

- SRV1-WIN > Gestionnaire de serveur > Ajout de rôles et fonctionnalités 
- Sélectionner DNS & AD 
- Laisser les réglages par défaut > Installer 

[![Installation Services AD & DNS](../ressources/img/11-msp-2tp03-01.png)](../ressources/img/11-msp-2tp03-01.png){:target="_blank"}

- Gestionnaire de serveur > menu en forme de drapeau > "Promouvoir ce serveur en Contrôleur"
[![Promotion](../ressources/img/11-msp-2tp03-02.png)](../ressources/img/11-msp-2tp03-02.png){:target="_blank"}

- Entrer le nom de la forêt **reno.domaine.tssr**
[![Domaine](../ressources/img/11-msp-2tp03-03.png)](../ressources/img/11-msp-2tp03-03.png){:target="_blank"}

- Vérifier le niveau fonctionnel (Win Server 2019) et donner un mot de passe pour la restauration (ici: **OuiOnPeut!**)
[![Niveau Fonctionnel](../ressources/img/11-msp-2tp03-04.png)](../ressources/img/11-msp-2tp03-04.png){:target="_blank"}

- Faire **Suivant** pour chaque question suivantes, puis **Installer** une fois la vérification passée.

**Notes** : Le mot de passe du compte Administrateur local doit répondre aux exigences. Par défaut, à l'installation de l'OS en VM, il n'y a pas de mot de passe pour accèder à ce compte.


### 2. Mises à jour apportées à la zone suite à la création du domaine Active Directory
- Afficher le contenu de la zone **reno.domaine.tssr** et observez les enregistrements ajoutés suite à la création du domaine.

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;<span class="reponse">Pour afficher le <b>Gestionnaire du DNS</b> : <b>Gestionnaire de Serveur</b> > <b>Outils</b> > <b>DNS</b> </span>

[![Contenu de la zone DNS](../ressources/img/11-msp-2tp03-05.png)](../ressources/img/11-msp-2tp03-05.png){:target="_blank"}

- A quoi correspondent-ils et quelle est leur utilité ?

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;
<span class="reponse">Le serveur SOA est le serveur DNS faisant autorité sur le domaine <b>reno.domaine.tssr</b>.</span><br>
<span class="reponse">La ligne NS (NameServers) liste les serveurs de noms (DNS) servant le domaine.</span>

### 3. Intégration de postes à votre AD

*Prérequis* :

> Les clients et les serveurs de votre infrastructure interrogent principalement le serveur DNS que vous avez configuré au point 3.
>
> Ce serveur n'héberge pas le domaine DNS lié à votre AD
>
> Pour intégrer votre client Windows et votre serveur Windows au domaine, vous devez configurer un **redirecteur conditionnel** dans votre serveur configuré au point 3.
>
> - zone DNS : **reno.domaine.tssr**
> - Serveur DNS vers lequel rediriger les requêtes : "Serveur Windows 1" **SRV1-WIN**

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;<span class="reponse">Pour ajouter un redirecteur conditionnel sur le serveur DNS, on ajoute le code suivant dans le fichier <code>/etc/bind/named.conf.local</code> sur <code>SRV3-DEB</code> :</span>
 
[![Redirection conditionnelle](../ressources/img/11-msp-2tp03-08.png)](../ressources/img/11-msp-2tp03-08.png){:target="_blank"}

<span class="reponse">Permet de rediriger les requêtes adressées à <code>reno.domaine.tssr</code> (notre AD) vers son IP 192.168.15.191 (serveur AD) (?!)</span>

- Intégrer votre poste client Windows (**CLI-WIN**) au domaine AD.

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;<span class="reponse">Via la commande Powershell :</span>
<pre>PS> Add-Computer -DomainName "reno.domaine.tssr"</pre>

[![Add-Computer](../ressources/img/11-msp-2tp03-10.png)](../ressources/img/11-msp-2tp03-10.png){:target="_blank"}

- Intégrer le serveur Windows 2 (**SRV2-WIN**) au domaine AD.
[![Add-Computer](../ressources/img/11-msp-2tp03-09.png)](../ressources/img/11-msp-2tp03-09.png){:target="_blank"}

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;<span class="reponse"><b>Notes</b> : On peut également passer par la méthode graphique, via les propriétés du système (<kbd>WIN</kbd> + <kbd>X</kbd> > <b>Système</b> > <b>Propriétés avancées</b> > onglet <b>Nom de l'ordinateur</b> > Ajouter au domaine.

<div class="img-row">
  	<div class="img-col">
		<a href="../ressources/img/11-msp-2tp03-06.png" target="_blank">
			<img src="../ressources/img/11-msp-2tp03-06.png" alt="../ressources/img/11-msp-2tp03-06.png">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../ressources/img/11-msp-2tp03-07.png" target="_blank">
  			<img src="../ressources/img/11-msp-2tp03-07.png" alt="../ressources/img/11-msp-2tp03-07.png">
  		</a>
	</div>
</div>

- [x] Vérifier que le client Windows et le serveur Windows 2 sont bien intégrés à l'AD.

<div class="img-row">
  	<div class="img-col">
		<a href="../ressources/img/11-msp-2tp03-13.png" target="_blank">
			<img src="../ressources/img/11-msp-2tp03-13.png" alt="../ressources/img/11-msp-2tp03-13.png">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../ressources/img/11-msp-2tp03-12.png" target="_blank">
  			<img src="../ressources/img/11-msp-2tp03-12.png" alt="../ressources/img/11-msp-2tp03-12.png">
  		</a>
	</div>
</div>

- Contrôler l'état de fonctionnement du service DHCP hébergé par le serveur Windows, celui-ci est-il toujours fonctionnel ? Pourquoi ?

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;<span class="reponse">Il est désactivé tant qu'il n'est pas autorisé auprès du serveur AD.</span>

![DHCP kaput](../ressources/img/11-msp-2tp03-14.png)


- Au besoin, faire les modifications nécessaires pour rétablir le bon fonctionnement du service DHCP.

<span class="arrow right"></span><span class="arrow right"></span><span class="arrow right"></span>&nbsp;<span class="reponse">Il faut autoriser le DHCP auprès de l'AD. Pour ce faire, clic droit sur le nom du DHCP > **Autoriser**, puis **Actualiser** </span>

<div class="img-row">
  	<div class="img-col">
		<a href="../ressources/img/11-msp-2tp03-15.png" target="_blank">
			<img src="../ressources/img/11-msp-2tp03-15.png" alt="../ressources/img/11-msp-2tp03-15.png">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../ressources/img/11-msp-2tp03-16.png" target="_blank">
  			<img src="../ressources/img/11-msp-2tp03-16.png" alt="../ressources/img/11-msp-2tp03-16.png">
  		</a>
	</div>
</div>

### 4. Création des Unités d'Organisation, Utilisateurs & Groupes

- En respectant les bonnes pratiques Microsoft, créer les utilisateurs en vous basant sur le tableau suivant. L'identifiant de connection sera composé de la première lettre du prénom suivi du nom de famille.
- Créer des UO afin de regrouper les utilisateurs d'un même service et de séparer les comptes d'ordinateur des postes clients et des serveurs.
- Créer des groupes afin de cibler les utilisateurs de chaque service.

![Structure AD prévue](../ressources/img/11-msp-2tp03-11.png)

<table class="table table-hover">
	<thead>
		<tr>
			<th>Service</th>
			<th>Membres</th>
			<th>id</th>
			<th>mdp</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Direction</td>
			<td>Christian Hef<br>Pauline Atron<br>Pascaline Résident</td>
			<td>chef<br>patron<br>president</td>
			<td class="vert-align-mid">!User123</td>
		</tr>
		<tr>
			<td>Comptabilité</td>
			<td>Bruno Ilan<br>Christelle Rédit<br>Florence Acture</td>
			<td>bilan<br>credit<br>facture</td>
			<td class="vert-align-mid">!User123</td>
		</tr>
		<tr>
			<td>Secrétariat</td>
			<td>Cédric Ourrier<br>Sandrine Tandard<br>Aline Genda</td>
			<td>courrier<br>standard<br>agenda</td>
			<td class="vert-align-mid">!User123</td>
	</tr>
		<tr>
			<td>Production</td>
			<td>Chloé Haîne<br>Ursule Sine<br>Denis Elais</td>
			<td>chaine<br>usine<br>delais</td>
			<td class="vert-align-mid">!User123</td>
		</tr> 			
		<tr>
			<td>Support Informatique</td>
			<td>Clément Lavier<br>Renaud Lizot<br>Gwellaouen Raison</td>
			<td>clavier<br>rlizot<br>graison</td>
			<td class="vert-align-mid">!User123</td>
		</tr>
</table>

**Script de création des OU** 

```powershell
# Pour lancer en mode ADMINISTRATEUR obligatoirement
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

# Récupération du domaine (reno.domaine.tssr)
# TODO: faire une boucle pour les cas où le domaine est composé de n parties (ici n=3)
$NomDUDomaine = (Get-WmiObject WIN32_ComputerSystem).Domain
$NomDomaineSplit = $NomDUDomaine.Split(".")

# Meh...
$a = $NomDomaineSplit[0]
$b = $NomDomaineSplit[1]
$c = $NomDomaineSplit[2]


# Creation OU de base (niveau 0)
$NOM_OU_Base = Read-Host "`nentrer le nom de l'OU Principale : "
New-ADOrganizationalUnit -Name $NOM_OU_Base -Path "DC=$a,DC=$b,DC=$c" -ProtectedFromAccidentalDeletion $false

# Création des OU (niveau 1)
# GROUPES ORDINATEURS PARTAGES SERVICES
$Groupes = "GROUPES ORDINATEURS PARTAGES SERVICES MODELES".Split(" ")
$Groupes | ForEach-Object {
    New-ADOrganizationalUnit -Name $_ -Path "OU=$NOM_OU_Base,DC=$a,DC=$b,DC=$c" -ProtectedFromAccidentalDeletion $false
}

# Création des sous-OU (niveau 2)
# GROUPES
$TopOU = "GROUPES"
$ListOU = "DL GG".Split(" ")
ForEach($item in $ListOU) {
    New-ADOrganizationalUnit -Name $item -Path "OU=$TopOU,OU=$NOM_OU_Base,DC=$a,DC=$b,DC=$c" -ProtectedFromAccidentalDeletion $false
}

# ORDINATEURS
$TopOU = "ORDINATEURS"
$ListOU = "CLIENTS SERVEURS".Split(" ")
ForEach($item in $ListOU) {
    New-ADOrganizationalUnit -Name $item -Path "OU=$TopOU,OU=$NOM_OU_Base,DC=$a,DC=$b,DC=$c" -ProtectedFromAccidentalDeletion $false
}

# SERVICES (niveau 2 & 3)
$TopOU = "SERVICES"
$ListLvl2 = "COMPTABILITE DIRECTION PRODUCTION SECRETARIAT SUPPORT_INFO".Split(" ")
$ListLvl3 = "IMPRIMANTES UTILISATEURS".Split(" ")
ForEach($item2 in $ListLvl2) {
    New-ADOrganizationalUnit -Name $item2 -Path "OU=$TopOU,OU=$NOM_OU_Base,DC=$a,DC=$b,DC=$c" -ProtectedFromAccidentalDeletion $false
    ForEach($item3 in $ListLvl3) {
        New-ADOrganizationalUnit -Name $item3 -Path "OU=$item2,OU=$TopOU,OU=$NOM_OU_Base,DC=$a,DC=$b,DC=$c" -ProtectedFromAccidentalDeletion $false
    }
}
```

**Création des utilisateurs (via GUI)**

1. Création des modèles d'utilisateurs pour chaque service. Les profils sont stockés dans chaque service.
[![Modèle](../ressources/img/11-msp-2tp03-17.png)](../ressources/img/11-msp-2tp03-17.png){:target="_blank"}
2. Création des utilisateurs dans chaque groupe. 
[![Utilisateurs](../ressources/img/11-msp-2tp03-18.png)](../ressources/img/11-msp-2tp03-18.png){:target="_blank"}

- [x] **TOUS** les utilisateurs parviennent bien à ouvrir une session depuis le client Windows.

<div class="img-row">
  	<div class="img-col">
		<a href="../ressources/img/11-msp-2tp03-19.png" target="_blank">
			<img src="../ressources/img/11-msp-2tp03-19.png" alt="../ressources/img/11-msp-2tp03-19.png">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../ressources/img/11-msp-2tp03-20.png" target="_blank">
  			<img src="../ressources/img/11-msp-2tp03-20.png" alt="../ressources/img/11-msp-2tp03-20.png">
  		</a>
	</div>
</div>

<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/headings.css">
