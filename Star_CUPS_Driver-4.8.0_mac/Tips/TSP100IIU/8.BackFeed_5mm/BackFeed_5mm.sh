#!/bin/sh
#
# Back Feed 5mm Setting Script for TSP100IIU
#
# How to use:
#
# 1) Set TSP100IIU a Default printer
# 2) Copy this script (BackFeed_5mm.sh) and BackFeed_5mm.dat into home folder.
# 3) Execute Termnal which is in the "Accessories" of "Applications",
#    then input "./BackFeed_5mm.sh" and return Enter key.
#
lpr -o raw BackFeed_5mm.dat
#
#
# Note:
# If you can not set TSP100IIU as a default printer, refer to the following
# procedure.
#
# 1) Using following command, printer queue lists, print queue names,
#    and default printer will be displayed.
#
#    $ lpstat -p -d
#
#    dispaly example:
#       star-no-power-mac-g4:~ star$ lpstat -p -d       
#       printer TSP100IIU__STR_T_001_ is idle.  enabled since Jan 01 00:00
#       system default destination: TSP100IIU__STR_T_001_
#
#    "TSP100IIU__STR_T_001_" are printer queue name.
#
# 2) Use following commands to set the selected printer.
#    Input printer queue names into "Printer-queue name" according to "$ lpstat -p -d command".
#
#    $ lpr -o raw BackFeed_5mm.dat -P "Printer-queue name"
#
#    Example
#       star-no-power-mac-g4:~ star$ lpr -o raw BackFeed_5mm.dat -P TSP100IIU__STR_T_001_
#
# 2010/02/19 Star Micronics co.,ltd.