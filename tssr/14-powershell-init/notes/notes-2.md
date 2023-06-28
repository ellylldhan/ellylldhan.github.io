title: notes-3 objets

# ENI TSSR 14 - Powershell
Cours "Initiation au scripting Powershell" @ ENI (2022)

<table>
<tr><th>Dates     :</th><td>du 28/11 au 02/12/2022</td></tr>
<tr><th>Formateur :</th><td>Thélo GUYADER</td></tr>
</table>

id: 140

[TOC]

## Module 2 : PowerShell Langage Objet

Powershell est un langage orienté objet.

Chaque objet pourra porter des **méthodes** et des **propriétés**.

Exemple: `Get-Service` renvoie un objet **Service Windows**

| Propriétés        | Méthodes              |
| :---------------- | :-------------------- |
| Nom du Service    | démarrer le Service   |
| Type de démarrage | désactiver le Service |
| status du Service | arreter le Service    |

### Get-Member
Permet de connaître les propriétés *essentielles* d'un objet.

```ps1
PS> get-Service | get-member
```

Un objet est constitué de proprietes qui contiennent une valeur.

On peut modiifer la valeur d'une propriété avec le verbe `Set`

```ps1
PS> Set-Service -Name WSearch -DisplayName "Service de recherche Windows"
```

### Les objets : methodes

Les objets disposent de méthodes  parfois communes à plusieurs types d'objets.

Contrairement aux propriétés, les méthodes effectuent des actions sur la totalité de l'objet ou sur la valeur d'une ou plusieurs propriétés d'un objet.

```ps1
PS> get-date | gm
PS> (get-date).adddays(1)
```
**Note**:

-  `gm` est un alias de `Get-Member`
- ne modifie pas la valeur de `get-date`, c'est juste un calcul fait sur une valeur.
- `Get-Date` est un objet `System.DateTime`

### TP 02 - Objet
[Voir Atelier 2 - Les objets](./tp02.html){:target="_blank"}




<p class="fin">~Fin~</p>

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">