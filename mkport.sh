#!/bin/sh
# Helper script which will create the port / distfiles
# from a checked out git repo

if [ -z "$1" ] ; then
  echo "Please provide port path"
  echo "For example x11-themes/furybsd-wallpapers"
  exit 1
fi

# Only run as superuser
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Deal with input for script below
port=$1
dfile=`echo $1 | cut -d'/' -f2-`
topdir=`echo $1 | cut -d'/' -f1-`

# Cleanup previous copies of ports overlay
rm -rf /usr/ports/${port}/ || true
cp -R ${topdir} /usr/ports/${topdir}

# Get the version
if [ -e "version" ] ; then
  verTag=$(cat version)
else
  verTag=$(date '+%Y%m%d%H%M')
fi

# Set the version numbers
sed -i '' "s|%%CHGVERSION%%|${verTag}|g" /usr/ports/${port}/Makefile
sed -i '' "s|%%GHTAG%%|${ghtag}|g" /usr/ports/${port}/Makefile

# Get the GIT tag
if [ $1 = "sysutils/furybsd-dsbdriverd" ]; then
  echo "Skipping git ls for forked repo"
else
  # Grab the tag from github using git ls
  echo "grabbing tag from git"
  port=$1
  dfile=`echo $1 | cut -d'/' -f2-`
  topdir=`echo $1 | cut -d'/' -f1-`
  ghtag=`git ls-remote https://github.com/furybsd/${dfile} HEAD | awk '{ print $1}'`
  echo "${ghtag}"
  # Set the version numbers
  sed -i '' "s|%%CHGVERSION%%|${verTag}|g" /usr/ports/${port}/Makefile
  sed -i '' "s|%%GHTAG%%|${ghtag}|g" /usr/ports/${port}/Makefile
fi

# Create the makesums / distinfo file
cd "/usr/ports/${port}"
make makesum
if [ $? -ne 0 ] ; then
  echo "Failed makesum"
  exit 1
fi

# Clean ports for plist
cd "/usr/ports/${port}"
make clean
if [ $? -ne 0 ] ; then
  echo "Failed make clean"
  exit 1
fi


# Create the package plist
cd "/usr/ports/${port}"
make makeplist > pkg-plist
if [ $? -ne 0 ] ; then
  echo "Failed makeplist"
  exit 1
fi
sed 1,/you/d pkg-plist >> pkg-plist.fixed
mv pkg-plist.fixed pkg-plist

make clean
if [ $? -ne 0 ] ; then
  echo "Failed make clean"
  exit 1
fi
