#Vagrant user bash setup
cat /tmp/vagrant_bash_profile >> /home/vagrant/.bashrc
cat /tmp/vagrant_bash_profile >> /home/vagrant/.bash_profile

#root user bash setup
#cat the uploaded root bash profile into /root/.bash_profile so it is applied to login shells...
cat /tmp/root_bash_profile >> /root/.bash_profile
#...and cat it into .bashrc so it's applied to non-login shells as well:
cat /tmp/root_bash_profile >> /root/.bashrc