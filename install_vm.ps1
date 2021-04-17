$vbox_program_path = "D:\Oracle\VirtualBox"
$vm_name = "BPC_IC1_ANON"
$vm_os_type = "Ubuntu_64"
$vm_storage_path = "D:\VM\" + $vm_name + "\" + $vm_name + ".vdi"
$vm_storage_size = 102400
$vm_iso_path = "D:\ISOs\ubuntu-20.04.1-live-server-amd64.iso"
$vm_memory = 2048
$vm_vram = 16
$vm_user = "anon"
$vm_user_pass = "changeme"
$vm_hostname = "anon.ibep.cz"
$vm_country = "CZ"
$vm_time_zone = "CET"

cd $vbox_program_path

.\VBoxManage createvm --name $vm_name --ostype $vm_os_type --register

.\VBoxManage createmedium --filename $vm_storage_path --size $vm_storage_size

.\VBoxManage storagectl $vm_name --name SATA --add SATA --controller IntelAhci

.\VBoxManage storageattach $vm_name --storagectl SATA --port 0 --device 0 --type hdd --medium $vm_storage_path

.\VBoxManage storagectl $vm_name --name IDE --add ide

.\VBoxManage storageattach $vm_name --storagectl IDE --port 0 --device 0 --type dvddrive --medium $vm_iso_path

.\VBoxManage modifyvm $vm_name --memory $vm_memory --vram $vm_vram --ioapic on --boot1 dvd --boot2 disk --cpus 2

.\VBoxManage unattended install $vm_name --user=$vm_user --password=$vm_user_pass --country=$vm_country --time-zone=$vm_time_zone --hostname=$vm_hostname --iso=$vm_iso_path --start-vm=gui