#!/bin/bash

# keyboard color changing script based on wallpaper images for linux
# The following script has been tested on HP OMEN 15-DC 
function read_image()
{
    echo "HP OMEN 15-DC keyboard colors script " | lolcat -as 100
    read -p 'Please , input the image path:' image_path


    #prompt="Please select a image file:"
    #options=( $(find -maxdepth 1 -print0 | xargs -0) )

    #PS3="$prompt "
    #select opt in "${options[@]}" "Quit" ; do 
    #    if (( REPLY == 1 + ${#options[@]} )) ; then
    #        exit

    #    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
    #        echo  "You picked $opt which is file $REPLY"
    #        break

    #    else
    #        echo "Invalid option. Try another one."
    #    fi
    #done    

    #ls -ld $opt

    #image_path=$(readlink -f "$opt")


    pattern=".*\.(gif|jpe?g|bmp|png)$"
    
    if [[ $image_path =~ $pattern ]]; then
        
        echo 'Is an image '
       
        # create wal cache colors 
        sudo -u $SUDO_USER bash -c "wal -q -n -i '$image_path'"
        #sudo -u $SUDO_USER bash "wal -n -i '$image_path'"
        
        if [ $? -eq 0 ]; then
            echo "******* Created cache colors path ******* "
        else
           echo FAIL
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





