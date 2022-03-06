#!/bin/fish


set TODAY (date)
set namefile "pkglist.txt"
touch $namefile

# Create pacman list of packages
pacman -Qqen > $namefile 


echo "*** Creating $namefile pacman at $TODAY"  

# append today's date to the file
begin;
      echo "Pacman Package List created at : " (date +"%b%d-%Y-%H%M%S") ;
      cat $namefile ;
  end | sponge $namefile 

