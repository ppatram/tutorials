#!/bin/bash

lastmach=$1
x=1
while [ $x -lt $lastmach ]
do
  x=$(( $x + 1 ))
  virsh shutdown ubuntu-vm${x}
  virsh undefine ubuntu-vm${x}
done

exit
