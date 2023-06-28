[Bootstrap]
SkipBDDWelcome=YES
DeployRoot=\\MDTServer\DeploymentShare$

[Settings]
Priority=Default

[Default]
OSInstall=Y
SkipCapture=NO
SkipAdminPassword=YES
SkipProductKey=YES
SkipComputerBackup=YES
SkipBitLocker=YES
KeyboardLocale=fr-FR
UserLocale=fr-FR
UILanguage=fr-FR
TimeZoneName=Romance Standard Time

[Default\OSChooser]
Description=Windows 10 Enterprise x64
DisplayName=Windows 10 Enterprise x64
ImagePath=.\Boot\LiteTouchPE_x64.iso

-------------
[Settings]
Priority=Default

[Default]
DeployRoot=\\DEPLOY\DeploymentShare$
UserID=deploy
UserDomain=reno.tssr.eni
UserPassword=!Admin123

KeyboardLocale=fr-FR
KeyboardLocalePE=040c:0000040c

SkipBDDWelcome=YES
------------

[Settings]
Priority=Default
Properties=MyCustomProperty

[Default]
OSInstall=YES
SkipAdminPassword=YES
SkipApplications=YES
SkipAppsOnUpgrade=YES
SkipBitLocker=YES
SkipCapture=YES
SkipComputerBackup=YES
SkipComputerName=YES
SkipDomainMembership=YES
SkipProductKey=YES
SkipSummary=YES
SkipTaskSequence=YES
SkipUserData=YES
TaskSequenceID=2

; AD
MachineObjectOU=OU=CLIENTS,OU=ORDINATEURS,OU=RENOCORP,DC=reno,DC=tssr,DC=eni
MachineObjectOU=OU=CLIENTS,OU=ORDINATEURS,OU=RENOCORP,DC=reno,DC=tssr,DC=eni
DomainAdmin=administrateur
DomainAdminDomain=reno.tssr.eni
DomainAdminPassword=!Admin123
JoinDomain=reno.tssr.eni
OSDComputerName=CLI2

; Locale
SkipLocaleSelection=YES
SkipTimeZone=YES
InputLocale=040c:0000040c
KeyboardLocale=040c:0000040c
UILanguage=fr-FR
UserLocale=fr-FR
SystemLocale=fr-FR
TimeZoneName=Romance Standard Time


------------KEVEN

[Settings]
Priority=Default
Properties=MyCustomProperty

[Default]
OSInstall=Y
; 	task sequence
SkipTaskSequence=YES
TaskSequenceID=001
	
; 	computer name
SkipComputerName=YES
OSDComputerName=Cli-Dep

;	Admin password
SkipAdminPassword=YES
AdminPassword=Ncc1701E

; 	Product key
SkipProductKey=YES

;	domain to join
SkipDomainMembership=YES
JoinDomain=keven.rtssr.eni
MachineObjectOU=OU=Clients,OU=Ordinateurs,DC=keven,DC=RTSSR,DC=eni
DomainAdmin=deploy
DomainAdminDomain=keven.rtssr.eni
DomainAdminPassword=Ncc1701E


; 	MOVE DATA AND SETTINGS
SkipUserData=YES
	
; 	locale and time
SkipLocaleSelection=YES
UserLocale=fr-FR
KeyboardLocale=040C:0000040C
SkipTimeZone=YES
TimeZoneName=Romance Standard Time
	
; 	capture image
SkipCapture=YES
	
; 	Bitlocker
SkipBitlocker=YES
	
; 	ready to Begin
SkipSummary=YES



----

SkipApplications=YES
SkipAppsOnUpgrade=YES
SkipComputerBackup=YES
SkipComputerName=YES
SkipDomainMembership=YES
SkipProductKey=YES
SkipUserData=YES


-----

[Settings]
Priority=Default
Properties=MyCustomProperty

[Default]
OSInstall=Y

; 	task sequence
SkipTaskSequence=YES
TaskSequenceID=2

; 	computer name
SkipComputerName=YES
OSDComputerName=CLI-DEP01

;	Admin password
SkipAdminPassword=YES
AdminPassword=!Admin123

; 	Product key
SkipProductKey=YES

;	domain to join
SkipDomainMembership=YES
JoinDomain=reno.tssr.eni
MachineObjectOU=OU=CLIENTS,OU=ORDINATEURS,OU=RENOCORP,DC=reno,DC=tssr,DC=eni
DomainAdmin=deploy
DomainAdminDomain=reno.tssr.eni
DomainAdminPassword=!Admin123

; 	MOVE DATA AND SETTINGS
SkipUserData=YES

; 	locale and time
SkipLocaleSelection=YES
UserLocale=fr-FR
KeyboardLocale=fr-FR
UILanguage=fr-FR
UserLocale=fr-FR
SystemLocale=fr-FR
SkipTimeZone=YES
TimeZoneName=Romance Standard Time

; 	capture image
SkipCapture=YES
	
; 	Bitlocker
SkipBitlocker=YES
	
; 	ready to Begin
SkipSummary=YES



---------------------- ACTUEL
[Settings]
Priority=Default
Properties=MyCustomProperty

[Default]
OSInstall=Y

; 	task sequence
SkipTaskSequence=YES
TaskSequenceID=2

; 	computer name
SkipComputerName=YES
OSDComputerName=CLI-DEP01

;	Admin password
SkipAdminPassword=YES
AdminPassword=!Admin123

; 	Product key
SkipProductKey=YES

;	domain to join
SkipDomainMembership=YES
JoinDomain=reno.tssr.eni
MachineObjectOU=OU=CLIENTS,OU=ORDINATEURS,OU=RENOCORP,DC=reno,DC=tssr,DC=eni
DomainAdmin=reno
DomainAdminDomain=reno.tssr.eni
DomainAdminPassword=!Admin123

; 	MOVE DATA AND SETTINGS
SkipUserData=YES

; 	locale and time
SkipLocaleSelection=YES
UserLocale=fr-FR
KeyboardLocale=fr-FR
UILanguage=fr-FR
UserLocale=fr-FR
SystemLocale=fr-FR
SkipTimeZone=YES
TimeZoneName=Romance Standard Time

; 	capture image
SkipCapture=YES
	
; 	Bitlocker
SkipBitlocker=YES
	
; 	ready to Begin
SkipSummary=YES



