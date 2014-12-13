ownCloud Version 7.0.4
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
docker run -d --name owncloud --restart always -p 80:80 -p 443:443 usertaken/archlinux-owncloud-stable
```
