# ENI TSSR 02 - Bases Réseau : CISCO
[TOC]

## Cisco

Cisco IOS est l'OS des routeurs & switch, etc.

**Notes** : https://www.adminmalin.fr/commandes-de-base-cisco

##### Modifier l'IP d'une interface

```cisco 
router> enable              # passer en mode root
router# configure terminal
router(config)# interface vlan1
router(config-if)# ip address 192.168.10.2 255.255.255.0
router(config-if)# end
```

##### Afficher config active

```cisco 
router# show running-config
```

##### Ajouter une passerelle par défaut

```cisco 
router> en                  # "enable" 
router# conf t              # "configure terminal"
router(config)# ip default-gateway 10.17.200.254
```

##### Activer (enable) une interface

```cisco 
router> en
router# conf t
router(config)# interface gi1/0/23
router(config-if)# no shutdown
router(config-if)# end
```

##### Désactiver (disable) une interface

```cisco
router> enable
router> enable terminal
router(config)# interface g1/0/23
router(config-if)# no shutdown
router(config-if)# end
```

##### Activer (enable) mot de passe sur routeur

```cisco 
router> en
router# conf t
router(config)# enable password monPassword
router(config)# end
```

### Routing
Set up routeurs entre plusieurs réseaux.

![Entre 2 routeurs](.ressources/img/routing-1.png)

Commande pour R1 : 

```cisco 
ip route <ip du réseau à atteindre> <masque du réseau> <passerelle pour y aller>
```

Ex.

```cisco
router> en
router# conf t
router(config)# ip route 192.168.0.0 255.255.255.0 172.10.25.1
router(config)# end
```

### Route static

![3 Routeurs](.ressources/img/routing-2.png)

De R1 à Net1 (sur R1) : Route static

```cisco 
# ip route <NET1> <mask> <P2>
# ip route <NET1> <mask> <P4>
```

##### Configurer une route static par défaut

```cisco
router(config)# ip route 0.0.0.0 0.0.0.0 209.168.200.226
```

S'applique typiquement sur les routeurs de bordures. (ici R0 et R2)

**Syntaxe** : `ip route <reseau> <masque> <ip troncon suivant>`

### Mise en place d'un relais DHCP

![Relais DHCP](.ressources/img/relais-dhcp.png)

##### 1. Allumer le vlan1 sur les switchs

Procédure à effectuer sur SWITCH1 et SWITCH2

```cisco
switch> enable				       # passer en mode root
switch# configure terminal         # passer en mode config
switch(config)# interface vlan1    # accès à config vlan 
switch(config-if)# no shutdown     # allumer/activer vlan 
switch(config-if)# exit
switch(config)# exit
switch# copy running-config startup-config    # sauvegarder config
```

##### 2. Configuration du serveur DHCP

Sur le serveur DHCP 

- onglet **DESKTOP** > **IP CONFIGURATION** 
- bouton **static** : entrer **IP DHCP** + **gateway** + **mask**

- onglet **SERVICES** > **DHCP**
- Configurer les **pools d'adresses** qu'il distribuera à ses différents clients. 
  Nous devons configurer 2 plages étant données que ce serveur DHCP servira pour 2 sous-réseaux.

Ici, ajouter les 2 plages suivantes :

|                        |       Réseau 1 |       Réseau 2 |
|:-----------------------|---------------:|---------------:|
| Nom                    |     10.0.0.0/8 |  172.16.0.0/16 |
| Gateway                | 10.255.255.254 | 172.16.255.254 |
| DNS srv                |        0.0.0.0 |        0.0.0.0 |
| Start ip (rempl. auto) |      10.0.0.10 |    172.16.0.10 |
| Subnet (rempl. auto)   |      255.0.0.0 |    255.255.0.0 | 
| Max nbr (rempl. auto)  |             50 |             50 |
| TFTP srv (rempl. auto) |        0.0.0.0 |        0.0.0.0 |

**ATTENTION** 

- Il faut modifier les plages par défaut car elle ne peut pas être supprimé. 
- Attention au remplissage auto des "start ip". Toujours vérifier.



![config dhcp](.ressources/img/config-dhcp.png)


![config dhcp](.ressources/img/config-dhcp-1.png)

##### 3. Configurer les interfaces du routeur

1. Attribuer une IP à l'interface FastEth0 et FastEth1.
2. Ajouter l'IP Helper pour Eth1 (172.16.0.0) c'est-à-dire le _reseau sans DHCP_.

Grâce à l'option IP HELPER le router pourra relayer la trame de diffusion au serveur DHCP.

**Attention** ! On ajoute IP HELPER sur l'interface du côté où il n'y a pas de serveur DHCP.

```cisco
router> enable
router# configure terminal
router(config)# interface fastEthernet 0/0
router(config-if)# ip address 10.255.255.254 255.0.0.0
router(config-if)# no shutdown
router(config-if)# exit
router(config)# interface fastEthernet 1/0
router(config)# ip address 172.16.255.254 255.255.0.0
```
On indique que les trames de diffusion sont relayées au serveur DHCP, soit à 10.255.255.253

```cisco 
router(config-if)# ip helper-address 10.255.255.253       # ip du dhcp
router(config-if)# no shutdown
router(config-if)# exit
router(config)# exit
router# copy running-config startup-config
```

##### 4. Tester

Clic sur PC > onglet **Desktop** > **IP Config** > cocher **DHCP**


### Exercice 1

![exo1](.ressources/img/exo-0.png)

#### Enoncé

1. **Routeur** : attribuer une IP static
2. **DHCP** 
	+ attribuer IP static + activer service DHCP 
	+ ajouter pool (réseau + leur passerelle)
3. **Switch** : activer VLAN 1
4. **Routeurs**
	+ routage static (router les réseaux hors-portée)
	+ ajouter ip helper
5. **Machines** : activer DHCP 


- *Next: TelNet/SSH sur un routeur*
- *Next: Mettre en place routage dynamique (OSPF)*


#### Détail

##### 1. Attribuer une ip static

- clic sur Routeur > onglet **CLI**
- Entrer les commandes suivantes :

```cisco
router> enable
router# configure terminal
router(config)# interface GigaEthernet 0/1
router(config-if)# ip address 10.17.16.1 255.255.240.0
router(config-if)# end
router(config)# exit
router# exit
router> copy running-config startup-config
```

##### 2. Configurer DHCP

- clic **Serveur** > onglet **Services** > **DHCP** > **on**
- entrer **nom** + **ip** + **subnet** + **startip addr** puis **save** (*server pool*)

Ex.

|         PoolName | Default gateway |      Start IP |          Mask |
|-----------------:|----------------:|--------------:|--------------:|
|    10.17.16.0/20 |      10.17.16.1 |    10.17.16.0 | 255.255.240.0 |
| 192.168.200.0/24 |   192.168.200.1 | 192.168.200.0 | 255.255.255.0 |
| 192.168.100.0/24 |   192.168.100.1 | 192.168.100.0 | 255.255.255.0 |
|       serverpool |   192.168.200.1 |               |               |

![illustration](.ressources/img/exo-02.png)

##### 3. Activer le vlan1 sur chaque switch

- clic **Switch** > onglet **CLI**

```cisco 
switch> enable
switch# configure terminal
switch(config)# interface vlan1
switch(config)# no shutdown
switch(config)# end
switch(config)# exit
switch# exit
switch> copy running-config startup-config
```

##### 4. Routeurs (suite)
Enregistrer les routes statiques pour connaître les réseaux qui sont hors-portée.

###### Routage via GUI

- onglet **Config** > **Routing** > **static**
- Network : 10.17.16.0
- Mask    : 255.255.240.0
- Next hop: 192.168.100.254
- Sera noté `10.17.16.0/20 via 192.168.100.254` 

![illustration](.ressources/img/exo-01.png)



###### Routage via CLI

**Syntaxe** :

```cisco
router(config)# ip route <ip réseau à atteindre> <son masque> <passerelle pour y aller|next hop>
router(config)# end
```

**Exemple** :

```cisco
router> enable
router# configure terminal
router(config)# ip route 192.168.200.0 255.255.255.0 192.168.100.254
router(config)# end
```

###### Ajout du helper-ip

Permet au routeur lointain de connaître l'ip du DHCP.

**Attention** : Sélectionner l'interface qui reçoit le broadcast de la requête au DHCP. Ici, `G0/1` sur `Routeur1`.

```cisco
router> enable
router# configure terminal
router(config)# interface GigaEthernet 0/1
router(config)# ip helper-address 192.168.200.2      # ip du dhcp 
router(config)# end
router(config)# exit
router# exit
router> copy running-config startup-config
```

##### 5. Machine

Activer l'ip par DHCP sur chaque machine de tous les réseaux.

clic **PC** > onglet **Desktop** > **IP Config** > sélection **DHCP**

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
