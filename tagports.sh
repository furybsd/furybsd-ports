#!/bin/sh
# Helper script which will tag github repos for ports / distfiles

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

if [ ! -f "/usr/local/furybsd/tag" ] ; then
  echo "FuryBSD must be built with tag first"
  exit 1
fi

version=`cat /usr/local/furybsd/tag`

git clone git@github.com:furybsd/furybsd-update.git ${repodir}/furybsd-update
git clone git@github.com:furybsd/furybsd-xorg-tool.git ${repodir}/furybsd-xorg-tool
git clone git@github.com:furybsd/furybsd-xfce-settings.git ${repodir}/furybsd-xfce-settings
git clone git@github.com:furybsd/furybsd-wallpapers.git ${repodir}/furybsd-wallpapers
git clone git@github.com:furybsd/furybsd-common-settings.git ${repodir}/furybsd-common-settings

cd ${repodir}/furybsd-update
git tag -a $version -m "{$version}"
git push origin --tags
cd ${repodir}/furybsd-xorg-tool
git tag -a $version -m "{$version}"
git push origin --tags
cd ${repodir}/furybsd-xfce-settings
git tag -a $version -m "{$version}"
git push origin --tags
cd ${repodir}/furybsd-wallpapers
git tag -a $version -m "{$version}"
git push origin --tags
cd ${repodir}/furybsd-common-settings
git tag -a $version -m "{$version}"
git push origin --tags
rm -rf ${repodir}
