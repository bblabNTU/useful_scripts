# useful_scripts
some useful linux scripts

## 1. mount_and_copy.sh

usage:
1. mount an SSD
2. Copy the file under Document to your SSD
3. unmount SSD

```
chmod +x ./mount_and_copy.sh
./mount_and_copy.sh
```
> so far you need to edit mount point and copy path manually

## 2. pi image shrink.sh (v 1.13)

usage:
shrink your image

1. add permission:
`chmod +x ./pishrink.sh`
2. execute (select your image):
`sudo ./pishrink.sh -v ./UAV0605_mavros-and-realsense.img`

author:https://github.com/Drewsif/PiShrink
