::Essentials
choco install -y googlechrome
choco install visualstudiocode
choco install -y 7zip.install
choco install -y notepadplusplus.install
choco install -y vlc
choco install -y keepass.install
choco install -y gimp
choco install -y irfanview

::Development
choco install -y git.install
call refreshenv

git config --global user.name "Bartosz Wiśniewski"
git config --global user.email "poprosturonin@gmai.com"

choco install -y slack
choco install -y vcredist140

::Python
choco install -y python
choco install -y pycharm

::Java
choco install -y jdk8

::Web
choco install -y nodejs.install
choco install -y ruby
call refreshenv

gem install sass

::Experiments
choco install -y golang
choco install -y mingw

::Deployment
choco install -y sqlite
choco install -y mysql.workbench
choco install -y docker

::Utility
choco install -y teamviewer
choco install -y filezilla
choco install -y paint.net
choco install -y openvpn
choco install -y youtube-dl
choco install -y vim
choco install -y audacity
choco install -y ffmpeg
choco install -y rufus
choco install -y utorrent
