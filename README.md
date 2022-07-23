# android_device_realme_X2
For building TWRP for Realme X2

TWRP device tree for Realme X2

## Features

Works:

- ADB
- Decryption of /data
- Screen brightness settings
- Correct screenshot color
- MTP
- Flashing (opengapps, roms, images and so on)
- Backup/Restore
- USB OTG

TO-DO:

- Adb sideload

## Compile

First checkout manifest:

```
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
repo sync
```
Finally execute these:

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_X2-eng
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true
```

To test it:

```
fastboot boot out/target/product/X2/recovery.img
```

## Other Sources

Using precompiled stock kernel
