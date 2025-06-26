Hier ist die Anleitung zum Kompilieren der Firmware mit Arduino.


# 1. Arduino IDE 2.0 installieren

Installieren Sie zunächst die Arduino IDE für Ihr Betriebssystem (Windows/Mac/Linux). Sie können sie von [der offiziellen Arduino-Website](https://www.arduino.cc/en/software/), dem Windows Store, Flathub und anderen Quellen herunterladen.

# 2. Unterstützung für ESP32-Boards hinzufügen

1. Gehen Sie zu File->Preferences
2. Fügen Sie unter Settings die URL des Boardmanagers von Espressif Systems in das Feld „Additional board managers URLs“ ein.
	`https://espressif.github.io/arduino-esp32/package_esp32_index.json`
3. Speichern Sie Ihre Einstellungen, indem Sie auf „ok“ klicken.
4. Suchen Sie im Boardmanager nach esp32 und installieren Sie "esp32 by Espressif Systems" (>= 3.0.2).
5. Warten Sie, bis die Installation abgeschlossen ist.

Das Waveshare Wiki bietet die gleiche Anleitung auf English mit Bildern hier:  
[https://www.waveshare.com/wiki/Arduino_Board_Managers_Tutorial]

# 3. Arduino GFX installieren

1. Öffnen Sie den Bibliotheksmanager.
2. Suchen Sie nach "GFX Library for Arduino" (von "Moon On Our Nation").
3. Installiere sie diese (Version 1.6.0).

# 4. Holen Sie sich den Arduino-Sketch

Es wird zu einem späteren Zeitpunkt einen Download unter Releases geben, aber im Moment müssen Sie Folgendes tun:
1. Gehe auf die [Hauptseite dieses Projekts](https://github.com/Nexusnui/Animated-Mini-BlueBrixx-Gate)
2. Klicke auf den Pfeil neben dem grünen "Code"-Knopf
3. Klicken Sie unter SSH auf die Schaltfläche "Download ZIP".
4. Entpacken Sie den Inhalt der ZIP-Datei.
5. Gehen Sie zu "Animated-Mini-BlueBrixx-Gate-main/Code/animated-gate".
6. Öffnen Sie "animated-gate.ino" mit der Arduino IDE (ein Doppelklick sollte genügen).

# 5. Bereiten Sie die SD-Karte vor
1. Formatieren Sie Ihre SD-Karte mit „Fat32“ (je nach Betriebssystem benötigen Sie eventuell zusätzliche Software)
2. Verschieben Sie die Datei „PuddleLoop.gif“ aus dem Datenordner (innerhalb des Sketch-Ordners) auf die SD-Karte
3. Stecken Sie die Karte in das Display.

# 6. Stellen Sie die richtigen Projektparameter ein

1. Verbinden Sie das Display mit Ihrem PC über ein USB-C-Kabel
2. In Arduino IDE gehen Sie zu Tool->Board->esp32 und wählen Sie "ESP32S3 Dev Module"
3. Nehmen sie unter Tools die folgenden Einstellungen vor:
   - 'Events Run On: "Core 0"'
   - 'Flash Mode: "QIO 120MHz"'
   - 'Flash Size: "16MB (128Mb)"'
   - 'Arduino Runs On: "Core 1"'
   - 'USB Firmware MSC On Boot: "Disabled"'
   - 'Partition Scheme: "16M Flash (3MB APP/9.9MB FATFS)"'
   - 'PSRAM: "OPI PSRAM"'
   
Das Waveshare Wiki hat in Bild für die Einstellungen unter Tools (es zeigt aber ein anderes Partitionsschema):
[https://www.waveshare.com/wiki/ESP32-S3-LCD-1.85#Arduino_project_parameter_setting]

# 7. Hochladen des Sketches
1. Klicken Sie auf die Schaltfläche Upload.
2. Warten Sie, bis die Skizze kompiliert und hochgeladen ist.
3. Sie sollten nun die PuddleLoop-Animation auf dem Bildschirm sehen.