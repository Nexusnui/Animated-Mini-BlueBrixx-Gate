These are the instructions for compiling the firmware with Arduino.


# 1. Install Arduino IDE 2.0

First install Arduino IDE for your operating system(Windows/Mac/Linux). You can download it from [the official Arduino website](https://www.arduino.cc/en/software/), the Windows Store, Flathub and other sources.

# 2. Add support for ESP32 boards

1. Go to File->Preferences
2. Under settings paste Espressif Systems board manager url into the "Additional board managers URLs" field.
	`https://espressif.github.io/arduino-esp32/package_esp32_index.json`
3. Save your settings by clicking 'ok'
4. In the board manager search for esp32 and inatall 'esp32 by Espressif Systems' (>= 3.0.2)
5. Wait for the installation to finish

The Waveshare Wiki provides the same guide with image here:  
[https://www.waveshare.com/wiki/Arduino_Board_Managers_Tutorial]

# 3. Install Arduino GFX

1. Open the library manager
2. Search for 'GFX Library for Arduino' (by 'Moon On Our Nation')
3. Install it (version 1.6.0)

# 4. Get the Arduino Sketch

There will be a download under releases at a later point, but for now you have to do the following:  
1. Go the [main page of this project](https://github.com/Nexusnui/Animated-Mini-BlueBrixx-Gate)
2. Click the arrow next on the green "Code" button
3. Under SSH click the "Download ZIP" button
4. Extract the content of the ZIP File
5. Go to 'Animated-Mini-BlueBrixx-Gate-main/Code/animated-gate'
6. Open 'animated-gate.ino' with Arduino IDE (just double clicking should work)

# 5. Prepare the SD Card
1. Format your sd card to "Fat32"(depending on your operating system you may require additional software)
2. Move the file "PuddleLoop.gif" from the data folder(inside the Sketch folder) to the sd Card
3. Insert the card into the display

# 6. Set the correct project parameters

1. Connect the display with your pc through a usb-c cable
2. In Arduino IDE go to Tool->Board->esp32 and select "ESP32S3 Dev Module"
3. Under tools apply the following settings:
   a. 'Events Run On: "Core 0"'
   b. 'Flash Mode: "QIO 120MHz"'
   c. 'Flash Size: "16MB (128Mb)"'
   d. 'Arduino Runs On: "Core 1"'
   e. 'USB Firmware MSC On Boot: "Disabled"'
   f. 'Partition Scheme: "16M Flash (3MB APP/9.9MB FATFS)"'
   g. 'PSRAM: "OPI PSRAM"'
   
The Waveshare Wiki has in Image for the settings under tools(it shows a different partition scheme):
[https://www.waveshare.com/wiki/ESP32-S3-LCD-1.85#Arduino_project_parameter_setting]

# 7. Upload the Sketch
1. Hit the upload button
2. Wait for the Sketch to compile and Upload
3. You should now see the PuddleLoop animation on the screen