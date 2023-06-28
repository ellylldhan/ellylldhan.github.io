- M01 Intro

- M02 Réseaux
	+ naviguer sous ios
		* principaux modes de commandes
		* modes de configuration et sous-modes de configuration
		* navigation entre les différents modes 
	+ La structure des commandes
		* la structure des commandes ios de base 
		* fonctionnalités d'aide d'ios 
		* touches d'accès rapide et raccourcis clavier
	+ configuration de base 
		* supprimer le nom 
		* sécuriser l'accès au mode d'execution utilisateur 
		* sécuriser l'accès au mode d'execution privilégié 
		* sécuriser l'accès à la ligne vty 
		* rappel : recommandation sur la création de mot de passe ANSSI 
		* chiffrer les mots de passe 
		* communiquer 
	+ Enregistrement des configurations
		* Routeur / démarrage 
		* fichiers de configuration 
		* copier la configuration 
	+ configuration de l'adressage IP 
		* configurer une adresse IP et un masque de sous-réseau 
	+ TP Packet Tracer
		* 1. learn to use PT 
		* 2. navigating the IOS 
		* 3. using the cisco IOS show commands 
		* 4. implementing basic connectivity 
		* 5. configure initial router settings 

- M03 VLAN ("Le Commutateur")
	+ VLAN Virtual Local Area Network 
		* présentation des VLAN
		* types de VLAN 
	+ configuration de VLAN 
		* commandes de création de VLAN 
		* exemple de création de VLAN 
		* commandes d'attribution de port à des VLAN
		* exemple de VLAN de données et de voix 
		* vérifier les informations sur les vlan
	+ trunk
		* vlan dans un env à plusieurs commutateurs 
		* commandes de configuration de trunk 
		* vérifier la configuration du trunk 
	+ TP Packet Tracer 
		* 3.3.12 VLAN configuration	
		* 3.4.5  Configure trunk
	+ Sécurité des ports 
		* mettre en oeuvre la sécurité des ports 
	+ Accès à distance sécurisé
		* fonctionnement de SSH 
		* configurer ssh 
	+ TP Packet Tracer
		* 16.4.6  Configure Secure Password and SSH
		* 5.2.2.7 configuring switch port security 
		* 5.2.2.8 Troubleshooting switch port security 
		* 11.6.1  Switch security configuration 
	
- M03ex Securité des ports
	+ Mettre en oeuvre la sécurité des ports
		* Ports inutilisés sécurisés
		* Atténuer les attaques de table d'adresses MAC
		* Activer la sécurité des ports
		* Limiter le nombre d’adresses MAC
		* Modes de violation de la sécurité des ports
		* Ports en état désactivé par erreur
		* Vérifier la sécurité des ports

- M04 Routeur
	+ Configuration de base 
		* configurer les interfaces du routeur 
	+ Routage statique
		* principe
		* types de routes 
		* configurer les routes statiques par défaut 
		* création d'une route statique 
		* table de routage IP 
	+ Métrique et distance administrative
		* distance par type de route 
		* vérifier les réseaux directement connectés
	+ TP Packet Tracer 
		* 10.1.4 Configure initial router settings
		* 10.3.5 Troubleshoot default gateway issues
		* 13.2.6 Verify IPv4 & IPv6 addressing 
		* 15.6.1 Configure IPv4 and IPv6 static and default routes
	+ Fonctionnement du routage inter-vlan 
		* Routage inter-vlan router-on-a-stick 
			- scénario
			- configuration de la sous-interface 
			- vérification du routage
	+ TP Packet Tracer
		* 4.2.7 Configure router-on-a-stick inter-vlan routing
	+ RIP
		* carte d'indentité de RIP 
		* fonctionnement / algorithme 
		* routage / table
		* routage / RIP 
	+ TP Packet Tracer
		* 3.2.1.8 Configuring RIPv2

- M04ex RIP v2
	+ 3.2 Protocole RIPv2
		* Configuration du protocole RIP
			- Mode de configuration RIP du routeur
			- La vérification du routage RIP
			- Activer et vérifier le protocole RIPv2
			- Désactiver la fonction de récapitulation automatique
			- Configurer des interfaces passives
			- La propagation d'une route par défaut

- M04ex Routage statique
	+ Configuration des routes statiques IPv4
		* La configuration d'une route statique connectée directement
		* La configuration d'une route statique de tronçon suivant
		* La configuration d'une route statique entièrement spécifiée
	+ Configuration des routes statiques par défaut
		* La configuration d'une route statique IPv4 par défaut
		* La configuration d'une route statique IPv6 par défaut


- M05 Securité
    + Hygiène informatique 
        * Définitions
        * Guide d'hygiène informatique
        * Sécurité avec l'ANSSI et CyberEDU
        * Politique de sécurité
        * Convention de nommage
        * Liste de ports
    + Objectif des listes de contrôle d'accès (ACL Access Control List)
        * Définition d'une ACL
        * Filtrage des paquets
        * Fonctionnement des ACL
    + Masques génériques dans les ACL
        * Wildcard Mask
        * Types de masques génériques
        * Les mots-clés des masques génériques
        * Directives sur la création des ACL
        * Types des ACL IPv4
        * Configurer les ACL IPv4 standard 
        * Configurer les ACL IPv4 standard numérotées
    + Sécuriser les ports VTY à l'aide d'une ACL IPv4 standard
        * la commande `access-class`
        * exemple d'accès sécurisé aux VTY
        * vérifier la sécurité du port VTY
    + TP Packet Tracer
        * 5.1.8  Configure numbered standard IPv4 ACL 
        * 5.1.9  Configure named standard IPv4 ACL
        * 5.4.12 Configure extended IPv4 ACL - Scenario 1
    + Caractéristiques de la NAT 
        * Définition NAT 
        * NAT Statique 
            - TP Packet Tracer 6.4.5 Configure static NAT
            - TP Packet Tracer 6.5.6 Configure dynamic NAT
        * PAT
            - TP Packet Tracer 6.8.1 Configure NAT for IPv4

- M05ex Configuration NAT 
	+ configurer NAT Statique 
	+ configurer NAT Dynamique

- M06 CyberSec Bases
	+ Sensibilisation et initiation à la cybersécurité
		* 01. notions de base 
			- 1.1 les enjeux de la sécurité des SI
			- 1.2 les besoins en sécurité 
			- 1.3 notions de vulnérabilité, menace, attaque 
			- 1.4 panorama de quelques menaces
			- 1.5 le rôle de la CNIL 
		* 02. re


- M07 CyberSec Hygiène
	+ Sensibilisation et initiation à la cybersécurité
		* 02. règles d'hygiène informatique 
			- connaître le SI 
			- maîtriser les réseaux
			- sécuriser les terminaux 
			- gérer les utilisateurs 
			- contrôler la sécurité du SI 

- M08 ToIP
	+ RTC la fin 
		* historique et téléphonie classique
		* matériel et infrastructure
	+ Définition 
		* les différents protocoles 
		* appels 
		* définitions 
	+ Audit 
		* implémenter la VoIP 
	+ ROI et motivation
		* les différents protocoles
		* audit 
	+ Dimensionnement 
		* règles de dimensionnement
	+ Acteurs et offres 
		* matériel et infrastructure 
	+ Matériel et infrastructure
		* PABX Private Automatic Branch Exchange 
		* IP-PBX
		* Serveur de taxation
		* Le Media Gateway (routeur)
		* Petite passerelle
		* Les terminaux
		* POE auto alimentation 802.3 af/at 
		* Switch POE Power Over Ethernet 
	+ Support de ligne
		* ADSL
		* SDSL 
		* Liaison louée
		* Fibre
	+ Protocoles 
		* Les différents protocoles
		* SIP Session Initiation Protocole 
		* SIP dans le modèle OSI 
		* SIP les différents acteurs 
		* Le protocole SIP 
		* Le format des messages SI (sic) 
		* Adressage SIP 
		* Exemple SIP 
		* Le format des messages SIP
		* Le Registrar SIP 
		* Le proxy SIP 
		* Le trunk SIP 
		* RTP/RTCP Real-Time Transport Protocol (RFC 1889)
		* MGCP
		* IAX
		* Codecs
	+ Le réseau aujourd'hui 2021
		* Tendance des réseaux
		* Connexions Internet
		* Caractéristiques du trafic
	+ La QoS
		* Mise en oeuvre 
		* Caractéristiques 
		* Principes généraux
		* Techniques de mise en oeuvre de la QoS
		* QoS Couche 2 Trame Ethernet 802.1Q
		* La QoS CoS de couche 2 : 802.1Q/p 
		* QoS Couche 3 : paquet IPv4 
		* Couche 3 : paquet IPv6
		* QoS couche 3 : Diffserv (DSCP : Differentiated Services Code Point)
		* DSCP - ECN
		* Sélecteur de classe CS
		* La QoS de couche 3 : DiffServ 
		* QoS Values Calculator v3
		* Les problèmes classiques
	+ Les problèmes classiques
		* Les problèmes de transmission
		* La perte de paquets
		* Le délai de latence
		* La gigue (Jitter)
		* Seuils optimums
		* Le phénomène d’écho
	+ Circuit d’appels
		* XiVO et circuit d’appels
	+ Acteurs du marché de serveur de téléphonie
		* Serveur
		* Softphone
	+ XiVO
		* Présentation de XiVO
		* Onglet Services
		* Onglet Configuration
		* Client XiVO
	+ XiVO Configuration et ajout utilisateur
		* Installation et configuration de XiVO
		* Ajouter un utilisateur
	+ XiVO Configuration du client
		* XiVO Client
	+ XiVO Musique d’attente
		* Musique d’attente	
	+ Configuration interne
	+ XiVO Création de groupes d’appels
		* Groupe d’appels
		* Groupe d’appels - Les temps et les délais
	+ XiVO Chambre de conférences
		* Chambre de conférence
	+ XiVO Filtrage patron/secrétaire
		* Filtre secrétaire
	+ Extension.conf et IVR
		* Les fichiers de conf
		* Syntaxe EXTEN
		* Syntaxe EXTEN Numérotation
		* Exemple
		* Syntaxe EXTEN spécial ID
		* Syntaxe EXTEN Variable
		* Syntaxe EXTEN Actions
		* Actions
	+ TP 
		* Circuit d'appels 
		* IVR

- Trame Ethernet - Paquet IPv4
	+ Trame Ethernet II 
	+ Assigned Number (RFC 1700)
	+ Trame Ethernet 802.1Q
	+ Paquet IPv4
		* en-tête IPv4
		* le diagramme IPv4

