title: notes - Office365 

# TSSR 01 - Office365

[TOC]

**Sommaire**

1. Microsoft 365
2. Word
3. Excel
4. Outlook + savoir le dépanner
5. Teams + OneDrive

### 1. Microsoft 365

**SaaS** : *Software as a Service*. Les soft sont dans le cloud, le client ne pait pas de licence pour une version mais, soit il peut les utiliser librement en ligne, soit il pait un abonnement.

Concurrents de Microsoft : Zoho, GSuite, AWS Amazon Web Services, HyperOffice, IBM Cloud

**Notes**: Zoho est surtout connu pour son CRM (gestion de relation client). ***A CHECKER***

- Offre cloud avec plein de soft (Exchange, SharePoint, Office, etc.)
- 4 datacenters en France
- Multi-plateformes
- Pour les particuliers & les entreprises
- Moins de serveurs sur sites

#### Les éléments de base
##### Composition

Exchange, OneDrive, Office365, Teams, SharePoint. Le tout est géré par **Azure AD**.

##### Vocabulaire

- Famille et **plan** : MS365 est dispo en version famille (particuliers, asso, entreprise) de plans (Business Essentials, E3 Secteur Public, E5 Entreprise)
- Un **Tenant** : c'est **l'ensemble des services** (!!!!!) de votre abonnement dans MS365 associé à votre **domaine** pour votre entreprise. C'est aussi tous les comptes utilisateurs. 
- **Administrateur global** : C'est celui qui a les plus hauts privilèges dans le domaine.


##### ex. Création d'un Tenant (ensemble des services)

1. Sélectionnez un plan
2. Fournissez une adresse mail valide (ex. prenom.nomannée@campus-eni.fr)
3. Entrez les données de votre entreprise
4. Choisissez le nom de votre Tenant (ex. admin@monEntreprise.onmicrosoft.com)
5. Validez


##### Tenant

Tenant = bulle de votre entreprise au sein de l'espace Office

https://www.it-connect.fr/office-365-comment-recuperer-le-tenant-name-et-tenant-id/

- Nom de Tenant type : `NomDeLAdminGlobal@domaine.onmicrosoft.com`
- Possibilité d'envoyer ou de recevoir des courriels pour ce domaine
- Le Tenant n'est pas modifiable
- Afin d'avoir une adresse mail en `@votreEntreprise.fr` en louant un domaine internet pour en créant un domaine personnalisé dans MS365.

Pour déposer un nom de domaine, voir l'AFNIC (organisation officielle qui gère les noms de domaines en France). 

https://www.afnic.fr/fr/votre-nom-de-domaine/comment-choisir-et-creer-mon-nom-de-domaine/

Location d'un domaine : OVH.com, gandi.net, godaddy.com, ipfix, etc.

#### Demo/TP : Création d'un Tenant

https://products.office.com/fr-fr/business/office-365-enterprise-e5-business-software


### 2. Word

Presentation
Ecriture


### 3. Excel


#### Limitation d'un classeur
Les limitations sont liées à la machine et à l'OS

- Nombre de feuilles max : 255
- Nombre de lignes max   : 1 048 576 (2^20)
- Nombre de colonnes max : 16 384
- Nom de cellule peut aller de A1 à XFD1048576
- Nom d'une feuille : 31 caractères maximum
- Nombre de caractères dans une cellule :
	+ Texte   : 32 767 caractères (2^15 - 1)
	+ Formule : 8 192 caractères  (2^13)
	+ Chiffres : 11 caractères affichables. Si plus long, l'écriture passe en exponentiel.

#### Quelques fonctions
- `alea()` : génére un nombre aléatoire
- `arrondi()` : arrondi à X chiffres après la virgule. Voir aussi `arrondi.inf()`, `arrondi.sup()`
- `ent()` : arrondi à l'entier inférieur
- `produit()` : multiple tous les nombres. Equivalent à `*`
- `somme()` : additionne tous les nombres. Equivalent à `*`
- `quotient()` : donne la partie entière du résultat d'une division
- `mod()` : modulo (reste d'une division) 

... A SUIVRE

### 4. Exploiter et réparer Outlook

**Objectifs**:

- Savoir résoudre et expliquer les problèmes de synchronisation des ressources en ligne
- Connaître l'utilisation des outils de communication asynchrone
- Paramétrer un logiciel de messagerie

#### Le cheminement d'un courrier

1. user1 à locationA écrit une lettre à user2 à locationB
2. le facteur vient chercher la lettre
3. le facteur distribue la lettre au bureau de poste local de user1
4. le bureau de poste envoie la lettre au centre de tri proche de user1
5. le centre de tri envoie la lettre au centre de tri proche de user2
6. le centre de tri de user2 envoie la lettre au bureau de poste de user2
7. le facteur de user2 lui distribue sa lettre
8. user2 peut prendre la lettre dans sa boîte et la lire

**Exemple avec les emails**

1. envoi du mail par user1 : autrement dit, le mail est soumis au serveur de mail par protocole SMTP
2. serveur de messagerie de user1 le recoit et le transmet à son tour en SMTP au serveur de mail de user2
3. le serveur de mail de user2 transmet le mail à user2 en utilisant un des protocoles suivants : pop3, imap, https, ActiveSync


#### Pré-requis pour l'infrastructure réseau

Ports et protocoles : tous les ports nécessaires doivent être ouverts dans le parefeu.

| Protocole | Port non sécurisé | Port TLS/SSL |
|:----------|:------------------|:-------------|
| HTTP Hypertext Transfert Protocol| 80 | 443 |
| POP3 Post Office Protocol | 110 | 995 |
| IMAP4 Interactive Message Access Protocol | 143 | 993 |
| SMTP Simple Mail Transfer Protocol | 25 |  |
| Soumission client SMTP | 2525 (bloqué par FAI) | 587 ou 2525 (465 déprécié) |


- Le port 465 était le port de soumission en chiffrement implicite (465 déprécié et réaffecté à IGMPV sur cisco)




#### APARTÉ : Les ports (à corriger)

| Protocole | TCP/UDP | Port | Description |
|:----------|:--------|:-----|:------------|
| BGP Border Gateway Protocol | TCP | 179 | Widely used on public internet and by ISP to maintain very large routing tables and traffic processing. BGP is one of the few protocols that have been designed to deal with the very large routing tables that must exist on the public Internet. |
| DHCP Dynamic Host Configuration Protocol | UDP | 67/68 | USed on networks that do not use static IP address assignment (almost all of them). A DHCP server can be set up with a pool of addresses that are available for assignment. When a client device is turned on, it can request an IP from the local DHCP server which will assign an IP address, if one is available. The assignment is not permanent and expires at a configurable interval. If an address renewal is not requested and the lease expires, the address will be put back into the pool for assignment |
| DNS Domain Name System | TCP/UDP | 53 | Used on public and private networks to translate domain names into IP addresses, typically for network routing. | 
| FTP File Transfert Protocol | TCP | 20/21 | data on port 20, control handled on TCP port 21 |
| FTP over TLS/SSL | TCP | 989/990 | FTP with secure connection using either SSL or TLS |
| HTTP HyperText Transfer Protocol | TCP | 80 | Main protocol used by web browsers and is thus used by any client that uses files located on these servers |
| HTTPS HyperText Transfer Protocol over SSL/TLS | TCP | 443 | Used in conjonction with HTTP to provide the same services but using a secure connection provided by either SSL or TLS. |
| IMAP Internet Message Access Protocol | TCP | 143 | IMAP v4 is the second main protocols used to retrieve mail from a server. While POP has wider support, IMAP supports a wider array of remote mailbox. |
| IMAP over TLS/SSL | TCP | 193 | IMAP over TLS/SSL. |
| LDAP Lightweight Directory Access Protocol | TCP/UDP | 389 | Provides a mechanism of accessing and maintaining distributed deirectory information. Is based on the ITU-TX.500 standard but has been simplified ans altered to ork onver TCP/IP networks. |
| NetBIOS | TCP/UDP | 137/138/139 | Not a protocol in itself but is typically used in combination with IP with the NetBIOS over TCP/IP (NBT) protocol. NBT has long been the central protocol to interconnect Microsoft Windows machines. |
| NFS Network File System | | | Like SMB but for Linux. Not crossplatform. |
| NTP Network Time Protocol | UDP | 123 | Used to synchronize devices on the Internet, ex. for time keeping. Most modern OS support NFT as a basis for an accurate clock. Important in networking as it provides an ability to easily interrelate troubles from one devie to another as the clock are precisely accurate. |
| POP3 over SSL/TLS | TCP | 995 | POP3 using a secured connection over TSL/SSL |
| POP3 Post Office Protocol | TCP | 110 | One of 2 protocols used to retrieve mails from a server. Allows clkient to retrieve the complete content of server mailbox and then deleting content from said servers |
| RDP Remote Desktop Protocol | TCP/UDP | 3389 | Used for remote desktop connections |
| SMB Server Message Block | TCP/UDP | 445 | Provides shared access to files, printers and serial ports between nodes on a network. Crossplatform. |
| SMTP chiffrement explicite | TCP | 587 | Transfert mail avec chiffrement explicite |
| SMTP chiffrement implicite | TCP | 465 | Transfert mail avec chiffrement implicite |
| SMTP Simple Mail Transfer Protocol | TCP | 25 | Used for two primary functions : mail transfer 1) from source to destination between mail servers, 2) from end users to mail system. Port 25 = sans chiffrement |
| SNMP Simple Network Management Protocol | TCP/UDP | 161/162 | Used by admins as a method of network management. Has a number of different abilities including the ability to monitor, configure and control network device. SNMP traps can also be configured on network devices to notify a central server when specific actions are occuring. Typically used when an alerting condition is happening |
| SSH Secure Shell | TCP | 22 | Used to manage network devices securely at the command level. Secure alternative to Telnet. |
| Telnet | TCP | 23 | Like SSH but unsecure |
| TFTP Trivial File Transfer Protocol | UDP | 69 | Method of file transfer without the session establishment requirements that FTP uses. Uses UDP instead of TCP, therefore has no way of ensuring the file has been properly transferred. The end device must be able to check the file to ensure proper transfer. Typically used by devices to upgrade software and firmware (ex. Cisco equipment). |

**DHCP** : *Dynamic Host Configuration Protocol*, assigns IP addr to client on request. IP taken for a poll of addresses set up by sysadmin. IP can expire. Expired IP return to the poll for futur assignment.

**UDP** : *User Datagram Protocol*, One-way, packet indépendant, pas de vérification, pas de garantie de réception, pas fiable mais rapide. Ex. jeux en ligne.

**TCP** : *Transmission Control Protocol*, paquets sont testés et vérifiés à la réception, fiable mais plus lent. Ex. appel téléphonique

**DNS** : *Domain Name System*, attention pas *_service_*. Annuaire qui ait le lien entre les adresses IP et les noms de domaines.

##### DNS

- Domain Name System are widely used to on public and private networks to translate domain names into IP addresses, typically for network routing. 
- DNS is hieratical with main root servers that contains databases that list the managers of high level TLD (Top Level Domains), such as `.com`.
- These different TLD managers then contain information for the second level domains that are typically used by individual users (ex. `cisco.com`).
- A DNS server can also be set up within a private naming services between the hosts of the internal network without being part of the global system.


##### Différence TCP/UDP
###### UDP
UDP signifie **User Datagram Protocol**. Ce protocole de connexion envoi des packets de données indépendants. On appelle ces packets indépendants des *datagrams*. Ces *datagrams* passent d’un ordinateur à un autre. **Il n’y a pas de garantie sur la réception des données**. Ce n’est pas un protocole de communication fiable.

UDP est utile lorsque l’on as pas à vérifier chaque packet. Ce protocole est beaucoup plus rapide que le protocole TCP due au fait qu’il n’y a **pas de vérifications à la réception**.

Le meilleur exemple du protocole UDP est l’exemple de l'horloge. Imaginez un programme qui envoi l'heure à un ordinateur lorsque celui-ci le demande. Si jamais l’ordinateur ne reçois pas le packet, ça n’as pas de sens de le renvoyer puis qu’entre temps, l’heure as changée.

###### TCP
TCP signifie **Transmission Control Protocol**. C’est probablement le protocole le plus utilisé sur internet. TCP est un protocole orienté connexion qui assure une certaine sécurité au niveau de l’échange des packets. **Les informations sont testées et vérifiés**. Ainsi, si un ordinateur ne reçois pas correctement un packet, ce-dernier est renvoyé.

Le protocole TCP établit une communication entre un ordinateur source et un ordinateur de destination. Les ports sont reliés via un lien jusqu’à ce que la connexion soit terminée. Contrairement à UDP, les packets ne sont pas envoyés de manière indépendante, il y a une **vérification à la récéption**.

Un des protocole TCP les plus connu est une conversation téléphonique. En effet, il faut bien que tout les packets soit réceptionnés. Sinon, la qualité de l’appel seras médiocre.

###### Comparatif

| UDP | TCP |
|:----|:----|
| Le protocole n'est pas orienté connexion | Le protocole est orienté connexion |
| Le protocole n’est pas sécurisé  | Le protocole est sécurisé |
| UDP envoi des packets indépendants appelés datagrams de la source à la destination | Le protocole TCP crée une connexion entre une source et une destination |
| Les packets peuvent se perdre  | Pas de perte de packets, le protocole est stable |
| La vitesse est plus importante que la stabilité  | La sécurité et la stabilité est plus importante que la vitesse |
| Le header de UDP est de 8 bytes  | Le header de TCP est de 20 bytes |
| UDP n’effectue aucune vérification  | TCP effectue trois vérification de récéption |
| TCP utilise des méchanismes de détéction d’erreur, on peux donc catcher sur ces erreurs | UDP n'as pas de système de vérification, on ne peux donc pas les détecter dans le code |
| Exemple : un jeux vidéo en ligne  | Exemple : un appel téléphonique |
| UDP est utilisé pour les protocoles DNS, DHCP, SNMP, RIP, VOIP, TFTP  | TCP est utilisé pour les protocoles HTTP, HTTPS, FTP, SMTP |


##### Résumé

###### File transfer

| Protocole | Port | Nom | Alias |
|:----------|:-----|:----|:------|
| FTP       | 21   | File Transfert Protocol |       |
| FTPS      | 21 explicite<br>989/TCP control<br>990/TCP data | FTP Secure   | FTP over TLS/SSL |
| TFTP      | 69   | Trivial File Transfer Protocol |       |
| SSH       | 22   | Secure Shell |   |
| Telnet    | 23   | Telnet | Dinosaure |
| SMB       | 445  | Server Message Block | Shared access, file & printers |

###### Mail/Web

| Protocole | Port | Nom | Alias |
|:----------|:-----|:----|:------|
| POP3<br>over TLS/SSL | 110<br>995 | Post Office Protocol | Mail grabbed and kept on client |
| IMAP<br>over TLS/SSL | 143<br>993 | Internet Message Access Protocol | Mail kept on mailserver |
| SMTP<br>chiffr. explicite<br>chiffr. implicite | 25<br>465<br>587 | Simple Mail Transfer Protocol | Mail transfer protocol between mail systems, and end users |


###### Web

| Protocole | Port | Nom | Alias |
|:----------|:-----|:----|:------|
| HTTP<br>HTTPS | 80<br>443  | HyperText Transfer Protocol | |
| DNS  | 53 | Domain Name System |  |
| DHCP | 67/68 | Dynamic Host Configuration Protocol | |
| RDP  | 3389 | Remote Desktop | |


<link rel="stylesheet" type="text/css" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
