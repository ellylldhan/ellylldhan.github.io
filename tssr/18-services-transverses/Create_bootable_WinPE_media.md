## Create bootable WinPE media
- 24/04/2018 
- 3 minutes de lecture

The Windows Assessment and Deployment Kit (ADK) includes the CopyPE and MakeWinPEMedia command line utilities. When run from the Deployment and Imaging Tools Environment, CopyPE creates a working set of WinPE files, that MakeWinPEMedia can use to create bootable WinPE media. MakeWinPEMedia can create bootable WinPE USB drives, virtual hard disks, or ISOs that allow you to boot a VHD or burn to a DVD or CD.

CopyPE and MakeWinPEMedia are installed when you choose the Deployment tools and Windows Preinstallation Environment options when installing the ADK. If you're using the ADK for Windows 10, version 1809, Windows PE is a separate add-on that you download and install after you install the ADK. You can download the WinPE add-on from the Download Center.

### Step 1: Create working files
No matter what type of media you're going to create, the first thing to do is create a working set of WinPE files on your technician PC.

1. Start the Deployment and Imaging Tools Environment as an administrator.
2. Run copype to create a working copy of the Windows PE files. For more information about copype, see Copype command line options.

```
copype amd64 C:\WinPE_amd64
``` 

### Step 2: Customize WinPE (Usually not needed)
Note, when you add more packages to WinPE, it slows WinPE performance and boot time. Only add additional packages when necessary.
Common customizations
    • Add an update. If you're going to be capturing an FFU at the end of the lab, apply KB4048955 to your WinPE image. To learn more, see: WinPE: mount and customize.
    • Add a video or network driver. (WinPE includes generic video and network drivers, but in some cases, additional drivers are needed to show the screen or connect to the network.). To learn more, see WinPE: Add drivers.
    • Add PowerShell scripting support. To learn more, see WinPE: Adding Windows PowerShell support to Windows PE. PowerShell scripts are not included in this lab.
    • Set the power scheme to high-performance. Speeds deployment. Note, our sample deployment scripts already set this scheme automatically. See WinPE: Mount and Customize: High Performance.
    • Optimize WinPE: Recommended for devices with limited RAM and storage (for example, 1GB RAM/16GB storage). After you add drivers or other customizations to Windows PE, see WinPE: Optimize and shrink the image to help reduce the boot time.
Step 3: Create bootable media
Now that you now have a set of working files, you can use MakeWinPEMedia to build bootable WinPE media.
Create a bootable WinPE USB drive
    1. Attach a USB drive to your technician PC.
    2. Start the Deployment and Imaging Tools Environment as an administrator.
    3. Optional You can format your USB key prior to running MakeWinPEMedia. MakeWinPEMedia will format your WinPE drive as FAT32. If you want to be able to store files larger than 4GB on your WinPE USB drive, you can create a multipartition USB drive that has an additional partition formatted as NTFS. See Create a multipartition USB drive for instructions.
    4. Use MakeWinPEMedia with the /UFD option to format and install Windows PE to the USB flash drive, specifying the USB key's drive letter :
Copier 
MakeWinPEMedia /UFD C:\WinPE_amd64 F:
Avertissement
This command reformats the partition.
See MakeWinPEMedia command line options for all available options.
The bootable WinPE USB drive is ready. You can use it to boot a PC into WinPE.
Create a WinPE ISO, DVD, or CD
    1. Use MakeWinPEMedia with the /ISO option to create an ISO file containing the Windows PE files:
Copier 
MakeWinPEMedia /ISO C:\WinPE_amd64 C:\WinPE_amd64\WinPE_amd64.iso
    2. Optional Burn a DVD or CD: In Windows Explorer, right-click the ISO file, and select Burn disc image > Burn, and follow the prompts.
Passer au clavier zerty
Dism /Mount-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /index:1 /MountDir:"C: \WinPE_amd64\mount"

Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"
Dism /Set-AllIntl:fr-fr /Image:"C:\WinPE_amd64\mount
Démonter l'image système Windows PE :
Dism /Unmount-Image /MountDir:"C:\WinPE_amd64\mount" /commit
La préparation se fera par la commande suivante :
MakeWinPEMedia /UFD C:\WinPE_amd64 F:


Create a WinPE VHD to use with Hyper-V
Even though you can create a bootable When running Windows PE in Hyper-V, consider using an ISO file format instead of a VHD, to enable quick setup of the virtual PC.
To install Windows PE to a VHD:
    1. Create a virtual hard drive (.vhdx):
Copier 
diskpart
create vdisk file="C:\WinPE.vhdx" maximum=1000
attach vdisk
create partition primary
assign letter=V
format fs=ntfs quick
exit
    2. Prepare the drive by using MakeWinPEMedia:
Copier 
MakeWinPEMedia /UFD C:\WinPE_amd64 V:
    3. Detach the drive:
Copier 
diskpart
select vdisk file="C:\WinPE.vhdx"
detach vdisk
exit
Troubleshooting
    1. If Windows PE doesn't appear, try the following workarounds, rebooting the PC each time:
        ◦ To boot a PC that supports UEFI mode: In the firmware boot menus, try manually selecting the boot files: \EFI\BOOT\BOOTX64.EFI.
        ◦ If your PC requires storage or video drivers to boot, try adding those same drivers to the Windows PE image. For more information, see WinPE: Mount and Customize.
    2. If the PC doesn't connect to network locations, see WinPE Network Drivers: Initializing and adding drivers.
Related topics
WinPE for Windows 10
WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)
WinPE: Mount and Customize
WinPE: Boot in UEFI or legacy BIOS mode
Windows Setup Supported Platforms and Cross-Platform Deployments

Capture image :
Dism /Image:C:\test\offline /Optimize-Image /WIMBoot

Dism /Capture-Image /ImageFile:<path_to_image_file> /CaptureDir:<source_directory> /Name:<image_name> [/Description:<image_description>]
[/ConfigFile:<configuration_file.ini>] {[/Compress:{max|fast|none}] [/Bootable] | [/WIMBoot]} [/CheckIntegrity] [/Verify] [/NoRpFix] [/EA]


Dism /Capture-Image /ImageFile:"D:\Images\Fabrikam.wim" /CaptureDir:C:\ /Name:Fabrikam
