This directory contains patches for embedded targets that can be applied to vanilla fpc-trunk

to apply do the following:
copy the patchfile you want to apply in your directory where fpc-trunk resides, then run patch or use your prefered tool to apply the patchfile

Example:

cd <you-fpc-trunk-directory>
patch -p0 <fpc-trunk-stm32l4.patch

Now rebuild fpc, have fun!

IMPORTANT: It is not possible to apply all patches, you run in a high chance of issues with patching when you try to apply more than one patch.

To make your experience perfect, edit your fpc.cfg file, change the following lines:
```shell
# searchpath for units and other system dependent things
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/*
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/rtl

to

# searchpath for units and other system dependent things
#ifdef embedded
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/$fpcsubarch
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/$fpcsubarch/*
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/$fpcsubarch/rtl
#else
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/*
-Fu/usr/local/lib/fpc/$fpcversion/units/$fpctarget/rtl
#endif
```
This allows you to use several subarchs (armv6, armv7 and armv7em) at the same time.


