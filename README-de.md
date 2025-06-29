[![en](https://img.shields.io/badge/lang-en-green.svg)](README.md)
[![de](https://img.shields.io/badge/lang-de-red.svg)](README-de.md)


# Animated-Mini-BlueBrixx-Gate (Anleitung ist derzeit WIP)
Animiertes Mini BlueBrixx Gate:
![Gif eines BlueBrixx Stargates](Images/Animatead_Brick_Stargate_TP_BG.gif)

# Über dieses Projekt
Mit diesem Projekt können den Mini Stargates von BlueBrixx Bildschirme hinzugefügt werden, die eine Animation des Ereignishorizonts anzeigen.

# Teileliste:
Alle Teile, die für den Bau des Bildschirms benötigt werden, finden Sie in der [Teileliste](PARTLIST-de.md).

# Drucken:
Hinweise/Einstellungen zum Drucken des Gehäuses finden Sie [hier](3D_PRINTING-de.md)

# Software:
Es gibt zwei Möglichkeiten, die Firmware auf den Controller zu bekommen, die einfachste ist das [Flashen der vorkompilierten Firmware](FLASH_FIRMWARE-de.md)(Nur Windows) oder das aufwendigere [Kompilieren mit Arduino](COMPILE_FIRMWARE-de.md).

# Zusammenbau:
Nachdem Sie das Gehäuse gedruckt und die Firmware geflasht haben, können Sie dieser [Montageanleitung](ASSEMBLY-de.md) folgen, um alles zusammenzubauen.

# Quellen:
- Der Hauptcode verwendet eine modifizierte Version von [Gif viewer example(GIFDEC)](https://github.com/moononournation/Arduino_GFX/tree/master/examples/ImgViewer/ImgViewerAnimatedGIF_GIFDEC) aus der [Arduino GFX library](https://github.com/moononournation/Arduino_GFX).
- Die Animation wurde auf der Grundlage der von David Gian-Cursion in [diesem Blogpost](https://www.gian-cursio.net/2025/02/mr-stargate-puddle/) zur Verfügung gestellten Animation erstellt. Die aktuelle Version hat einen blauen Farbton, eine Alternative mit den Originalfarben wird später bereitgestellt.
- Der Arduino-Sketch enthält auch einige Treiberdateien aus der Demo, die im [waveshare wiki](https://www.waveshare.com/wiki/ESP32-S3-LCD-1.85#Resources) bereitgestellt wird.  Ich bin mir nicht sicher, unter welcher Lizenz sie zur Verfügung gestellt werden. Wenn Sie es besser wissen oder von Waveshare sind, informieren Sie mich und ich werde dieses Projekt entsprechend aktualisieren.
