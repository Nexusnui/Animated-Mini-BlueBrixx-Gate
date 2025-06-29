[![en](https://img.shields.io/badge/lang-en-green.svg)](README.md)
[![de](https://img.shields.io/badge/lang-de-red.svg)](README-de.md)

# Animated-Mini-BlueBrixx-Gate (Instructions are currently WIP)
Animated Mini BlueBrixx Gate:
![Gif of BlueBrixx Stargate](Images/Animatead_Brick_Stargate_TP_BG.gif)

# About this project
With this project you can add a screen to your Mini Stargates from BlueBrixx, that display an animation of the event horizon.

# Partlist:
You can find all parts required for building the screen in the [Partlist](PARTLIST.md).

# Printing:
Advice/Settings for printing the shell can be found [here](3D_PRINTING.md)

# Software:
There are two ways top get the firmware onto the device the easiest beeing by [flashing the precompiled firmware](FLASH_FIRMWARE.md)(Only Windows) or [compiling it with Arduino](COMPILE_FIRMWARE.md).

# Assembly:
After printing and flashing the firmware you can follow this [assembly guide](ASSEMBLY.md) to put everything together.

# Sources:
- The main code uses a modified version of the [Gif viewer example(GIFDEC)](https://github.com/moononournation/Arduino_GFX/tree/master/examples/ImgViewer/ImgViewerAnimatedGIF_GIFDEC) from the [Arduino GFX library](https://github.com/moononournation/Arduino_GFX).
- The animtation was created based the one provided by David Gian-Cursion in [this blogpost](https://www.gian-cursio.net/2025/02/mr-stargate-puddle/). The current version has a blue tint and an alternative with the original colors will be provided later.
- The arduino sketch also includes some driver files from the demo provided on the [waveshare wiki](https://www.waveshare.com/wiki/ESP32-S3-LCD-1.85#Resources). I am not sure under what license they are provided, if you know any better or are from waveshare inform me and I will update this project accordingly.