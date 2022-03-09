#!/bin/bash


function read_image()
{
    read -p 'Please , input the image path:' image_path
    pattern=".*\.(gif|jpe?g|bmp|png)$"
    
    if [[ $image_path =~ $pattern ]]; then
        
        echo 'Is an image \n'
        wal -n -i "$image_path" 
        
        echo "******* Created cache colors path ******* "        
        image=${image_path##*/}   
        array=($(find /home/elegant00/.cache/wal/schemes/ -name "*$image"))
        bar=$(printf "%s " "${array[@]}")
        bar=${bar:1}
        foo="/${bar%?}"
        array_colors=($(tail -4 "$foo"))

        # Change zone 0-3 to array color of corresponding wallpaper . TODO: Better color representation
        for i in ${!array_colors[@]};
        do 
           echo "*** Changing key-board colors ***"
           echo ${array_colors[$i]} | sed -r 's/^.{1}//' > "/sys/devices/platform/hp-wmi/rgb_zones/zone0$i"
           
           echo "${array_colors[$i]}" | sed -r 's/^.{1}// '  
        
        done
    else
        echo "Not image"
    fi
}
read_image





