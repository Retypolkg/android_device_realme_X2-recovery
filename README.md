# android_device_realme_RMX1991
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
- Backup/Restore (Needs more testing)
- USB OTG

TO-DO:

- Vibration support

## Compile

First checkout minimal twrp with omnirom tree:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
repo sync
```

Then add these projects to .repo/manifest.xml:

```xml
<project path="device/realme/RMX1991" name="mauronofrio/android_device_realme_RMX1991" remote="github" revision="android-9.0" />
```

Finally execute these:

```
. build/envsetup.sh
lunch omni_RMX1991-eng
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true # Only if you use minimal twrp tree.
```

To test it:

```
fastboot boot out/target/product/RMX1991/recovery.img
```

## Other Sources

Using precompiled stock kernel

## Thanks

