title: notes-4 structures

# ENI TSSR 14 - Powershell
Cours "Initiation au scripting Powershell" @ ENI (2022)

<table>
<tr><th>Dates     :</th><td>du 28/11 au 02/12/2022</td></tr>
<tr><th>Formateur :</th><td>Thélo GUYADER</td></tr>
</table>

id: 140

[TOC]

## Module 4 - Structures et Variables
### Structures de contrôle
#### if
```ps1
if ($x -eq $y) {
    # do stuff
} elseif ($x _eq $z) {
    # do other stuff
} else {slf-raspi
    # or else do stuff
}
```

#### while / do while
Boucle tourne tant que la condition d'arrêt est **$false**.

```ps1
$x = 'pouet'
while ($x -ne 'q') {
    $x = Read-Host "Veuillez saisir..."
}
```
```ps1
do {
    $x = Read-Host "Veuillez saisir..."
} while ($x -ne 'q')
```

#### until / do until
Boucle tourne jusqu'à ce que la condition d'arrêt soit **$true**.

```ps1
until ($x -eq 'q') {
    $x = Read-Host "Veuillez saisir..."
}
```
```ps1
do {
    $x = Read-Host "Veuillez saisir..."
} until ($x -eq 'q')
```
#### for
Boucle tant que la condition est **$true**.

```ps1
for($i=0; $i < 10; $i++) {
    # do stuff
}
```

**Multiple operations**

```ps1
# Comma separated assignment expressions enclosed in parenthesis.
for (($i = 0), ($j = 0); $i -lt 10; $i++) {
    "`$i:$i"
    "`$j:$j"
}

# Sub-expression using the semicolon to separate statements.
for ($($i = 0;$j = 0); $i -lt 10; $i++) {
    "`$i:$i"
    "`$j:$j"
}

# Comma separated assignment expressions.
for (($i = 0), ($j = 0); $i -lt 10; $i++, $j++) {
    "`$i:$i"
    "`$j:$j"
}

# Comma separated assignment expressions enclosed in parenthesis.
for (($i = 0), ($j = 0); $i -lt 10; ($i++), ($j++)) {
    "`$i:$i"
    "`$j:$j"
}

# Sub-expression using the semicolon to separate statements.
for ($($i = 0;$j = 0); $i -lt 10; $($i++;$j++)) {
    "`$i:$i"
    "`$j:$j"
}

for (($i = 0), ($j = 0); $i -lt 10 -and $j -lt 10; $i++,$j++) {
    "`$i:$i"
    "`$j:$j"
}
```

Voir *`Get-Help about_logical_operators`*

#### foreach
```ps1
$liste = Get-ADUser -filter *
foreach($item in $liste) {
    write-host "Username : $item.Name"
    write-host "Surname  : $item.Surname"
}
```

#### switch
```ps1
switch($ADGroup) {
    "User" {
        write-host "Le groupe est Utilisateur"
    }
    "Administrator" {
        write-host "Le groupe est Administrateur"
    }
    "Default" {
        write-host "Le groupe n'est pas valide"
    }
}
```

**Note**: Si plusieurs valeurs correspondent au critère, tous les blocs d'actions correspondant sont appliqués.

### Caractéristiques
#### Incrémentation
```ps1
$compteur = 1
$compteur += 1
$compteur++       # à vérifier
```

#### Concaténation 1
```ps1
write-host "Ceci est le " $compteur "e tours"
```

#### Définition / Affectation de variable
```ps1
$foo = 1                         # type int 
$user = Get-ADUser -filter *     # type object 
$str = "Hi"                      # type string 
```

#### Accès Variable
Pour connaître le type d'une variable 
```ps1
$a.GetType()     # accès aux méthodes
$a.count         # accès aux propriétés
```

#### Comment
```ps1
# Ceci est un commentaire 

<# Commentaire 
   Multiline #>
```

#### Spécificités Powershell

Afficher les variables actuellement déclarées dans la console.

```ps1
PS> Get-Variable
```

#### Lire input
```ps1
$a = Read-Host "Veuillez saisir..."
```

#### Ecrire output
```ps1
PS> write-host "Blabla"
PS> write-host "blabla alias $foo"     # var dans echo 
```

#### Variables de type Object
```ps1
PS> $service.ServiceName     # accès propriété
PS> $ADUser[2]               # 3e utilisateur 
PS> $Service[3].stop()       # accès méthode
```

#### Convertisseur de valeur (transtypage ?)
```ps1
PS> $date = (Get-Date).toString("yyyyMMdd")
PS> $date.GetType()                          # String !!
```

#### Concaténation de string (opérateur `+`)
```ps1
$a = "foo"
$b = "bar"
$c = $a + $b      # => "foobar"
```
```ps1
$d = (Get-ADUser -filter *)
$e = $d.Name 
$f = $d.Surname 
$g = $e + $f      # => "Toto le Haricot"
```

**ATTENTION** il faut impérativement que les variables concaténées soient toutes du même type.

### Opérations multi-types

**Notes**: c'est le type du premier élément qui prend le dessus

```ps1
PS> 1 + 2
3
PS> "1"+"2"
12
PS> "1" + 2
12
PS> 1 + "2"
3
```

### Type Int
```ps1
$a = 1
$b = 2 
$c = $a + $b
```
```ps1 
$d = Get-Process
$e = $d[1].id 
$f = $d[2].id 
$g = $e - $f 

# => id du process 1 - id du process 2
``` 
### Type Array
```ps1
# Definition
$array = "PC1", "PC2", "PC3"
$array[0]                     # PC1

# Ajout (à la fin)
$arr += "PC4"                 # PC1, PC2, PC3, PC4

# Remplacer
$arr.Replace("PC1", "PC4")    # PC4, PC2, PC3, PC4
```

**Important** : les arrays sont de **taille fixe**. On ne peut pas supprimer de valeur. (valeur de isFixedSize est à $true)

**Note**: L'opérateur `+=` détruit le tableau et le reconstruit avec l'élément ajouté. Voir plus d'infos sur *`Get-Help about-array`*.


<p class="fin">~Fin Module 4~</p>

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">