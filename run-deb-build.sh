#!/bin/sh
set -eux
gpg --import ~/apt-keys/privkey.asc
gbp clone https://github.com/mobile-shell/mosh
mk-build-deps --install --tool 'apt-get -y' --root-cmd 'sudo' mosh/debian/control
cd mosh
gbp buildpackage --git-upstream-branch=master --git-upstream-tree=branch --git-builder="debuild --build=binary -k8CFB5DCB19B609A0"
cp -v ~/*.deb ~/deb-export/pool/main
exec ~/run-deb-packager.sh
