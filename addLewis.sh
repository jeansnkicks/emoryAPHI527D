#!/bin/bash
username='lbrodna'
ret=false

id $username >/dev/null 2>&1 && ret=true

if $ret; then
  echo "User exist"
else
  sudo useradd -m -s /bin/bash $username
  sudo mkdir /home/${username}/.ssh
  sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ41G7oCkKwwIgFbz46zguN9FUqIKzcLK2iZw1j9xeO+fLSmv4V4og125Ew6/mEiZXA5/lsJOuQtdHkpQ0dN7RBUMs6if8URatSwokYqrlo/QnkvCYrSSJLFapj5IgtqfWEbvCleKijLrARdxN3WNOw7EoGHviFgtXquIbNOuO33MZXQq+F3ywrcBCPvW2OGIT8v4SVE4S+PGchWdAWiVu20mGQrjP804flxikMXZpLgFr1LFklYljoUAafmBTbwHwKoR/jnXpUjf2DMd/8znQ5pdfeJf2ft1xb8JfLpsraQ6e073J1i9KcbpPr2mK+fVDdzxSPylRoEmzUurkX7Xx" > /home/${username}/.ssh/authorized_keys
  sudo chmod 600 /home/${username}/.ssh/authorized_keys
  sudo chmod 700 /home/${username}/.ssh
  sudo chown -R ${username}. /home/${username}/.ssh
  sudo usermod -aG wheel ${username}
  sudo echo ${username}'        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
  echo "Script Completed Successfully"
fi
