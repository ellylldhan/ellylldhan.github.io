# ENI TSSR 18 - RDS WDS MDT
Cours TSSR *"Services Transverses Microsoft"* @ ENI (2023)

<table>
<tr><th>Dates     :</th><td>du 13/03 au 17/03/2023</td></tr>
<tr><th>Formateur :</th><td>Mathieu LE MASSON</td></tr>
</table>

id: 200

*200 - Services Transverses Microsoft (RDS/WDS/MDT)*



**Partager un dossier dans VMWARE**

1. VMWARE > **Properties** de la VM > onglet **OPTIONS**
2. Activer "**Shared Folders**" > bouton "<kbd>Add</kbd>" > naviguer vers dossier à partager dans Windows > <kbd>OK</kbd>
3. Sur la VM > exécuter en tant que **root** `vmhgfs-fuse .host:/ /mnt/gfs -o allow_other -o uid=1000` 
4. Naviguer vers `/mnt/hgfs/<nom du partage>`

