$script = <<-SCRIPT
sudo dnf -y upgrade

sudo dnf -y install git htop

sudo dnf -y install firewalld
sudo systemctl start firewalld
sudo firewall-cmd --add-service=cockpit
sudo firewall-cmd --add-service=cockpit --permanent

sudo dnf -y install osbuild-composer composer-cli cockpit-composer
sudo dnf -y install podman virt-install libvirt
sudo systemctl enable --now cockpit.socket

sudo systemctl enable --now osbuild-composer.socket
sudo systemctl enable --now libvirtd

SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "fedora/38-cloud-base"
    config.vm.provider 'libvirt' do |provider|
        provider.memory = 2048
        provider.cpus = 4
    end
    config.vm.provision "shell", inline: $script
    config.vm.network "forwarded_port", guest: 9090, host: 9090
    config.vm.network "forwarded_port", guest: 8080, host: 8080
end
