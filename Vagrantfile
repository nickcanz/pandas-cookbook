# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_x11 = true

  config.vm.forward_port 5555, 5555

   config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.add_recipe "pandas"
     # You may also specify custom JSON attributes:
     #chef.json = { :mysql_password => "foo" }
   end
end
