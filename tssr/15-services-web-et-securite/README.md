# ENI TSSR 15 - Services Web et Sécurité
Cours TSSR @ ENI (2023)

<table>
	<tr>
		<th>Date :</th>
		<td>du 16/01 au 20/01/2023</td>
	</tr>
	<tr>
		<th>Formateur :</th>
		<td>Matthieu CLAVEAU</td>
	</tr>
</table>

id: 160

*160 - Serveurs Web, Certificats et PKI Microsoft, VPN*


**Partager un dossier dans VMWARE**

1. VMWARE > **Properties** de la VM > onglet **OPTIONS**
2. Activer "**Shared Folders**" > bouton "<kbd>Add</kbd>" > naviguer vers dossier à partager dans Windows > <kbd>OK</kbd>
3. Sur la VM > exécuter en tant que **root** `vmhgfs-fuse .host:/ /mnt/gfs -o allow_other -o uid=1000` 
4. Naviguer vers `/mnt/hgfs/<nom du partage>`


