title : tp09 - ACL
## Les ACL
TP du Module 06 – La sécurité NTFS et les ACL

[TOC]

### 1.

- Sur votre VM Win10-XX, configurez les autorisations d'accès sur les répertoires suivants :
	1. Sur le volume DATA, créer le répertoire Echange
	2. Quelles sont les autorisations positionnées par défaut sur le répertoire Echange ?

**Reponse 1)**

- Depuis l'explorateur Windows, explorer le lecteur **d:\DATA**
- Clic droit > **Nouveau** > **Dossier**
- Nommez-le **Echange**

**Reponse 2)**

Pour connaître les autorisations NTFS positionnées par défaut sur ce répertoire :

- Clic droit sur **Echange** > **Propriétés**
- Onglet **Sécurité**
- L'entité de sécurité **Utilisateurs authentifiés** possède des autorisations en **Modification**
- L'entité de sécurité **Système** possède des autorisations en **Contrôle total**
- Le groupe prédéfini **Administrateurs** possède des autorisations en **Contrôle total**
- Le groupe prédéfini **Utilisateurs** possède des autorisations en **Lecture**

Ces autorisations proviennent de l'héritage du volume D: (un indice du fait qu'apparaissent des coches grisées).

![img1](../ressources/img/03-services-client-windows/mod6-tp09-01.png)

### 2.
- Q: Peuplez ce répertoire de fichiers, de dossiers. Héritent-ils des autorisations du dossier parent ?

- Dans le dossier **Echange**
- Clic droit > **Nouveau** > **Document texte**
- Sur **Nouveau document texte**
- Clic droit > **Propriétés**
- Onglet **Sécurité**

Oui, les nouveaux fichiers héritent des autorisations du dossier parent **Echange** (qui lui-même hérite des autorisations du lecteur **D:**).

Pour s'en assurer, il suffit d'observer la présence des coches grisées. Pour plus de détail, cliquez sur le bouton **Avancé**.

![img1](../ressources/img/03-services-client-windows/mod6-tp09-02.png)

![img1](../ressources/img/03-services-client-windows/mod6-tp09-03.png)

### 3.

Configurez les autorisations d'accès au répertoire **Echange**
	+ Vos **collègues** pourront modifier tous les objets et sous-objets de ce répertoire
	+ Les administrateurs auront le contrôle total
	+ Vous accorderez les droits en **Lecture** sur le répertoire aux utilisateurs de votre poste
	+ Testez le bon fonctionnement des autorisations

#### Reponses

Ici plusieurs possibilités, en voici une en modifiant les héritages
	* Lecteur D:
	* Clic droit > **Propriétés**
	* Onglet **Sécurité**
	* **Modifier**
	* Sélectionnez **Utilisateurs authentifiés**
	* **Supprimer**

Par bonne pratique Microsoft, laissez **Système** et **Administrateurs** en **Contrôle total**
	* Laissez aussi **Utilisateurs** en **Lecture** car c'est ce qui est demandé dans la consigne
	* **OK** > **Appliquer** > **OK**
	* Dossier **Echange**
	* Clic droit > **Propriétés**
	* Onglet **Sécurité**
	* On observe que l'entité de sécurité **Utilisateurs authentifiés** n'est plus présente, par héritage.
	* **Modifier**
	* **Ajouter**...
	* Entrez les noms des objets à sélectionner : **L_Collegues**
	* **Entrée**
	* Cocher **Modification** (vous observerez que **Ecriture** va se cocher automatiquement)
	* **Appliquer** > **OK**
	
![img1](../ressources/img/03-services-client-windows/mod6-tp09-04.png)

![img1](../ressources/img/03-services-client-windows/mod6-tp09-05.png)


##### Les tests d'accès (important)
###### Solution 1 (+ probante) : Tests grandeur réelle
Première solution (peut-être la plus probante) : faire des tests "grandeur réelle"

- Fermez votre session actuelle (**logoff**) puis ouvrez une session locale avec l'utilisateur **Romain**.
- Tester l'accès au dossier **Echange** (**Lecture** possible car **Romain** (utilisateur) possède les autorisations en **Lecture**).
- Tester la création d'un nouveau fichier dans le dossier **Echange** (impossible car **Romain** n'a pas les autorisations en **Modification**, il fait partie du groupe prédéfini **Utilisateurs**).

![img1](../ressources/img/03-services-client-windows/mod6-tp09-06.png)

- Fermez la session de **Romain** et ouvrez une session avec **un de vos utilisateurs supplémentaires**.
- Tester l'accès au dossier **Echange** (**Lecture** possible car votre utilisateur supplémentaire (**L_Collegues**) possède les autorisations en **Lecture**).
- Tester la création d'un nouveau fichier dans le dossier **Echange** (possible car votre utilisateur possède les autorisations en **Modification**, par l'intermédiaire du groupe **L_Collegues**).
- Tester l'accès à l'onglet **Sécurité** du dossier **Echange** pour tenter de modifier les ACL (Impossible car l'utilisateur supplémentaire, qui fait partie du groupe **L_Collegues**, ne possède pas les autorisations en **Contrôle Total**, le bouton **Modifier** est protégé par l'UAC).
- Fermer la session actuelle et ouvrez une session locale avec l'utilisateur **francois**.
- Tester l'accès au dossier **Echange** (lecture possible car **francois** (Administrateurs) possède les autorisations en **Lecture**).
- Tester la création d'un nouveau fichier dans le dossier **Echange** (possible car **francois** possède les autorisations en **Modification**, par l'intermédiaire du groupe prédéfini Administrateurs).
- Tester l'accès à l'onglet Sécurité du dossier **Echange** pour tenter de modifier les ACL (possible car **francois**, qui fait partie du groupe prédéfini Administrateurs possède les autorisations en Contrôle Total).

###### Solution 2 (+ rapide) : via onglet "Accès Effectif"
Deuxième possibilité (plus rapide) par l'intermédiaire de l'onglet Accès effectif__
- Ouvrez une session avec un utilisateur membre du groupe Administrateurs
- Affichez les propriétés du dossier **Echange** (clic droit > Propriétés)
-  Onglet Sécurité
- Avancé
- Onglet Accès effectif
- Sélectionner un utilisateur

**Tests d'autorisation d'accès avec un utilisateur membre du groupe utilisateurs**
- Entrez le nom de l'objet à sélectionner : **Romain**
- Entrée
- Afficher l'accès effectif
- On observe que **romain** n'a que des accès en **Lecture** (pas de création, d'écriture et de suppression possible).

![img1](../ressources/img/03-services-client-windows/mod6-tp09-07.png)

**Tests d'autorisation d'accès avec un utilisateur membre du groupe **L_Collegues****
+ Sélectionner un utilisateur
+ Entrez le nom de l'objet à sélectionner : *l'un de vos utilisateurs supplémentaires*
+ Entrée
+ Afficher l'accès effectif
+ On observe qu'Alix possède un niveau d'autorisation plus élevé que **romain** car le groupe **L_Collegues** possède des accès en **Modification**

![img1](../ressources/img/03-services-client-windows/mod6-tp09-08.png)

**Tests d'autorisation d'accès avec un utilisateur membre du groupe Administrateurs**
+ Sélectionner un utilisateur
+ Entrez le nom de l'objet à sélectionner : **francois**
+ Entrée
+ Afficher l'accès effectif
+ De par son appartenance au groupe prédéfini Administrateurs, **francois** possède le niveau d'accès Contrôle Total

![img1](../ressources/img/03-services-client-windows/mod6-tp09-09.png)


### 4.
- Sur le volume TOOLS, créer les répertoires logiciels et manuels d'utilisation
	+ Yann et **François** accéderont en **Modification**s à ces répertoires.
	+ Les utilisateurs standard auront un accès en **Lecture** et les administrateurs posséderont un contrôle total
	+ Testez le bon fonctionnement des autorisations

#### Réponses
Ici plusieurs possibilités, en voici une en modifiant les héritages

- Lecteur e:
- Clic droit > Propriétés
- Onglet Sécurité
- Modifier
- Sélectionnez Utilisateurs authentifiés
- Supprimer
- Par bonne pratique Microsoft, laissez Système et Administrateurs en Contrôle total
- Laissez aussi Utilisateurs en **Lecture** car c'est ce qui est demandé dans la consigne.
- OK > Appliquer > OK
- Créer les dossiers logiciels et manuels d'utilisation dans le volume TOOLS (clic droit dans le volume TOOLS > Nouveau > Dossier).
- Par héritage, ces dossiers permettent au Système et aux Administrateurs d'en avoir le Contrôle total. Les membres du groupe Utilisateurs, n'ont qu'un accès en **Lecture**

Occupons-nous maintenant des autorisations d'accès de Yann et **François**
Les DACL ne doivent contenir que des groupes. C'est la bonne pratique.
Yann et **François** sont tous les deux membres du groupe L_Informatiques
Il suffit donc de rajouter le groupe L_Informatiques dans les DACL des dossiers logiciels et manuels d'utilisation

- Sur les dossiers logiciels et manuels d'utilisation
- Clic droit > Propriétés
- Onglet Sécurité
- On observe que l'entité de sécurité Utilisateurs authentifiés n'est plus présente, par héritage.
- Modifier
- Ajouter...
- Entrez les noms des objets à sélectionner : L_Informatiques
- Entrée
- Cocher **Modification** (vous observerez que Ecriture va se cocher automatiquement).
- Toujours faire les tests d'autorisation d'accès "grandeur réelle" ou bien en passant par l'onglet Accès Effectif


### Sur la VM Discovery en PowerShell
- Afficher la liste des droits d'accès au dossier 2022 du lecteur M:
```ps1
Get-Acl m:\2022
```

- Quelle cmdlet permet la **Modification** des ACL sur un dossier ?
```ps1
Set-Acl
```


<link rel="stylesheet" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" href="../ressources/css/style.css">
