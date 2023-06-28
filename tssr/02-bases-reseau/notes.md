title: notes reseau 101

# TSSR 02 - Bases Réseaux

[TOC]

**Sommaire**

## M03-02-TP Calcul Adresses

**nb hôtes = 2^masque - 2**

-2 parce que le 0 et le 2^masque sont réservé (ex. 0 et 127)

| Adresse | Masque | /? | adr réseau  | nb hôtes / réseau | adr diffusion |
|:---|:---|:---|:---|:---|:---|
| 10.44.160.1 | 255.0.0.0 | 24 | 10.0.0.0 | 16 777 214 | 10.255.255.255 |
| 164.2.34.35 | 255.255.0.0 | 16 | 164.2.0.0 | 65 534 | 164.2.255.255 |
| 101.2.3.18 | 255.0.0.0 | 24 | 101.0.0.0 | 16 777 214 | 101.255.255.255 |
| 210.222.5.121 | 255.255.255.0 | 8 | 210.222.5.0 | 254 | 210.222.5.255 |
| 11.107.56.23 | 255.0.0.0 | 24 | 11.0.0.0 | 16 777 214 | 11.255.255.255 |
| 223.254.254.254 | 255.255.255.0 | 8 | 23.254.254.0 | 254 | 23.254.254.255 |
| 152.91.10.150 | 255.255.0.0 | 16 | 152.91.0.0 | 65 534 | 152.91.255.255 |
| 81.17.66.38 | 255.0.0.0 | 24 | 81.0.0.0 | 16 777 214 | 81.255.255.255 |
| 128.21.30.253 | 255.255.0.0 | 16 | 128.21.0.0 | 65 534 | 128.21.255.255 |
| 192.168.18.69 | 255.255.255.0 | 8 | 192.168.18.0 | 254 | 192.168.18.255 |
| 98.54.56.23 | 255.0.0.0 | 24 | 98.0.0.0 | 16 777 214 | 98.255.255.255 |
| 194.224.199.234 | 255.255.255.0 | 8 | 194.224.199.0 | 254 | 94.224.199.255 |
| 191.255.252.20 | 255.255.0.0 | 16 | 191.255.0.0 | 65 534 | 191.255.255.255 |


## M03-03-TP CIDR

### A. Calcul du réseau, des hôtes et de l'adresse de diffusion

**191.255.252.20/22**

- 191.255.252.20   : 1011 1111 . 1111 1111 . 1111 1100 . 0001 0100
- Masque (22 x 1)  : 1111 1111 . 1111 1111 . 1111 1100 . 0000 0000
- Réseau (AND)     : 1011 1111 . 1111 1111 . 1111 1100 . 0000 0000 
- Diffusion        : 1011 1111 . 1111 1111 . 1111 1111 . 1111 1111 
- Masque (DEC)     : 255.255.252.0
- Réseau (DEC)     : 191.255.252.0
- Nb hôtes (n x 0) : 2^n - 2 = 2^10 - 2 = 1022
- Adr de diffusion : 191.255.255.255

Adr de diffusion : passer tous les bits de idhotes à 1 dans masque ??
Nb Hôtes : nb de 0 dans masque


**98.54.56.23/13**

- 98.54.56.23               : 0110 0010 . 0011 0110 . 0011 1000 . 0001 0111
- Masque (13 x 1)           : 1111 1111 . 1111 1000 . 0000 0000 . 0000 0000
- Réseau (AND)              : 0110 0010 . 0011 0000 . 0000 0000 . 0000 0000
- Diffusion (bits hôte à 1) : 0110 0010 . 0011 0111 . 1111 1111 . 1111 1111
- Masque (DEC)              : 255.248.0.0
- Réseau (DEC)              : 98.48.0.0
- Diffusion (DEC)           : 98.55.255.255
- Nb hôtes (n x 0)          : 2^n - 2 = 2^19 -2 = 524 286





### C. Trouver adresse réseau & notation CIDR depuis range d'adr IP (min & max)

**Exemple**
- 10.0.0.1 - 10.255.255.254 : adr réseau + CIDR = 10.0.0.0/8, masque = 255.0.0.0
- 172.16.80.1 - 172.16.87.254
- 192.168.15.117 - 192.168.15.118
- 172.16.0.1 - 172.31.255.254


**Méthode**:

1. Convertir chaque adr ip en BIN
2. Comparer les résultats : la partie non-commune est la partie réservée aux IP
3. A la place de la partie commune, mettre que des 1, suivit de 0 pour la partie non-commune. C'est le masque. Convertir en DEC pour avoir le masque.
4. Compter combien de 1 contient l'adr masque en BINAIRE : c'est le CIDR (/?)
5. Faire un AND sur n'importe quelle IP (min ou max) avec le masque en BIN. C'est l'adr réseau.

**Exemple**

- 192.168.15.117 : 1100 0000 . 1010 1000 . 0000 1111 . 0111 01 | 01 
- 192.168.15.118 : 1100 0000 . 1010 1000 . 0000 1111 . 0111 01 | 10
- Masque :         1111 1111 . 1111 1111 . 1111 1111 . 1111 11 | 00 (30 x 1)
- AND              1100 0000 . 1010 1000 . 0000 1111 . 0111 01   00 

Convertion :
- Masque : 255.255.255.252
- Réseau (AND) : 192.168.15.116/30  



## Démo packet Tracer

**PDU** : *Protocol Data unit* is a single unit of info transmitted among peer entities of a computer network.

**ARP** : *Address Resolution Protocol* is a communication protocol used for discovering the link layer address, such as a MAC address, associated with a given internet layer address (typically on IPv4 address).

In IPv6 networdks; the functionality of ARP is provided by the *Neighbor Discovery Protocol* (**NDP**).

**ICMP** : *Internet Control Message Protocol* is a supporting protool in the Internet protocol suite. Used by network devices (ex. Routers) to send error messages and operational info indicating success or failure when communication with another IP address. Typically, protocol used when doing a **ping**. 


**Get MAC address** : 
```
ipconfig /all
```


## TP Packet Tracer

D'après [jodies.de/ipcalc](http://jodies.de/ipcalc?host=210.222.5.121&mask1=29&mask2=)

### Les Adresses IP données
- Adr0 : **210.222.5.121/29**
```
Address:   210.222.5.121         11010010.11011110.00000101.01111 001
Netmask:   255.255.255.248 = 29  11111111.11111111.11111111.11111 000
Wildcard:  0.0.0.7               00000000.00000000.00000000.00000 111
=>
Network:   210.222.5.120/29      11010010.11011110.00000101.01111 000 (Class C)
Broadcast: 210.222.5.127         11010010.11011110.00000101.01111 111
HostMin:   210.222.5.121         11010010.11011110.00000101.01111 001
HostMax:   210.222.5.126         11010010.11011110.00000101.01111 110
Hosts/Net: 6    
```

- Adr1 : **194.224.199.234/19**
```
Address:   194.224.199.234       11000010.11100000.110 00111.11101010
Netmask:   255.255.224.0 = 19    11111111.11111111.111 00000.00000000
Wildcard:  0.0.31.255            00000000.00000000.000 11111.11111111
=>
Network:   194.224.192.0/19      11000010.11100000.110 00000.00000000 (Class C)
Broadcast: 194.224.223.255       11000010.11100000.110 11111.11111111
HostMin:   194.224.192.1         11000010.11100000.110 00000.00000001
HostMax:   194.224.223.254       11000010.11100000.110 11111.11111110
Hosts/Net: 8190      
```

### Configuration du Routeur

Sur le Routeur, configurer les ip des interfaces GigabitEthernet connectées à chaque réseau.

- Sur GigabitEthernet0/0, lui donner une IP (ip0) du réseau connecté à cette prise (net0). Ex. la dernière adresse de la plage dispo.
- Sur GigabitEthernet0/1, lui donner une autre IP (ip1) du réseau connecté à cette prise (net1)
- Sur chaque poste du réseau net0, donner l'adresse ip (ip0) du routeur comme passerelle par défaut (gateway)
- Sur chaque poste du réseau net1, donner l'adresse ip (ip1) du routeur comme passerelle par défaut

**Réseau 1**

- ip srv-0   : 210.222.5.121
- ip pc-0    : 210.222.5.122
- ip lap-0   : 210.222.5.123 
- ip router0 : 210.222.5.126
- passerelle : 210.222.5.126
- masque     : 255.255.255.248
- network    : 210.22.5.120/29

**Réseau 2** 

- ip srv-1    : 194.224.192.1
- ip pc-1     : 194.224.192.2
- ip lap-1    : 194.224.192.3 
- ip router-1 : 194.224.223.254
- passerelle  : 194.224.223.254
- masque      : 255.255.254.0
- network     : 194.224.192.0/19


## Notes Réseaux
### Pré-requis pour l'infrastructure réseau

Ports et protocoles : tous les ports nécessaires doivent être ouverts dans le parefeu.

| Protocole | Port non sécurisé | Port TLS/SSL |
|:----------|:------------------|:-------------|
| HTTP Hypertext Transfert Protocol| 80 | 443 |
| POP3 Post Office Protocol | 110 | 995 |
| IMAP4 Interactive Message Access Protocol | 143 | 993 |
| SMTP Simple Mail Transfer Protocol | 25 |  |
| Soumission client SMTP | 2525 (bloqué par FAI) | 587 ou 2525 (465 déprécié) |


- Le port 465 était le port de soumission en chiffrement implicite (465 déprécié et réaffecté à IGMPV sur cisco)


### APARTÉ : Les ports

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

### DNS

- Domain Name System are widely used to on public and private networks to translate domain names into IP addresses, typically for network routing. 
- DNS is hieratical with main root servers that contains databases that list the managers of high level TLD (Top Level Domains), such as `.com`.
- These different TLD managers then contain information for the second level domains that are typically used by individual users (ex. `cisco.com`).
- A DNS server can also be set up within a private naming services between the hosts of the internal network without being part of the global system.


### Différence TCP/UDP
#### UDP
UDP signifie **User Datagram Protocol**. Ce protocole de connexion envoi des packets de données indépendants. On appelle ces packets indépendants des *datagrams*. Ces *datagrams* passent d’un ordinateur à un autre. **Il n’y a pas de garantie sur la réception des données**. Ce n’est pas un protocole de communication fiable.

UDP est utile lorsque l’on as pas à vérifier chaque packet. Ce protocole est beaucoup plus rapide que le protocole TCP due au fait qu’il n’y a **pas de vérifications à la réception**.

Le meilleur exemple du protocole UDP est l’exemple de l'horloge. Imaginez un programme qui envoi l'heure à un ordinateur lorsque celui-ci le demande. Si jamais l’ordinateur ne reçois pas le packet, ça n’as pas de sens de le renvoyer puis qu’entre temps, l’heure as changée.

#### TCP
TCP signifie **Transmission Control Protocol**. C’est probablement le protocole le plus utilisé sur internet. TCP est un protocole orienté connexion qui assure une certaine sécurité au niveau de l’échange des packets. **Les informations sont testées et vérifiés**. Ainsi, si un ordinateur ne reçois pas correctement un packet, ce-dernier est renvoyé.

Le protocole TCP établit une communication entre un ordinateur source et un ordinateur de destination. Les ports sont reliés via un lien jusqu’à ce que la connexion soit terminée. Contrairement à UDP, les packets ne sont pas envoyés de manière indépendante, il y a une **vérification à la récéption**.

Un des protocole TCP les plus connu est une conversation téléphonique. En effet, il faut bien que tout les packets soit réceptionnés. Sinon, la qualité de l’appel seras médiocre.

#### Comparatif

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


### Résumé

#### File transfer

| Protocole | Port | Nom | Alias |
|:----------|:-----|:----|:------|
| FTP       | 21   | File Transfert Protocol |       |
| FTPS      | 21 explicite<br>989/TCP control<br>990/TCP data | FTP Secure   | FTP over TLS/SSL |
| TFTP      | 69   | Trivial File Transfer Protocol |       |
| SSH       | 22   | Secure Shell |   |
| Telnet    | 23   | Telnet | Dinosaure |
| SMB       | 445  | Server Message Block | Shared access, file & printers |

#### Mail/Web

| Protocole | Port | Nom | Alias |
|:----------|:-----|:----|:------|
| POP3<br>over TLS/SSL | 110<br>995 | Post Office Protocol | Mail grabbed and kept on client |
| IMAP<br>over TLS/SSL | 143<br>993 | Internet Message Access Protocol | Mail kept on mailserver |
| SMTP<br>chiffr. explicite<br>chiffr. implicite | 25<br>465<br>587 | Simple Mail Transfer Protocol | Mail transfer protocol between mail systems, and end users |


#### Web

| Protocole | Port | Nom | Alias |
|:----------|:-----|:----|:------|
| HTTP<br>HTTPS | 80<br>443  | HyperText Transfer Protocol | |
| DNS  | 53 | Domain Name System |  |
| DHCP | 67/68 | Dynamic Host Configuration Protocol | |
| RDP  | 3389 | Remote Desktop | |





<link rel="stylesheet" href="../ressources/css/bootstrap.min.css">
<link rel="stylesheet" href="../ressources/css/style.css">