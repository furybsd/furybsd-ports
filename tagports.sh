#!/bin/sh
# Helper script which will tag github repos for ports / distfiles

if [ -z "$1" ] ; then
  echo "Please provide tag"
  echo "For example 11-28-2019"
  exit 1
fi

# Only run as regular user with ssh keys
if [ "$(id -u)" = "0" ]; then
  echo "This script must be run by release engineer" 1>&2
  exit 1
fi

# Ask for authentication once
killall ssh-agent
eval $(ssh-agent)
ssh-add

repodir="/tmp/furybsd-tag"

rm -rf ${repodir}
mkdir -p ${repodir}

git clone git@github.com:furybsd/furybsd-update.git ${repodir}/furybsd-update
git clone git@github.com:furybsd/furybsd-xorg-tool.git ${repodir}/furybsd-xorg-tool
git clone git@github.com:furybsd/furybsd-xfce-settings.git ${repodir}/furybsd-xfce-settings
git clone git@github.com:furybsd/furybsd-wallpapers.git ${repodir}/furybsd-wallpapers
git clone git@github.com:furybsd/furybsd-common-settings.git ${repodir}/furybsd-common-settings

cd ${repodir}/furybsd-update
git tag -a $1 -m "{$1}"
git push origin --tags
cd ${repodir}/furybsd-xorg-tool
git tag -a $1 -m "{$1}"
git push origin --tags
cd ${repodir}/furybsd-xfce-settings
git tag -a $1 -m "{$1}"
git push origin --tags
cd ${repodir}/furybsd-wallpapers
git tag -a $1 -m "{$1}"
git push origin --tags
cd ${repodir}/furybsd-common-settings
git tag -a $1 -m "{$1}"
git push origin --tags
rm -rf ${repodir}
