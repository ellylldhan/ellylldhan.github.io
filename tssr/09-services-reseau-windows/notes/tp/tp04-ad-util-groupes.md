title: tp04 - AD util. & groupes

# ENI TSSR 09 - Services Réseaux Windows

[TOC]

## TP 04 - Gestion des utilisateurs et groupes dans un contexte de domaine AD

**Objectifs** 

Gérer un contexte de domaine Active Directory.

**Prérequis**

Avoir réaliser l'atelier 3 (*"Mise en place d'un AD"*).

### Résumé des paramètres

<table>
  <thead>
    <tr>
      <th class="header_nom_vm">Nom VM :</th>
      <th>Modele_SRV<sup class="red-star">*</sup></th>
      <th>CD01</th>
      <th>SRV01</th>
      <th>W10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>ip</th>
      <td> n/a </td>
      <td> 172.23.17.1 </td>
      <td> 172.23.17.2 </td>
      <td> 172.23.17.11</td>
    </tr>
    <tr>
      <th>Utilisateur</th>
      <td> Administrateur </td>
      <td> Admin </td>
      <td> Admin </td>
      <td> Admin </td>
    </tr>
    <tr>
      <th>mdp</th>
      <td> !Admin123 </td>
      <td> !Admin123 </td>
      <td> !Admin123 </td>
      <td> !Admin123 </td>
    </tr>
    <tr>
      <th>Type</th>
      <td> Template </td>
      <td> Ctlr de domaine </td>
      <td> Serveur </td>
      <td> Poste client </td>
    </tr>
    <tr>
      <th>OS</th>
      <td> Win Srv 2019 Std </td>
      <td> clone Modele_SRV </td>
      <td> clone Modele_SRV </td>
      <td> Win 10 Pro </td>
    </tr>
    <tr>
      <th>CPU</th>
      <td> 1x1 </td>
      <td> 1x1 </td>
      <td> 1x1 </td>
      <td> 2x1 </td>
    </tr>
    <tr>
      <th>RAM</th>
      <td> 4 Go </td>
      <td> 4 Go </td>
      <td> 4 Go </td>
      <td> 2 Go </td>
    </tr>
    <tr>
      <th>NIC</th>
      <td> Host-Only </td>
      <td> Host-Only </td>
      <td> Host-Only </td>
      <td> Host-Only </td>
    </tr>
    <tr>
      <th>HDD</th>
      <td> 1x 32 Go </td>
      <td> 1x 32 Go </td>
      <td> 1x 32 Go </td>
      <td> 1x 32 Go </td>
    </tr>
</tbody>
</table>

<span class="attention"><sup class="red-star">\*</sup>ATTENTION <u>NE PAS REDEMARRER</u> LES MODELES UNE FOIS CLONÉS ! </span>

<table>
  <thead>
    <tr>
      <th>Service</th>
      <th>Utilisateur</th>
      <th>Fonction</th>
      <th>login</th>
      <th>mdp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td scope="row" rowspan="4" class="vert-align-mid td-commercial">Commercial</td>    
        <td class="td-commercial-light">Camille</td>
        <td class="td-commercial-light">Secrétaire</td>
        <td class="td-commercial-light">camille / camille@renaud.lcl</td>
        <td class="td-commercial-light">!User123</td>
    </tr>
    <tr>
        <td class="td-commercial-light">Inès</td>  
        <td class="td-commercial-light">Intérimaire</td>  
        <td class="td-commercial-light">ines / ines@renaud.lcl</td>
        <td class="td-commercial-light">!User123</td>
    </tr>
    <tr>
        <td class="td-commercial-light">Claude</td>  
        <td class="td-commercial-light"></td>  
        <td class="td-commercial-light">claude / claude@renaud.lcl</td>
        <td class="td-commercial-light">!User123</td>
    </tr>
    <tr>
        <td class="td-commercial-light">Corentin</td>  
        <td class="td-commercial-light"></td>  
        <td class="td-commercial-light">corentin / corentin@renaud.lcl</td>
        <td class="td-commercial-light">!User123</td>
    </tr>
    <tr>
        <td scope="row" rowspan="4" class="vert-align-mid td-informatique">Informatique</td>    
        <td class="td-informatique-light">Sophie</td>
        <td class="td-informatique-light">Secrétaire</td>
        <td class="td-informatique-light">sophie / sophie@renaud.lcl</td>
        <td class="td-informatique-light">!User123</td>
    </tr>
        <tr>
        <td class="td-informatique-light">Reno</td>  
        <td class="td-informatique-light"></td>  
        <td class="td-informatique-light">Reno / Reno@renaud.lcl</td>
        <td class="td-informatique-light">!User123</td>
    </tr>
    <tr>
        <td class="td-informatique-light">Samir</td>  
        <td class="td-informatique-light"></td>  
        <td class="td-informatique-light">samir / samir@renaud.lcl</td>
        <td class="td-informatique-light">!User123</td>
    </tr>
    <tr>
        <td class="td-informatique-light">Stéphane</td>  
        <td class="td-informatique-light"></td>  
        <td class="td-informatique-light">stephane / stephane@renaud.lcl</td>
        <td class="td-informatique-light">!User123</td>
    </tr>
       <tr>
        <td scope="row" rowspan="4" class="vert-align-mid td-production">Production</td>    
        <td class="td-production-light">Isabelle</td>
        <td class="td-production-light">Intérimaire</td>
        <td class="td-production-light">Isabelle / Isabelle@renaud.lcl</td>
        <td class="td-production-light">!User123</td>
    </tr>
        <tr>
        <td class="td-production-light">Pascal</td>  
        <td class="td-production-light"></td>  
        <td class="td-production-light">Pascal / Pascal@renaud.lcl</td>
        <td class="td-production-light">!User123</td>
    </tr>
    <tr>
        <td class="td-production-light">Paul</td>  
        <td class="td-production-light"></td>  
        <td class="td-production-light">Paul / Paul@renaud.lcl</td>
        <td class="td-production-light">!User123</td>
    </tr>
    <tr>
        <td class="td-production-light">Philippe</td>  
        <td class="td-production-light"></td>  
        <td class="td-production-light">Philippe / Philippe@renaud.lcl</td>
        <td class="td-production-light">!User123</td>
    </tr>
  </tbody>
</table>

### Recherche d'objets dans l'annuaire
#### Instructions

Utilisez les fonctions de recherches de l'AD pour contrôler si les comptes présents auparavant dans la base SAM existent toujours. 

**Q: Si oui, où se trouvent-ils ? Où se trouve le compte d'ordinateur CD01 ?**

#### Mode opératoire


### Création de la structure de stockage des objets de l’annuaire
Créer les unités d’organisation en vous basant sur les informations du tableau ci-dessous.

| type | nom |
|------|-----|
| Agence | Nantes<br>Vertou<br>Rennes |
| Services | Production<br>informatique<br>Commercial |
| Fonctions (dans Services) | Secrétaire<br>Intérimaire |
| Ordinateurs | Serveur Membre<br>Poste Client |

#### Mode opératoire
Plan des UO :

```
AD
└── renaud.lcl
    └── slf
        ├── groupes
        │   ├── DL
        │   └── GG
        │       ├── GG_ALL_COMMERCIAL
        │       ├── GG_ALL_INFORMATIQUE
        │       ├── GG_ALL_INTERIMAIRES
        │       ├── GG_ALL_PRODUCTION
        │       ├── GG_ALL_SECRETAIRES
        │       ├── GG_COMMERCIAL_SECRETAIRE
        │       ├── GG_INFORMATIQUE
        │       ├── GG_INFORMATIQUE_SECRETAIRE
        │       ├── GG_PROD_MATIN
        │       └── GG_PROD_SOIR
        ├── ordinateurs
        │   ├── poste client
        │   │   └── W10
        │   └── serveur membre
        │       └── SRV01
        └── utilisateurs
            ├── modeles
            │   ├── mod_commercial
            │   ├── mod_prod_matin
            │   ├── mod_prod_soir
            │   ├── mod_si
            │   └── mod_si_secretaire
            ├── nantes
            │   ├── Reno
            │   ├── Samir
            │   ├── Sophie
            │   └── Stéphane
            ├── rennes
            │   ├── Camille
            │   ├── Claude
            │   ├── Corentin
            │   └── Inès
            └── vertou
                ├── Isabelle
                ├── Pascal
                ├── Paul
                └── Philippe
```

#### Création des OU Organizational Units

```ps1
New-ADOrganizationalUnit -Name "SLF" -Path "DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false

New-ADOrganizationalUnit -Name "GROUPES" -Path "OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "ORDINATEURS" -Path "OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "UTILISATEURS" -Path "OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false

New-ADOrganizationalUnit -Name "DL" -Path "OU=GROUPES,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "GG" -Path "OU=GROUPES,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false

New-ADOrganizationalUnit -Name "POSTE CLIENT" -Path "OU=ORDINATEURS,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "SERVEUR MEMBRE" -Path "OU=ORDINATEURS,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false

New-ADOrganizationalUnit -Name "MODELES" -Path "OU=UTILISATEURS,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "RENNES" -Path "OU=UTILISATEURS,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "NANTES" -Path "OU=UTILISATEURS,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "VERTOU" -Path "OU=UTILISATEURS,OU=SLF,DC=renaud,DC=lcl" -ProtectedFromAccidentalDeletion $false
```


### Comment supprimer une OU protégée en suppression ?
#### Powershell
```
Get-ADOrganizationalUnit -identity "OU=POSTE CLIENT,DC=reno,DC=lcl" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit -Confirm:$false
```

Le faire pour chaque enfant, puis on remonte les branches jusqu'à la racine.

#### GUI VMware

1. Activer les menus cachés dans **Gestionnaire Utilisateurs & Ordinateurs** > **Affichage** > **Fonctionnalités avancées**
[![Activation](../.ressources/img/activer-suppression-ou.png)](../.ressources/img/activer-suppression-ou.png){:target="_blank"} 

2. Passer sur chaque élément > **Propriétés** > onglet **Objet** > décocher **Protéger l'objet des suppressions accidentelles**

<div class="img-row">
  	<div class="img-col">
  		<a href="../.ressources/img/activer-suppr-ou-2.png" target="_blank">
			<img src="../.ressources/img/activer-suppr-ou-2.png" alt="../.ressources/img/activer-suppr-ou-2.png"  style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../.ressources/img/activer-suppr-ou-3.png" target="_blank">
	  		<img src="../.ressources/img/activer-suppr-ou-3.png" alt="../.ressources/img/activer-suppr-ou-3.png" style="width:100%">
	  	</a>
	</div>
</div>

3. Pour supprimer un OU, clic droit sur l'object > **Supprimer** > **Ok**

### Création des modèles et comptes utilisateurs

#### Instructions

- Créer des modèles d'utilisateurs pour les services INFORMATIQUE, PRODUCTION et COMMERCIAL.
- Les caractéristiques des comptes utilisateurs selon leur service d'appartenance sont indiquées ci-après

##### Les utilisateurs du service PRODUCTION
- [x] Tranches horaire Philippe et Pascal : 6h à 13h
- [x] Tranches horaire Paul et Isabelle : 13h à 21h
- [x] Chaque collaborateur n'est affecté qu'à une tranche horaire
- [x] Ils travaillent tous dans l'agence de Vertou
- [x] Ils font partie du groupe PRODUCTION

##### Les utilisateurs du service INFORMATIQUE
- [x] disposent de tous les privilèges à l'échelle du domaine sauf la secrétaire (*admin du domaine*)
- [x] travaillent tous dans l'agence de Nantes
- [x] aucune restriction horaire

##### Les utilisateurs du service COMMERCIAL
- [x] Ne peuvent se connecter que sur le poste client Windows 10 Pro

##### Modèles

En partant de ces modèles précédemment créés, créer les comptes et les groupes suivants. (groupes qui permettent de rassembler des objets **qui possèdent des caractéristiques communes**).

| Service informatique | Service Production | Service commercial |
|----------------------|--------------------|--------------------|
| Stéphane             | philippe               | Camille (secretaire) | 
| Sophie (secretaire)  | pascal                 | claude | 
| Samir                | Paul                   | Corentin | 
| Reno                 | Isabelle (intérimaire) |Inès (intérimaire) | 

- [x] Contrôler que la bonne prise en compte des caractéristiques des comptes créés.
- [x] Faire un snapshot "TP04 Terminé"


#### Mode opératoire

1. Créer des groupes d'étendue globale (préfixé GG_) dans l'AD pour chaque service, chaque agences, etc.

2. Créer des groupes d'étendue globale pour chaque type de profil (ex. GG_PROD_MATIN, GG_PROD_SOIR)
<div class="img-row">
  	<div class="img-col">
  		<a href="../.ressources/img/tp04-01.png" target="_blank">
			<img src="../.ressources/img/tp04-01.png" alt="../.ressources/img/tp04-01.png"  style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../.ressources/img/tp04-02.png" target="_blank">
	  		<img src="../.ressources/img/tp04-02.png" alt="../.ressources/img/tp04-02.png" style="width:100%">
	  	</a>
	</div>
</div>

3. Glisser-déposer les machines ayant déjà rejoint le domaine, dans l'OU **ORDINATEUR** > { **SERVEUR** | **POSTE** }

4. Créer les utilisateurs, les glisser-déposer dans leurs OU respectives (ex. **UTILISATEURS** > **VERTOU**)

5. Ajouter chaque membre à son ou ses groupes respectifs.
[![membre de](../.ressources/img/tp04-07.png)](../.ressources/img/tp04-07.png){:target="_blank"} 

6. Les **restrictions d'horaires** se font sur les profils utilisateurs (ou mieux, sur les modèles).
<div class="img-row">
  	<div class="img-col">
  		<a href="../.ressources/img/tp04-03.png" target="_blank">
			<img src="../.ressources/img/tp04-03.png" alt="../.ressources/img/tp04-03.png"  style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../.ressources/img/tp04-04.png" target="_blank">
	  		<img src="../.ressources/img/tp04-04.png" alt="../.ressources/img/tp04-04.png" style="width:100%">
	  	</a>
	</div>
</div>

7. Les **restrictions d'accès** à un ou plusieurs postes se font dans les **propriétés** de chaque profil (ou modèle) > onglet **Compte** > bouton "**Se connecter à...**"
<div class="img-row">
  	<div class="img-col">
  		<a href="../.ressources/img/tp04-05.png" target="_blank">
			<img src="../.ressources/img/tp04-05.png" alt="../.ressources/img/tp04-05.png"  style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href="../.ressources/img/tp04-06.png" target="_blank">
	  		<img src="../.ressources/img/tp04-06.png" alt="../.ressources/img/tp04-06.png" style="width:100%">
	  	</a>
	</div>
</div>







### Bonus

- Ajoutez dans votre infrastructure une nouvelle VM Windows Serveur 2019 en partant des images de base créées à l’atelier 1. Elle sera nommée **CD02**.
- Celle-ci sera ensuite à promouvoir contrôleur de domaine supplémentaire de votre domaine. Vérifiez
que les objets créés sur le premier sont bien répliqués sur le second.
- En cas de déconnexion du réseau du serveur CD01, parvenez-vous à vous authentifier auprès de CD02 ?






<link rel="stylesheet" type="text/css" href="../.ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../.ressources/css/style.css">

