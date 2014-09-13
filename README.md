ownCloud Version 7.0.2
======================

Arch Linux ownCloud Stable

Enable port 80

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
docker run -d -p 80:80 usertaken/archlinux-owncloud-stable
```
