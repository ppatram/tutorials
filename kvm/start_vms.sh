#!/bin/bash

lastmach=$1
x=2
while [ $x -lt $lastmach ]
do
  x=$(( $x + 1 ))
  #echo virsh start ubuntu-vm${x}
  virsh start ubuntu-vm${x}
done

exit
