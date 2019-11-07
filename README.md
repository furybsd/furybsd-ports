# furybsd-ports
Ports for FuryBSD

## Updating a port

Make sure you have a ports tree in /usr/ports:

```
portsnap fetch extract
```

Run the mkports.sh script to generate a port from this repo into /usr/ports:

```
./mkports.sh x11-themes/furybsd-wallpapers
```
