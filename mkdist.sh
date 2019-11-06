#!/bin/sh
# Helper script which will create the port / distfiles
# from a checked out git repo

# Get list of ports from parent scripts
port=$1
dfile=`echo $1 | cut -d'/' -f2-`
topdir=`ls -d */`

# Cleanup previous copies of ports overlay
rm -rf /usr/ports/${port}/ || true
cp -R ${topdir} /usr/ports/${topdir}

# Get the GIT tag
ghtag=`git ls-remote https://github.com/furybsd/${dfile} HEAD | awk '{ print $1}'`

# Get the version
if [ -e "version" ] ; then
  verTag=$(cat version)
else
  verTag=$(date '+%Y%m%d%H%M')
fi

# Set the version numbers
sed -i '' "s|%%CHGVERSION%%|${verTag}|g" /usr/ports/${port}/Makefile
sed -i '' "s|%%GHTAG%%|${ghtag}|g" /usr/ports/${port}/Makefile

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
make makeplist > /usr/ports/${port}/pkg-plist
if [ $? -ne 0 ] ; then
  echo "Failed makesum"
  exit 1
fi
cat /usr/ports/${port}/pkg-plist
