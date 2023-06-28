title: mod3-notes-vlan

# ENI TSSR 08 - Réseau & Téléphonie sur IP (ToIP)

Du 07/06 au 17/06/2022<br>
Formatrice : Elisabeth LEFRANC

<span id="toc"></span>

[TOC]


## Module 3 - Le commutateur (vlan)
### Le VLAN Virtual Local Area Network

#### Présentation
Les VLAN permettent de nous éviter d'acheter un nouveau commutateur. Ils se font généralement en fonction des services :

- Les diffusions, les multidiffusions et les monodiffusions sont isolées dans le VLAN individuel
- Chaque VLAN aura sa propre plage d'adressage ip unique
- Domaines de diffusion plus petits


![illu-vlan.png](../ressources/img/08-reseau-toipillu-vlan.png)


| Avantages | Description |
|:----------|:------------|
| Domaines de diffusion plus petits | La division du réseau local réduit le nombre de domaines de diffusion. |
| Sécurité optimisée | Seuls les utilisateurs du même VLAN peuvent communiquer ensemble. |
| Efficacité accrue des IT | Les VLAN peuvent regrouper des appareils ayant des exigences similaires, par ex. professeurs contre étudiants. |
| Réduction des coûts | Un commutateur peut prendre en charge plusieurs groupes ou VLAN. |
| Meilleures performances | Les domaines de diffusion plus petits réduisent le trafic et améliorent la bande passante. |
| Gestion simplifiée | Des groupes similaires auront besoin d'applications similaires et d'autres ressources réseau. |


#### Types de VLAN
##### VLAN de données
Dédié au trafic généré par l'utilisateur (trafic mail et web)

##### VLAN natif

Utilisé uniquement pour les liaisons de **trunk**. 

Toutes les trames sont marquées sur une liaison de trunk **802.1Q**, à l'exception de celles sur le **VLAN natif**.

##### VLAN de gestion
Utilisé pour le trafic **SSH/TelNet VTY** (Virtual Terminal).

- Ne doit pas être transporté avec le trafic d'utilisateur final.
- Généralement, le VLAN qui est le **SVI** pour le commutateur de couche 2.

##### VLAN par défaut
Le VLAN dit par "défaut" est le **VLAN 1** apparant de base sur tous les ports du commutateur à la sortie-usine. 
Il est de plus **natif**.

**Impossible de le supprimer ou de le renommer**

##### VLAN voix

C'est un VLAN distinct qui est requis car le trafic de voix nécessite :

- la bande passante consolidée (?!)
- la priorité de **QoS** élevée
- la capacité d'éviter la congestion
- le délai inférieur à 150 ms de la source à la destination

L'ensemble du réseau doit être conçu pour prendre en charge la voix.


### Configuration de VLAN
#### Commandes de création de VLAN
Les détails du VLAN sont stockés dans le fichier **vlan.dat**. 
Vous créez des VLAN en mode de configuration globale (`conf t`).


| Tâches                                         | Commande IOS                            |
|:-----------------------------------------------|:----------------------------------------|
| Passez en mode de configuration globale        | switch# **configure terminal**          | 
| Créez un VLAN avec un numéro d'identité valide | switch(config)# **vlan** *vlan-id*        |
| Indiquez un nom unique pour identifier le VLAN | switch(config-vlan)# **name** *vlan-name* |
| Repassez en mode d'exécution privilégié        | switch(config-vlan)# end              |


**Exemple de création de VLAN**

```cisco
S1# configure terminal
S1(config)# vlan 30
S1(config-vlan)# name Administration
S1(config-vlan)# end
```

**Notes**: Le nom fourni à `name` est case-sensitive.

#### Commandes d'attribution de port à des VLAN

Affectuer un port à un vlan. 

| Tâches                                     | Commande IOS                                            |
|:-------------------------------------------|:--------------------------------------------------------|
| Passer en mode de configuration globale    | switch# **configure terminal**                          | 
| Passer en mode de configuration d'interface| switch(config)# **interface** *interface-id*            |
| Définir le port en mode d'accès            | switch(config-if)# **switchport mode access**           |
| Affecter le port à un réseau local virtual | switch(config-if)# **switchport access vlan** *vlan-id* |
| Repasser en mode d'exécution privilégié    | switch(config-if)# **end**                              |

**Exemple de VLAN de données et de voix**

- Nous voulons créer et nommer à la fois les VLAN de données et de voix
- Activer la QoS pour le trafic de voix à l'interface

```cisco
S1# conf t
S1(config)# vlan 20
S1(config-vlan)# name Student
S1(config-vlan)# vlan 150 
S1(config-vlan)# name VOICE
S1(config-vlan)# exit 
S1(config)# interface fa0/18
S1(config-if)# switchport mode access
S1(config-if)# switchport access vlan 20
S1(config-if)# mls qos trust cos 
S1(config-if)# switchport voice vlan 120 
S1(config-if)# end
```

#### Vérifier les informations sur les VLAN
Commande `show vlan`

```cisco
show vlan [ brief | id VLAN-ID | name VLAN-NAME | summary ]
```

```cisco
S1# show vlan summary 
Number of existing VLANs          : 7
Number of existing VIP VLANs      : 7
Number of existing extended VLANs : 0
```

```cisco
S1# show interface vlan 20
<blabla>
```

| Tâche | Option de commande |
|:------|:-------------------|
| Afficher une ligne pour chaque VLAN comportant le nom du VLAN, son état et ses ports. | **brief** |
| Afficher des informations sur un VLAN identifié par un ID de VLAN | **id** *vlan-id* |
| Afficher des informations sur un VLAN identifié par un nom de VLAN. Le *nom de VLAN* est une chaîne ASCII de 1 à 32 caractères de long. | **name** *vlan-name* |
| Afficher les informations récapitulatives sur le VLAN | **summary** |

### Trunk
Dans un environnement à plusieurs commutateur, un trunk est une liaison point à point entre 2 périphériques réseau.

#### Fonctions du trunk

- Autoriser plusieurs VLAN sur un port 
- Etendre le VLAN sur l'ensemble du réseau


![illu-trunk.png](../ressources/img/08-reseau-toipillu-trunk.png)


#### Commandes de configuration de trunk

Les trunks sont de couche 2 et transportent le trafic pour tous les VLAN.

| Tâche                                       | Commande IOS                                                     |
|:--------------------------------------------|:-----------------------------------------------------------------|
| Passer en mode de configuration globale     | switch# **conf t**                                               |
| Passer en mode de configuration d'interface | switch(config)# **interface** *interface-id*                     |
| Régler le port en mode de liaison permanent | switch(config-if)# **switchport mode trunk**                     |
| Choisir un VLAN natif                       | switch(config-if)# **switchport trunk native vlan** *vlan-id*    |
| Autoriser les VLAN sur la liaison trunk     | switch(config-if)# **switchport trunk allowed vlan** *vlan-list* |
| Repasser en mode d'exécution privilégié     | switch(config-if)# **end**                                       |

#### Vérification de la config du trunk

Ex. Définir le mode de trunk et le VLAN natif

**Notes** : la commande `show interface fa0/1 switchport` ...

- est définie sur le trunk administrativement
- est définie comme trunk opérationnel
- l'encapsulation est `dot1q`
- VLAN natif défini sur **VLAN 99**
- tous les VLAN créés sur le commutateur transmettront le trafic sur ce trunk.

```cisco
S1(config)# interface fa0/1
S1(config-if)# switchport mode trunk 
S1(config-if)# no switchport trunk native vlan 99
S1(config-if)# end 

S1# show interfaces fa0/1 switchport
<blabla>
```

### Sécurité des ports

Ya plusieurs failles de sécurité sur un commutateur, mais ça fait pas partie du cours. Cependendant, des gestes simples peuvent augmenter rapidement la sécurité de votre commutateur :

- mettre un mdp sur toutes les lignes d'accès et les modes du commutateur
- utiliser le protocole SSH
- sortir les ports du commutateur du VLAN 1 natif
- désactiver les ports non utilisés du commutateur 

https://www.ssi.gouv.fr/entreprise/guide/recommandations-pour-la-securisation-dun-commutateur-de-desserte/

Source : *Mise en oeuvre de la sécurité des ports* (Cisco)

#### Ports inutilisés sécurisés

Les attaques de couche 2 sont parmi les plus faciles à déployer pour les pirates, mais ces menaces peuvent également être atténuées avec certaines solutions de couche 2 courantes.

Tous les ports (interfaces) du commutateur doivent être sécurisés avant que le commutateur ne soit déployé en production. La façon dont un port est sécurisé dépend de sa fonction.

Une méthode simple pour protéger le réseau contre les accès non autorisés consiste à désactiver tous les ports inutilisés d'un commutateur.

- Sur chaque port inutilisé, configurer la commande `shutdown`;
- Pour configurer un ensemble de ports, utiliser la commande `interface range`.

**Syntaxe**: 

```
switch(config)# interface range TYPE MODULE/FIRST_NUMBER - LAST_NUMBER
```

**Exemple**:

```
switch(config)# interface range g0/1-2, f0/11-18
switch(config-if-range)# shutdown
``` 

#### Atténuer les attaques de table d'adresse MAC
La méthode la plus simple et la plus efficace pour empêcher les attaques par débordement de la table d'adresse MAC consiste à activer la **sécurité des ports**.

La sécurité des ports **limite le nombre d'adresses MAC valides** autorisées sur un port. 
Il permet à un admin de configurer manuellement les adresses MAC d'un port ou de permettre au commutateur d'apprendre dynamiquement un nombre limité d'adresses MAC. 

Lorsqu'un port configuré ainsi reçoit une trame, l'adresse MAC de la source est comparée à la liste des adresses MAC des sources sécurisées qui ont été configurées manuellement ou apprises dynamiquement sur le port.

En limitant le nombre d'adresses MAC autorisées sur un port à 1, la sécurité du port peut servir à contrôler l'accès non autorisé au réseau. 


#### Activer la sécurité des ports
La sécurité des ports est activée avec la commande de configuration de l'interface `switchport port-security`.


**Exemple**

```
S1(config)# interface f0/1
S1(config-if)# switchport port-security
Command rejected: FastEthernet0/1 is a dynamic port 
S1(config-if)# switchport mode access
S1(config-if)# switchport port-security
S1(config-if)# end
S1# 
```

**Note**: 

- La securité des ports ne peut être configurée que sur des ports d'accès configurés manuellement ou des ports de trunk de réseau configurés manuellement.<br>C'est pour ça que dans l'ex. la commande est rejetée (port dynamic).
- C'est pour cela qu'on passe le port en mode access avec la commande `switchport mode access`


#### Limiter le nombre d'adresses MAC

```
S1(config)# interface f0/1 
S1(config-if)# switchport port-security maximum ?
  <1-8192>  Maximum addresses
S1(config-if)# switchport port-security maximum 1
```

- La valeur de sécurité du port par défaut est 1.
- Le nombre maxi dépend du commutateur et de l'IOS.

Le commutateur peut être configuré pour en savoir plus sur les adresses MAC sur un port sécurisé de 3 manières :

1. **Configuration manuelle** 
```
switch(config-if)# switchport port-security mac-address MAC_ADDRESS
```

2. **Apprentissage dynamique** : lorsque la commande **switchport port-security** est entrée, l'adresse MAC du périphérique connecté au port est automatiquement sécurisée mais n'est pas ajoutée à la configuration en cours. Si le commutateur est redemarré, le port devra réapprendre l'adresse MAC du périphérique.

3. **Apprentissage dynamique - Sticky**: permet au commutateur d'apprendre dynamiquement les adresses MAC et les enregistrer dans la configuration en cours avec la commande suivante :
```
switch(config-if)# switchport port-security mac-address sticky
```
L'enregistrement de la configuration en cours enregistre l'adresse MAC apprise dynamiquement dans la NVRAM.


**Vérifier la configuration**

```
S1# show port-security interface 
S1# show port-security address
``` 

**Exemple** 

![port-security-ex1.png](../ressources/img/08-reseau-toipport-security-ex1.png)



#### Modes de violation de la sécurité des ports

**Syntaxe**

```
switch(config-if)# switchport port-security violation {shutdown | restrict | protect}
```

- shutdown : port desactivé, led du port s'éteint, message syslog est envoyé. Réactivation manuelle.
- restrict : port toujours actif mais supprime les paquets dont l'adr source est inconnue. Compteur de violation de sécurité est incrémenté. Message syslog envoyé.
- protect : port toujours actif mais supprime les paquets de source inconnue. Aucun syslog.


| Mode         | Description |
|:-------------|:------------|
| **shutdown**<br>(par défaut) | Le port passe immédiatement à l'état *désactivé par erreur*, éteint la LED du port et envoie un message **syslog**. Il incrémente le compteur de violations. Un port désactivé par erreur doit être réactiver par un admin en entrant les commandes **shutdown** et **no shutdown** |
| **restrict**     | Le port supprime les paquets dont l'adresse source est inconnue jusqu'à ce que vous supprimiez un nombre suffisant d'adresses MAC sécurisées pour passer en dessous de la valeur maximale ou qu'on augmente cette valeur. Ce mode entraîne l'incrementation du compteur de violation de sécurité et génère un message syslog. |
| **protect**      | Il s'agit du mode de violation **le moins sécurisé**. Le port supprime les paquets avec des adresses source MAC inconnues jusqu'à ce que vous supprimiez un nombre suffisant d'adresse MAC sécurisées pour descendre sous la valeur maximale ou que vous augmentiez la valeur maximale. **Aucun message syslog n'est envoyé**.|


**Vérification**

```
S1# show port-security interface 
```

**Exemple** : passage en mode restrict (le plus courant)

![port-security-ex2.png](../ressources/img/08-reseau-toipport-security-ex2.png)

#### Ports en état désactivé par erreur

Quand un port est désactivé et placé dans l'état **error-disabled**, aucun trafic n'est envoyé ou reçu sur ce port. 

Une série de message liés à la sécurité des ports s'affiche sur la console, comme illustré dans l'exemple suivant.

**Remarque** : le protocole de port et l'état de la liaison passent à l'état **down** et le voyant du port est éteint

![port-security-ex3.png](../ressources/img/08-reseau-toipport-security-ex3.png)

##### Exemple
1. Ici la commande **show interface** identifie le port comme étant **error-disabled**.
2. La commande **show port-security interface** affiche désormais l'état du port comme étant **secure-shutdown**. 
3. Le compteur de violation incrémente de 1.
4. L'administrateur doit déterminer la cause de la violation de sécurité. Si un périphérique non autorisé est connecté à un port sécurisé, la menace de sécurité est éliminée avant de réactiver le port. 
5. Pour réactiver le port, utilisez d'abord la commande **shutdown** puis la commande **no shutdown**.

![port-security-ex4.png](../ressources/img/08-reseau-toipport-security-ex4.png)

#### Vérifier la sécurité des ports
##### show port-security interface

Permet d'afficher les détails d'une interface spécifique.

![port-security-ex5.png](../ressources/img/08-reseau-toipport-security-ex5.png)

##### show run
Permet de vérifier que les adresse MAC sticky sont enregistrées dans la configuration.

![port-security-ex6.png](../ressources/img/08-reseau-toipport-security-ex6.png)


##### show port-security address
Permet d'afficher toutes les adresses MAC sécurisées configurées manuellement ou apprises dynamiquement sur toutes les interfaces de commutateur. 


![port-security-ex7.png](../ressources/img/08-reseau-toipport-security-ex7.png)

### Accès à distance sécurisé
#### Configuration de SSH
Le protocole TelNet 23 étant non chiffré, nous utiliserons le protocole SSH 22

1. On va configurer le domaine.
2. Puis on va definir localement un username et un mdp.
3. On va chiffer la connection en generant des clés RSA. 
4. On active le protocole ssh sr les lignes vty. 
5. On recommande d'utiliser la version 2 qui est plus sécurisé.

1. configurer le domaine IP : 
```
IP domain-name DOMAIN-NAME
```
2. générer des paires de clés RSA : 
```
crypto key generate RSA
```
3. **Notes**: pour supprimer une clé : `crypto key zeroize rsa`
4. Configurer l'authentification d'utilisateur :
```
username USERNAME secret PASSWORD
```
5. Activer le protocole SSH sur les lignes vty à l'aide de la commande de mode de configuration de ligne transport input ssh.
6. Activer SSH version 2
```
ip ssh version 2
```


### Liste des TP

- 16.4.6 Packet Tracer - Configure Secure Passwords and SSH.pka
- 5.2.2.7 Packet Tracer - Configuring Switch Port Security
- 5.2.2.8 Packet Tracer - Troubleshooting Switch Port Security

**Bonus**

- 11.6.1 Packet Tracer - Switch Security Configuration

<a href="#toc">Retour au sommaire</a>

<div class="fin">
-Fin-
</div> 

<link rel="stylesheet" href="../ressources/css/style.css">
