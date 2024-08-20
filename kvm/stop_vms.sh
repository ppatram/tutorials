#!/bin/bash

lastmach=$1
x=0
while [ $x -lt $lastmach ]
do
  x=$(( $x + 1 ))
  virsh shutdown ubuntu-vm${x}
done

exit
