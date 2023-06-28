title: notes-3 manipulations

# ENI TSSR 14 - Powershell
Cours "Initiation au scripting Powershell" @ ENI (2022)

<table>
<tr><th>Dates     :</th><td>du 28/11 au 02/12/2022</td></tr>
<tr><th>Formateur :</th><td>Thélo GUYADER</td></tr>
</table>

id: 140

[TOC]

## Module 03 - Manipulation des objets
### Manipuler des objets
En PowerShell, le résultat d'une commande peut être composé d'un ensemble d'objets
```ps1
PS> Get-Service
```

Le nombre d'objets étant souvent élevé, il est important de pouvoir sélectionner et mettre en forme le résultat d'une commande.
```ps1
PS> Get-EventLog
```

#### Pipeline

L'utilisation de redirections au moyen de pipeline permet d'effectuer des commandes de triage, de mise en forme, de sélection et de conditionner le résultat final. Peut être utilisé plusieurs fois.
```ps1
PS> Get-EventLog -LogName "System" | Select-Object Name | Format-Table
```

Le pipe utilise la variable réservée `$PSItem`. Cela permet de cibler une propriété d'un objet :
```ps1
PS> Get-Process | Select Name, Id | Where { $PSItem.id -gt 1500 -and $PSItem.id -lt 2000 }
```

#### Select-Object
La commande `Select-Object`  permet de sélectionner une ou plusieurs propriétés.

```ps1
PS> Get-Service | Select-Object -Property Name, Status
PS> Get-Service | Select Name, Status
```

Parmi les propriétés de la fonction `Select` :
```powershell
PS> Get-Service | select -First 5       # les 5 premiers résultats
PS> Get-Service | Select -Last 5        # les 5 derniers
PS> Get-Service | Select -Unique Name   # equiv. Distinct
PS> Get-Service | Select -ExpandProperty Name   # affiche uniquement les valeurs dans la console
```

#### Sort-Object
La commande `Sort-Object` permet de trier selon un critère donné.

```ps1
PS> Get-Service | Select Name, Status | Sort Status
PS> Get-Service | Select Name, id | Sort id -Descending
```

Ex. La propriété `Length` indique le poids des fichiers en octets. Ils seront classés du plus faible au plus élevé.
```ps1
PS> Get-ChildItem -Path C:\Windows | Sort -Property Length
```

#### Measure-Object
La commande `Measure-Object` permet de compter le nombre d'objets, d'établir des moyennes, etc.


- L'action par défaut est le **comptage**.
```ps1
PS> Get-Process | Measure-Object
```

- La commande est aussi utilisable sur une propriété pour déterminer une valeur **moyenne**.
```ps1
PS> Get-ChildItem -Path | Measure-Object -Property Length -Average
```

- Sert aussi à calculer des valeurs **minimales** et **maximales**.
```ps1
PS> Get-ChildItem -Path | Measure -Property Length -Minimum -Maximum
```

#### Where-Objet

La commande `Where-Objet` conditionne la présence d'un objet dans le résultat.

- Les conditions sont toujours appliquées sur des valeurs de propriété
- Elles peuvent être uniques ou multiples, obligatoires ou optionnelles

```ps1
PS> Get-Service | Where -Property Status -eq "Running"
PS> Get-Process | Where -Property Name -like "power*"
```

| Comparaison            | insensible à la casse | Sensible à la casse |
| :--------------------- | :-------------------: | :-----------------: |
| Egalité                |          -eq          |        -ceq         |
| Inégalité              |          -ne          |        -cne         |
| Supérieur à            |          -gt          |        -cgt         |
| Sup. ou égal à         |          -ge          |        -cge         |
| Inférieur à            |          -lt          |        -clt         |
| Inf. ou égal à         |          -le          |        -cle         |
| égalité d'expression   |         -like         |       -clike        |
| inégalité d'expression |       -notlike        |      -cnotlike      |

##### OR / AND & FilterScript
Pour ajouter des expressions logique à un Where-Objet :

**And**
```ps1
PS> Get-Process | Select Name, Id | Where -FilterScript { $PSItem.id -gt 1500 -and $PSItem.id -lt 2000 }
PS> Get-Process | Select Name, Id | Where -FilterScript { $_.id -eq 825 -and $_.Name -like "power*" }
```

**Or**
```ps1
PS> Get-LocalUser | Select Name, Sid, Enabled | Where { $_.Name -like "Toto"
-or $_.Sid -eq S-1-5-21-3376288570-2491860933-3167967787500
-or $_.Enabled -eq $true }
```

**Important** : penser à inclure les propriétés à tester dans le Select-Object.

##### Collaboration de conditions
Il est également possible de grouper des conditions

```ps1
PS> Get-ADUser -Filter * | Select Name, UserPrincipalName | Where -FilterScript {
	($_.Name -eq "Administrateur" -or $_.Name -eq "Administrator")
	-and
	$_.UserPrincipalName -eq "Admin"
}
```

#### Format-Table
Permet de mettre en forme le résultat final afin d'améliorer la lecture du résultat, mais également de permettre l'export vers un fichier dans un ou plusieurs formats.

```ps1
PS> Get-ADUser -Filter * | Select Name,GivenName,Enabled | Format-Table
```

- L'ordre des colonnes est personnalisable
```ps1
PS> Get-ADUser -Filter * | Format-Table -Property Enabled, Name, SamAccountName
```
- On peut également regrouper les objets par valeurs de propriétés identiques
```ps1
PS> Get-ADUser -Filter * | Format-Table -GroupBy Enabled
```

- Les utilisateurs seront regroupés selon l'état de leur compte actif ou inactif.

**Attention** Select-Object n'est pas obligatoire pour l'utilisation des commandes de format.

```ps1
PS> Get-Service | Format-Table -HideTableHeaders    # masque le nom de la propriété, affichage brut
PS> Get-Service | Format-Table -Wrap                # force le retour à la ligne en fin de console (wrap word)
```

#### Format-Wide
Permet de mettre en forme les valeurs d'une propriété en colonne. Le nombre de colonnes est paramétrable.

```ps1
PS> Get-Service | Format-Wide -Column 10
PS> Get-Service | Format-Wide -AutoSize
```

Avec `-AutoSize`, le nombre de colonnes est déterminé automatiquement.

#### Format-List
Permet de formater un affichage sous forme de liste. L'ordre d'affichage des propriétés est paramétrable dans la commande.

```ps1
PS> Get-ADUser -Filter * | Format-List -Property Name, Enabled, SamAccountName
PS> Get-ADUser -Filter * | fl -Property Name, Enabled, SamAccountName
```

#### Export-Object
Permet d'exporter un output dans un format donné (ex. csv). Les formats pris en charge nativement sont le CSV, le CLIXML, le JSON, le HTML.

```ps1
PS> Get-ADUser -Filter * | Export-CSV C:\ENI\export.csv -Delimiter ";"
PS> Get-ADUser -Filter * | Export-CSV C:\ENI\export.csv -Delimiter ";" -NoTypeInformation
```

Par défaut le type d'objet est exporté dans le fichier. La propriété `-NoTypeInformation` évite cela.

Pour les formats JSON et HTML, il faut convertir les données puis les exporter.

```ps1
PS> Get-Service | ConvertTo-Html | Out-File C:\ENI\Services.html
```

Il existe des modules supplémentaires qui permettent de manipuler plus de formats (ex. Import-Excel).


#### Out-File
Permet de rediriger un flux vers un fichier (equiv. du chevron en bash).

```ps1
PS> Get-Service | Out-File C:\ENI\Services.txt
PS> Get-Service | Out-File C:\ENI\Services.txt -Append
PS> Get-Service | Out-File C:\ENI\Services.txt -Width 42   # défaut: 80
```

- `-Append` permet d'ajouter en fin de fichier
- `-Width` spécifie le nombre de caractères par ligne. Par défaut 80.

**Remarques**: 

- Le chevron à la Bash fonctionne aussi, dans les 2 sens. `>`, `>>`, `<`, `<<`
- Le `2>` fonctionne aussi pour rediriger les erreurs. 
- `$Null` est l'équivalent du `/dev/null`

#### Get-Content
Permet d'afficher le contenu d'un fichier dans la console, on utilise la commande `Get-Content`.

```ps1
PS> Get-Content C:\User.csv
PS> Get-Content | C:\User.csv -Tail 1
```

#### Import-CSV
Permet d'importer des données dans certains formats en vue d'être manipuler dans le shell.

Exemple : Créer des comptes AD d'après un csv importé
```ps1
PS> Import-CSV C:\users.csv -Delimiter ";" | New-ADUser
```

Il n'est pas possible de cibler une propriété du fichier CSV et de l'attribuer à une propriété particulière d'un objet.

```ps1
# CETTE COMMANDE N'EST PAS FONCTIONNELLE !
PS> Import-CSV C:\users.csv -Delimiter ";" | New-ADUser -Name $_.nom -GivenName $_.GivenName
```


### Les propriétés calculées

Lorsque les propriétés ne correspondent pas, il faut créer de nouvelles propriétés et récupérer la valeur de propriété d'origine.

Cela peut être utile pour mieux interpréter le résultat d'une commande, notamment en assurant la traduction de la propriété.

```ps1
PS> Import-CSV c:\users.csv -Delimiter ";" | New-ADUser -Name $_.nom -GivenName $_.GivenName
PS> Import-CSV c:\users.csv -Delimiter ";" | Select GivenName @{n='Name';e={$_.nom}} | New-ADUser -Name $_.Name -GivenName $_.GivenName
```

- `n=Name`        : nouvelle étiquette de la propriété
- `e={$_.nom}`    : nom de la propriété dont la valeur va être récupérée
- `-Name $_.Name` : utilisation de la nouvelle propriété avec son nouveau label

On peut également changer l'**unité de mesure** remontée par les commandes.

Ex. la propriété **Length** est affiché en octet. On peut se servir des propriétés calculées pour afficher un résultat "*human-readable*".

```ps1
PS> Get-ChildItem -File | Select Name,
    @{
        n='Taille';
        e={ '{0:N2}' -f ($_.Length / 1MB) }
    }
```

- `'{0:N2}'` : numérique à 2 décimales
- `($_.Length / 1MB)` : La conversion est faite en bytes et non en octets.

Explications supplémentaires sur les formats : https://docs.microsoft.com/fr-fr/dotnet/standard/base-types/standard-numeric-format-strings

On peut également intégrer plusieurs propriétés calculées dans une même commande.

```ps1
PS> Get-Volume | Select DriveLetter,
    @{
        n='Taille (GB)';
        e={'{0:N2}' -f ($PSItem.Size / 1GB)}
    },
    @{
        n='Espace Libre (GB)';
        e={'{0:N2}' -f ($PSItem.SizeRemaining / 1GB)}
    }
```


<p class="fin">~Fin~</p>

<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/headings.css">