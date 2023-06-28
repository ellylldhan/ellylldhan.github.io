title: notes-certificats

# ENI TSSR 15 - Services Web et Sécurité
Cours *"Serveurs Web, Certificats et PKI Microsoft, VPN"* @ ENI (2023)

<table>
<tr><th>Dates     :</th><td>du 16/01 au 20/01/2023</td></tr>
<tr><th>Formateur :</th><td>Matthieu CLAVEAU</td></tr>
</table>

id: 160

[TOC]


1. Les Objectifs
2. Les Serveurs Web
	3. Installation Apache
	4. Installation d'IIS 
	5. Création de sites sous Apache
	6. Création de sites sous IIS 
	7. Distinction entre les sites (p58)
8. Module 2 Les Certificats Numériques (p66) 
	9. Les certificats auto-signés (p72)
	10. Les certificats auto-signés Apache (p74)
	11. Configuration du site Apache (p90)
	12. Les certificats auto-signés IIS (p95)
	13. Configuration du site IIS (p100)
	14. Installation PKI (p107)
	15. Modèle de certificat IIS (p119)
	16. Installation certificat IIS (p125)
	17. Vérification sur les navigateurs (p133)
18. VPN (p142)
	19. VPN Nomade (p144)
	20. VPN Site à Site (p151)
	21. OpenVPN (p155)
		22. Ajout d'un autorité de certification dans PfSense (p157)
		23. Authentification LDAP dans PfSense (p165)
		24. Paramétrage OpenVPN Server (p173)
		25. OpenVPN Client (p182)



0. les Objectifs (p2)
	- module 1 : serveur web (Apache/IIS)
	- module 2 : gestion des certificats (PKI)
	- module 3 : gérer les accès des utilisateurs nomades 
	
1. M01 Les Serveurs Web  (p4)
	- Installer un serveur web 
	- Publier des sites web 
	- authentifier l'accès aux sites web 

	1.1 Installation Apache 
	1.2 Installation IIS
	1.3 Création de sites sous Apache 
	1.4 Création de sites sous IIS 
	1.5 Distinction entre les sites

2. M02 Les certificats numériques (p34)
	2.1 Les certificats auto-signés 
	2.2 Les certificats auto-signés Apache
		2.2.1 Configuration du site Apache
	2.3 Les certificats auto-signés IIS 
		2.2.1 Configuration du site IIS 
	2.4 Installation PKI	
	2.5 Modèle de certificat IIS 
	2.6 Installation de certificat IIS 
	2.7 Verification sur les navigateurs 


## Module 2 - Les certificats numériques

### 2.1 Fonctionnement
#### Qu'est-ce qu'un certificat ?
Un certificat permet d'authentifier une connexion et de garantir que le serveur contacté est bien celui qu'il prétend être.

Il contient les informations :

- un no. de série 
- l'autorité de certification émettrice 
- la période de validité 
- le nom du titulaire de la clé publique 
- l'algorithme de chiffrement (la clé publique)
- l'algorithme de signature (signature numérique)

**Dans le cas d'une connexion HTTPS, l'utilisation d'un certificats SSL est obligatoire**. 

Dans le navigateur web, la présence du cadenas à côté de l'URL permet de confirmer l'identité du serveur Web qui répond à la requête. Cela signifie que le site internet affiché est bien celui qui était ciblé.

#### Comment l'identité du serveur web est-elle validée ?
Utilisation d'une chaîne de certification :

- **Un client** (navigateur) demande l'accès à des ressources de façon sécurisée.
- **Un serveur** (site) héberge des ressources sécurisées. Possède et utilise un certificat pour garantir la communication.
- **Une autorisation de certification** qui a émis et garantie le certificat stocké par le serveur. Déchiffre et valide le certificat reçu par le client.

#### Comment obtenir un certificat ?
Il y a 3 possibilités pour obtenir un certificat, chacune avec des avantages et des inconvénients :

- Générer et utiliser un certificat auto-signé
- Utiliser un certificat provenant d'une autorité de certification interne 
- Obtenir/acheter un certificat auprès d'une autorité de certification publique


### Les certificats auto-signés
- Protocole SSL (Secure Socket Layer) par Netscape 
	+ 1994 : SSL 1.0
	+ 1995 : SSL 2.0
	+ 1996 : SSL 3.0
- Passé sous la responsabilité de l'IETF (Internet Engineering Task Force)
	+ Renommé TLS (Transport Layer Secure)
	+ 1999 : TLS 1.0 proche de SSL 3.0
	+ 2006 : TLS 1.1
	+ 2008 : TLS 1.2
	+ 2018 : TLS 1.3
- TLS est chargé de 3 fonctions 
	+ L'**authentification**: vérification de l'identité du serveur (certificat numérique) 
	+ La **confidentialité**: chiffrement des données sur la média 
	+ L'**intégrité**: garantie de la validité des données (algorithme de hashage)

### 2.2 Les certificats auto-signés Apache
#### 2.2.1 Etapes de création des certificats
- Création de l'arborescence de stockage des certificats 
- Création d'une clé privée 
- Création d'un fichier de demande de "signature de certificat"
- Création d'un certificat auto-signé
- Modification du fichier configuration du site 

#### 2.2.2 Arborescence de stockage

En gras les répertoires à créer :

<pre># tree -d /etc/ssl 
/etc/ssl
├── certs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Les autorités de certifications connus
│   └── java
├── <b>certs-auto</b>&nbsp;&nbsp;&nbsp;&nbsp;# Les certificats auto-signés 
├── private&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Les clés privées 
└── <b>reqs</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Les demandes de signatures de certificats
</pre>

#### 2.2.3 Etape 1 : Création de la clé privée
Commande de la création de la clé privée;

<pre># <b>openssl genrsa -des3 -out /etc/ssl/private/www.tssr.lcl.key 2048</b>
<span style="color:grey;font-style:italic;">Generating RSA private key, 2048 bit long modulus
.......................................................................................+++
.............+++
e is 65537 (0x10001)
Enter pass phrase for /etc/ssl/private/private.key:
Verifying - Enter pass phrase for /etc/ssl/private/private.key:</span></pre>

- **genrsa** : génération d'une clé privée avec l'algorithme RSA (Ronald **R**ivest, Adi **S**hamir et Leonard **A**delman)
- **-des3** : oblige l'utilisation d'une phrase de passe pour protéger l'utilisation de la clé. Cette phrase de passe sera demandée à chaque démarrage du serveur Apache (facultatif).
- **-out chemin/fichier_clé_privée** : chemin et nom du fichier contenant la clé privée. 
- **2048** : longueur de la clé en bits (2048 par défaut). Option à positionner en dernier.


##### 2.2.3.1 Création d'un fichier de demande de signature de certificat
- Pour faire une demande de certificat auprès d'une autorité de certification
- Pour créer un certificat auto-signé 


##### 2.2.3.2 Gestion des informations du certificat
- Des informations du certificat sont à renseigner à la création.
- Ces informations prennent en compte le nom du site.


Fichier **/etc/ssl/openssl.cnf** (en gras, les valeurs modifiées)

<pre>[ req_distinguished_name ]
countryName                    = Country Name (2 letter code)
<b>countryName_default</b> = <b>FR</b>
countryName_min                = 2
countryName_max                = 2
stateOrProvinceName            = State or Province Name (full name)
<b>stateOrProvinceName_default</b> = <b>Loire_Atlantique</b>
localityName                   = Locality Name (eg, city)
<b>localityName_default</b> = <b>Saint_Herblain</b>
0.organizationName             = Organization Name (eg, company)
0.organizationName_default     = Eni-Ecole
organizationalUnitName         = Organizational Unit Name (eg, section)
<b>organizationalUnitName_default</b> = <b>SRV-APACHE</b>
commonName                     = Common Name (e.g. server FQDN or YOUR name)
<b>commonName_default</b> = <b>www.tssr.lcl</b>
commonName_max                 = 64
emailAddress                   = Email Address
<b>emailAddress_default</b> = <b>admin@tssr.lcl</b>
emailAddress_max               = 64</pre>


#### 2.2.4 Etape 2 : Création de la demande signature de certificat
Commande de création de la demande de signature de certificat

<pre># <b>openssl req -new -key /etc/ssl/private/www.tssr.lcl.key -out /etc/ssl/reqs/www.tssr.lcl.request.csr</b>
<span style="color:grey;font-style:italic;">Enter pass phrase for /etc/ssl/private/apache.key:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [FR]:
State or Province Name (full name) [Loire_Atlantique]:
Locality Name (eg, city) [Saint_Herblain]:
Organization Name (eg, company) [Eni-Ecole]:
Organizational Unit Name (eg, section) [Srv-Apache]:
Common Name (e.g. server FQDN or YOUR name) [www.tssr.lcl]:
Email Address [admin@tssr.lcl]:
Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:</span>
</pre>

- **req** : gestion des requête de certification 
- **-new** : nouvelle demande 
- **-key chemin/fichier_clé_privée** : clé privée à utiliser 
- **-out chemin/fichier_demande_certificat** : fichier contenant la demande de certificat 

Voir `man req` 

**Remarque** : l'information `Common Name` doit correspondre à l'URL du site web. Pour un autre usage, il faudra fournir un nom d'hôte d'ordinateur ou un nom d'utilisateur.

Exemple de contenu du fichier de la demande de signature de certificat

```
# cat /etc/ssl/reqs/www.tssr.lcl.request.csr
-----BEGIN CERTIFICATE REQUEST-----
MIIC7jCCAdYCAQAwgagxCzAJBgNVBAYTAkZSMRkwFwYDVQQIDBBMb2lyZV9BdGxh
bnRpcXVlMRcwFQYDVQQHDA5TYWludF9IZXJibGFpbjESMBAGA1UECgwJRW5pLUVj
b2xlMRMwEQYDVQQLDApTcnYtQXBhY2hlMRkwFwYDVQQDDBB3d3cuZW5pLWVjb2xl
LmZyMSEwHwYJKoZIhvcNAQkBFhJhZG1pbkBlbmktZWNvbGUuZnIwggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+d4NMzICBeQj+kzd1euI5xeb1Av4mkQbZ
NScXRnlLsufX5j1nIJ2wLLpk3W5l6wKc/VWFUMFODLDYzEfKBVOMmuhZ33s/ZiQe
NvEiObCfXw11k+sA1FmUvWADIuwnpZYOVGNYl5Q/haCCntiYlokdHqsulj1/X6Xc
bbeyKa6BkjawMOUzHm8WIf5xNO0850W3aAae+XkT+TcXvVCd3NaPe2CNxDMUs7pT
v8xBjPzNlCWjBrbCDQJ5zdg3qp7KmSa0CAJPJloSmdnFfC2MMvJgyGcsbSpARibm
pp5A0ig1rvBqj3utOaW9fBKSqh1EO92L/ZGyOfRu5mwh+wOp3OfbAgMBAAGgADAN
BgkqhkiG9w0BAQsFAAOCAQEAuhZWosiQjM5yjR/WUOi9iiE7Rd6j8L54He01fRrR
mVKnFpPpQGje0H4rQ1bhAuUzXbr+fRrCTNww8wVWjWBwUOVv5ZcXKb4mb+/fZYQd
DdKEPMW6e45oDzsLae/XaeNAgqcXK2E7ykOdJhR6cImdvVqvurhbGvLGPHUo4oM9
YLA4ubvP25ieE0dgfCBoNr6AavomxVoSPn2JCUg0+RMFMBObhD91vq7qijzDoVpd
w93ijk3WcAjasKb5igweLIMdGC9Cti4pTPpnZ9EH0WF/DZ4+Dr+3geH2lqS78BAQ
KNlBmWf325XgGy+jPopI5beQNkdEx3bM1174ZhyLv1ZQDA==
-----END CERTIFICATE REQUEST-----
```

#### 2.2.5 Etape 3 : Création du certificat auto-signé
##### 2.2.5.1 Création du certificat autosigné
La phrase de passe de la clé privée sera demandée si nécessaire.

<pre># <b>openssl x509 -req -days 90 -in /etc/ssl/reqs/www.tssr.lcl.request.csr 
-signkey /etc/ssl/private/www.tssr.lcl.key -out /etc/ssl/certs-auto/www.tssr.lcl.cert</b>
<span style="color:grey;font-style:italic;">Signature ok
subject=/C=FR/ST=Loire_Atlantique/L=Saint_Herblain/O=Eni-Ecole/OU=Srv-Apache/CN=www.tssr.lcl/
emailAddress=admin@tssr.lcl
Getting Private key
Enter pass phrase for /etc/ssl/private/www.tssr.lcl.key:</span>
</pre>

- **x509** : gestion des certificats (auto-signés ou auprès d'une autorité de certification).
- **-req** : demande de chiffrement de certificats.
- **-days XXX** : durée de validité du certificat en jours (par défaut: 365).
- **-in chemin/fichier_demande_certificat** : fichier contenant la demande de signature de certificat.
- **-signkey chemin/fichier_clé_privée** : chemin et nom du fichier contenant la clé privée.
- **-out chemin/fichier_certificat** : chemin et nom du fichier contenant le certificat.

Pour en savoir plus : `man x509`

##### 2.2.5.2 Suppression de la phrase de passe

Avant de modifier le fichier, faire une copie.

***Entête du fichier de la clé privée crypté :***
<pre># <b>cat /etc/ssl/private/www.tssr.lcl.key</b>
<span style="color:grey;font-style:italic;">-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,D53022AF0D4525AC
[...]</span>
</pre>

***Commande pour enlever du fichier de la clé privée crypté***
<pre># <b>openssl rsa -in /etc/ssl/private/www.tssr.lcl.key -out /etc/ssl/private/www.tssr.lcl-des3.key</b>
<span style="color:grey;font-style:italic;">Enter pass phrase for /etc/ssl/private/www.tssr.lcl.key:
writing RSA key</span></pre>

***Entête du fichier de la clé privée sans cryptage***
<pre># <b>cat /etc/ssl/private/www.tssr.lcl-des3.key</b>
<span style="color:grey;font-style:italic;">-----BEGIN RSA PRIVATE KEY-----
[...]</span></pre>

##### 2.2.5.3 Création d'une clé privée et d'un certificat sans la demande de signature
***Commande de création d'une clé privée et d'un certificat***
<pre># <b>openssl req -new -nodes -x509 -keyout /etc/ssl/private/www.tssr.lcl-des3.key 
-out /etc/ssl/certs-auto/www.tssr.lcl.cert -days 365 -newkey rsa:4096</b>
<span style="color:grey;font-style:italic;">Generating a 4096 bit RSA private key
.....................................................+++
writing new private key to '/etc/ssl/private/www.tssr.lcl-des3.key'
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
Country Name (2 letter code) [FR]:
State or Province Name (full name) [Loire_Atlantique]:
Locality Name (eg, city) [Saint_Herblain]:
Organization Name (eg, company) [Eni-Ecole]:
Organizational Unit Name (eg, section) [Srv-Apache]:
Common Name (e.g. server FQDN or YOUR name) [www.tssr.lcl]:
Email Address [admin@tssr.lcl]:</span></pre>

- **req** : demande de chiffrement de certificats 
- **-new** : nouvelle demande de certificat
- **-nodes** : pas de cryptage de la clé privée 
- **-x509** : gestion des certificats (auto-signés ou auprès d'une autorité de certification)
- **-keyout chemin/fichier_clé_privée** : chemin et nom du fichier contenant la clé privée
- **-out chemin/fichier_certificat** : chemin et nom du fichier contenant le certificat 
- **-days XXX** : durée de validité du certificat en jours (par défaut: 365)
- **-newkey rsa:xxxx** : longueur de la clé en bits

##### 2.2.5.4 Affichage du contenu d'un certificat

***Affichage de toutes les informations***
<pre># <b>openssl x509 -text -in /etc/ssl/certs-auto/www.tssr.lcl.cert</b></pre>

***Affichage de l'émetteur du certificat***
<pre># <b>openssl x509 -noout -in /etc/ssl/certs-auto/www.tssr.lcl.cert -issuer</b>
<span style="color:grey;font-style:italic;">issuer= /C=FR/ST=Loire_Atlantique/L=Saint_Herblain/O=Eni-Ecole/OU=Srv-Apache/
CN=www.tssr.lcl/emailAddress=admin@tssr.lcl</span></pre>

***Affichage du destinataire du certificat***
<pre># <b>openssl x509 -noout -in /etc/ssl/certs-auto/www.tssr.lcl.cert -subject</b>
<span style="color:grey;font-style:italic;">subject= /C=FR/ST=Loire_Atlantique/L=Saint_Herblain/O=Eni-Ecole/OU=Srv-Apache/
CN=www.tssr.lcl/emailAddress=admin@tssr.lcl</span></pre>

***Affichage de sa période de validité***
<pre># <b>openssl x509 -noout -in /etc/ssl/certs-auto/www.tssr.lcl.cert -dates</b>
<span style="color:grey;font-style:italic;">notBefore=May 13 08:27:18 2016 GMT
notAfter=Aug 11 08:27:18 2016 GMT</span></pre>

***Affichage de sa valeur de hachage***
<pre># <b>openssl x509 -noout -in /etc/ssl/certs-auto/www.tssr.lcl.cert -hash</b>
<span style="color:grey;font-style:italic;">f98894ab</span></pre>

***Affichage de son empreinte MD5***
<pre># <b>openssl x509 -noout -in /etc/ssl/certs-auto/www.tssr.lcl.cert -fingerprint</b>
<span style="color:grey;font-style:italic;">SHA1 Fingerprint=19:C5:E9:7F:74:A1:0B:40:C5:86:AC:77:0F:AC:99:6F:24:F2:7A:51</span></pre>

### 2.3 Configuration du site Apache
#### 2.3.1 Activation du module SSL
Par défaut, le serveur Apache n'écoute pas sur le port 443 car le module le permettant n'est pas actif.

***Activation du module SSL***
<pre># <b>a2enmod ssl</b>
<span style="color:grey;font-style:italic;">Considering dependency setenvif for ssl:
Module setenvif already enabled
Considering dependency mime for ssl:
Module mime already enabled
Considering dependency socache_shmcb for ssl:
Enabling module socache_shmcb.
Enabling module ssl.
See /usr/share/doc/apache2/README.Debian.gz on how to configure SSL and create self-signed certificates.
To activate the new configuration, you need to run:
service apache2 restart</span></pre>

***Activation du site par défaut SSL (pour test)***
<pre># <b>a2ensite default-ssl</b></pre>


#### 2.3.2 Modification du fichier de configuration du site web

Changer le port d'écoute de l'hôte virtuel `<VirtualHost *:443>`.

#### 2.3.3 Ajout des directives prenant en charge la clé privée et le certificat
- **SSLEngine on**: Directive activant la prise en charge du moteur SSL 
- **SSLCertificateKeyFile /chemin/fichier_clé_privée** : directive définissant la clé privée du serveur à utiliser 
- **SSLCertificateFile /chemin/fichier_certificat** : directive définissant le certificat du serveur à utiliser

#### 2.3.4 Précisez les protocoles pris en charge
- **SSLProtocol [all] [+|-] protocol** : directive indiquant les versions des protocoles SSL/TLS acceptées
- Par défaut : **SSLProtocol all -SSLv3**

Protocoles pris en charge : **SSLv3**, **TLSv1**, **TLSv1.1**, **TLSv1.2**, **TLSv1.3**

#### 2.3.5 Fichier de configuration avec chiffrement

***Fichier de configuration du site "www.tssr.lcl"***

```
<VirtualHost *:443>
	DocumentRoot /var/www/www.tssr.lcl 
	ServerName www.tssr.lcl 
	[...]
	SSLEngine on 
	SSLCertificateKeyFile /etc/ssl/private/www.tssr.lcl.key 
	SSLCertificateFile /etc/ssl/certs-auto/www.tssr.lcl.cert 
	SSLProtocol all -SSLv3
	[...]
</VirtualHost>
```

### 2.4 Les certificats auto-signés IIS

#### 2.4.1 Création d'un certificat auto-signé sous IIS
1. Création à partir de la configuration globale 

2. Certificats de serveur 
[![06](.ressources/img/notes-06.png)](.ressources/img/notes-06.png){:target="_blank"}

3. Créer un certificat auto-signé
[![07](.ressources/img/notes-07.png)](.ressources/img/notes-07.png){:target="_blank"}

4. Indiquer le nom du site (www.tssr.lcl)

5. Magasin de certificats (hébergement web) 
[![08](.ressources/img/notes-08.png)](.ressources/img/notes-08.png){:target="_blank"}

6. Le certificat est créé 
[![09](.ressources/img/notes-09.png)](.ressources/img/notes-09.png){:target="_blank"}


#### 2.4.2 Configuration du site IIS
##### 2.4.2.1 Paramétrage du site IIS en HTTPS
- Paramétrage du site > cliquer sur "**Liaison**"

- Type : **HTTPS**
- Port : **443**
- Nom de l'hôte : **glpi.tssr.lcl** 
- Certificat SSL : **choisir le certificat dans le menu déroulant**

[![10](.ressources/img/notes-10.png)](.ressources/img/notes-10.png){:target="_blank"}

[![11](.ressources/img/notes-11.png)](.ressources/img/notes-11.png){:target="_blank"}

Le site est accessible en http et https 

[![12](.ressources/img/notes-12.png)](.ressources/img/notes-12.png){:target="_blank"}


##### 2.4.2.2 Accès du site web

- Le serveur est certifié 
- Le client ne l'est pas

[![13](.ressources/img/notes-13.png)](.ressources/img/notes-13.png){:target="_blank"}


#### 2.4.3 Installer le certificat
- Erreur de certificat 
- Afficher les certificats 
- Installer un certificat 

<div class="img-row">
  	<div class="img-col">
		<a href=".ressources/img/notes-14.png" target="_blank">
			<img src=".ressources/img/notes-14.png" alt=".ressources/img/notes-14.png">
		</a>
	</div>
  	<div class="img-col">
  		<a href=".ressources/img/notes-15.png" target="_blank">
  			<img src=".ressources/img/notes-15.png" alt=".ressources/img/notes-15.png">
  		</a>
	</div>
</div>

**Installer un certificat**

- Assistant d'importation du certificat 
- Utilisateur actuel 
- Magasin de certification racine de confiance 

<div class="img-row">
  	<div class="img-col">
		<a href=".ressources/img/notes-16.png" target="_blank">
			<img src=".ressources/img/notes-16.png" alt=".ressources/img/notes-16.png">
		</a>
	</div>
  	<div class="img-col">
  		<a href=".ressources/img/notes-17.png" target="_blank">
  			<img src=".ressources/img/notes-17.png" alt=".ressources/img/notes-17.png">
  		</a>
	</div>
	<div class="img-col">
  		<a href=".ressources/img/notes-18.png" target="_blank">
  			<img src=".ressources/img/notes-18.png" alt=".ressources/img/notes-18.png">
  		</a>
	</div>
</div>


### 2.5 Installation PKI
#### 2.5.1 Certificat par autorité de certification publique
Les OS et certains navigateurs comme Firefox embarquent un certain nombre de certificats racines de confiance.

Ils proviennent d'autorités de certification **publiques**.

Tout certificat généré par une de ces autorités (ou par des serveurs secondaires) sera automatiquement approuvé puisque nous avons confiance dans l'autorité parente. 

Ces certificats sont souvent payants. Un service gratuit : **Let's Encrypt**. 

Ils permettent de publier des services sur internet avec implémentation du SSL 

Microsoft met à disposition sur ses OS serveurs le **rôle AD CS** aussi appelé **PKI** (**Private Key Infrastructure**)
Ce rôle permet de générer des certificats qu'on pourra utiliser pour tous les services internes (Web, Exchange...)

Les machines clients pourront faire confiance aux certificats générés sans action particulière, car le certificat racine sera automatiquement déployé sur toutes les machines de l'AD. Une fois la PKI en place, on pourra ajouter des services facilement.

Il sera cependant toujours très compliqué de publier les services sur Internet.

#### 2.5.2 Installer une PKI Microsoft
##### 2.5.2.1 Installer le rôle

1. **Service de certificats Active Directory** > Ajouter les fonctionnalités 
[![19](.ressources/img/notes-19.png)](.ressources/img/notes-19.png){:target="_blank"}

2. Choisir les services du rôle à installer > Autorité de certification > Effectuer l'installation 
[![20](.ressources/img/notes-20.png)](.ressources/img/notes-20.png){:target="_blank"}

##### 2.5.2.2 Configuration post-déploiement
1. Configurer les services de certificats 
2. Vérifier le compte de l'administrateur 
3. Sélectionner les rôles à configurer

[![21](.ressources/img/notes-21.png)](.ressources/img/notes-21.png){:target="_blank"}

<div class="img-row">
  	<div class="img-col">
  		<a href=".ressources/img/notes-22.png" target="_blank">
  			<img src=".ressources/img/notes-22.png" alt=".ressources/img/notes-22.png">
  		</a>
	</div>
	<div class="img-col">
  		<a href=".ressources/img/notes-23.png" target="_blank">
  			<img src=".ressources/img/notes-23.png" alt=".ressources/img/notes-23.png">
  		</a>
	</div>
</div>

##### 2.5.2.3 Configuration du rôle
1. Spécifier le type d'installation
	+ Autorité de certification d'entreprise (avec ADDS) 
	+ Autorité de certification autonome (sans ADDS)
[![24](.ressources/img/notes-24.png)](.ressources/img/notes-24.png){:target="_blank"}

2. Spécifier le type de l'AC 
	+ Autorité de certification racine (Principale à créer)
	+ Autorité de certification secondaire (Seconde à créer en secours)
[![25](.ressources/img/notes-25.png)](.ressources/img/notes-25.png){:target="_blank"}

3. Spécifier le type de la clé privée 
	+ Création d'une clé  
	+ Réutilisation d'une clé 
[![26](.ressources/img/notes-26.png)](.ressources/img/notes-26.png){:target="_blank"}

4. Spécifier le chiffrement à utiliser 
	+ Le chiffrement et la longueur de la clé 
	+ L'algorithme de hashage 
[![27](.ressources/img/notes-27.png)](.ressources/img/notes-27.png){:target="_blank"}

5. Spécifier le nom de l'AC
	+ Avec ADDS, rempli automatiquement
	+ Sans ADDS, spécifier le suffixe du nom unique 
[![28](.ressources/img/notes-28.png)](.ressources/img/notes-28.png){:target="_blank"}

6. Spécifier la période de validité 
	+ La durée peut être en jours, semaine, mois, année
[![29](.ressources/img/notes-29.png)](.ressources/img/notes-29.png){:target="_blank"}

7. Contrôler le résumé de l'installation 
[![30](.ressources/img/notes-30.png)](.ressources/img/notes-30.png){:target="_blank"}

8. Installation terminée
[![31](.ressources/img/notes-31.png)](.ressources/img/notes-31.png){:target="_blank"}


##### 2.5.2.4 Vérification d'installation PKI Microsoft

###### Outils d'administration Windows

- Autorité de certification 
- Nom de la PKI ("Propriétés")
- Afficher le certificat 

[![32](.ressources/img/notes-32.png)](.ressources/img/notes-32.png){:target="_blank"}


###### Certificat de l'autorité racine

- Console mmc **certmgr.msc**
- Certificat utilisateur 
[![33](.ressources/img/notes-33.png)](.ressources/img/notes-33.png){:target="_blank"}

- Console mmc **certlm.msc**
- Certificat ordinateur 
[![34](.ressources/img/notes-34.png)](.ressources/img/notes-34.png){:target="_blank"}


p63 p119

<p class="fin">~Fin~</p>

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">