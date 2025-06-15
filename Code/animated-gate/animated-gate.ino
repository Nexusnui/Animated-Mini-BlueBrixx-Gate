/*******************************************************************************
 * Animated GIF Image Viewer
 * This is a Animated GIF of Stargate Event Horizon example based on Example from Arduino GFX
 * Image Source: Todo
 * cropped: resized: 360x360
 * optimized with ezgif.com
 *
 * GIFDEC original source: https://github.com/BasementCat/arduino-tft-gif
 ******************************************************************************/
/* Wio Terminal */
#define GIF_FILENAME "/PuddleLoop.gif"

/*******************************************************************************
 * Start of Arduino_GFX setting
 ******************************************************************************/

#include <Arduino_GFX_Library.h>

#define GFX_BL 5 //backlight pin

/* data bus class */
Arduino_DataBus *bus = new Arduino_ESP32QSPI(21 /* cs */, 40 /* sck */, 46 /* d0 */, 45 /* d1 */, 42 /* d2 */, 41 /* d3 */, false);

/* display class */
Arduino_GFX *gfx = new Arduino_ST77916(bus /*bus*/, -1 /*rst*/, 0 /*rotation*/, true /*ips*/, 360 /*width*/, 360 /*height*/);

/*******************************************************************************
 * End of Arduino_GFX setting
 ******************************************************************************/

/* Wio Terminal */
#include "SD_Card.h"

#include "GifClass.h"
static GifClass gifClass;

void setup()
{

//Todo: Check if this is required
#ifdef DEV_DEVICE_INIT
  DEV_DEVICE_INIT();
#endif

  //Todo: Define Dev Mode Var
  //Serial.begin(115200);
  // Serial.setDebugOutput(true);
  // while(!Serial);
  //Serial.println("Arduino_GFX Animated GIF Image Viewer example");

  // Init Display
  if (!gfx->begin())
  {
    //Serial.println("gfx->begin() failed!");
  }
  gfx->fillScreen(RGB565_BLACK);

#ifdef GFX_BL
  pinMode(GFX_BL, OUTPUT);
  digitalWrite(GFX_BL, HIGH);
#endif

/* Wio Terminal */
SD_Init();
}

void loop()
{
/* Wio Terminal */
File gifFile = SD_MMC.open(GIF_FILENAME);

  if (!gifFile || gifFile.isDirectory())
  {
    //Serial.println(F("ERROR: open gifFile Failed!"));
    gfx->println(F("ERROR: open gifFile Failed!"));
  }
  else
  {
    // read GIF file header
    gd_GIF *gif = gifClass.gd_open_gif(&gifFile);
    if (!gif)
    {
      //Serial.println(F("gd_open_gif() failed!"));
    }
    else
    {
      uint8_t *buf = (uint8_t *)malloc(gif->width * gif->height);
      if (!buf)
      {
        //Serial.println(F("buf malloc failed!"));
      }
      else
      {
        int16_t x = (gfx->width() - gif->width) / 2;
        int16_t y = (gfx->height() - gif->height) / 2;

        //Serial.println(F("GIF video start"));
        int32_t start_ms = millis(), t_delay = 0, delay_until;
        int32_t res = 1;
        int32_t duration = 0, remain = 0;
        while (res > 0)
        {
          t_delay = gif->gce.delay * 10;
          res = gifClass.gd_get_frame(gif, buf);
          if (res < 0)
          {
            //Serial.println(F("ERROR: gd_get_frame() failed!"));
            break;
          }
          else if (res > 0)
          {
            gfx->drawIndexedBitmap(x, y, buf, gif->palette->colors, gif->width, gif->height);

            duration += t_delay;
            delay_until = start_ms + duration;
            while (millis() < delay_until)
            {
              delay(1);
              remain++;
            }
          }
        }
        /*Serial.println(F("GIF video end"));
        Serial.print(F("Actual duration: "));
        Serial.print(millis() - start_ms);
        Serial.print(F(", expected duration: "));
        Serial.print(duration);
        Serial.print(F(", remain: "));
        Serial.print(remain);
        Serial.print(F(" ("));
        Serial.print(100.0 * remain / duration);
        Serial.println(F("%)"));
        */

        gifClass.gd_close_gif(gif);
        free(buf);
      }
    }
  }
}
