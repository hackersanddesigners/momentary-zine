#!/bin/sh
chmod u+x USBSerialNumber.sh


# Set the green color
greenColor ()
{

        echo  "[;33m"

}

# Set the red color
redColor ()
{

        echo "[;31m"

}

# Set the default color
defaultColor ()
{

        echo  "[;m"

}

# Set the line feed
LF ()
{
    echo ""
}

# Show the success message
ShowSuccessMsg ()
{
    greenColor
    echo "$successMsg"
    LF
    defaultColor
}

# Show the error message
ShowErrorMsg ()
{
    redColor
    echo "$errorMsg"
    LF
    defaultColor

    exit 0
}

# Create the message that the invalid number is inputed
ShowInvalidNumberMsg ()
{
    errorMsg=`echo "the input number is invalid."`
    ShowErrorMsg
}

greenColor
echo "------------------------------------------------------------------------------"
echo "                            USB Serial Number Settings                        "
echo "------------------------------------------------------------------------------"
defaultColor
# waitNextStep

# Select Enable or Disable
echo "[USB serial number]"
echo "1:Register USB Serial Number"
echo "2:Initialize USB Serial Number"
LF
echo "Input the number:"
read Number
LF

# check
case $Number in
1)

    chmod u+x USBSerialNumber
    ./USBSerialNumber

    result="$?"

    if test ${result} -eq 0
    then
        lpr -o raw USBSerialNumber.dat
        
        # wait printer reset
        sleep 5

        lpr -o raw EnableMSWC-1.prn

        result="$?"
        if test ${result} -eq 0
        then
            successMsg=`echo "Please reset power on the printer for enable settings." &&
                        echo "then Please delete old printer queue." &&
                        echo "then Please create new printer queue." `
           ShowSuccessMsg
        fi
    else
         exit 0
    fi

    ;;
2)
    lpr -o raw InitializeUSBSerialNumber.dat

    # wait printer reset
    sleep 5

    lpr -o raw DisableMSWC-1.prn

    result="$?"
    if test ${result} -eq 0
    then
        successMsg=`echo "Please reset power on the printer for enable settings." &&
                    echo "then Please delete old printer queue." `
        ShowSuccessMsg
    fi
    ;;
*)
    ShowInvalidNumberMsg
    ;;
esac


exit 0