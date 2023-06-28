title: cheatsheet-cisco

# CISCO - Liste des commandes
*ENI TSSR 08 - Réseau & Téléphonie sur IP (ToIP)*



<span id="toc"></span>

[TOC]



### Mot de passe

#### Mot de passe sur console

```
S1# conf t 
S1(config)# line console 0
S1(config-line)# password letmein
S1(config-line)# login
S1(config-line)# exit
```

**Notes**:

- `login` permet de "activer la connection" (?!)
- Le mot de passe est stocké en clair dans la config si le chiffrement n'est pas activé.


#### Mot de passe sur le mode privilégié (enable) mais en clair (?!)

```
S1# conf t 
S1(config)# enable password c1$c0
S1(config)# exit
```

**Notes**: le mdp apparaitra en clair dans le fichier de config.

#### Mot de passe chiffré sur le mode execution

```
S1# conf t 
S1(config)# enable secret itsasecret
S1(config)# exit
```

**Notes** : écrase le mot de passe privilégié.

#### Chiffrer les mot de passe

```
S1# conf t 
S1(config)# service password-encryption
S1(config)# exit
```

#### Setup taille minimum pour les mdp

```
S2# security password min-length 10
```


#### Check running-config

```
R1# show running-config
R1# sh run
``` 

#### MOTD Message Of The Day

```
S1# banner motd "This is what you see on the welcome page"
```


#### Desactiver des ports (plusieurs en même temps)

```
S1# conf t 
S1(config)# interface range f0/3-24,g0/1-2
S1(config)# shutdown
S1(config)# exit 
```



### SECURITE DES PORTS (VLAN) --- a revoir

```
S1# conf t 
S1(config)# interface range f0/1-2
S1(config-if)# switch port-security
S1(config-if)# switch port-security
S1(config-if)# switch port-security maximum 1
S1(config-if)# switch port-security max-address sticky
S1(config-if)# switch port-security violation restrict
```

- `S1(config-if)# switch port-security` : activer la securité
- `S1(config-if)# switch port-security maximum 1` : limiter à une connexion sur cette interface 
- `S1(config-if)# switch port-security max-address sticky` : enregistrer les addr mac des postes qui se connectent
- `S1(config-if)# switch port-security violation restrict` : définir le comportement en cas de violation de la sécurité (ex. plus d'une connection). Restrict permet de ne pas bloquer le port. 


#### Enable port security

```
S1# conf t
S1(config)# interface f0/1 
S1(config-if)# switchport mode access 
S1(config-if)# switchport port-security
S1(config)# end
```

**Notes** : 

- `S1(config-if)# switchport mode access` : utile pour repasser en mode access si jamais le port est en mode trunk.


#### Limiter le nombre d'adresses MAC (?) sur un port

```
S1# conf t
S1(config)# interface f0/1 
S1(config-if)# switchport port-security maximum INT_VALUE
S1(config)# end
```

Avec INT_VALUE le nombre en question (ex. 1).


#### Configurer apprentissage dynamique des adresse MAC

```
S1# conf t
S1(config)# interface range f0/1-2
S1(config-if-range)# switchport port-security mac-address sticky
S1(config-if-range)# end
```

**Notes** : à faire pour toutes les interfaces concernées.

#### Check port security status

```
S1# show port-security interface ID_INTERFACE 
S1# show port-security interface f0/1
S1# show port-security address 
```
#### Mode de violation de la sécurité des ports

```
S1# conf t 
S1(config)# 
```
 
### A trier

#### Definir hostname

```
Router# conf t 
Router(conf)# hostname R1
R1# end
```

#### Sauvegarder la running-config sur la startup-config

```
S1# copy running-config startup-config
S1# cop run start 
``` 

#### Désactiver recherche DNS

```
S1# no ip domain-lookup
```

### IP

#### Attribuer IP

```
R1# conf t 
R1(config)# interface g0/0
R1(config-if)# ip address 172.16.1.2 255.255.255.0
R1(config-if)# no shutdown
R1(config-if)# end
```

**Notes** : `no shutdown` signifie que l'on active l'interface. 


#### Passerelle par défaut

```
switch# conf t 
switch(config)# ip default-gateway IP_PASSERELLE
```

### SSH
#### 1. Attribuer ip

```
R1# conf t 
R1(config)# interface g0/0
R1(config-if)# ip address 172.16.1.2 255.255.255.0
R1(config-if)# no shutdown
R1(config-if)# exit
```

#### 2. Définir passerelle par defaut

```
R1# conf t 
R1(config)# interface g0/0
R1(config-if)# ip default-gateway 172.16.1.1 
R1(config-if)# exit 
```

#### 3. Definir mdp console/enable

```
R1# enable secret itsasecret
```

#### 4. Desactiver recherche DNS
```
R1# no ip domain-lookup
```

#### 5. Definir nom de domaine

```
R1# ip domain-name MonDomaine.com
```

**Notes** : case-sensitive

#### 6. Créer user

```
R1# username monUser secret monPassword
```

#### 7. Crypter mdp

```
R1# conf t 
R1(config)# service password-encryption
R1(config)# security password min-length 10
```

#### 8. Générer clé RSA

```
R1# conf t 
R1(config)# crypto key generate RSA
Bits ? [512] : 1024
```

#### 9. Configurer lignes vty pour accès SSH avec timeout à 6 minutes

```
R1# conf t 
R1(config)# line vty 0 4
R1(config-line)# transport input ssh
R1(config-line)# login local
R1(config-line)# exec-timeout 6
```




<link rel="stylesheet" href=".ressources/css/style.css">

