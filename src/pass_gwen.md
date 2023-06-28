<span id="toc"></span>

## Passage Gwen

Quelques questions lors du passage du titre.

Remarque : dans le QCM il n'y avait pas de sous-réseau, ni de ports. 
Le Jury n'a posé aucune question dessus.

<a href="#toc">Retour en haut</a>

### 1. pfsense
<div class="is-question">**Une règle pfSense à analyser**</div>

La règle permettait de se connecter depuis l'extérieur vers l'intérieur.

<a href="#toc">Retour en haut</a>

### 2. mail à rédiger
<div class="is-question">**Un mail à rédiger car l'équipe informatique devait couper le serveur applicatif pour faire des mises à jour et rajouter un disque.**</div>

Le jury a précisé qu'il faut bien mettre l'heure du début mais pas l'heure de fin. Il faudra avertir les utilisateurs en temps réel au redémarrage.

> "Bonjour,
> 
> Nous vous informons que le serveur applicatif sera coupé aujourd'hui à partir de midi pour maintenance. 
> 
> Nous vous informerons sa remise en marche dès que l'opération sera terminée.
> 
> Merci de votre compréhension.
> 
> Cordialement,
>
> Le Service Informatique"

<a href="#toc">Retour en haut</a>

### 3. syslog
<div class="is-question">**Envoyer des messages système vers un serveur syslog. Comment le mettre en place et comment traiter les messages ?**</div>

**ChatGPT**

<div class="is-success">Pour envoyer des messages système vers un serveur syslog, vous avez besoin de configurer votre système pour utiliser le protocole syslog et spécifier l'adresse du serveur syslog. Voici les étapes générales pour mettre en place ce processus :

1. Choisissez un serveur syslog : Tout d'abord, vous devez avoir un serveur syslog prêt à recevoir les messages système. Vous pouvez installer un serveur syslog open-source tel que rsyslog, syslog-ng ou utiliser un service cloud de syslog.

2. Configuration du client : Sur la machine à partir de laquelle vous souhaitez envoyer les messages système, vous devez configurer le démon syslog pour rediriger les journaux vers le serveur syslog. Le processus de configuration peut varier en fonction du système d'exploitation que vous utilisez.

   - Sur Linux (rsyslog) : Ouvrez le fichier de configuration `/etc/rsyslog.conf` (ou `/etc/rsyslog.d/50-default.conf`) et ajoutez une ligne pour rediriger les journaux vers le serveur syslog. Par exemple, `*.* @adresse_serveur_syslog:port`.

   - Sur macOS (syslog) : Ouvrez le fichier de configuration `/etc/syslog.conf` et ajoutez une ligne pour rediriger les journaux vers le serveur syslog. Par exemple, `*.* @adresse_serveur_syslog:port`.

   - Sur Windows (EventLog to Syslog) : Vous pouvez utiliser des outils tiers tels que EventLog to Syslog pour rediriger les journaux vers un serveur syslog.

3. Redémarrez le service syslog : Après avoir modifié la configuration, redémarrez le service syslog pour appliquer les modifications. Par exemple, sur Linux, vous pouvez utiliser la commande `sudo service rsyslog restart` ou `sudo systemctl restart rsyslog`.

Une fois la configuration en place, les messages système seront envoyés vers le serveur syslog. Maintenant, vous pouvez traiter ces messages sur le serveur syslog de différentes manières, selon vos besoins. Voici quelques exemples :

- Stockage des journaux : Le serveur syslog peut stocker les messages dans des fichiers journaux locaux ou dans une base de données, en fonction de sa configuration.

- Analyse et filtrage : Vous pouvez configurer le serveur syslog pour analyser et filtrer les messages en fonction de critères spécifiques tels que le niveau de gravité, l'application source, l'adresse IP, etc. Cela vous permet de trier et de hiérarchiser les messages pour une meilleure gestion.

- Alertes et notifications : Le serveur syslog peut être configuré pour déclencher des alertes ou des notifications lorsqu'il reçoit des messages spécifiques. Par exemple, il peut envoyer des e-mails, des SMS ou déclencher des intégrations avec d'autres systèmes de surveillance.

- Intégration avec des outils de gestion des journaux : Vous pouvez utiliser des outils de gestion des journaux tels que ELK Stack (Elasticsearch, Logstash, Kibana) ou Splunk pour analyser et visualiser les messages système à des fins de surveillance et de débogage.

Ces exemples vous donnent une idée générale de ce que vous pouvez faire avec les messages système envoyés vers un serveur syslog. Les fonctionnalités exactes et les méthodes de traitement dépendent du serveur syslog que vous utilisez et de votre configuration spécifique.</div>


<a href="#toc">Retour en haut</a>

### 4. Définition de `$PATH`
C'est un variable d'environnement sous Linux qui contient des chemins dans lesquels le système cherche des executables. 

**Version longue**

C'est une variable d'environnement utilisée par les systèmes UNIX et UNIX-like (y compris Linux) pour spécifier les répertoires dans lesquels le système recherche les commande exécutable. C'est l'équivalent de la variable d'environnement %PATH% utilisée par les systèmes Windows.


<a href="#toc">Retour en haut</a>

### 5. Emplacement Linux des "fichiers utilisateurs"
Réponse : /etc/divasswd

<a href="#toc">Retour en haut</a>

### 6. Tableau TCP/IP à compléter
Il faut remettre les protocoles, dont OSPF et SMTP. Il y en a d'autres.

**Notes**

<a href=".ressources/img/g01.png" target="_blank"><img src=".ressources/img/g01.png" alt="Modèle TCP/IP"></a><br>
<a href=".ressources/img/g02.png" target="_blank"><img src=".ressources/img/g02.png" alt="TCP/IP"></a><br>
<a href=".ressources/img/g03.png" target="_blank"><img src=".ressources/img/g03.png" alt="Tableau TCP/IP"></a>

**ChatGPT**

<div class="is-success">Le tableau TCP/IP (Transmission Control Protocol/Internet Protocol) est une suite de protocoles réseau qui est utilisée comme base pour la communication sur Internet et dans de nombreux réseaux locaux. Il s'agit d'un ensemble de protocoles interconnectés qui permettent aux appareils de communiquer et d'échanger des données de manière fiable et efficace.

Le tableau TCP/IP est composé de plusieurs protocoles qui remplissent différentes fonctions :

1. IP (Internet Protocol) : Il est responsable de l'adressage et du routage des paquets de données sur un réseau. Il attribue une adresse unique à chaque appareil connecté et permet de déterminer le chemin optimal pour acheminer les données d'un appareil à un autre.

2. TCP (Transmission Control Protocol) : Il fournit un contrôle fiable de la transmission des données. Il découpe les données en segments, les numérote et s'assure qu'ils sont livrés dans l'ordre correct et sans erreur. TCP gère également le contrôle de flux pour éviter la congestion du réseau.

3. UDP (User Datagram Protocol) : Il est un protocole de transport alternatif à TCP. Contrairement à TCP, UDP ne fournit pas de garantie de livraison des données ni de contrôle de flux. Il est souvent utilisé pour les applications qui nécessitent une transmission de données rapide et où la perte de quelques paquets n'est pas critique.

4. ICMP (Internet Control Message Protocol) : Il est utilisé pour le diagnostic et la gestion des erreurs dans les réseaux IP. ICMP permet l'envoi de messages de contrôle et de notification entre les appareils réseau pour vérifier la connectivité, signaler les erreurs et les problèmes de routage.

5. DNS (Domain Name System) : Il est responsable de la résolution des noms de domaine en adresses IP. DNS convertit les noms de domaine faciles à retenir (comme www.example.com) en adresses IP numériques que les appareils réseau peuvent comprendre.

Ces protocoles, combinés dans le tableau TCP/IP, fournissent les fondements de la communication réseau moderne, en permettant l'acheminement des données, la fiabilité de la transmission, la résolution des noms de domaine et la détection des erreurs.</div>



<a href="#toc">Retour en haut</a>

### 7. MDM vs GLPI
<div class="is-question">**Donner les avantages à utiliser un MDM pour les mobiles par rapport à un GLPI par exemple**</div>

*Un MDM (Mobile Device Management) est une solution de gestion de ressources informatiques spécifiquement conçu pour la gestion des appareils mobiles. Il offre des fonctionnalités avancées et une gestion de la mobilité d'entreprise.*

**ChatGPT**

<div class="is-success">Un MDM (Mobile Device Management) et GLPI (Gestionnaire Libre de Parc Informatique) sont deux solutions utilisées dans le domaine de la gestion des dispositifs et des ressources informatiques, mais elles diffèrent par leurs fonctionnalités et leurs domaines d'application. Voici quelques avantages distincts de l'utilisation d'un MDM pour la gestion des mobiles par rapport à GLPI :

1. Gestion spécialisée des appareils mobiles : Un MDM est spécialement conçu pour la gestion des appareils mobiles tels que smartphones et tablettes. Il offre des fonctionnalités avancées spécifiquement adaptées aux besoins de la gestion des mobiles, comme la configuration à distance, la sécurité des données mobiles, la gestion des applications, le suivi de la localisation, etc. GLPI, quant à lui, est davantage axé sur la gestion des ressources informatiques globales telles que les ordinateurs, les serveurs, les imprimantes, etc.

2. Contrôle granulaire des appareils mobiles : Un MDM permet un contrôle plus granulaire sur les appareils mobiles gérés. Vous pouvez appliquer des politiques de sécurité, des restrictions d'utilisation, des configurations réseau spécifiques, et même effacer à distance les données des appareils perdus ou volés. GLPI est plus centré sur la gestion des informations et des ressources, mais n'offre pas le même niveau de contrôle sur les appareils mobiles individuels.

3. Gestion de la mobilité d'entreprise (EMM) : De nombreux MDM fournissent également des fonctionnalités d'Enterprise Mobility Management (EMM) qui permettent de gérer efficacement les appareils mobiles dans un environnement professionnel. Cela inclut des fonctionnalités avancées telles que la séparation des données personnelles et professionnelles, le déploiement d'applications spécifiques à l'entreprise, l'intégration avec des services de messagerie d'entreprise, etc. Ces capacités spécifiques à la mobilité d'entreprise ne sont généralement pas présentes dans GLPI.

4. Support multiplateforme : Les MDM offrent une prise en charge étendue des différentes plateformes mobiles, y compris iOS, Android, Windows, etc. Cela permet de gérer de manière centralisée les dispositifs utilisant différents systèmes d'exploitation. GLPI, quant à lui, est plus orienté vers les ressources informatiques générales et ne propose pas la même prise en charge multiplateforme pour les appareils mobiles.

En résumé, un MDM est spécifiquement conçu pour la gestion des appareils mobiles, offrant des fonctionnalités spécialisées, un contrôle avancé et une gestion de la mobilité d'entreprise. GLPI est plus adapté à la gestion globale des ressources informatiques, y compris les ordinateurs, les serveurs, etc. Le choix entre les deux dépend des besoins spécifiques de gestion des dispositifs mobiles par rapport à la gestion des ressources informatiques globales.</div>

**Exemples**

- Microsoft Intune
- Mobile Device Manager Plus
- Meraki Systems Manager (Cisco)
- VMware Workspace ONE UEM

<a href="#toc">Retour en haut</a>

### 8. Types de VPN
<div class="is-question">**Expliquer tous les VPN (les types de VPN?)**</div>

Gwen: Site à site, Nomade

**Notes**

- VPN basé sur le protocole IPSec (Internet Protocol Security). Connection VPN sécurisée (auth, chiffrement, intégrité des données)
- VPN basé sur le protocole SSL/TLS (Secure Sockets Layer/Transport Layer Security). Protocoles de sécurité web pour connection sécurisée. Utilisé pour connection **point à point**.
- VPN basé sur protocole PPTP (Point-to-Point Tunneling Protocol). Protocole plus ancien. Moins sécurisé que IPSec et SSL/TLS.
- VPN basé sur le protocole L2TP (Layer 2 Tunneling Protocol). Combine les fonctionnalités de PPTP et de protocoles de stockage
- VPN basé sur le protocole OpenVPN. Protocole open source sécurisé. Utilise certificats + clé pour authentification et chiffrement des données. Peut fonctionner sur plusieurs ports, multi-plateformes. Couramment utilisé pour les solutions VPN.


**ChatGPT**

<div class="is-success">Il existe plusieurs types de VPN (Virtual Private Network) qui sont utilisés pour sécuriser les communications et permettre l'accès à distance à des réseaux privés. Voici les principaux types de VPN :

1. VPN basé sur le protocole IPsec (Internet Protocol Security) : IPsec est un protocole de sécurité largement utilisé pour établir des connexions VPN sécurisées. Il offre une authentification, un chiffrement et une intégrité des données pour sécuriser les communications sur un réseau public. Les VPN basés sur IPsec sont généralement utilisés pour des connexions point à point entre des réseaux locaux ou des appareils individuels.

2. VPN basé sur le protocole SSL/TLS (Secure Sockets Layer/Transport Layer Security) : Les VPN basés sur SSL/TLS utilisent des protocoles de sécurité web pour établir une connexion sécurisée. Ces VPN sont souvent utilisés pour permettre un accès distant aux ressources d'un réseau privé via un navigateur web. Ils sont couramment utilisés pour les applications d'accès à distance et de travail à distance.

3. VPN basé sur le protocole PPTP (Point-to-Point Tunneling Protocol) : PPTP est un protocole VPN plus ancien qui offre un moyen simple d'établir des connexions sécurisées. Il est souvent utilisé pour des connexions VPN entre des appareils individuels et des serveurs VPN. Cependant, PPTP est considéré comme moins sécurisé que les protocoles IPsec et SSL/TLS et n'est pas recommandé pour les environnements où la sécurité est une priorité.

4. VPN basé sur le protocole L2TP (Layer 2 Tunneling Protocol) : L2TP est un protocole VPN qui combine les fonctionnalités de PPTP et de protocoles de cryptage comme IPsec. Il est souvent utilisé en conjonction avec IPsec pour sécuriser les connexions VPN. L2TP/IPsec est couramment utilisé pour les connexions VPN entre des réseaux locaux et des utilisateurs distants.

5. VPN basé sur le protocole OpenVPN : OpenVPN est un protocole VPN open source et sécurisé. Il utilise des certificats et des clés pour l'authentification et le chiffrement des données. OpenVPN peut être configuré pour fonctionner sur différents ports et peut être utilisé sur plusieurs plates-formes, ce qui en fait un choix populaire pour les solutions VPN.

Ces types de VPN sont utilisés pour répondre à différents besoins en matière de sécurité, d'accès à distance et de connectivité. Le choix du type de VPN dépend des exigences spécifiques de votre réseau et de l'utilisation prévue du VPN.</div>


<a href="#toc">Retour en haut</a>

### 9. Switch
<div class="is-question">**Qu'est-ce qu'on peut voir sur un commutateur ?**</div>

Gwen: cette question est dans le questionnaire de Tati

Tati:

- la bande passante
- le port sur lequel est connecté + ip
- l'interface voir si elle est up ou down
- l'adresse MAC
- la charge éléctrique si c'est un switch PoE

ChatGPT:

- ports ethernet (combien de ports?)
- état des ports (activé ou non, up ou down)
- activité du trafic (données transmises)
- adresse MAC (table d'adresses MAC)
- stat de performances (ex. collision de paquets, erreurs de transmission)
- configuration et gestion (CLI ou GUI)


**ChatGPT**

<div class="is-success">Sur un commutateur réseau, on peut généralement voir les éléments suivants :

1. Ports Ethernet : Les commutateurs réseau sont équipés de plusieurs ports Ethernet où les périphériques réseau tels que les ordinateurs, les serveurs, les imprimantes, les téléphones IP, etc., peuvent être connectés. Chaque port est numéroté et peut être utilisé pour connecter un appareil au réseau.

2. État des ports : Les commutateurs réseau affichent l'état de chaque port, indiquant s'ils sont activés, désactivés ou s'ils ont une connectivité réseau.

3. Activité du trafic : Les commutateurs peuvent afficher l'activité du trafic sur chaque port, indiquant si des données sont transmises ou reçues. Cela peut être utile pour diagnostiquer des problèmes de connectivité ou pour surveiller l'utilisation du réseau.

4. Adresse MAC : Les commutateurs maintiennent des tables d'adresses MAC (Media Access Control) qui associent les adresses MAC des périphériques connectés à leurs ports respectifs. Ces tables sont utilisées pour acheminer efficacement les paquets réseau vers les destinations appropriées.

5. Statistiques de performances : Certains commutateurs peuvent fournir des statistiques de performances telles que la bande passante utilisée, les collisions de paquets, les erreurs de transmission, etc., permettant de surveiller l'état et les performances du réseau.

6. Configuration et gestion : Les commutateurs peuvent être gérés via une interface de ligne de commande (CLI) ou une interface graphique (GUI) pour effectuer des opérations de configuration, telles que la création de VLAN (Virtual Local Area Network), la configuration des paramètres de sécurité, la gestion des listes de contrôle d'accès (ACL), etc.

Il est important de noter que les fonctionnalités et les informations affichées peuvent varier selon le modèle et le fabricant du commutateur. Les commutateurs réseau plus avancés peuvent également offrir des fonctionnalités supplémentaires, telles que la prise en charge de la qualité de service (QoS), la gestion de la puissance PoE (Power over Ethernet), la redondance de lien, etc.</div>


<a href="#toc">Retour en haut</a>

### 10. Certificats : définition
<div class="is-question">**Certificats: qu'est ce que ça sécurise ?**</div>

Bien connaître les certificats. Le jury a posé 2 questions dessus.

Jury a demandé "qu'est-ce que ça sécurise ?"

Réponse: ex. un site russe qui demande la carte bancaire est sécurisé... Ca signifie que c'est chiffré entre l'opérateur jusqu'au site internet mais après on peut mettre tout ce qu'on veut dans le site internet.

<a href="#toc">Retour en haut</a>

### 11. Certificats : HTTPS
<div class="is-question">**Certificat : Quoi mettre en place pour avoir un HTTPS**</div>

Gwen: ?

Moi: mettre en place le protocole SSL...

Chat:

1. obtenir un certificat SSL/TLS auprès d'une authorité de certification (ex. Let's Encrypt)
2. installer le certificat sur le serveur
3. configurer le serveur web pour utiliser le certificat et activer le support HTTPS


**ChatGPT** (attention, bullshit sur la fin !)

<div class="is-success">Pour mettre en place le protocole HTTPS (Hypertext Transfer Protocol Secure) sur un site Web, voici les étapes générales à suivre :

1. Obtenez un certificat SSL/TLS : Un certificat SSL/TLS est nécessaire pour activer le chiffrement et établir une connexion sécurisée. Vous pouvez obtenir un certificat auprès d'une autorité de certification (CA) reconnue ou utiliser des solutions gratuites telles que Let's Encrypt.

2. Installez le certificat sur votre serveur : Suivez les instructions fournies par votre fournisseur de certificats pour installer le certificat sur votre serveur web. Cela implique généralement de générer une paire de clés (clé privée et clé publique) et d'associer le certificat à votre nom de domaine.

3. Configurez votre serveur web : Vous devez configurer votre serveur web (par exemple, Apache, Nginx) pour utiliser le certificat SSL/TLS et activer le support HTTPS. Cela implique de modifier les fichiers de configuration du serveur pour spécifier le chemin vers le certificat et les options de chiffrement.

4. Redirigez le trafic HTTP vers HTTPS : Vous pouvez configurer votre serveur web pour rediriger automatiquement tout le trafic HTTP vers HTTPS. Cela garantit que les utilisateurs accèdent toujours à votre site via une connexion sécurisée.

5. Vérifiez la configuration : Une fois la configuration terminée, effectuez des tests pour vous assurer que tout fonctionne correctement. Vérifiez si votre site est accessible via HTTPS et assurez-vous que le certificat est valide et correctement installé.

6. Mettez à jour les liens internes : Si vous avez des liens internes dans votre site web (par exemple, des liens vers des images, des fichiers CSS, etc.), assurez-vous de les mettre à jour pour qu'ils utilisent des URL HTTPS au lieu de HTTP.

7. Mettez à jour vos ressources externes : Si votre site web intègre des ressources externes provenant d'autres domaines (par exemple, des scripts, des images, des vidéos), assurez-vous que ces ressources sont également accessibles via HTTPS.

Une fois que vous avez suivi ces étapes, votre site web sera accessible via HTTPS, et les communications entre les utilisateurs et votre serveur seront chiffrées, offrant ainsi une connexion sécurisée.</div>


<a href="#toc">Retour en haut</a>

### 12. Hyper-V / vSphere saturé
<div class="is-question">**Expliquer comment faire qd on a un hyper-v avec le DRS de vSphere rempli dans une VM**</div>

Il y a un schéma.

Gwen: j'ai expliqué qu'on peut créer une nouvelle machine pour diviser les ressources et faire plus de place. Vu que le jury ne m'a pas reposer la question, j'imagine que c'était la bonne réponse.

Chat:

1. vérifier les ressources allouées
2. vérifier les paramètres de DRS (Distributed Resource Scheduler)
3. analyser les performances avec des outils de surveillance 
4. répartir manuellement les VM : si le DRS ne parvient pas à équilibrer les charges de travail, on peut répartir manuellement les VM sur différents hôtes Hyper-V pour soulager la charge. Il faudra alors migrer les VM d'un hôte à un autre avec des outils de migration direct (live migration) ou hors-ligne (offline migration) d'Hyper-V
5. ajouter des ressources ou mettre à niveau 
6. problèmes de configuration ?

**ChatGPT**

<div class="is-success">Si vous avez un environnement Hyper-V avec le DRS (Distributed Resource Scheduler) de vSphere rempli dans une machine virtuelle, cela peut indiquer un problème de configuration ou de ressources insuffisantes. Voici quelques étapes que vous pouvez suivre pour résoudre ce problème :

1. Vérifiez les ressources allouées : Assurez-vous que la machine virtuelle dispose des ressources adéquates, telles que la mémoire, le processeur et l'espace de stockage. Si les ressources sont insuffisantes, augmentez-les pour répondre aux besoins de la machine virtuelle.

2. Vérifiez les paramètres de DRS : Assurez-vous que les paramètres de DRS sont correctement configurés. DRS est conçu pour répartir les charges de travail de manière équilibrée sur les hôtes Hyper-V. Vérifiez les règles de DRS, les seuils de performances et les paramètres de planification pour vous assurer qu'ils correspondent aux besoins de votre environnement.

3. Analysez les performances : Utilisez des outils de surveillance des performances pour analyser les métriques de performance de la machine virtuelle et des hôtes Hyper-V. Identifiez les goulots d'étranglement ou les problèmes de performances qui pourraient entraîner une utilisation excessive des ressources et une saturation du DRS.

4. Répartissez manuellement les machines virtuelles : Si le DRS ne parvient pas à équilibrer automatiquement les charges de travail, vous pouvez répartir manuellement les machines virtuelles sur différents hôtes Hyper-V pour soulager la charge. Cela peut impliquer de migrer manuellement les machines virtuelles d'un hôte à un autre à l'aide des fonctionnalités de migration en direct (live migration) ou hors ligne (offline migration) d'Hyper-V.

5. Ajoutez des ressources ou mettez à niveau : Si les ressources existantes ne suffisent pas à gérer la charge de travail de la machine virtuelle, envisagez d'ajouter des ressources supplémentaires à l'hôte Hyper-V ou de mettre à niveau l'hôte vers un modèle plus puissant pour mieux répondre aux exigences de performance.

6. Identifiez les problèmes de configuration : Vérifiez si la configuration de la machine virtuelle, telle que les paramètres de démarrage automatique des applications, les services en cours d'exécution ou les tâches planifiées, peut provoquer une utilisation excessive des ressources.

Si les problèmes persistent malgré ces actions, il peut être utile de consulter les forums de support dédiés à Hyper-V ou de contacter le support technique pour obtenir une assistance plus spécifique à votre environnement.</div>


<a href="#toc">Retour en haut</a>

### 13. Types déploiements
<div class="is-question">**Expliquer les différents types de déploiement**</div>

Gwen: ils attendent les sigles MDT, WDS et clé USB

Chat: hors-sujet. 


<a href="#toc">Retour en haut</a>

### 14. Analyse de trame
Gwen: fastoche. Jury a demandé la définition de TTL (Time To Live).

Moi: euh... a faire au moins une fois 


<a href="#toc">Retour en haut</a>

### 15. Appli prise en main à distance
<div class="is-question">**Quelles sont les applications que vous utilisez pour prendre en main à distance**</div>

- TeamViewer
- AnyDesk
- Remmina
- Bureau à distance

<a href="#toc">Retour en haut</a>

### 16. Schéma serveur proxy + reverse-proxy
Gwen: je vous laisse chercher la réponse

Moi: 

- proxy se met entre client réseau local et internet, sert à filtrer les connections sortantes
- reverse proxy se met entre internet et le reseau local, sert à filtrer les connections entrantes. Ex. on a plusieurs serveurs web, le reverse-proxy permet de filtrer les connections entrantes et faire du load-balancing (répartir les connections sur les différents serveurs web)

https://www.it-connect.fr/les-serveurs-proxy-et-reverse-proxy-pour-les-debutants/


<a href="#toc">Retour en haut</a>

### 17. Cable cat.6 UPT
<div class="is-question">**Expliquer ce qu'est un câble de catégorie 6 UTP. Que signifie "UTP" ?**</div>

Gwen: jury a demandé ce que signifie UTP ?

Moi: cable éthernet RJ45 pour débit allant jusqu'à 10 Gbit/s. Non blindé.

UTP = Unshielded Twisted Pair, meaning pas de blindage autour des paires de fils. Au lieu de blindage, les paires de fils sont torsadées pour réduire les interférences électromagnétiques et la diaphonie (crosstalk) entre les paires adjacentes.


**ChatGPT**

<div class="is-success">Un câble de catégorie 6 UTP (Unshielded Twisted Pair) est un type de câble Ethernet utilisé pour la transmission de données à haute vitesse sur des réseaux locaux (LAN). Voici quelques caractéristiques principales du câble de catégorie 6 UTP :

1. Débit et bande passante : Le câble de catégorie 6 UTP est conçu pour prendre en charge des débits de données allant jusqu'à 10 Gbps (gigabits par seconde) sur des distances allant jusqu'à 55 mètres. Il offre une bande passante plus élevée que les câbles de catégorie précédente, tels que le catégorie 5e.

2. Paires torsadées non blindées : UTP signifie "Unshielded Twisted Pair", ce qui signifie qu'il n'y a pas de blindage métallique autour des paires de fils. Au lieu de cela, les paires de fils sont torsadées pour réduire les interférences électromagnétiques (EMI) et la diaphonie (cross-talk) entre les paires adjacentes.

3. Connecteurs RJ-45 : Les câbles de catégorie 6 UTP utilisent des connecteurs RJ-45, qui sont largement répandus et compatibles avec la plupart des équipements réseau couramment utilisés.

4. Distances de transmission : Le câble de catégorie 6 UTP est conçu pour des distances de transmission allant jusqu'à 100 mètres pour des débits de données allant jusqu'à 1 Gbps. Pour des débits de données plus élevés, tels que 10 Gbps, la distance maximale est réduite à 55 mètres.

5. Compatibilité descendante : Les câbles de catégorie 6 UTP sont rétrocompatibles avec les équipements réseau utilisant des câbles de catégorie inférieure, tels que le catégorie 5e. Cependant, pour atteindre les performances maximales de la catégorie 6, il est recommandé d'utiliser des équipements réseau compatibles avec la catégorie 6.

Le câble de catégorie 6 UTP est largement utilisé dans les environnements réseau professionnels pour les applications nécessitant une bande passante élevée, telles que les réseaux d'entreprise, les centres de données, les salles de serveurs et les installations de vidéosurveillance IP. Il offre des performances améliorées par rapport aux câbles de catégorie inférieure et constitue un choix courant pour les réseaux Gigabit Ethernet et les déploiements à haute densité de données.</div>

<a href="#toc">Retour en haut</a>

### 18. Expliquer le cryptage asymétrique ou symétrique
Gwen: voir clé de chiffrement

Tati: Asymétrique : clé publique/clé privée. Symétrique : même clé pour le chiffrement/déchiffrement 

**ChatGPT**

<div class="is-success">Le cryptage asymétrique et le cryptage symétrique sont deux méthodes de cryptographie utilisées pour chiffrer et déchiffrer des données de manière sécurisée. Voici une explication de chaque méthode :

1. Cryptage symétrique :
Le cryptage symétrique, également appelé cryptographie à clé secrète, utilise une clé unique pour chiffrer et déchiffrer les données. La même clé est utilisée à la fois par l'émetteur et le destinataire des données. Voici les étapes du processus de cryptage symétrique :

- Étape 1 : L'émetteur et le destinataire conviennent d'une clé secrète avant la communication.
- Étape 2 : L'émetteur utilise cette clé secrète pour chiffrer les données.
- Étape 3 : L'émetteur envoie les données chiffrées au destinataire via un canal de communication.
- Étape 4 : Le destinataire utilise la même clé secrète pour déchiffrer les données et les rendre à leur forme originale.

Le cryptage symétrique est généralement plus rapide et efficace que le cryptage asymétrique car il nécessite moins de calculs. Cependant, il pose le défi de la distribution sécurisée de la clé secrète entre les parties concernées.

2. Cryptage asymétrique :
Le cryptage asymétrique, également connu sous le nom de cryptographie à clé publique, utilise une paire de clés distinctes : une clé publique et une clé privée. La clé publique est utilisée pour chiffrer les données, tandis que la clé privée correspondante est utilisée pour déchiffrer les données. Voici les étapes du processus de cryptage asymétrique :

- Étape 1 : Le destinataire génère une paire de clés (clé publique et clé privée).
- Étape 2 : Le destinataire diffuse la clé publique au public tandis que la clé privée reste confidentielle.
- Étape 3 : L'émetteur utilise la clé publique du destinataire pour chiffrer les données.
- Étape 4 : L'émetteur envoie les données chiffrées au destinataire via un canal de communication.
- Étape 5 : Le destinataire utilise sa clé privée pour déchiffrer les données et les rendre à leur forme originale.

Le cryptage asymétrique est plus sécurisé que le cryptage symétrique car la clé privée n'est jamais partagée ou exposée, tandis que la clé publique peut être distribuée librement. Cela permet des communications sécurisées même lorsque les parties ne se sont jamais rencontrées auparavant. Cependant, le cryptage asymétrique est généralement plus lent et nécessite plus de puissance de calcul.

En pratique, une combinaison des deux méthodes est souvent utilisée, où le cryptage symétrique est utilisé pour chiffrer les données réelles, tandis que le cryptage asymétrique est utilisé pour échanger et protéger la clé symétrique. Cela combine l'efficacité du cryptage symétrique avec la sécurité du cryptage asymétrique.</div>


<a href="#toc">Retour en haut</a>

### 19. Différence entre Remote Desktop et Remote App
Moi: Remote Desktop : on se connecte à une machine via RDP ex. Bureau à Distance, TeamViewer. Remote App : on passe par une interface web (ex. ?)

Chat: Faux. Remote Desktop : on accède à l'intégralité du bureau d'un ordinateur distant. Remote App : on accède à distance à des applications spécifiques exécutées sur un ordi distant, plutot que d'acceder à l'integralité du bureau. Ex. accès à une CRM, accès à un RDS (?)

Donner un exemple ? 


<a href="#toc">Retour en haut</a>

### 20. Question SLA
<div class="is-question">**Un client doit faire le point avec un fournisseur sur les services fournis, quelle est la méthodologie ?**</div>

Gwen: le jury attendait "SLA"

Revoir ce qu'est le SLA...

Chat: 

1. etablir les objectif et les attentes
2. preparer la réunion
3. planifier la reunion
4. tenir la reunion
5. examiner les mesures correctives (màj SLA)
6. suivre et évaluer
7. documenter

Moi:

Revoir le cours d'ITIL vite fait, mais je sens le méga bullshit encore. Examiner ce qu'est un SLA... Me faire ma propre réponse.


**ChatGPT**

<div class="is-success">Selon ITIL (Information Technology Infrastructure Library), une méthodologie couramment utilisée pour la gestion des services informatiques, la démarche recommandée pour faire le point avec un fournisseur de services serait de suivre les étapes suivantes :

1. Établir les objectifs et les attentes : Définissez clairement les objectifs de la réunion et les attentes de votre entreprise par rapport aux services fournis par le fournisseur. Identifiez les domaines qui nécessitent une évaluation et une discussion approfondies.

2. Préparer la réunion : Rassemblez toutes les informations pertinentes sur les services fournis, y compris les accords de niveau de service (SLA), les rapports de performance, les incidents antérieurs, les demandes de changement, etc. Identifiez les problèmes ou les préoccupations spécifiques que vous souhaitez aborder lors de la réunion.

3. Planifier la réunion : Fixez une date et une heure pour la réunion avec le fournisseur. Assurez-vous que les personnes clés de votre entreprise et du fournisseur seront présentes. Préparez un ordre du jour détaillé pour la réunion en incluant les sujets spécifiques à aborder.

4. Tenir la réunion : Lors de la réunion, commencez par partager les objectifs et les attentes de la réunion. Discutez des performances du fournisseur par rapport aux SLA convenus. Abordez les problèmes, les incidents ou les demandes de changement spécifiques qui nécessitent une attention particulière. Écoutez les points de vue du fournisseur et échangez des informations de manière constructive.

5. Examiner les mesures correctives : Si des problèmes ou des préoccupations sont identifiés lors de la réunion, discutez des mesures correctives nécessaires pour les résoudre. Déterminez les actions à entreprendre, les responsabilités et les délais. Si nécessaire, convenez de la mise à jour des SLA ou d'autres accords contractuels.

6. Suivre et évaluer : Suivez la mise en œuvre des actions convenues et évaluez les résultats. Assurez-vous que les problèmes identifiés sont résolus de manière satisfaisante et que les services fournis sont alignés sur les attentes de votre entreprise.

7. Documenter : Enregistrez les discussions, les accords et les actions convenues dans un compte rendu de réunion ou un système de gestion des problèmes/incidents. Cela vous permettra de référencer les décisions prises et de suivre les progrès réalisés.

En suivant cette méthodologie, vous pouvez établir un cadre structuré pour faire le point avec votre fournisseur de services, faciliter la communication et la résolution des problèmes, et améliorer la satisfaction globale par rapport aux services fournis.</div>


<a href="#toc">Retour en haut</a>

### 21. Table de routage: trouver l'ip du routeur, gateway et broadcast
Revoir de quoi à l'air une table de routage

<a href="#toc">Retour en haut</a>

### 22. Linux: trouver une variable dans un script
Gwen : 

- Trouver la "variable de l'emplacement d'un site web" dans un script bash.
- La variable était "ROOT", sans le `$` (???)

Moi: ça devrait pas être trop dur...

<a href="#toc">Retour en haut</a>

### 23. Pourquoi vm win7 x86 n'utilise pas tout le disque ?
**Sur un serveur de déploiement (schéma), pourquoi des 6 Go (sic) ne pas totalement employés des PC déployés ?**

Gwen: et on voyait sur l'image qu'il déployait des Win7 en x86 (dont 32 bits). Win7 x32bits ne sait pas utiliser des disques de plus de 4 Go.

<a href="#toc">Retour en haut</a>

### 24. Expliquer les deux couches matérielle dans le schéma

<a href=".ressources/img/g04.png" target="_blank">
<img src=".ressources/img/g04.png" alt="g04">
</a>

Moi: Ce schéma pourrait être celui d'un hyperviseur de type 2 (ou hyperviseur hébergé). La couche matérielle du bas symbolise le matériel physique sur lequel est installé la couche logicielle (par exemple VMware Workstation). Cette couche logicielle est utilisé pour émulé du matériel (ex. des machines virtuelles) sur lesquelles on vient installé des systèmes d'exploitation (ex. un Debian ou un Windows Server).

<a href="#toc">Retour en haut</a>

### 25. Avantages Disponibilité des VM
<div class="is-question">**Quels sont les avantages de la disponibilité pour les machines virtuelles ?**</div>

Gwen: il y avait 2 disponibilités différentes, il fallait les expliquer. Je me souviens de la **haute disponibilité**, mais l'autre je ne sais plus.

Moi: euh...

Chat:

1. **haute dispo** : en cas de défaillance matérielle ou logicielle d'un hôte physique sur lequel une vm est exécutée, celle-ci peut être automatiquement redémarrée ou migrée vers un autre hôte sans interruption de service.

2. **migration à chaud** : permet de migrer des VM à chaud d'un hôte physique à un autre, même lorsqu'elles sont en cours d'exécution. Utile pour faire des opérations de maintenance sans interrompre le service.

3. **équlibrage de charge** : les vm peuvent être réparties sur plusieurs hôtes physiques pour équilibrer la charge de travail. Permet d'optimisez l'utilisation des ressources disponibles et d'améliorer les performances globales du système.

4. **Evolutivité** : facile de créer de nouvelles vm ou d'ajuster les ressources allouées. 

5. **Gestion centralisée** : avec aide de plateformes telles que vSphere, Hyper-V, KVM

<a href="#toc">Retour en haut</a>

### 26. Dans VMware, donner les différents type de connection

Gwen: bridge, NAT et host-only. Le jury a demandé la différence entre NAT et bridge, je me suis plantée.

Moi: Bridge, NAT, Host-Only, Custom

**ChatGPT**

<div class="is-success">NAT (Network Address Translation) et Bridge sont deux concepts liés à la mise en réseau utilisés dans la virtualisation et les environnements réseau. Voici la différence entre les deux :

1. NAT (Network Address Translation) :
   - NAT est une technique de traduction d'adresses réseau qui permet de connecter un réseau local (par exemple, une machine virtuelle) à un réseau externe (par exemple, Internet) en utilisant une seule adresse IP publique.
   - Dans un réseau NAT, une adresse IP publique est attribuée au routeur ou au serveur NAT, qui traduit les adresses IP privées des machines virtuelles du réseau local vers cette adresse IP publique lorsqu'elles communiquent avec des ressources externes.
   - NAT permet de masquer les adresses IP privées des machines virtuelles et de les regrouper derrière une seule adresse IP publique, offrant ainsi une certaine sécurité et une économie d'adresses IP.
   - Cependant, avec NAT, les machines virtuelles du réseau local ne sont pas directement visibles depuis l'extérieur du réseau, ce qui peut limiter certaines fonctionnalités et empêcher l'accès à certaines ressources réseau.

2. Bridge (Pont) :
   - Un pont réseau, également appelé bridge, est utilisé pour connecter plusieurs réseaux locaux (par exemple, des machines virtuelles) afin qu'ils puissent communiquer directement les uns avec les autres.
   - Dans un réseau en pont, les interfaces réseau des machines virtuelles sont liées à une interface de pont, ce qui permet aux machines virtuelles de partager le même réseau logique.
   - Le pontage permet aux machines virtuelles de communiquer entre elles et avec d'autres appareils du réseau local, comme s'ils étaient directement connectés au même réseau physique.
   - Contrairement à NAT, le pontage ne modifie pas les adresses IP des machines virtuelles et permet une communication transparente avec les ressources externes et autres appareils du réseau.

En résumé, NAT est utilisé pour traduire les adresses IP privées des machines virtuelles en une seule adresse IP publique, tandis que le pontage (bridge) permet de connecter plusieurs machines virtuelles pour qu'elles puissent communiquer directement entre elles et avec d'autres appareils du réseau local sans modification des adresses IP.</div>

<a href="#toc">Retour en haut</a>

## PASSAGE avec le JURY

3 mises en pratique

<a href="#toc">Retour en haut</a>

### MSP1. Ticket GLPI : pb connection
<div class="is-question">Une personne a laissé un ticket sur GLPI pour me dire qu'elle n'arrive plus à se connecter.</div>

Gwen: 

- il fallait l'appeler pour cibler où elle était bloquée. 
- Puis la faire retaper son mdp en mode clair (?)
- Puis réinit son mdp dans l'AD

Moi: "mode clair" ?

<a href="#toc">Retour en haut</a>

### MSP2. Ajouter un disque sur une VM, en interface web

Moi: chercher de quelle interface web il peut s'agir ? ESXi ? Hyper-V ? vSphere ?


<a href="#toc">Retour en haut</a>

### MSP3. ???

Gwen : j'ai oublié mais c'était bateau.

<a href="#toc">Retour en haut</a>

## Questions techniques

<a href="#toc">Retour en haut</a>

### Q1 : quelle différence entre clone et snapshot

Chat:

- snapshot : copie instantannée d'un état à un moment précis. Point de restauration
- clone : copie complète et autonome d'une VM. Peut être déployé


**ChatGPT**

<div class="is-success">Dans VMware Workstation, les snapshots et les clones sont deux fonctionnalités distinctes pour la gestion des machines virtuelles. Voici les différences entre les deux :

1. Snapshot :
   - Un snapshot est une copie instantanée de l'état actuel d'une machine virtuelle à un moment précis. Il capture l'état de tous les fichiers, des paramètres, de la mémoire et des disques virtuels de la machine virtuelle.
   - Les snapshots permettent de capturer un point de restauration pour une machine virtuelle. Vous pouvez créer un snapshot avant de faire des modifications majeures, telles que l'installation d'un logiciel, la modification des paramètres système, etc.
   - Lorsque vous prenez un snapshot, vous pouvez continuer à travailler sur la machine virtuelle dans son état actuel, tandis que le snapshot enregistre l'état précédent. Si vous rencontrez des problèmes ou souhaitez revenir à l'état précédent, vous pouvez restaurer la machine virtuelle à partir du snapshot enregistré.
   - Les snapshots peuvent également être utilisés pour créer une chaîne de snapshots, vous permettant ainsi de restaurer la machine virtuelle à différents points dans le temps.

2. Clone :
   - Un clone est une copie complète et autonome d'une machine virtuelle existante. Il crée une réplique indépendante de la machine virtuelle source, y compris tous les fichiers, paramètres, disques virtuels, etc.
   - Un clone peut être utilisé pour déployer rapidement plusieurs instances identiques d'une machine virtuelle. Chaque clone fonctionne indépendamment des autres, avec son propre ensemble de ressources et de paramètres.
   - Contrairement aux snapshots, les clones ne sont pas liés à l'état actuel de la machine virtuelle source. Ils sont créés comme des machines virtuelles distinctes et fonctionnent de manière autonome.
   - Les clones peuvent être personnalisés après leur création, tels que la modification des paramètres réseau, l'ajout de logiciels supplémentaires, etc.

En résumé, les snapshots capturent un état spécifique d'une machine virtuelle à un moment donné, vous permettant de revenir à cet état ultérieurement. Les clones sont des répliques indépendantes et autonomes d'une machine virtuelle, pouvant être déployées comme des instances distinctes. Les snapshots sont utiles pour les restaurations rapides et les tests, tandis que les clones sont utiles pour le déploiement de plusieurs instances identiques.</div>

<a href="#toc">Retour en haut</a>

### Q2 : Comment faites-vous votre veille techno ?
Gwen: Veulent entendre "it-connect.fr" et savoir quels sujets m'intéressent

Moi: twitter + inoreader

- it-connect?fr
- bytebytego
- Mathis Hammel (fondateur Codingame)
- Nicholas Krassas
- \_MG

<a href="#toc">Retour en haut</a>

## NOTES

- 1. revoir ce qu'est une règle pfSense.
- 3. revoir syslog, serveur syslog, rsyslog
- 4. refaire un definition de $PATH propre et personnelle
- 6. tableau tcp/ip à connaître, à refaire dans drawio
- 7. "MDM pour mobiles" ? Ses avantages ?
- 8. Les types de VPN. Retrouver dans le cours.
- 9. Revoir cours de la vieille folle. 
- 10/11. revoir les certificats
- 12. DRS/HyperV ??? Relire cours virtualisation ?
- 13. Revoir cours RDS/WDT pour les types de déploiement
- 14. Analyse de trame à voir
- 15. Appli de prise en main à distance (facile)
- 16. Proxy & reverse proxy
- 17. cable cat.6 UTP
- 18. revoir clé (cryptage sym/asymétrique)
- 19. difference remote desktop et remote app
- 20. revoir SLA. Me faire ma propre réponse à cette question
- 21. revoir de quoi a l'air une table de routage, id ip broadcast gateway et routeur (pas la même chose que gateway ?)
- 22. trouver une variable dans un script bash
- 23. revoir serveur déploiement ? => WDT, RDS, etc.
- 24. expliquer couches matérielle, revoir cours virtualisation
- 25. dispo des VM ? revoir cours virtualisation
- 26. diff type de co dans vmware : bridge, nat, host-only. Diff entre NAT et bridge ?
- MSP1: ticket glpi RAS
- MSP2: ajout disque à VM via interface web. Trouver laquelle
- MSP3: ??? mais bateau
- Bonus1: diff clone vs snapshot
- Bonus2: veille techno. Citer ses sources ! it-connect, bytebytego, krassas, matthieu hammel (codingame) 

<link rel="stylesheet" type="text/css" href=".ressources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/style.css">
<link rel="stylesheet" type="text/css" href=".ressources/css/headings.css">


<style>
.is-success {	
	font-family: Roboto, sans-serif;

	font-style: normal;
	font-variant: normal;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 24px;
	text-decoration: rgb(27, 94, 32);
	text-align: start;
	text-indent: 0px;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;
	word-spacing: 0px;
	
	background-attachment: scroll;
	background-color: rgb(232, 245, 233);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: no-repeat;
	color: rgb(27, 94, 32);
	
	border: ;
	border-top: 0px none rgb(129, 199, 132);
	border-right: 0px none rgb(129, 199, 132);
	border-bottom: 0px none rgb(129, 199, 132);
	border-left: 55px solid rgb(129, 199, 132);
	margin: 16px 0px;
	padding: 0px 16px 16px;
	max-height: none;
	min-height: 0px;
	max-width: none;
	min-width: 0px;
	
	position: relative;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
	float: none;
	display: block;
	clear: none;
	z-index: auto;
	
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;
	
	border-collapse: separate;
	border-spacing: 0px 0px;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;
	
	overflow: visible;
	cursor: auto;
	visibility: visible;
	
	transform: none;
	transition: all 0s ease 0s;
	box-sizing: border-box;
	resize: none;
	text-shadow: none;
	text-overflow: clip;
	word-wrap: normal;
	box-shadow: none;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
}

.is-question {	
	font-family: Roboto, sans-serif;

	font-style: normal;
	font-variant: normal;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 24px;
	text-decoration: rgb(13, 71, 161);
	text-align: start;
	text-indent: 0px;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;
	word-spacing: 0px;
	
	background-attachment: scroll;
	background-color: rgb(227, 242, 253);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: no-repeat;
	color: rgb(13, 71, 161);
	
	border: ;
	border-top: 0px none rgb(100, 181, 246);
	border-right: 0px none rgb(100, 181, 246);
	border-bottom: 0px none rgb(100, 181, 246);
	border-left: 55px solid rgb(100, 181, 246);
	margin: 16px 0px;
	padding: 0px 16px 16px;
	max-height: none;
	min-height: 0px;
	max-width: none;
	min-width: 0px;
	
	position: relative;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
	float: none;
	display: block;
	clear: none;
	z-index: auto;
	
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;
	
	border-collapse: separate;
	border-spacing: 0px 0px;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;
	
	overflow: visible;
	cursor: auto;
	visibility: visible;
	
	transform: none;
	transition: all 0s ease 0s;
	box-sizing: border-box;
	resize: none;
	text-shadow: none;
	text-overflow: clip;
	word-wrap: normal;
	box-shadow: none;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
}

</style>
