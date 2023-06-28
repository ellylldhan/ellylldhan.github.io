# ENI TSSR 13 - Bash Init
Cours TSSR "*Scripting Shell*" @ ENI (2022)

<table>
	<tr>
		<th>Dates :</th>
		<td>du 21/11 au 25/11/2022</td>
	</tr>
	<tr>
		<th>Formateur :</th>
		<td>François LE NALIO</td>
	</tr>
</table>

id: 130

*130 - Scripting Linux*


**Partager un dossier dans VMWARE**

1. VMWARE > **Properties** de la VM > onglet **OPTIONS**
2. Activer "**Shared Folders**" > bouton "<kbd>Add</kbd>" > naviguer vers dossier à partager dans Windows > <kbd>OK</kbd>
3. Sur la VM > exécuter en tant que **root** `vmhgfs-fuse .host:/ /mnt/gfs -o allow_other -o uid=1000` 
4. Naviguer vers `/mnt/hgfs/<nom du partage>`


