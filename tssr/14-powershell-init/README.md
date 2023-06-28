# ENI TSSR 14 - Powershell
Cours TSSR @ ENI (2022)

<table>
	<tr>
		<th>Date :</th>
		<td>du 28/11 au 02/12/2022</td>
	</tr>
	<tr>
		<th>Formateur :</th>
		<td>Thélo GUYADER</td>
	</tr>
</table>

id: 140

*140 - Initiation scripting Powershell*


**Partager un dossier dans VMWARE**

1. VMWARE > **Properties** de la VM > onglet **OPTIONS**
2. Activer "**Shared Folders**" > bouton "<kbd>Add</kbd>" > naviguer vers dossier à partager dans Windows > <kbd>OK</kbd>
3. Sur la VM > exécuter en tant que **root** `vmhgfs-fuse .host:/ /mnt/gfs -o allow_other -o uid=1000` 
4. Naviguer vers `/mnt/hgfs/<nom du partage>`


