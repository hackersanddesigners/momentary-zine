#!/bin/sh
#
# Memory Swtich Setting Script for FVP10
#
# How to use:
#
# 1) Set FVP10 a Default printer
# 2) Copy this script (default.sh) and default.dat into home folder.
# 3) Execute Termnal which is in the "Accessories" of "Applications",
#    then input "./default.sh" and return Enter key.
# 4) After execution, printer will print self test.
#    Please verify print result of <8> line in "-- Memory Switch --" part.
#    4rd and 8rd digit of the <8> line should be set to "0".
#
#    Sample: 
#        <8> 0000000000000000 0000
#
lpr -o raw default.dat
#
#
# Note:
# If you can not set FVP10 as a default printer, refer to the following
# procedure.
#
# 1) Using following command, printer queue lists, print queue names,
#    and default printer will be displayed.
#
#    $ lpstat -p -d
#
#    dispaly example:
#       star-no-power-mac-g4:~ star$ lpstat -p -d       
#       printer FVP10__STR_T_001_ is idle.  enabled since Jan 01 00:00
#       system default destination: FVP10__STR_T_001_
#
#    "FVP10__STR_T_001_" are printer queue name.
#
# 2) Use following commands to set the selected printer.
#    Input printer queue names into "Printer-queue name" according to "$ lpstat -p -d command".
#
#    $ lpr -o raw mac.dat -P "Printer-queue name"
#
#    Example
#       star-no-power-mac-g4:~ star$ lpr -o raw default.dat -P TSP651__STR_T_001_
#
# 2010/02/18 Star Micronics co.,ltd.
