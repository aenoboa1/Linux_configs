#!/bin/bash

# keyboard color changing script based on wallpaper images for linux
# The following script has been tested on HP OMEN 15-DC 
function read_image()
{
    echo "HP OMEN 15-DC keyboard colors script " | lolcat -as 100
    image_path=$(zenity --entry --text="Please , input the image path:")

    pattern=".*\.(gif|jpe?g|bmp|png|webp)$"
    
    if [[ $image_path =~ $pattern ]]; then
        
        echo 'Is an image '
       
        # create wal cache colors 
        sudo -u $SUDO_USER bash -c "wal -q -n -i '$image_path'"
        
        if [ $? -eq 0 ]; then
            echo "******* Created cache colors path ******* "
        else
           echo FAIL
           exit 0
        fi

        image=${image_path##*/}  
        # Created SUDO_USER to fetch user env variable
        array=($(find /home/$SUDO_USER/.cache/wal/schemes/ -name "*$image"))

        bar=$(printf "%s " "${array[@]}")
        bar=${bar:1}
        foo="/${bar%?}"
        array_colors=($(tail -12 "$foo"| head -4))

        # Change zone 0-3 to array color of corresponding wallpaper . TODO: Better color representation
        for i in ${!array_colors[@]};
        do 
           echo "*** Changing key-board colors *** zone0$i"   | lolcat 
           echo ${array_colors[$i]} | sed -r 's/^.{1}//' > "/sys/devices/platform/hp-wmi/rgb_zones/zone0$i"
           echo "${array_colors[$i]}" | sed -r 's/^.{1}// '  
        
        done
    else
        echo "Not an image"
    fi
}

read_image
