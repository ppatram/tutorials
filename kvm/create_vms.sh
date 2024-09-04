#!/bin/bash
i=$1
cd /var/lib/libvirt/disks
for i in {1..10}; do
   echo "Creating VM${i}..."
   qemu-img create -b /var/lib/libvirt/images/jammy-server-cloudimg-amd64-disk-kvm.img -F qcow2 -f qcow2 ubuntu-vm${i}-disk.qcow2 20G

   sed "s/__VMNUM__/${i}/" /root/tutorials/kvm/user-data.txt > /root/tutorials/kvm/user-data${i}.txt
   virt-install --network bridge=virbr0 --name ubuntu-vm${i}   --virt-type kvm --memory 2048 --vcpus 2   --import  --disk path=/var/lib/libvirt/disks/ubuntu-vm${i}-disk.qcow2,device=disk    --graphics none --os-variant ubuntu18.04 --cloud-init user-data=/root/tutorials/kvm/user-data${i}.txt --noautoconsole
   echo "DONE"
done

#virsh console ubuntu-vm${i}

