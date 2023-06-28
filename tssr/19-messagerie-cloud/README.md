# ENI TSSR 19 - Messagerie Cloud
Cours TSSR *"Cloud et Microsoft 365"* @ ENI (2023)

<table>
<tr><th>Dates     :</th><td>du 24/04 au 28/04/2023</td></tr>
<tr><th>Formateur :</th><td>Jordan RONDAULT</td></tr>
</table>

id: 180

*180 - Cloud et Microsoft 365*



**Partager un dossier dans VMWARE**

1. VMWARE > **Properties** de la VM > onglet **OPTIONS**
2. Activer "**Shared Folders**" > bouton "<kbd>Add</kbd>" > naviguer vers dossier à partager dans Windows > <kbd>OK</kbd>
3. Sur la VM > exécuter en tant que **root** `vmhgfs-fuse .host:/ /mnt/gfs -o allow_other -o uid=1000` 
4. Naviguer vers `/mnt/hgfs/<nom du partage>`

