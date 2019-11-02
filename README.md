# furybsd-ports
Ports for FuryBSD

## Updating a port

Make sure you have a ports tree in /usr/ports:

```
portsnap fetch extract
```

Copy the ports overlays to your ports tree:

```
cp -R x11-themes/ /usr/ports/x11-themes/
```

Enter the port directory and modify the makefile version:

```
edit /usr/ports/x11-themes/furybsd-artwork/Makefile
```

Update the dist info:

```
cd /usr/ports/x11-themes/furybsd-artwork && make makesum
```

Update the plist:

```
cd /usr/ports/x11-themes/furybsd-artwork && make makeplist > pkg-plist
```

Remove top line from pkg-plist:

```
edit /usr/ports/x11-themes/furybsd-artwork/pkg-plist
```

Make clean:
```
cd /usr/ports/x11/themes/furybsd-artwork && make clean
```

Run portlint to do final sanity check:
```
pkg install portlint
```
```
cd /usr/ports/x11/themes/furybsd-artwork && portlint
```

Make clean:
```
cd /usr/ports/x11/themes/furybsd-artwork && make clean
```

Copy the ports back to git repo as your user not root:

```
cp -R /usr/ports/x11-themes/furybsd-artwork/ ~/Projects/furybsd/furybsd-artwork/x11-themes/furybsd-artwork/
```
