#!/usr/local/bin/bash
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

# Create FuryBSD work folder if it does not exist
if [ ! -d "/usr/local/furybsd" ] ; then
  mkdir /usr/local/furybsd
fi

# Dynamically create a version newer than the latest tag
gitcheck=$(git ls-remote --tags https://github.com/furybsd/furybsd-wallpapers | awk '{ print $2}' | cut -d'/' -f3 | sed 's/[^a-zA-Z0-9]//g' | tail -n 1)
getdate=$(date '+%Y%m%d')
buildnum=$(echo ${getdate}01)
echo "gitcheck is ${gitcheck}"
echo "buildnum is ${buildnum}"
until [  ${buildnum} -gt ${gitcheck} ]; do
    #echo $buildnum $buildnum
    let buildnum+=1
done
echo "buildnum is ${buildnum}"
export getTag=$(echo ${buildnum})
echo "${getTag}" > /usr/local/furybsd/version
export verTag=$(cat /usr/local/furybsd/version)

# Set the version instead if tag is used
if [ -f "/usr/local/furybsd/tag" ] ; then
  rm /usr/local/furybsd/version
  export verTag=$(cat /usr/local/furybsd/tag) 
fi

# Set the version numbers
sed -i '' "s|%%CHGVERSION%%|${verTag}|g" /usr/ports/${port}/Makefile

case $1 in
  'x11/furybsd-xfce-desktop')
    echo "skipping git ls for this port"
    ;;
  'x11/furybsd-kde-desktop')
    echo "skipping git ls for this port"
    ;;
  'x11/furybsd-gnome-desktop')
    echo "skipping git ls for this port"
    ;;
  'sysutils/furybsd-dsbdriverd')
    echo "skipping git ls for this port"
    ;;
  *)
  if [ -f "/usr/local/furybsd/tag" ] ; then
    ghtag=$(cat /usr/local/furybsd/tag)
    sed -i '' "s|%%GHTAG%%|${ghtag}|g" /usr/ports/${port}/Makefile
  else
    ghtag=`git ls-remote https://github.com/furybsd/${dfile} HEAD | awk '{ print $1}'`
    sed -i '' "s|%%GHTAG%%|${ghtag}|g" /usr/ports/${port}/Makefile
  fi
    ;;
esac

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

case $1 in
  'x11/furybsd-xfce-desktop')
    echo "skipping plist for this port"
    ;;
  'x11/furybsd-kde-desktop')
    echo "skipping plist for this port"
    ;;
  'x11/furybsd-gnome-desktop')
    echo "skipping plist for this port"
    ;;
  *)
    # Create the package plist
    port=$1
    echo "making plist for ${port}"
    cd "/usr/ports/${port}"
    make -DBATCH makeplist > pkg-plist
    if [ $? -ne 0 ] ; then
      echo "Failed makeplist"
      exit 1
    fi
    sed 1,/you/d pkg-plist >> pkg-plist.fixed
    mv pkg-plist.fixed pkg-plist
    ;;
esac

make clean
if [ $? -ne 0 ] ; then
  echo "Failed make clean"
  exit 1
fi
