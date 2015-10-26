ownCloud Version latest
======================

Arch Linux ownCloud Stable

Enable port 80 and/or 443

From Docker Index
```
docker pull magdeoz/archlinux-owncloud-stable
```

Build Yourself
```
docker build --rm -t magdeoz/archlinux-owncloud-stable github.com/magdeoz/docker-archlinux-owncloud-stable
```

Run
```
docker run -d -p 80:80 -p 443:443 --name owncloud --restart always magdeoz/archlinux-owncloud-stable
```
