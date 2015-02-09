ownCloud Version 8.0
======================

Arch Linux ownCloud Stable

Enable port 80 and/or 443

From Docker Index
```
docker pull usertaken/archlinux-owncloud-stable
```

Build Yourself
```
docker build --rm -t usertaken/archlinux-owncloud-stable github.com/UserTaken/docker-archlinux-owncloud-stable
```

Run
```
docker run -d -p 80:80 -p 443:443 --name owncloud --restart always usertaken/archlinux-owncloud-stable
```
