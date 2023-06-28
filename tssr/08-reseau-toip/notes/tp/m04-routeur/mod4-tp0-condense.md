title: mod4-tp0-condensé

# Condensé des TP
*ENI TSSR 08 - Réseau & ToIP*

[TOC]


## M04 TP1 - Config de base de Routeur


**Objectives**

- Partie 1 : vérifier la configuration par défaut du routeur
- Partie 2 : configurer et vérifier la configuration initiale du routeur
- Partie 3 : enregistrer le fichier de configuration en cours

**Contexte**

Au cours de cet exercice, vous allez effectuer des **configurations de base sur les routeurs**. 

Vous sécuriserez l'accès au port de console et CLI à l'aide de mots de passe chiffrés. et configurer les messages affichés lors de la connexion des utilisateurs au routeur. Ces bannières avertiront les intrus que l'accès est interdit. 

Enfin, vous allez vérifier et enregistrer votre configuration en cours.

### Etablir une connection avec le cable bleu

1. Choisissez le câble bleu **Console** parmi les connexions disponibles.
2. Cliquez sur **PCA**, puis sélectionnez **RS 232**.
3. Faites glisser le câble, cliquez sur **R1**, puis sélectionnez **Console**.
4. Cliquez sur **PCA** > onglet **Desktop** > **Terminal**.
5. Cliquez sur **OK**, puis appuyez sur <kbd>Entrée</kbd>. Vous êtes maintenant en mesure de configurer **R1**.

### Mot de passe sur console (avec activation de la connexion)

```
S1# conf t
S1(config)# line console 0
S1(config-line)# password letmein
S1(config-line)# login
S1(config-line)# end
```

**Note**: 

- `login` permet d'activer la connection (?!).
- Si vous n'êtes pas invité à entrer un mot de passe, c'est qu'on a oublié d'entrer la commande `login`.

### Mot de passe sur mode privilégié (enable) mais en clair

```
R1# conf t 
R1(config)# enable password c1$c0 
R1(config)# exit 
```

### Mot de passe sur mode exécution (?) chiffré

**Remarque** : va écraser le mot de passe du mode privilégié si déjà setup.

```
R1# conf t 
R1(config)# enable secret itsasecret
R1(config)# exit 
```

### Activer le chiffrement des mots de passe

```
R1# conf t
R1(config)# service password-encryption
``` 

### Check mot de passe : `sh run`

```
R1# sh run 
R1# show running-config
```

### Banner MOTD (Message Of The Day)

```
R1# conf t 
R1(config)# banner motd "Ceci est mon message."
```

**Notes** : une bannière MOTD est préconisée parce qu'elle permet de donner des infos comme le nom du routeur, ou des avertissements pouvant dissuader des accès illicites.

### Exemples de renseignement fourni par `sh run`

- mots de passe, chiffré ou non
- nom du routeur, hostname 
- nombre et types d'interfaces du routeur 
- nombre d'interfaces SERIAL  (ex. 2)
- nombre d'interfaces FAST-ETHERNET (ex. 4)
- nombre d'interfaces GIGA-ETHERNET (ex. 2)
- plage de valeurs affichées pour les lignes vty (Virtual Terminal) (ex. 0 à 4 ?)

### Afficher le contenu de la NVRAM : `sh start`

```
R1# sh start 
R1# show startup-config
``` 

### Changer nom du Routeur (hostname)

```
Router# conf t
Router(config)# hostname R1
```

### Chiffrez tous les mots de passe en clair.

```
R1(config)# service password-encryption
```

### Enregistrer la configuration courante dans la mémoire NVRAM

```
R1# copy running-config startup-config
R1# cop run start
```

### Afficher le contenu de la mémoire NVRAM

```
R1# show startup-config
```


## M04 TP2 - Troubleshooting Default Gateway

??? 

One PC has the wrong IP, another one has the wrong IP. 
S1 has no default gateway... 

## M04 TP3 - IPv4 & IPv6

### Discover the IPv4/IPv6 path (`tracert`)

- From **PC1**, trace the route to **PC2**.

```
C:\>tracert 10.10.1.20

Tracing route to 10.10.1.20 over a maximum of 30 hops: 

  1   0 ms      0 ms      0 ms      10.10.1.97
  2   0 ms      0 ms      0 ms      10.10.1.5
  3   1 ms      1 ms      34 ms     10.10.1.10
  4   1 ms      6 ms      4 ms      10.10.1.20

Trace complete.
```

- From **PC2**, trace the route to **PC1**.

```
C:\>tracert 10.10.1.100

Tracing route to 10.10.1.100 over a maximum of 30 hops: 

  1   0 ms      0 ms      0 ms      10.10.1.17
  2   0 ms      19 ms     0 ms      10.10.1.9
  3   0 ms      1 ms      1 ms      10.10.1.6
  4   0 ms      1 ms      6 ms      10.10.1.100

Trace complete.
```

- From **PC1**, trace the route to the IPv6 address for **PC2**.

```
C:\>tracert 2001:db8:1:4::a

Tracing route to 2001:db8:1:4::a over a maximum of 30 hops: 

  1   11 ms     0 ms      0 ms      2001:DB8:1:1::1
  2   3 ms      0 ms      35 ms     2001:DB8:1:2::1
  3   0 ms      0 ms      1 ms      2001:DB8:1:3::2
  4   5 ms      20 ms     4 ms      2001:DB8:1:4::A

Trace complete.
```

- From **PC2**, trace the route to the IPv6 address for **PC1**.

```
C:\>tracert 2001:db8:1:1::a

Tracing route to 2001:db8:1:1::a over a maximum of 30 hops: 

  1   0 ms      0 ms      0 ms      2001:DB8:1:4::1
  2   0 ms      0 ms      0 ms      2001:DB8:1:3::1
  3   19 ms     31 ms     39 ms     2001:DB8:1:2::2
  4   4 ms      1 ms      0 ms      2001:DB8:1:1::A

Trace complete.
```

 
<link rel="stylesheet" href="../.ressources/css/style.css">
 