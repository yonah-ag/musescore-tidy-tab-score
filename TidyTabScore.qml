/* Copyright © 2022 yonah_ag
 *
 *  This program is free software; you can redistribute it or modify it under
 *  the terms of the GNU General Public License version 3 as published by the
 *  Free Software Foundation and appearing in the accompanying LICENSE file.
 *
 *  Description
 *  -----------
 *  Tidy TAB score by tidying rests, stems, hooks and beams
 *  Set element colour in voices 1 & 2
 *  Set vertical position of rests in voices 1 & 2
 *  Hide element in voices 3 & 4
 *
 *  Releases
 *  ---------
 *  | 1.0.0 | 06 Mar 2022 | Initial release |
 */

import MuseScore 3.0

MuseScore 
{
   description: "Tidy TAB score by hiding score elements";
   requiresScore: true;
   version: "1.0";
   menuPath: "Plugins.Tidy Tab Score";
   
   property var inkElm : "#A0A0A0"; // element ink colour
   property var offRest0 : -4; // Offset for voice 1 rests
   property var offRest1 : 4.5; // Offset for voice 2 rests
   
   function inkElement(element, voice) {
      if(element.type == Element.CHORD) {
         if(element.stem) element.stem.color = inkElm;
         if(element.hook) element.hook.color = inkElm;
         if(element.beam) element.beam.color = inkElm;
      }
      else if (element.type == Element.REST) {
         element.autoplace = false;   
         element.color = inkElm;
         if(voice == 0)
            element.offsetY = offRest0
         else
            element.offsetY = offRest1;
      }
   }

   function tidyElement(element) {
      if(element.type == Element.CHORD) {
         if(element.stem) element.stem.visible = false;
         if(element.hook) element.hook.visible = false;
         if(element.beam) element.beam.visible = false;
      }
      else if (element.type == Element.REST) {
          element.visible = false;
      }
   }

   function tidyScore()
   {
      var staveBeg;
      var staveEnd;
      var tickEnd;
      var toEOF;
      var cursor = curScore.newCursor();

      staveBeg = 0;
      staveEnd = curScore.nstaves - 1;

// Voices 1 and 2

      cursor.rewind(0);
      for (var stave = staveBeg; stave <= staveEnd; ++stave) {
         for (var voice = 0; voice < 2; ++voice) {
            cursor.staffIdx = stave;
            cursor.voice = voice;
            cursor.rewind(0);
            cursor.staffIdx = stave;
            cursor.voice = voice;
            while (cursor.segment) {
               if (cursor.element) inkElement(cursor.element, voice);
               cursor.next();
            }
         }
      }

// Voices 3 and 4

      cursor.rewind(0);
      for (var stave = staveBeg; stave <= staveEnd; ++stave) {
         for (var voice = 2; voice < 4; ++voice) {
            cursor.staffIdx = stave;
            cursor.voice = voice;
            cursor.rewind(0);
            cursor.staffIdx = stave;
            cursor.voice = voice;
            while (cursor.segment) {
               if (cursor.element) tidyElement(cursor.element);
               cursor.next();
            }
         }
      }
   }

   onRun:
   {
      tidyScore();
      Qt.quit();
   }
}
