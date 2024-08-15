#!/bin/bash

cd /var/lib/libvirt/disks
for i in {3..10}; do
   echo "Creating VM${i}..."
   qemu-img create -b /var/lib/libvirt/images/ubuntu-18.04-server-cloudimg-amd64.img -F qcow2 -f qcow2 ubuntu-vm${i}-disk.qcow2 20G

   virt-install --name ubuntu-vm${i}   --virt-type kvm --memory 2048 --vcpus 2   --import  --disk path=/var/lib/libvirt/disks/ubuntu-vm${i}-disk.qcow2,device=disk    --graphics none --os-variant ubuntu18.04 --cloud-init user-data=/root/kvm/user-data.txt --noautoconsole
   echo "DONE"
done


