title: notes

# ENI TSSR 19 - Messagerie Cloud
Cours TSSR *"Cloud et Microsoft 365"* @ ENI (2023)

<table>
<tr><th>Dates     :</th><td>du 24/04 au 29/04/2023</td></tr>
<tr><th>Formateur :</th><td>Jordan RONDAULT</td></tr>
</table>

id: 180

[TOC]

## Module 1


### Users & Group

- Strategie mode de passe en Powershell 
```ps
Set-MSolPasswordPolicy -ValidityPeriod 90 -NotificationDays 85
```

- Pour enlever l'expiration de mot de passe
```ps
Set-MsolUser -UserPrincipalName fmercury@mylabeni2021.tk -PasswordNeverExpires $true
```

- Pour ajouter, modifier ou forcer le changerment d'un mdp utilisateur
```ps
Set-MsolUserPassword -UserPrincipalName fmercury@mylabeni2021.tk --ForceChangePassword
Set-MsolUserPassword -UserPrincipalName fmercury@mylabeni2021.tk --NewPassword "Pa55w.rd"
```


### Roles

- `Get-MsolRole`			: quels sont les roles ?
- `Get-MsolUserRole`		: quels sont les roles asssignés à un utilisateur
- `Add-MsolRoleMember`		: ajouter des membres à un role
- `Remove-MsolRoleMember`   : supprimer des membres à un role


### TP02 User & Groupe
- Créer un utilisateur 
```powershell
# René
new-msolUser -UserPrincipalName rsens@rtssr011p-3.lab-eni.fr -DisplayName "René Sens" -FirstName "René" -LastName "Sens" -Department "Pédagogie"  -Title "Formateur" -password $mdp -ForceChangePassword $true -UsageLocation CA

# Sacha
$mdp=Read-Host -AsSecureString
new-msolUser -UserPrincipalName sacha@rtssr011p-3.lab-eni.fr -DisplayName "Sacha Hute" -FirstName "Sacha" -LastName "Hute" -Department "Restauration"  -Title "Cuisinier" -password $mdp -ForceChangePassword $true -UsageLocation JP

```

Output : 
```ps
PS C:\Windows\system32> new-msolUser -UserPrincipalName rsens@rtssr011p-3.lab-eni.fr -DisplayName "René Sens" -FirstName "René" -LastName "Sens" -Department "Pédagogie"  -Title "Formateur" -password $mdp -ForceChangePassword $true -UsageLocation CA

Password                     UserPrincipalName            DisplayName isLicensed
--------                     -----------------            ----------- ----------
System.Security.SecureString rsens@rtssr011p-3.lab-eni.fr René Sens   False
```


```ps
PS C:\Windows\system32> $mdp=Read-Host -AsSecureString
*******
PS C:\Windows\system32> new-msolUser -UserPrincipalName sacha@rtssr011p-3.lab-eni.fr -DisplayName "Sacha Hute" -FirstName "Sacha" -LastName "Hute" -Department "Restauration"  -Title "Cuisinier" -password $mdp -ForceChangePassword $true -UsageLocation JP

Password                     UserPrincipalName            DisplayName isLicensed
--------                     -----------------            ----------- ----------
System.Security.SecureString sacha@rtssr011p-3.lab-eni.fr Sacha Hute  False
```


#### Page 2
- Installation, importation du module `msonline` & connection au service 
```ps1
install-module msonline
import-module msonline
Connect-MsolService
``` 

- Création new user `labeni`
```ps1
$mdp=Read-host -AsSecureString
new-msoluser -UserPrincipalName labeni@rtssr011p-3.lab-eni.fr -DisplayName labeni -FirstName Lab -LastName ENI -Password $mdp -PasswordNeverExpires $true -UsageLocation FR -Department Informatique -title Administrateur
``` 

- Attribution d'un rôle 
```ps1
Get-MsolRole | select name | where name -like *Administrator*          # Voir les roles dispo

$labeni="labeni@rtssr011p-3.lab-eni.fr"
Add-MsolRoleMember -RoleName "Company Administrator" -RoleMemberEmailAddress $labeni
```

**Note**: trouver le nom exact du role :

```ps1
PS C:\Windows\system32> Get-MsolRole
ObjectId                               Name                             Description                                  
--------                               ----                             -----------                                  
62e90394-69f5-4237-9190-012177145e10   Company Administrator            Can manage all aspects of Azure AD and Mic...
[...]
```

- Modifier fonction (*title*) d'un utilisateur 
```ps1
$ima="igeley@rtssr011p-3.lab-eni.fr"
Set-MsolUser -Title "Chef Cuisinier" -UserPrincipalName $ima
``` 

- Supprimer / Restorer un utilisateur 
```ps1
Remove-MsolUser  -UserPrincipalName sacha@rtssr011p-3.lab-eni.fr
Restore-MsolUser -UserPrincipalName sacha@rtssr011p-3.lab-eni.fr
```

- Get password policy 
```ps1
get-msolpasswordpolicy -DomainName "rtssr011p-3.lab-eni.fr"
```

Output :

```
PS C:\Windows\system32> get-command get*password*

CommandType     Name                                               Version    Source                                 
-----------     ----                                               -------    ------                                 
Cmdlet          Get-AzureADApplicationPasswordCredential           2.0.2.140  azuread                                
Cmdlet          Get-AzureADServicePrincipalPasswordCredential      2.0.2.140  azuread                                
Cmdlet          Get-MsolPasswordPolicy                             1.1.183.66 msonline                               

PS C:\Windows\system32> get-msolpasswordpolicy -DomainName "rtssr011p-3.lab-eni.fr"

ExtensionData                                    NotificationDays ValidityPeriod
-------------                                    ---------------- --------------
System.Runtime.Serialization.ExtensionDataObject               14     2147483647
```

- Importer des Utilisateurs par CSV 

```ps
Import-Csv -path "C:\temp\user-labeni.csv" | foreach {new-msoluser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -UserPrincipalName $_.UserPrincipalName -UsageLocation $_.UsageLocation -Password $_.Password -City $_.City -Department $_.Department }
```


- Supprimer, attribuer une licence 
```ps1
$lic= New-MsolLicenceOptions -AccountSkuId "WWLx847940:SPE_E5" -DisabledPlans BI_AZURE_P2,SWAY,RMS_S_ENTERPRISE
set-msoluserLicence -UserPrincipalName $sacha -LicenceOptions $lic
```




## TP 4 ADConnect










<p class="fin">~Fin~</p>




<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">
