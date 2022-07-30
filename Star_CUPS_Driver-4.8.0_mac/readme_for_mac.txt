///////////////////////////////////////////////////////////////////////////

    - Star CUPS Driver Ver. 4.8.0 for mac -
        Readme File                                    10/29/2021

   (C) 2004 - 2021 Star Micronics Co., Ltd. All rights reserved.
///////////////////////////////////////////////////////////////////////////

* This ReadMe File applies to Star CUPS Driver Ver. 4.8.0 for mac
* This file provides supplementary information that is not described in other
  documentation.

  Thank you very much for purchasing Star Printer.

  Contents:

  1. About "Star CUPS Driver Ver. 4.8.0"
  2. Restrictions
  3. Cautions When printing via a USB interface
  4. FVP10 Compression Print Setting
  5. How to send RAW Data to CUPS Printer
  6. TSP100IIU Vertical Compression Print and Back Feed Function Setting
  7. USB Serial Number Setting
  8. Release History

=======================================
 1.About "Star CUPS Driver Ver. 4.8.0"
=======================================
- Added TSP100IV
- Removed Star Micronics Cloud Service function

================
 2.Restrictions
================
2-1 It may cause extremely slow printing or data lost when using CUPS drivers
    V3.4.0 or older with Mac OS X 10.9 (Mavericks).

2-2 Below is the restrictions for this version.
    Please read through and have well understanding before use.

 * TSP100LAN
   Cannot print files with the names are over 80 characters.

 * SM-L300, SM-L304
   When printer turns off while USB connecting to PC, the printer queue is
   displayed as “Offline” even though the printer works.
   *Need restart the printer and PC to solve this happened.

2-3 Note for Upgrade Install
    Even if you perform an upgrade installation from the previous version,
    the function of the printer queue that has already created is still the old version.
    To upgrade the existing printer queue, please perform the following operation.

    1. Open the CUPS management screen.
    2. Select the Printer Queue.
    3. Select "Maintenance" - "Modify Printer".
    4. Select "Current Connection" and click "Continue".
    5. Click "Continue" without changing "Description" and "Location".
    6. Select the same "Model" from list. (Do not select "Current Driver - queue name".)

2-4 Limitations for Mac OS X 10.10 (USB models)
    If a USB printer is used with Mac OS X10.9.4 - 10.10,
    the printer queue is sometimes displayed as Off-line even though the printer can print
    when powering off the printer or restarting the PC.

    It can be prevented by allocating a USB serial number.
    Please use the "USB serial number allocation script" enclosed in the package
    to allocate a USB serial number to the printer.
    Please see the manual attached to the "USB serial number allocation script" for details.

2-5 Limitation for USB models
    In the Device Management feature of Star Micronics Cloud,
    the USB printer status may not be acquired correctly.
    It can be recovered by restarting the PC with the printer turned on.

==============================================
 3.Cautions When printing via a USB interface
==============================================
When printing via a USB interface on Mac OS X, the printing speed
will dramatically decrease or printing jobs may fail.

If this happens, use the script ("setup_for_mac.sh") in the
"Tips"-->"MSW_Setting" folder in the "starcupsdrv-X.X.X_mac.zip" (X.X.X
represents the driver version) in this driver package.
This will improve the problems described above.

Read the comments in the script for details on how it is used.

===================================
 4.FVP10 Compression Print Setting
===================================
Please refer to the following places for the Compression Print Setting.

Please execute the script("default.sh")in the "Tips"-->"FVP10_Compression_Print_Setting" folder in the
"starcupsdrv-X.X.X_mac.zip" (X.X.X represents the driver version)in this driver package.

The reduction print setting is 4 of the following.
  1.Default
  2.Vertical Compression Print 50% Setting
  3.Horizontal Compression Print 67% Setting
  4.Vertical Compression Print 50% Setting + Horizontal Compression Print 67% Setting

Read the comments in the script for details on how it is used.

========================================
 5.How to send RAW Data to CUPS Printer
========================================
If you want to send RAW data file to Printer without any filtering,
you can use "-oraw" option of the "LPR" command.

Please refer to the following places for details.

"Tips"-->"HowToSendRawDataViaCUPS20060725.tar" folder
in the "starcupsdrv-X.X.X_mac.zip" (X.X.X represents the driver version)
in this driver package.

=======================================================================
 6.TSP100IIU Vertical Compression Print and Back Feed Function Setting
=======================================================================
* This setting applies to Star TSP100IIU.
Please refer to the following places for the Vertical Compression Print and Back Feed Function Setting.

Please execute the script("BackFeed_default.sh")in the "Tips"-->"TSP100IIU" folder in the
"starcupsdrv-X.X.X_linux.zip" (X.X.X represents the driver version)in this driver package.

The reduction print setting is 13 of the following.
  1.Back Feed default setting
  2.Back Feed 11mm setting
  3.Back Feed 10mm setting
  4.Back Feed  9mm setting
  5.Back Feed  8mm setting
  6.Back Feed  7mm setting
  7.Back Feed  6mm setting
  8.Back Feed  5mm setting
  9.Back Feed  4mm setting
 10.Back Feed  3mm setting
 11.Compression default setting
 12.Compression 75% setting
 13.Compression 50% setting

Read the comments in the script for details on how it is used.

=============================
 7.USB Serial Number Setting
=============================
Please refer to the following places for the USB Serial Number Setting.

Please execute the script("default.sh")in the "Tips"-->"USBSerialNumber" folder in the
"starcupsdrv-X.X.X_mac.zip" (X.X.X represents the driver version)in this driver package.

Read the "How to use.txt" in the script for details on how it is used.

===================
 8.Release History
===================
* Fri Oct 29  2021
- Version 4.8.0
- Added TSP100IV
- Removed Star Micronics Cloud Service function

* Wed Apr 22  2020
- Version 4.7.0
- Added print density +4 (mC-Print3 Series)
- MCP31C and MCP31CB (mC-Print3 Series) are supported

* Fri Jan 17  2020
- Version 4.6.1
- Supported macOS10.15

* Mon Dec 9  2019
- Version 4.6.0
- Added SK1 Printers

* Thu Jul 25 2019
- Version 4.5.0
- Added MCP30 Printer (mC-Print3 Series)

* Wed Nov 5 2018
- Version 4.4.0
- Added mC-Sound Function(MCP31)

* Fri Jun 15 2017
- Version 4.3.0
- Added MCP31, MCP21 and MCP20
- The following Star Printers at End of Support.
   SP500, TSP650, TSP828L, TSP1000, TUP500, TUP900, HSP7000

* Mon Mar 22 2017
- Version 4.2.0
- Added Micro Receipt function and SDK.
- Supported resizing of QR code.
- Bug Fix.

* Mon Apr 10 2017
- Version 4.1.0
- Added Models(SM-L300/SM-L304/POP10).

* Thu Oct 6 2016
- Version 4.0.0
- Release one package which contains both desktop printer driver and portable one.
- Add AllReceipts function support.
