# ENI TSSR 17 - Supervision
Cours TSSR *"Supervision avec Centreon"* @ ENI (2023)

<table>
<tr><th>Dates     :</th><td>du 06/03 au 10/03/2023</td></tr>
<tr><th>Formateur :</th><td>Guillaume CHERAMY</td></tr>
</table>

id: 150

*150 - Supervision avec Centreon*




**Partager un dossier dans VMWARE**

1. VMWARE > **Properties** de la VM > onglet **OPTIONS**
2. Activer "**Shared Folders**" > bouton "<kbd>Add</kbd>" > naviguer vers dossier à partager dans Windows > <kbd>OK</kbd>
3. Sur la VM > exécuter en tant que **root** `vmhgfs-fuse .host:/ /mnt/gfs -o allow_other -o uid=1000` 
4. Naviguer vers `/mnt/hgfs/<nom du partage>`

