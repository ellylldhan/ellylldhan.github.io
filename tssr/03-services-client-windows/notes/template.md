title: tp04 - Powershell 101

# ENI TSSR 03 - Services Client Windows

[TOC]

## TP 03 - Mise en place d'un domaine Active Directory

### Objectifs

Mettre en place un contexte de domaine Active Directory et y intégrer des membres.


### Prérequis

Copier les fichiers iso Windows Server 2019 et Windows 10 localement.

### Résumé des paramètres

<table>
	<thead>
		<tr>
			<th style="background-color:grey;color:white;font-weight: bold">Nom VM :</th>
			<th>Modele_SRV</th>
			<th>CD01</th>
			<th>SRV01</th>
			<th>W10</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>Type</th>
			<td> Template </td>
			<td> Ctlr de domaine </td>
			<td> Serveur </td>
			<td> Poste client </td>
		</tr>
		<tr>
			<th>Utilisateur</th>
			<td> Administrateur </td>
			<td> Admin </td>
			<td> Admin </td>
			<td> Admin </td>
		</tr>
		<tr>
			<th>mdp</th>
			<td> !Admin123 </td>
			<td> !Admin123 </td>
			<td> !Admin123 </td>
			<td> !Admin123 </td>
		</tr>
		<tr>
			<th>ip</th>
			<td> 172.23.17.1 </td>
			<td> 172.23.17.1 </td>
			<td> 172.23.17.2 </td>
			<td> 172.23.17.11</td>
		</tr>
		<tr>
			<th>OS</th>
			<td> Win Srv 2019 Std </td>
			<td> clone Modele_SRV </td>
			<td> clone Modele_SRV </td>
			<td> Win 10 Pro </td>
		</tr>
		<tr>
			<th>CPU</th>
			<td> 1x1 </td>
			<td> 1x1 </td>
			<td> 1x1 </td>
			<td> 2x1 </td>
		</tr>
		<tr>
			<th>RAM</th>
			<td> 4 Go </td>
			<td> 4 Go </td>
			<td> 4 Go </td>
			<td> 2 Go </td>
		</tr>
		<tr>
			<th>NIC</th>
			<td> Host-Only </td>
			<td> Host-Only </td>
			<td> Host-Only </td>
			<td> Host-Only </td>
		</tr>
		<tr>
			<th>HDD</th>
			<td> 1x 32 Go </td>
			<td> 1x 32 Go </td>
			<td> 1x 32 Go </td>
			<td> 1x 32 Go </td>
		</tr>
</tbody>
</table>

<span class="attention">ATTENTION <u>NE PAS REDEMARRER</u> UN MODÈLE UNE FOIS CLONÉ ! </span>

### TABLEAU 2

<table>
  <thead>
    <tr>
      <th>Service</th>
      <th>Utilisateur</th>
      <th>Fonction</th>
      <th>login</th>
      <th>mdp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td scope="row" rowspan="4" class="vert-align-mid td-commercial">Commercial</td>    
        <td>Camille</td>
        <td>Secrétaire</td>
        <td>camille / camille@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Inès</td>  
        <td>Intérimaire</td>  
        <td>ines / ines@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Claude</td>  
        <td></td>  
        <td>claude / claude@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Corentin</td>  
        <td></td>  
        <td>corentin / corentin@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td scope="row" rowspan="4" class="vert-align-mid td-informatique">Informatique</td>    
        <td>Sophie</td>
        <td>Secrétaire</td>
        <td>sophie / sophie@renaud.lcl</td>
        <td>!User123</td>
    </tr>
        <tr>
        <td>Reno</td>  
        <td></td>  
        <td>Reno / Reno@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Samir</td>  
        <td></td>  
        <td>samir / samir@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Stéphane</td>  
        <td></td>  
        <td>stephane / stephane@renaud.lcl</td>
        <td>!User123</td>
    </tr>
       <tr>
        <td scope="row" rowspan="4" class="vert-align-mid td-production">Production</td>    
        <td>Isabelle</td>
        <td>Intérimaire</td>
        <td>Isabelle / Isabelle@renaud.lcl</td>
        <td>!User123</td>
    </tr>
        <tr>
        <td>Pascal</td>  
        <td></td>  
        <td>Pascal / Pascal@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Paul</td>  
        <td></td>  
        <td>Paul / Paul@renaud.lcl</td>
        <td>!User123</td>
    </tr>
    <tr>
        <td>Philippe</td>  
        <td></td>  
        <td>Philippe / Philippe@renaud.lcl</td>
        <td>!User123</td>
    </tr>
  </tbody>
</table>

### IMAGES

<div class="img-row">
  	<div class="img-col">
		<a href=".ressources/img/tp03-04.png" target="_blank">
			<img src=".ressources/img/tp03-04.png" alt=".ressources/img/tp03-04.png" style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href=".ressources/img/tp03-05.png" target="_blank">
  			<img src=".ressources/img/tp03-05.png" alt=".ressources/img/tp03-05.png" style="width:100%">
  		</a>
	</div>
</div>
<div class="img-row">
  	<div class="img-col">
  		<a href=".ressources/img/tp03-06.png" target="_blank">
			<img src=".ressources/img/tp03-06.png" alt=".ressources/img/tp03-06.png"  style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href=".ressources/img/tp03-07.png" target="_blank">
	  		<img src=".ressources/img/tp03-07.png" alt=".ressources/img/tp03-07.png" style="width:100%">
	  	</a>
	</div>
</div>

<div class="img-row">
  	<div class="img-col">
  		<a href=".ressources/img/tp03-08.png" target="_blank">
			<img src=".ressources/img/tp03-08.png" alt=".ressources/img/tp03-08.png"  style="width:100%">
		</a>
	</div>
  	<div class="img-col">
  		<a href=".ressources/img/tp03-09.png" target="_blank">
	  		<img src=".ressources/img/tp03-09.png" alt=".ressources/img/tp03-09.png" style="width:100%">
	  	</a>
	</div>
</div>	

[![Domaine](.ressources/img/tp03-10.png)](.ressources/img/tp03-10.png){:target="_blank"} 


<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
