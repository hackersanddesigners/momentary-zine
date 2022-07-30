#!/bin/sh

PACKAGE_ID="com.starmicronics.starcupsdrv"

# Check root privilege
if [ ${EUID:-${UID}} != 0 ]; then
    echo 'Permission denied'
    exit 1
fi

# Delete UNIX socket file
rm /var/run/com.starmicronics.allreceipts.writeFileHelper.socket

# Stop Daemon
launchctl unload /Library/LaunchDaemons/com.starmicronics.allreceipts.writeFileHelper.plist
launchctl unload /Library/LaunchDaemons/com.starmicronics.allreceipts.uploadDaemon
launchctl unload /Library/LaunchDaemons/com.starmicronics.PromoPRNT.plist 

# Remove Application Support Directory.
if [ `echo $0 | grep uninstaller` ]; then
    rm -fr "/Library/Application Support/StarMicronics/AllReceipts"
    rmdir "/Library/Application Support/StarMicronics"
fi

# Remove files
package_ids=`pkgutil --pkgs | grep com.starmicronics.star.*cupsdrv.*`
for package_id in ${package_ids[@]}; do
    files=`pkgutil --files ${package_id} --only-files`
    for file in ${files[@]}; do
        rm -v /${file}
    done

    pkgutil --forget ${package_id}
done

if [ -e "/Applications/Star Cloud Services.app" ]; then
    rm -vr "/Applications/Star Cloud Services.app"
fi

if [ -e "/Applications/Star Micronics Cloud.app" ]; then
    rm -vr "/Applications/Star Micronics Cloud.app"
fi

if [ -e /usr/libexec/cups/backend/starmobilebluetooth ]; then
    rm -f /usr/libexec/cups/backend/starmobilebluetooth
fi
