title: notes TSSR 10

# ENI TSSR 10 - Services Réseaux Linux

<table class="formateur">
	<tbody>
		<tr>
			<th scope="row">Cours ENI </th>
			<td>du 08/08 au 12/08/2022</td>
		</tr>
		<tr>
			<th scope="row">Formateur</th>
			<td>François LE NALIO</td>
		</tr>
	</tbody>
</table>

[TOC]

## Sommaire

1. Contexte de mise en oeuvre
2. Configuration de l'adressage réseau 
3. Routage et traduction
4. Administration à distance 
5. Service DNS (partie 1)
6. Service DHCP
7. Service DNS (partie 2)
8. Annexes


## 5. Service DNS (partie 1)
### 5.1 Fonctionnement
DNS (Domain Name System) est un protocole standardisé par l'IETF (*Internet Engineering Task Force*).

#### Utilité

Son premier rôle est de donner des correspondances entre des noms d'hôtes pleinement qualifiés (FQDN Fully Qualified Domain Name) et la ou les adresses IP associées.

Le service DNS permet aussi :

- de donner le nom associé à une adresse ip connue (**résolution inverse**)
- d'indiquer quels hôtes fournissent un service donné (**résolution de services**)
- d'indiquer quels sont le ou les serveurs de messagerie d'un domaine cible.

#### Structure de nommage
La structure de nommage est arborescente.

[![Domaine](.ressources/img/nommage-dns.png)](.ressources/img/nommage-dns.png){:target="_blank"} 

<table>
	<thead>
		<tr><th colspan="2" class="horiz-align-middle">Structure</th></tr>
	</thead>
	<tbody>
		<tr>
			<th>. (1)</th>
			<td>Le point par lequel se termine tout nom de domaine.<br>Représente la <b>racine de l'espace de nom DNS</b></td>
		</tr>
		<tr>
			<th>com.</th>
			<td>Nom de domaine, sous-domaine du domaine racine</td>
		</tr>
		<tr>
			<th>. (2)</th>
			<td>Caractère de séparation entre domaines</td>
		</tr>
		<tr>
			<th>indiatimes.com</th>
			<td>Nom de domaine, sous-domaine du domaine "com."</td>
		</tr>
		<tr>
			<th>. (3)</th>
			<td>Caractère de séparation entre le nom du domaine et le nom d'un hôte de ce domaine</td>
		</tr>
		<tr>
			<th>www.indiatimes.com</th>
			<td>Nom d'hôte pleinement qualifié</td>
		</tr>
	</tbody>
</table>

#### Contexte et limite de résolution de nom de domaines
La résolution de nom de domaine est utilisée sur le réseau public Internet pour référencer des ressources de ce réseau. Un ensemble de domaines publics de 1er niveau sont administrés par l'IANA (*Internet Assigned Numbers Authority*) et des entités sont chargées de leur gestion.

Le protocole DNS peut aussi être utilisé pour la résolution de domaines sans suffixes publics, non résolvables par les serveurs DNS Internet mais pouvant être résolus en interne.

Lors du choix de création d'un nom de domaine pour y référencer des hôtes, on détermine si ce nom ne pourra être résolu qu'en interne (suffixe non public) ou si celui-ci doit pouvoir être résolu globalement (enregistrement d'un nom de domaine public auprès d'un bureau d'enregistrement *registrar*).

**Exemples**

- *ma-super-entreprise.bzh* : Nom de domaine utilisé pour référencer les services de mon entreprise accessibles depuis Internet.
- *enigmes.corp* : Nom de domaine propre à mon entreprise dans lequel son tréférencées les ressources hébergées et accessibles uniquement localement dans l'entreprise.

#### Besoins et types de serveurs DNS
Lors du déploiement d'un service DNS, celui-ci peut être configuré pour :
	
- Résoudre les requêtes clientes relatives à tout domaine / résolveur DNS complet
- Etre source d'information pour un ou plusieurs domaines ciblés / serveur faisant autorité

L'implémentation et la configuration du service est distincte en fonction de l'utilisation de celui-ci.

#### Le serveur DNS résolveur complet

[![DNS Résolveur](.ressources/img/dns-resolver-complet.png)](.ressources/img/dns-resolver-complet.png){:target="_blank"} 

- Le DNS résolveur est le service chargé de répondre aux requêtes des clients (1)
- Pour y répondre il fait appel à d'autres serveurs DNS (2)
- **Il n'est pas source d'information de domaine.**

Le serveur DNS faisant autorité est abordé au point 7.1 du cours.

### 5.2 Caractéristiques du serveur DNS résolveur

Un serveur DNS complet fait appel aux services d'autres serveur DNS pour résoudre les requêtes qui lui sont adressées.

Par défaut, il connaît les noms et adresses IP des **serveurs racines**. Il leur adresse des **requêtes itératives** (càd qui remontent la chaîne de serveurs DNS secondaires jusqu'à trouver celui qui saura resoudre la requête) afin de résoudre les noms qu'il doit résoudre. Ces requêtes itératives lui permettent de contacter ensuite successivement un ensemble de serveurs faisant autorité pour remonter au serveur de l'espace de noms donné.

Il  es tpossible de configurer des **serveurs redirecteurs** afin de limiter les échanges nécessaires à la résolution de noms. Lorsqu'un **redirecteur inconditionnel** est configuré, le serveur lui adresse des **requêtes récursives** afin de résoudre les noms demandés par ses clients.

La configuration d'un **redirecteur conditionnel** permet d'indiquer pour un espace de nom donné (la condition) le serveur à qui adresser la requête récursive de résolution.

Le serveur conserve en mémoire **cache** les réponses aux requêtes de résolution qu'il a transmises à ses clients. La **durée de conservation en cache** (**TTL** Time To Live) est définie par les serveurs faisant autorité, elle est subie par les serveurs DNS résolveur.

### 5.3 Configuration d'un DNS Resolveur

<table>
	<tr><th>Nom du paquet</th><td>bind9</td></tr>
	<tr><th>Fichier de configuration</th><td>/etc/bind/named.conf</td></tr>
	<tr><th>Nom du service</th><td>bind9</td></tr>
	<tr><th class="vert-align-top">Commandes</th><td>named-checkconf<br>named-checkzone<br>rndc</td></tr>
	<tr><th>Fichier journal</th><td>/var/log/syslog</td></tr>
</table>

#### 5.3.1 Configuration initiale de bind9 sous Debian

La configuration illustrée ci-après résulte d'une installation de Bind9 sous Debian 10 depuis les dépôts officiels.
Le fichier de configuration principal renvoie vers 3 fichiers dans lesquels dsont répartis les différentes directives de configuration du service.


```sh 
# dans /etc/bind/named.conf 
# [...]

# Configuration des options
# Le fichier contient :
# 		options { directory "/vcb"/; } [...]
include /etc/bind/named.conf.options;

# Configuration des zones hébergées localement
# Le fichier contient :
# 		zone "demo.eni" { [...] }
include /etc/bind/named.conf.local;

# Configuration des zones par défaut
# Le fichier contient :
# 		zone "localhost" { [...] }
include /etc/bind/named.conf.default-zones;

# [...]
```

#### 5.3.2 Fichiers de configuration d'un service DNS Résolveur

Fichier **/etc/bind/named.conf**

```c  
// rsxclts = réseaux des postes clients de l'entreprise
// acl (or access control statement) defines groups of hosts which can then be permitted or denied access to the nameserver. 
acl rsxclts { 127.0.0.0/8; 192.168.53.0/24; 192.168.1.0/24; };

include /etc/bind/named.conf.options;
include /etc/bind/named.conf.local;
include /etc/bind/named.conf.default-zones;
```

Fichier **/etc/bind/named.conf.options**

```c 
options {
	// Répertoire de travail de Bind9 
	directory "/var/cache/bind";

	// Redirection exclusive (pas d'appel aux racines en cas d'indisponibilité)
	// vers les serveurs Quad9 
	forward only;
	forwarders { 9.9.9.9; };

	// Restriction des hôtes auxquels répond le serveur 
	allow-query { rsxclts; };
	// Restriction des hôtes autorisés à adresser des requêtes récursives au serveur 
	allow-recursion { rsxclts; };

	// Communication DNSSEC désactivée
	dnssec-enable no;
	dnssec-validation no;

	// Information de version non communiquée
	version none;
};
```

Fichier **/etc/bind/named.conf.default-zones** (préconfiguré)

```c 
// RFC 1912
zone "localhost" {
	type master;
	file "/etc/bind/db.local";
};
zone "127.in-addr.arpa" {
	type master;
	file "/etc/bind/db.127";
};
zone "0.in-addr.arpa" {
	type master;
	file "/etc/bind/db.0";
};
zone "255.in-addr.arpa" {
	type master;
	file "/etc/bind/db.255";
};
```

Les fichiers de zones ciblés dans l'exemple de configuration sont présents par défaut suite à l'installation de bind9.

#### 5.3.3 Configuration de Redirecteur Conditionnel
Pour configurer un redirecteur conditionnel, une zone typée *forward* doit être ajoutée à la configuration de Bind9 dan sle fichier **/etc/bind/named.conf.local**, comme dans l'exemple suivant :

```cs 
zone macharmantevoisine.eni {
	type forward;
	forward only;
	forwarders { 10.0.0.53; };
};
```

#### 5.3.4 Ressources Complémentaires
La documentation de référence de Bind9 fournit la liste ehaustive de ses directives et options de configuration de Bind9. 

**https://ftp.isc.org/isc/bind9/cur/9.11/doc/arm/Bv9ARM.ch06.html**

**Next : Atelier 5. Configurer un service DNS résolveur**




<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">