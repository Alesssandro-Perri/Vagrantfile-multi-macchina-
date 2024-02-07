# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"
  PROXY = "http://10.20.5.51:8888"	
  NO_PROXY = "localhost,127.0.0.1" 
  PROXY_ENABLE = true
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  config.ssh.insert_key = false
  config.vm.box_check_update = false

#WEB  
  config.vm.define "web" do |webconfig|
    webconfig.vm.box = BOX_IMAGE
	
	webconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
	webconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"
	if Vagrant.has_plugin?("vagrant-proxyconf")
		if PROXY_ENABLE == true
			webconfig.proxy.http = PROXY
			webconfig.proxy.https = PROXY
			webconfig.proxy.no_proxy = NO_PROXY
		end
	end
	
	webconfig.vm.hostname = "web.m340"
	webconfig.vm.provider "virtualbox" do |vb|
		vb.name = "web.m340"
		vb.memory = "4096"
	end
	
	#provisioning
	webconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
	
	#synced_folder
	webconfig.vm.synced_folder "site/", "/var/www/html"
  end

#DATABASE
  config.vm.define "db" do |dbconfig|
    dbconfig.vm.box = BOX_IMAGE
	
	dbconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
	if Vagrant.has_plugin?("vagrant-proxyconf")
		if PROXY_ENABLE == true
			dbconfig.proxy.http = PROXY
			dbconfig.proxy.https = PROXY
			dbconfig.proxy.no_proxy = NO_PROXY	
		end
	end
	
	dbconfig.vm.hostname = "db.m340"
	dbconfig.vm.provider "virtualbox" do |vb|
		vb.name = "db.m340"
		vb.memory = "4096"
	end
	
	#provisioning
	dbconfig.vm.provision "shell", path: "./scripts/provision_mysql.sh"
  end
end
